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
            'separator' => $this->language->get('text_separator')
        );
        
        $this->data['text_selfservice'] = $this->language->get('text_selfservice');
        $this->data['text_helpcenter'] = $this->language->get('text_helpcenter');
        $this->data['text_contactservice'] = $this->language->get('text_contactservice');
        $this->data['text_order_tracking'] = $this->language->get('text_order_tracking');
        $this->data['text_delivery_tracking'] = $this->language->get('text_delivery_tracking');
        $this->data['text_register'] = $this->language->get('text_register');
        $this->data['text_forget_password'] = $this->language->get('text_forget_password');
        $this->data['text_after_sale'] = $this->language->get('text_after_sale');
        $this->data['text_more'] = $this->language->get('text_more');
        
        $this->load->model('pavblog/category');
        $this->load->model('pavblog/blog');
        $all_articles = array();
        $all_categories = array();
        $categories = $this->model_pavblog_category->getChild(1);
        
        foreach ($categories as $category) {
            $articles = $this->model_pavblog_blog->getSameCategory($category['category_id']);
            if ($articles) {
                $this->injectUrlIntoArticles($articles);
                $all_articles[$category['category_id']] = $articles;
                $all_categories[] = $category;
            }
        }
        
        $this->data['all_articles'] = $all_articles;
        $this->data['all_categories'] = $all_categories;
        $this->data['link_more'] = $this->url->link('clientservice/helpcenter', '', 'SSL');
        
    	$this->template = 'default/template/clientservice/clientservice.tpl';
    	$this->children = array(
        	'common/header',
        	'common/footer'
    	);
    
    	$this->response->setOutput($this->render());
    }
    
    private function injectUrlIntoArticles(&$articles) {
        foreach ($articles as &$article) {
        	$article['link'] = $this->url->link('clientservice/helpcenter&faq_id=' . $article['blog_id'], '', 'SSL');
        }
    }
}

?>