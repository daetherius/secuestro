<?php
echo
	$this->element('adminhdr',array('links'=>array('back'))),
	$this->element('inputs'),
	$this->element('tinymce',array('advanced'=>1,'size'=>'m'));

	$moo->buffer('
		var check_album_or_video = function(){
			var opt_fields = [$("AlbumUrl").getParent(),$$("div.input.file")[0]];
			
			if($("AlbumTipo").get("value") == "video")
				opt_fields.reverse();
			
			opt_fields[0].dissolve();
			opt_fields[1].reveal();
			
		}; check_album_or_video();
	');
	$moo->addEvent('AlbumTipo','click','check_album_or_video()');
?>