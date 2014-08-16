<?php

class ControllerClientServiceHelpCenter extends Controller {
    public function index() {
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

        
        $this->load->model('pavblog/category');
        $this->load->model('pavblog/blog');
        
        $all_articles = array();
        $all_categories = array();
        
        $categories = $this->model_pavblog_category->getChild(1);
        
       	$first = true; 
        foreach ($categories as $category) {
            $articles = $this->model_pavblog_blog->getSameCategory($category['category_id']);
            if ($articles) {
                $this->injectUrlIntoArticles($articles);
                if ($first) {
                    $this->data['blog_id'] = $articles[0]['blog_id'];
                    $first = false;
                }
                $all_articles[$category['category_id']] = $articles;
                $all_categories[] = $category;
            }
        }
         
        if ($this->request->server['REQUEST_METHOD'] == 'GET' && isset($this->request->get['faq_id'])) {
            $this->data['blog_id'] = (int)$this->request->get['faq_id'];
        }       
        
        $this->data['all_articles'] = $all_articles;
        $this->data['all_categories'] = $all_categories;
        
     	$this->template = 'default/template/clientservice/helpcenter.tpl';
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