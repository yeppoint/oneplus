<?php 
class ControllerAccountLogin extends Controller {
	private $error = array();

	public function index() {
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