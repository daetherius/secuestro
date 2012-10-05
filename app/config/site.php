<?php
$config['Site'] = array(
	'name'=>'Promoción de la Seguridad Personal y Familiar',
	'domain'=>$_SERVER['SERVER_NAME'],
	'email'=>'info@'.$_SERVER['SERVER_NAME'],
	'slogan'=>'Prevención de delitos: Privación ilegal de la libertad, extorsión y secuestro',
	'keywords'=>'',
	'description'=>'',
	'tw'=>'http://twitter.com/proseguridadmid',
	'fb'=>'http://www.facebook.com/pages/Proseguridad/203247783141234'
);

$config['Site']['og'] = array(
	'title'=>$config['Site']['name'],
	'type'=>'company',// blog, article
	'url'=>'http://'.$config['Site']['domain'],
	'image'=>'http://'.$config['Site']['domain'].'/img/logo.png',
	'site_name'=>$config['Site']['name'],
	'description'=>$config['Site']['description'],

	'itemtype'=>'organization' //article
);

/**
 * Modos de uso:
 * Crea por elemento (nombre de controlador) un array asociativo compuesto de las siguientes claves
 * - label: Nombre general del catálogo para el usuario; puede establecerse sin la clave si es el primer elemento del array
 * - route: URL personalizada del controlador; si no se especifica, lo toma de 'label'
 * - menu: Nombre del catálogo en el menú principal de navegación; Sólo los elementos que cuenten con esta clave aparecerán en el menú
 * - admin: Nombre del catálogo en el menú del panel de administración, o si es array: Si tiene 1 elemento indica la clase del botón, o si son 2 elementos, el label y la clase; si no se especifica, lo toma de 'menu', sino de 'label'; especificar a false para omitir
*/
$modules = array(
	'nodes'=>array('infórmate','menu','admin'=>array('pages')),
		'nodeimgs'=>array('imágenes','admin'=>false),
	
	'tips'=>array('Cómo prevenir','menu','admin'=>array('posts')),
		'categories'=>array('Categ. Cómo Prevenir','singu'=>'Categoría','admin'=>array('tags')),
	
	'posts'=>array('Comparte tips','menu','admin'=>array('posts')),
		'postimgs'=>array('imágenes','admin'=>false),
		'comments'=>array('comentarios','admin'=>array('comment')),
		
	'links'=>array('Links','menu','admin'=>array('links')),
	
	'albums'=>array('galería','menu'=>'Difunde y previene','admin'=>array('Galería/Videos','photos')),
		'albumimgs'=>array('imágenes','admin'=>false),
	'events'=>array('Eventos','admin'=>array('')),
		'eventimgs'=>array('imágenes','admin'=>false),

	'numeros'=>array('Números de emergencia','menu','admin'=>false),
	'banners'=>array('admin'=>array('banners')),
	'polls'=>array('encuestas','admin'=>array('faqs')),
		'questions'=>array('preguntas','admin'=>false),
		'answers'=>array('Encuestas','admin'=>false),
		'visitors'=>array('visitantes','admin'=>false),

	'users'=>array('Usuarios','admin'=>array('users')),
);

$cached_modules = Cache::read('sitemodules');

if((!$cached_modules) || Configure::read('debug')){
	foreach($modules as $idx => $mod){
		$mod = Set::normalize($mod);
		
		if((!isset($mod['label']))){
			if(in_array($label = key($mod),array('admin','menu','singu'))){
				$mod['label'] = $idx;
			} else {
				$mod['label'] = $label;
				unset($mod[$label]);
			}
		}
		
		if(array_key_exists('menu',$mod) && (!isset($mod['menu']))) $mod['menu'] = $mod['label'];
		if(!isset($mod['admin'])){
			if(isset($mod['menu']) && $mod['menu'])
				$mod['admin'] = $mod['menu'];
			else
				$mod['admin'] = $mod['label'];
		} elseif(is_array($mod['admin'])) {
			if(sizeof($mod['admin'])>1){
				$mod['admin'] = array('label'=>$mod['admin'][0],'class'=>$mod['admin'][1]);
			} else {
				$mod['admin'] = array('label'=>$mod['label'],'class'=>$mod['admin'][0]);
			}
		}
		
		if(!array_key_exists('route',$mod)) $mod['route'] = strtolower(Inflector::slug($mod['label']));
		
		if(is_numeric($idx)){
			unset($modules[$idx]);
			$modules[$mod['label']] = $mod;
		} else
			$modules[$idx] = $mod;
	}
	
	Cache::write('sitemodules',$modules);
} else
	$modules = $cached_modules;

$config['Modules'] = $modules;
?>