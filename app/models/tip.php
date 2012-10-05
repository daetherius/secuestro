<?php
class Tip extends AppModel {
	var $name = 'Tip';
	var $belongsTo = array('Category');
	var $labels = array();
	var $skipValidation = array();
	var $validate = array();
}
?>