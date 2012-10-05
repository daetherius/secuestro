<?php
App::import('Controller','_base/Items');
class PollsController extends ItemsController{
	var $name = 'Polls';
	var $uses = array('Poll','Question','Answer');
	var $test = true;

	function index(){}

	function admin_editar($id){
		parent::admin_editar($id);
			
		$orderdata = $this->m[0]->Question->find_(array(
			'conditions'=>array('poll_id'=>$id),
			'fields'=>array('id','nombre','orden'),
			'contain'=>false
		));
		$this->m[0]->clean($questions,true);
		$this->set(compact('orderdata'));		

	}

	function admin_resultados($id = false){

		if($id = $this->_checkid($id,false)){
			$poll = $this->m[0]->read(array('id','nombre'),$id);
			$qs = $this->m[0]->Question->find_(array('contain'=>array('Answer'),'conditions'=>array('poll_id'=>$id)));
			$this->set(compact('poll','qs'));
		}
		
		if($this->params['named']['raw']){ $this->layout = 'empty';$this->render('admin_raw'); }
	}

	function admin_respuestas($parent = false){
		if($parent = $this->_checkid($parent,false)){
			$question = $this->Question->find_(array($parent,'contain'=>false));
			$this->set('pollquestion',$question['Question']['nombre']);
			$this->set('pollid',$question['Question']['poll_id']);
		} else {
			$this->redirect($this->referer());
		}
		
		if(empty($this->data)){
			$this->set('orderdata',$this->Answer->find_(array(
				'conditions'=>array('question_id'=>$parent),
				'fields'=>array('id',$this->Answer->displayField,'votos','orden'),
				'contain'=>false,
			),'all+'));
		} else {
			$success = true;
			foreach($this->data['Answer'] as $it){
				if($parent) $it['question_id'] = $parent;
				if(!$it['votos']) $it['votos'] = 0; // Force default numeric

				$this->Answer->create(false);
				$success = $success && $this->Answer->save($it);
			}
			$this->_flash('save_'.($success ? 'ok':'some'));
		}
	}

	function admin_activar($id) { parent::admin_activar($id,true); }

	function block($pid) {
		$pid = $this->_checkid($pid);
		$ip = inet_ptod($this->RequestHandler->getClientIP());
		$isAjax = isset($this->params['isAjax']) && $this->params['isAjax'];

		if(!$this->test){
			$this->Poll->Visitor->save(array(
				'ip'=>$this->RequestHandler->getClientIP(),
				'item'=>'Poll',
				'item_id'=>$pid
			));
		}
		
		if($isAjax){
			$this->set('ajax','');
		} else {
			$this->redirect($this->referer());exit;
		}
	}

	function vote($full = false) {
		$question = $answer = false;
		$isAjax = isset($this->params['isAjax']) && $this->params['isAjax'];
		
		if(isset($this->data['Question']) && $this->data['Question']){
			if(isset($this->data['Question']['ids']) && $this->data['Question']['ids']){
				reset($this->data['Question']['ids']);
				list($qid,$aid) = explode('_',key($this->data['Question']['ids']));
			} else {
				$qid = $this->data['Question']['qid'];
				$aid = $this->data['Question']['aid'];
			}

			if($qid)
				$question = $this->Poll->Question->find_(array($qid,'contain'=>array('Poll')));

			if($aid)
				$answer = $this->Poll->Question->Answer->find_(array($aid,'contain'=>false));
		}
		
		$ip = inet_ptod($this->RequestHandler->getClientIP());
		
		/// No ha contestado previamente la pregunta
		if($question && $answer && (!$this->Poll->Visitor->find_(array('conditions'=>array('ip'=>$ip,'item'=>'Question','item_id'=>$qid)),'count'))){
			/// +1
			$this->Poll->Question->Answer->id = $answer['Answer']['id'];
			if((!$this->test) && $result = $this->Poll->Question->Answer->updateAll(array('Answer.votos'=>'Answer.votos + 1'),array('Answer.id'=>$answer['Answer']['id']))){ #!NEW
				$this->Poll->Visitor->create(false);
				$this->Poll->Visitor->save(array(
					'ip'=>$this->RequestHandler->getClientIP(),
					'item'=>'Question',
					'item_id'=>$question['Question']['id']
				));
			}

			/// Encuesta completada
			$answered = $this->Poll->Visitor->find_(array(
				'conditions'=>array(
					'ip'=>$ip,
					'item'=>'Question',
					'Question.poll_id'=>$question['Question']['poll_id']
				),
				'contain'=>array('Question')
			),'count');

			if((!$this->test) && $answered >= $question['Poll']['question_count']){
				$this->Poll->Visitor->create(false);
				$this->Poll->Visitor->save(array(
					'ip'=>$this->RequestHandler->getClientIP(),
					'item'=>'Poll',
					'item_id'=>$question['Question']['poll_id']
				));
			}
			
			$ajax = 'var answered = $("question_'.$question['Question']['id'].'"), qs = answered.getParent(".questions");';
			
			if(!$full) $ajax.= 'qs.set("opacity",0); answered.getNext(".question").reveal();';

			$ajax.='answered.dissolve().get("reveal").chain(function(){ this.destroy();';

			if($full) $ajax.= 'if(!$$(".question:not(.hide)").length){ (qs.getElements(".question.omega")[0]).fade("hide").removeClass("hide").fade(1); }';

			$ajax.= 'qs.tween("opacity",1); }.bind(answered));';
			
		} else {
			$ajax = 'alert("Ha ocurrido un problema. Intente de nuevo.");';
		}

		if($this->params['isAjax']){
			$this->set(compact('ajax'));
			$this->render('js');

		} else {
			$this->redirect($this->referer());
			exit;
			
		}
	}
}
?>