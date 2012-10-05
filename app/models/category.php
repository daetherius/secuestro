<?php
class Category extends AppModel {
	var $name = 'Category';
	var $hasMany = array('Tip');
	var $actsAs = array('Tree');
	var $asTree = false;

}
?>