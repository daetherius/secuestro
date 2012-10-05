<?php
$network = isset($network) && $network ? $network : 'facebook';
if($network == 'facebook'){
echo
	$html->tag('iframe','',array(
		'src'=>'//www.facebook.com/plugins/likebox.php?href='.urlencode(Configure::read('Site.fb')).'&width=230&height=590&colorscheme=light&show_faces=true&border_color=%23D7B03A&stream=true&header=false',
		'scrolling'=>'no',
		'frameborder'=>0,
		'style'=>'border:none; overflow:hidden; width:220px; height:590px;background-color:#fff;margin-bottom:16px;',
		'allowTransparency'=>'false'
	));

} else {
echo
	$html->script('http://widgets.twimg.com/j/2/widget.js',array('inline'=>true)),
	$html->scriptBlock('new TWTR.Widget({
	  version: 2,
	  type: "profile",
	  rpp: 3,
	  interval: 30000,
	  width: 220,
	  height: 300,
	  theme: {
	    shell: {
	      background: "#D7B03A",
	    },
	    tweets: {
	      background: "#ffffff",
	      color: "#333",
	      links: "#C89D0B"
	    }
	  },
	  features: {
	    scrollbar: false,
	    loop: false,
	    live: false,
	    behavior: "all"
	  }
	}).render().setUser("oprevidem").start();',array('inline'=>true)),
'</div>';
}
?>
