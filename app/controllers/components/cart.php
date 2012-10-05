<?php
class CartComponent extends Object {
	var $guest = true;
	var $msg = array(
		'add_one'=>'+1',
		'add_win'=>'Agregado al carrito.',
		'add_fail'=>'No se pudo agregar al carrito.',
		'remove'=>'Elemento eliminado.',
	);
	var $components = array('Cookie','Session','Paypal');

	function initialize(&$controller) {
		$this->controller =& $controller;
		$this->Product = ClassRegistry::init('Product');
		fb($this->Session->read('cart'),'Session->cart');
	}

	function docheckout(){
		$items = $this->Session->read('cart.items');
		$this->controller->set(compact('items'));

	}

	function add2cart($item_id = false,$type_id = false){
		if($item_id){
			$item = $this->Product->find_(array(
				$item_id,
				'contain'=>array('Productportada'),
				'fields'=>array('nombre','slug','precio','Productportada.src')
			),'first');
			
			if($item){
				$item['Product']['type'] = false;

				if($type_id && $type = $this->Product->Type->find_(array($type_id,'contain'=>false,'fields'=>array('id','nombre','precio')))){
					$item_id.='_'.$type_id;
					$item['Product']['type'] = $type['Type']['nombre'];
					
					if(isset($type['Type']['precio']) && $type['Type']['precio'])
						$item['Product']['precio'] = $type['Type']['precio'];
				}

				if($this->Session->check('cart.items.'.$item_id)){
					$this->Session->write('cart.items.'.$item_id.'.qty',$this->Session->read('cart.items.'.$item_id.'.qty')+1);
					$this->response($this->msg['add_one']); return;

				} else {
					$item['qty'] = 1;
					$this->Session->write('cart.items.'.$item_id,$item);
					$this->response($this->msg['add_win']); return;
				}
			}
		}

		$this->response($this->msg['add_fail']);
	}

	function updateqty(){
		if($this->controller->data){
			$response = '';
			foreach($this->controller->data['Product'] as $item_key => $item){
				if($this->Session->check('cart.items.'.$item_key)){
					$item_precio = $this->Session->check('cart.items.'.$item_key.'.precio');
					$this->Session->write('cart.items.'.$item_key.'.qty',(int)$item['qty']);
					$response.='$("precio_'.$item_key.'").set("html",'.(number_format($item['qty']*$item_precio,2)).');';
				}
			}
			$this->response($response);
		}
	}

	function remove($item_id){
		if($this->Session->check('cart.items.'.$item_id)){
			//$this->Session->delete('cart.items.'.$item_id);
		}

		//$this->response(,true);
	}

	function checkout(){
		$items = $this->Session->read('cart.items');
		$this->controller->set(compact('items'));
	}
	
	function response($msg,$js = false){
		if(isset($this->controller->params['isAjax']) && $this->controller->params['isAjax']){
			if(!$js) $msg = 'alert("'.$msg.'");';
			$ajax = $msg;
			$this->controller->set(compact('ajax'));
			$this->controller->render('js');
		} else {
			$this->controller->redirect($this->controller->referer(),true);
		}		
	}

	function beforeRender(&$controller){
		//if($this->guest){ $this->Cookie->write('cart',$this->Session->read('cart')); }
	}
	
}
?>