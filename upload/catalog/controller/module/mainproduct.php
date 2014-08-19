<?php

class ControllerModuleMainproduct extends Controller {
    /**
     * 要结合general func design attribute使用
     */
    private function index() {
        $this->load->language('module/mainproduct');
        $this->data['text_general'] = $this->language->get('text_general');
        $this->data['text_function'] = $this->language->get('text_function');
        $this->data['text_design'] = $this->language->get('text_design');
        $this->data['text_attribute'] = $this->language->get('text_attribute');
        $this->data['text_buy_product'] = $this->language->get('text_buy_product');
        
        $this->load->model('catalog/product');
        $this->load->model('setting/setting');
        
        $code = $this->session->data['language'];
        
        $mainproduct_setting = $this->model_setting_setting->getSetting('mainproduct');
        if ($mainproduct_setting) {
            $mainproduct = array();
            $mainproduct['product'] = $this->model_catalog_product->getProduct($mainproduct_setting['product-id']);
            $mainproduct['status'] = $mainproduct_setting['status'];
            $mainproduct['general_description'] = html_entity_decode($mainproduct_setting['general-description'][$code], ENT_QUOTES, 'UTF-8');
            $mainproduct['function_description'] = html_entity_decode($mainproduct_setting['function-description'][$code], ENT_QUOTES, 'UTF-8');
            $mainproduct['design_description'] = html_entity_decode($mainproduct_setting['design-description'][$code], ENT_QUOTES, 'UTF-8');
            $mainproduct['attribute_description'] = html_entity_decode($mainproduct_setting['attribute-description'][$code], ENT_QUOTES, 'UTF-8');
            $this->data['mainproduct'] = $mainproduct;
        }
        
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . 'template/module/mainproduct.tpl')) {
            $this->template = $this->config->get('config_template') . 'template/module/mainproduct.tpl';
        } else {
        	$this->template = 'default/template/module/mainproduct.tpl';
        }
        
        $this->children = array(
            'common/header',
            'common/footer'
        );       
    }

    public function general(){
        $this->index();
        if (isset($this->data['mainproduct']))
            $this->data['description'] = $this->data['mainproduct']['general_description'];
        else
            $this->data['description'] = '';
        return $this->response->setOutput($this->render());
    }

    public  function func(){
        $this->index();
        if (isset($this->data['mainproduct']))
            $this->data['description'] = $this->data['mainproduct']['function_description'];
        else
            $this->data['description'] = '';
        return $this->response->setOutput($this->render());
    }

    public function design(){
        $this->index();
        if (isset($this->data['mainproduct']))
            $this->data['description'] = $this->data['mainproduct']['design_description'];
        else
            $this->data['description'] = '';
        return $this->response->setOutput($this->render());
    }

    public function attribute(){
        $this->index();
        if (isset($this->data['mainproduct']))
            $this->data['description'] = $this->data['mainproduct']['attribute_description'];
        else
            $this->data['description'] = '';
        return $this->response->setOutput($this->render());
    }
}

?>
