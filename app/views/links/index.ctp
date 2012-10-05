<?php
echo $this->element('top',array('wide'=>true));
	
	if($items){
		foreach($items as $item)
			echo $this->element('th',array('item'=>$item,'v'=>true));
			
		echo $this->element('pages');


	} else 
		echo $html->para('noresults','No hay elementos que mostrar');
?>
</div>
</div><!-- .content -->