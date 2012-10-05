<?php
App::import('Controller','_base/Items');
class AlbumsController extends ItemsController{
	var $name = 'Albums';
	var $pageTitle = 'Galería de Fotos';
	var $uses = array('Album','Albumimg','Comment');
	var $paginate = array('Album'=>array('limit'=>8));

	function index() {
		$this->m[0]->recursive = -1;
		$this->paginate['Album']['recursive'] = -1;
		$this->paginate['Album']['contain'] = array('Albumportada','Albumimg');
		$items = $this->paginate($this->uses[0],$this->m[0]->find_(null,'paginate'));
		$this->set(compact('items'));
	}
}
?>