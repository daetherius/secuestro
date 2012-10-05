<ul id="menu">
<?php
echo $html->tag('li',$html->link($html->tag('span', 'inicio'),'/'),array('class'=>$this->params['controller']=='inicio' ? 'mSelected' : ''));
foreach(Configure::read('Modules') as $cntllr => $mod){
	if(isset($mod['menu']) && $mod['menu']){
		$submenu = '';
		if($cntllr == 'albums'){
			$submenu = $html->tag('ul',null,'submenu').
				$html->tag('li',$html->link('Eventos',array('controller'=>'events','action'=>'index'))).
				$html->tag('li',$html->link('Galerías y Videos',array('controller'=>'albums','action'=>'index'))).
			'</ul>';
		}

		echo
			$html->tag('li',
				$html->link(
					$html->tag('span',$mod['menu']),
					array('controller'=>$cntllr,'action'=>'index')
				).$submenu,
				array('class'=>$this->params['controller'] == $cntllr ? 'mSelected' : '')
			);
	}
}
?>
</ul>