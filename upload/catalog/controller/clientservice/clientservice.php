<?php

class ControllerClientServiceClientService extends Controller {
    public function index() {
        $this->document->addScript('catalog/view/javascript/help.js');
        $this->document->addStyle('catalog/view/css/help.css');
        $this->language->load('clientservice/clientservice');
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('clientservice/clientservice'),
            'text' => $this->language->get('text_clientservice'),
            'separator' => ' / '
        );
        
        $this->data['text_selfservice'] = $this->language->get('text_selfservice');
        $this->data['text_helpcenter'] = $this->language->get('text_helpcenter');
        $this->data['text_contactservice'] = $this->language->get('text_contactservice');
        
        $this->load->model('pavblog/category');
        $this->load->model('pavblog/blog');
        $articles = array();
        $this->data['first_level_categories'] = $this->model_pavblog_category->getChild(1);
        $this->data['blogs'] = $this->model_pavblog_blog->getListBlogs(array());
        
    	$this->template = 'default/template/clientservice/clientservice.tpl';
    	$this->children = array(
        	'common/header',
        	'common/footer'
    	);
    
    	$this->response->setOutput($this->render());
    }
    
    public function helpCenter() {
        $this->document->addScript('catalog/view/javascript/help.js');
        $this->document->addStyle('catalog/view/css/clientservice.css');
        $this->document->addStyle('catalog/view/css/help.css');
        $this->language->load('clientservice/clientservice');
        
        $this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('common/home'),
            'text' => $this->language->get('text_home'),
            'separator' => false
        );
        
        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('clientservice/clientservice'),
            'text' => $this->language->get('text_clientservice'),
            'separator' => ' / '
        );
        
        $this->data['breadcrumbs'][] = array(
            'href' => $this->url->link('clientservice/clientservice/helpcenter'),
            'text' => $this->language->get('text_helpcenter'),
            'separator' => ' / '
        );
        
    	$this->template = 'default/template/clientservice/helpcenter.tpl';
    	$this->children = array(
        	'common/header',
        	'common/footer'
    	);
        
        $this->load->model('pavblog/category');
        $this->load->model('pavblog/blog');
        $articles = array();
        $this->data['first_level_categories'] = $this->model_pavblog_category->getChild(1);
        $this->data['blogs'] = $this->model_pavblog_blog->getListBlogs(array());
    
    	$this->response->setOutput($this->render());
    }
    
    public function contactUs() {
    }
}

?>