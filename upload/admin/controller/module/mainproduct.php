<?php

class ControllerModuleMainproduct extends Controller {
	public function index() {
		$this->load->language('module/mainproduct');
		$this->load->model('catalog/product');
		$this->load->model('setting/setting');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_filter_name'] = $this->language->get('text_filter_name');
		$this->data['text_option'] = $this->language->get('text_option');
		$this->data['text_general'] = $this->language->get('text_general');
		$this->data['text_function'] = $this->language->get('text_function');
		$this->data['text_design'] = $this->language->get('text_design');
		$this->data['text_status'] = $this->language->get('text_status');
		$this->data['text_enable'] = $this->language->get('text_enable');
		$this->data['text_disable'] = $this->language->get('text_disable');
		$this->data['text_attribute'] = $this->language->get('text_attribute');
		$this->data['text_product_image'] = $this->language->get('text_product_image');
		$this->data['text_product_name'] = $this->language->get('text_product_name');
		$this->data['text_product_quantity'] = $this->language->get('text_product_quantity');
		$this->data['text_product_price'] = $this->language->get('text_product_price');
		$this->data['text_product_model'] = $this->language->get('text_product_model');
		$this->data['text_product_status'] = $this->language->get('text_product_status');
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_filter'] = $this->language->get('button_filter');
		
		$this->data['breadcrumbs'] = array();
		
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => false
		);
		
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);	
			
		$this->data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/mainproduct', 'token=' . $this->session->data['token'], 'SSL'),
			'separator' => ' :: '
		);		
		
		if ($this->request->server['REQUEST_METHOD'] == 'POST') {
			$this->model_setting_setting->editSetting('mainproduct', $this->request->post);
			$this->session->data['success'] = $this->language->get('text_success');
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->data['token'] = $this->session->data['token'];
		$this->data['action'] = $this->url->link('module/mainproduct', 'token=' . $this->session->data['token'], 'SSL');
		$this->data['filter_action'] = $this->url->link('module/mainproduct/filter', '', 'SSL');
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
        
        $this->load->model('localisation/language');
        $this->data['languages'] = $this->model_localisation_language->getLanguages();
		
		$mainproduct_setting = $this->model_setting_setting->getSetting('mainproduct');
		if ($mainproduct_setting) {
			$this->load->model('tool/image');
            /*
			$this->data['product'] = $this->model_catalog_product->getProduct($mainproduct_setting['product-id']);
			$this->data['status'] = $mainproduct_setting['status'];
			$this->data['product']['image'] = $this->model_tool_image->resize($this->data['product']['image'], 40, 40);
			$this->data['general_description'] = $mainproduct_setting['general-description'];
			$this->data['function_description'] = $mainproduct_setting['function-description'];
			$this->data['design_description'] = $mainproduct_setting['design-description'];
			$this->data['attribute_description'] = $mainproduct_setting['attribute-description'];
            */
            $this->data['mainproduct'] = array();
            $this->data['mainproduct']['product'] = $this->model_catalog_product->getProduct($mainproduct_setting['product-id']);
            $this->data['mainproduct']['status'] = $mainproduct_setting['status'];
            $this->data['mainproduct']['product']['image'] = $this->model_tool_image->resize($this->data['mainproduct']['product']['image'], 40, 40);
            $this->data['mainproduct']['general_description'] = $mainproduct_setting['general-description'];
            $this->data['mainproduct']['function_description'] = $mainproduct_setting['function-description'];
            $this->data['mainproduct']['design_description'] = $mainproduct_setting['design-description'];
            $this->data['mainproduct']['attribute_description'] = $mainproduct_setting['attribute-description'];
		}
		
		$this->template = 'module/mainproduct.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		
		return $this->response->setOutput($this->render());
	}
	
	public function filter() {
		if (isset($this->request->get['filter_name'])) {
			$filter_name = $this->request->get['filter_name'];
		} else {
			$filter_name = null;
		}
		
		$this->load->model('catalog/product');
		$data = array(
			'filter_name'     => $filter_name,
			'filter_model'    => null,
			'filter_price' 	  => null,
			'filter_quantity' => null,
			'filter_status'   => null,
			'sort' 			  => 'pd.name',
			'order' 		  => 'ASC'
		);
		
		$this->load->model('tool/image');
		$results = $this->model_catalog_product->getProducts($data);
		foreach ($results as &$result) {
			$result['image'] = $this->model_tool_image->resize($result['image'], 40, 40);
		}
		if ($results) {
			return $this->response->setOutput(json_encode($results));
		} else {
			return $this->response->setOutput(json_encode(array()));
		}
	}
}

?>