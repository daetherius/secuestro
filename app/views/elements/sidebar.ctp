<div class="sidebar">
<div class="pad">
<?php
if(is_c('inicio',$this)){
}

if(is_c('nodes',$this) && $items = Cache::read('node_recent')){
	echo $html->tag('ul',null,'bulleted');

	foreach($items as $slug => $nombre){
		$selected = isset($this->passedArgs[0]) && $slug == $this->passedArgs[0] ? 'selected' : '';
		echo $html->tag('li',$html->link($nombre,array('controller'=>Inflector::tableize('node'),'action'=>'ver','id'=>$slug)),$selected);
	}

	echo '</ul>';
}

if(is_c('tips',$this) && $items = Cache::read('category_recent')){
	echo $html->tag('ul',null,'bulleted');

	foreach($items as $slug => $nombre){
		$selected = isset($category) && $slug == $category['slug'] ? 'selected' : '';
		echo $html->tag('li',$html->link($nombre,array('controller'=>Inflector::tableize('tip'),'action'=>'index','category'=>$slug)),$selected);
	}

	echo '</ul>';
}

if(is_c('posts',$this) && $items = Cache::read('post_recent')){
	echo $html->tag('ul',null,'bulleted');

	foreach($items as $slug => $nombre){
		$selected = isset($this->passedArgs[0]) && $slug == $this->passedArgs[0] ? 'selected' : '';
		echo $html->tag('li',$html->link($nombre,array('controller'=>'posts','action'=>'ver','id'=>$slug)),$selected);
	}

	echo '</ul>';
}

echo $html->div('banners',$this->element('banners'),array('id'=>'banners')), $moo->showcase('banners',array('nav'=>'out'));
?>
</div>
</div>