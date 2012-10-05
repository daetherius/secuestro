<?php
echo
	$this->element('top'),
	$html->div('title title3',$category['nombre'].'');

	if($items){
		foreach($items as $item){
			echo $html->div('faq'),
				$html->div('respuesta desc tmce',$item['Tip']['nombre'].''),
			'</div>';
		}
	} else 
		echo $html->para('noresults','No hay elementos que mostrar');
	?>
</div>
</div><!-- end of content -->
<?php echo $this->element('sidebar') ?>