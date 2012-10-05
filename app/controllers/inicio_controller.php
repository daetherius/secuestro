<?php
App::import('Controller','_base/My');
class InicioController extends MyController {
	var $name = 'Inicio';
	var $uses = array('Album','Tip','Poll');

	function index(){
		$video = $this->Album->find_(array('contain'=>false,'conditions'=>array('tipo'=>'video')),'first');
		$this->set(compact('video'));

		$tips = $this->Tip->find_(array('contain'=>false));
		$this->set(compact('tips'));

		
		$this->pageTitle = Configure::read('Site.slogan');
	}
	
	function email(){ $this->layout = 'empty'; }
}
?>