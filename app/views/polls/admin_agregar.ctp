<?php
echo
	$this->element('adminhdr',array('links'=>array('back'))),
	$this->element('inputs',array(
		'after'=>	$html->link('Agregar Pregunta','javascript:;',array('id'=>'elist_adder','class'=>'adminButton add')).
			$util->tip(array('En la siguiente lista podrá agregar, editar, eliminar y ordenar las <b>preguntas</b> de la encuesta. Para ordenar arrastre desde el área punteada.','Preguntas de Encuesta')).
			$this->element('elist',array(
				'model'=>'Question',
				'fields'=>array('id','nombre'=>array('edit'=>1)),
				'options'=>array(
					'min'=>1,
					'sort'=>1,
					'adder'=>'elist_adder',
					'remover'=>1,
					'custom'=>array(array('text'=>'Respuestas','action'=>'admin_respuestas'))
				)
			))
	)),
	$this->element('tinymce');
?>