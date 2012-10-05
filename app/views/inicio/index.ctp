<?php

echo
	$this->element('showcase',array('data'=>$carrusel)),
	$html->div('contentwide'),
	$html->div('pad'),

	$html->div('featured_video');
		
		if($video){
		echo
			$html->div('column'),
				$util->youtube($video['Album']['url'],'player',array('width'=>480,'height'=>270)),
				$this->element('share'/*,array('url'=>array('controller'=>'albums','action'=>'ver','id'=>$video['Album']['slug']))*/),
			'</div>',
			
			$html->div('column'),
				$html->tag('h2',$video['Album']['nombre'],'title super'),
				$html->div('desc tmce',$util->trim($util->txt($video['Album']['descripcion']),500).''),
				$html->div('more',$html->link('Ver todos los Videos',array('controller'=>'albums','action'=>'index'))),
			'</div>';
		}
	
	echo '</div>', // div.featured_video
		$html->div('clear triple'),
			$html->div('column'),
				$html->tag('ul',null,'media'),
					$html->tag('li',$html->link('Eventos',array('controller'=>'events','action'=>'index')),'eventos'),
					$html->tag('li',$html->link('Galería y Videos',array('controller'=>'albums','action'=>'index'))),
				'</ul>',
				$html->div('banners',$this->element('banners',array('w'=>240)),array('id'=>'banners')), $moo->showcase('banners',array('nav'=>'out')),
			'</div>',

			$html->div('column tips'),
				$html->div('wrapper'),
					$html->tag('h2','MEDIDAS PARA PREVENIR EL SECUESTRO Y LA EXTORSIÓN','title'),
					$html->div('scroller',null,array('id'=>'scroller'));

					if($tips){
						foreach ($tips as $tip) {
							echo $html->div('desc tmce',$tip['Tip']['nombre']);
						}
						echo $moo->scroller('scroller',array('wait'=>5800));
					}
					
					echo '</div>',
				'</div>',
			'</div>',

			$html->div('column poll'),
				$html->div('wrapper'),
					$html->div('title title2 super','Encuesta Anónima'),
					$this->element('poll'),
					$html->link('Ver encuesta completa',array('controller'=>'polls','action'=>'index')),

				'</div>',
			'</div>',
		'</div>',

		$html->div('clear social'),
			$this->element('facebook',array('box'=>true,'url'=>Configure::read('Site.fb'),'w'=>'100%','h'=>222)),
			$this->element('twitter',array('box'=>true,'w'=>454,'h'=>222)),
		'</div>';
?>
</div>
</div>