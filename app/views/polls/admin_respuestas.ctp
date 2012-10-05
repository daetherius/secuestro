<?php
echo
	$this->element('adminhdr',array(
		'title'=>'Respuestas',
		'links'=>array(
			array('text'=>'Regresar','href'=>array('action'=>'editar',$pollid,'admin'=>true),'class'=>'back'),
			'adder'
		)
	)),
	$html->div('title title2 pollquestion',$pollquestion ? $pollquestion : ''),
	$html->div('OrderContainer'),
		$form->create('Answer',array('url'=>$this->here)),
		$html->tag('p',$form->submit('Guardar Cambios',array('div'=>false,'class'=>'submitRt')).'Arrastre desde aquí para reordenar.',array('id'=>'elist_instructions')),
		$this->element('elist',array(
			'model'=>'Answer',
			'fields'=>array('id','nombre'=>array('edit'=>1),'votos'=>array('edit'=>0,'hide'=>0,'label'=>'Votos')),
			'options'=>array('data'=>@$orderdata,'sort'=>1,'min'=>0,'adder'=>'elist_adder','remover'=>1)
		)),
		$form->end(),
	'</div>';
?>
