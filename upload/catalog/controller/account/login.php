<?php 
class ControllerAccountLogin extends Controller {
	private $error = array();

	public function index() {
        $this->load->language('account/login');
        //logo and icon
        if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        if ($this->config->get('config_icon') && file_exists(DIR_IMAGE . $this->config->get('config_icon'))) {
            $this->data['icon'] = $server . 'image/' . $this->config->get('config_icon');
        } else {
            $this->data['icon'] = '';
        }
        
        if ($this->config->get('config_logo') && file_exists(DIR_IMAGE . $this->config->get('config_logo'))) {
            $this->data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $this->data['logo'] = '';
        }   
        //text
        $this->data['text_welcome'] = $this->language->get('text_welcome');
        $this->data['text_email'] = $this->language->get('text_email');
        $this->data['text_username'] = $this->language->get('text_username');
        $this->data['text_password'] = $this->language->get('text_password');
        $this->data['text_captcha'] = $this->language->get('text_captcha');
        $this->data['text_register'] = $this->language->get('text_register');
        $this->data['text_login'] = $this->language->get('text_login');
         
		$this->load->model('account/customer');

		// Login override for admin users
		if (!empty($this->request->get['token'])) {
			$this->customer->logout();
			$this->cart->clear();

		    $this->redirect($this->url->link('account/login', '', 'SSL'));

		}		

		if ($this->customer->isLogged()) {  
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}

		$this->language->load('account/login');
        /**
         * if login faild ,return
         * {
         *    w:'error_msg'
         * }
         * if login ok ,return
         * {
         *    redirect :'index.php?route=account/account'
         * }
         */
        if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
            if($this->validate()){
                unset($this->session->data['guest']);
                $json = array(
                    'redirect' => 'index.php?route=account/account'
                );
            }else{
                $json = array(
                    'warning' => $this->error['warning']
                );
            }

            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
            return;
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/login.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/login.tpl';
		} else {
			$this->template = 'default/template/account/login.tpl';
		}

		$this->response->setOutput($this->render());
	}

	protected function validate() {
		if (!$this->customer->login($this->request->post['email'], $this->request->post['password'])) {
			$this->error['warning'] = $this->language->get('error_login');
		}

        if(!isset($this->session->data['captcha']) || $this->request->post['captcha'] !=$this->session->data['captcha'] ){
            $this->error['warning'] = $this->language->get('error_captcha');
        }

		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
}
?>