<?php
if(isset($comments)){
	if($this->Session->check('form_errors.Comment')){
		$this->Form->validationErrors = array('Comment'=>$this->Session->read('form_errors.Comment.errors'));
		$this->Session->delete('form_errors.Comment');
	}

echo
	$html->div(null,null,array('id'=>'comments')),
		$html->div('title title2','Comenta la nota'),
		$form->create('Comment',array('action'=>'publicar','id'=>'commentForm')),
			$form->input('parent',array('value'=>$_m[0],'type'=>'hidden')),
			$form->input('parent_id',array('value'=>$item[$_m[0]]['id'],'type'=>'hidden')),

			$html->div('subform'),
				$form->input('descripcion',array('label'=>'Comentario:','div'=>'comment_textarea')),
				$html->div('comment_texts'),
					$form->input('mail',array('div'=>'hide')),
					$form->input('autor',array('label'=>'Nombre:')),
					$form->input('email',array('label'=>'Email:')),
					//$form->input('web',array('label'=>'Sitio web:')),
					$form->submit('Enviar',array('before'=>$html->para('leydatos','Sus datos serán usados de acuerdo a los términos de la '.$html->link('Ley Federal de Protección de Datos Personales','http://dof.gob.mx/nota_detalle.php?codigo=5150631&fecha=05/07/2010',array('target'=>'_blank','rel'=>'nofollow'))))),
				'</div>',
			'</div>',
			
		$form->end(),
	
	/////////////

		$html->div('comment_list'),
		$html->tag('a','',array('name'=>'comments')),
		$html->div('hide','',array('id'=>'comment_updater')),
		$html->div('comment_count',$item[$_m[0]]['comment_count'] ? '('.$item[$_m[0]]['comment_count'].') Comentarios':'No hay Comentarios aún',array('id'=>'comment_count'));
		
		$odd = false;
		foreach($comments as $comment){
			echo $this->element('comment',array('data'=>$comment['Comment'],'odd'=>$odd));
			$odd = !$odd;
		}
		
		echo
			$this->element('pages',array('model'=>'Comment','full'=>true)),
			'</div>',
	
	'</div>';
	
	$moo->addEvent('commentForm','submit',array(
		'url'=>'/comments/publicar',
		'prevent'=>true,
		'data'=>'"commentForm"',
		'fade'=>1,
		'update'=>'"comment_updater"'
	));
}
?>