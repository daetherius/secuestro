<?php
if($item){
	$shop = isset($shop) ? $shop : false;
	$v = (isset($v) && $v) || $shop ? 'v' : '';
	$model = isset($model) ? $model : $_m[0];
	$comments = isset($comments) ? $comments : false;
	$mini = isset($mini) ? $mini : false;
	$layout = isset($layout) ? $layout : array();
	$class = isset($class) && $class ? $class : '';
	$thopts = isset($thopts) && $thopts ? $thopts : array('w'=>164,'h'=>128,'fill'=>true);
	
	$th = array(
		'img'=>false,
		'nombre'=>false,
		'fecha'=>false,
		'desc'=>false,
		'comments'=>false,
		'mas'=>false
	);
	
	if($layout){
		$fill = array_fill(0,sizeof($layout),false);
		$th = array_combine($layout,$fill);
	}
	
	$url = array(
		'controller'=>Inflector::tableize($model),
		'action'=>'ver',
		'id'=>isset($item[$model]['slug']) && $item[$model]['slug'] ? $item[$model]['slug'] : $item[$model]['id']
	);

	switch($model){
		case 'Video':
			$th['mas'] = 'Ver video';
		break; //---------------

		case 'Event':
			$url = '/'.$item['Eventportada']['src'];
			$th['fecha'] = $html->para('date',$util->fdate('s',$item[$model]['fecha']));

			$thopts = array('class'=>'pulsembox');

			$th['nombre'] = $html->tag('h2',$html->link($item[$model]['nombre'],$url,array('class'=>'pulsembox')),'title');
			$th['desc'] = $html->div('desc tmce',$item[$model]['descripcion'].'');
			
		break; //---------------

		case 'Album':
			$url = 'javascript:;';

			if($item[$model]['tipo'] == 'album'){
				$url = '/'.$item['Albumportada']['src'];
				$desc = str_replace('"','',$item['Albumportada']['descripcion']);
				$pbox_atts = array('class'=>'pulsembox','rel'=>'pbox_'.$item[$model]['id'],'title'=>strip_tags($desc),'name'=>$desc);
				$thopts = array('w'=>438,'h'=>246,'fill'=>true,'class'=>'pulsembox','atts'=>$pbox_atts);
				
			} else {
				$th['img'] = $util->youtube($item['Album']['url'],'player',array('width'=>438,'height'=>246));
				$pbox_atts = array();
			}
			
			$th['nombre'] = $html->tag('h2',$html->link($item[$model]['nombre'],$url,$pbox_atts),'title');
			$th['fecha'] = '';
			$th['desc'] = $html->div('desc tmce',$item[$model]['descripcion'].'');

			if(isset($item['Albumimg'])){
				$th['imgs'] = '';
				foreach($item['Albumimg'] as $img){
					if(!$img['portada']){
						$desc = str_replace('"','',$img['descripcion']);
						$th['imgs'].= $html->link($img['src'],'/'.$img['src'],array('class'=>'pulsembox','rel'=>'pbox_'.$item[$model]['id'],'title'=>strip_tags($desc),'name'=>$desc));
					}
				}
				$th['imgs'] = $html->div('hide',$th['imgs']);
			}

			$th['mas'] = false;
		break; //---------------

		case 'Link':
			$url = $item[$model]['enlace'];
			$th['fecha'] = '';
			$th['nombre'] = $html->tag('h2',$html->link($item[$model]['nombre'],$url,array('target'=>'_blank','rel'=>'nofollow')),'title');
			$th['desc'] = $html->div('desc tmce',''.$item[$model]['descripcion']);
			$th['_mas'] = $html->div('more',$html->link('Ir al Link',$url,array('target'=>'_blank','rel'=>'nofollow')));
		break; //---------------
		
		case 'Post':
			$th['desc'] = $html->div('desc tmce',$item[$model]['descripcion'].'');
			$th['mas'] = 'Comentar';
		default:
		break;
	}

	if($mini) $th = array('nombre'=>$th['nombre']);
	
	foreach($th as $key => $value){
		if($value === false){
			switch($key){
				case 'img':
					if(!isset($thopts['url'])) $thopts['url'] = $url;
					$th[$key] = $util->th($item,$model,$thopts);
				break;

				case 'nombre':
					$th[$key] = $html->tag('h2',$html->link($item[$model]['nombre'],$url),'title');
				break;
				
				case 'fecha':
					$th[$key] = $html->para('date',$util->fdate('s',$item[$model]['created']));
				break;
				
				case 'desc':
					$th[$key] = $html->div('desc tmce',''.strip_tags($util->trim($item[$model]['descripcion']),'<b><i><strong><em>'));
				break;
				
				case 'comments':
					if($comments && isset($item[$model]['comment_count']))
						$th[$key] = $html->link($item[$model]['comment_count'],$url,array('class'=>'comments'));
				break;
			}
		} elseif($value && $key === 'mas')
			$th['mas'] = $html->div('more',$html->link($th['mas'],$url));
	}
	
	echo $html->div('thumb '.$class.' '.$v.' '.low($model), implode('',$th));

} else
	echo $html->para('noresults','No hay elemento para mostrar');
?>