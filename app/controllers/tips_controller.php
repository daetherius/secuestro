<?php
App::import('Controller','_base/Categorizeditems');
class TipsController extends CategorizeditemsController {
	var $name = 'Tips';
	var $uses = array('Tip');

	function index() {
		$conds = array();
		if($category = $this->_setcategory()){
			$conds[$this->uses[0].'.'.strtolower($this->m[0]->baseCategory).'_id'] = $category['id'];
		} else {
			if($def_category = $this->m[0]->Category->find_(array('contain'=>false),'first')){
				$this->redirect(array('category'=>$def_category['Category']['slug']));
			}
		}

		$items = $this->m[0]->find_(array('contain'=>false,'conditions'=>$conds));
		$this->set(compact('items'));
	}
}
?>