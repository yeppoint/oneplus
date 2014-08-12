<?php 
class ControllerAccountRegister extends Controller {
	private $error = array();
	//email password 
	////data[''error]
	public function index() {
		if ($this->customer->isLogged()) {
			$this->redirect($this->url->link('account/account', '', 'SSL'));
		}

		$this->language->load('account/register');


		$this->load->model('account/customer');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') ) {
            /**
             * if faild return json:
             * {
                    error:'error msg..'
             * }
             *if ok return json:
             * {
                    redirect :'index.php'
             * }
             */
            if($this->validate()){
                $this->model_account_customer->addCustomer($this->request->post);

                $this->customer->login($this->request->post['email'], $this->request->post['password']);

                unset($this->session->data['guest']);

                $json =array(
                    'redirect' =>'index.php',
                );

            }else{
                if(isset($this->error['email'])){
                    $error_msg = $this->error['email'];
                }

                if(isset($this->error['warning'])){
                    $error_msg = $this->error['warning'];
                }

                if(isset($this->error['password'] )){
                    $error_msg =   $this->error['password'] ;
                }

                if(isset($this->error['captcha'])){
                    $error_msg =   $this->error['captcha'] ;
                }

                if(isset($this->error['password_diff'])){
                    $error_msg =   $this->error['password_diff'] ;
                }

                $json =array(
                        'error' =>$error_msg,
                 );
            }
            $this->response->addHeader('Content-Type: application/json');
            $this->response->setOutput(json_encode($json));
            return;
		}

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/register.tpl';
		} else {
			$this->template = 'default/template/account/register.tpl';
		}

		$this->response->setOutput($this->render());	
	}

	protected function validate() {
        if(!isset($this->session->data['captcha']) || $this->request->post['captcha'] != $this->session->data['captcha'] ){
            $this->error['captcha'] =$this->language->get('error_captcha');
        }

		if ((utf8_strlen($this->request->post['email']) > 96) || !preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ($this->model_account_customer->getTotalCustomersByEmail($this->request->post['email'])) {
			$this->error['warning'] = $this->language->get('error_exists');
		}

		// Customer Group
		$this->load->model('account/customer_group');

		if (isset($this->request->post['customer_group_id']) && is_array($this->config->get('config_customer_group_display')) && in_array($this->request->post['customer_group_id'], $this->config->get('config_customer_group_display'))) {
			$customer_group_id = $this->request->post['customer_group_id'];
		} else {
			$customer_group_id = $this->config->get('config_customer_group_id');
		}

		$customer_group = $this->model_account_customer_group->getCustomerGroup($customer_group_id);

		if ((utf8_strlen($this->request->post['password']) < 6) || (utf8_strlen($this->request->post['password']) > 16)) {
			$this->error['password'] = $this->language->get('error_password');
		}

        if($this->request->post['password'] != $this->request->post['password2']){
            $this->error['password_diff'] = $this->language->get('error_password_diff');
        }

		if (!$this->error) {
			return true;
		} else {
			return false;
		}


	}

	public function country() {
		$json = array();

		$this->load->model('localisation/country');

		$country_info = $this->model_localisation_country->getCountry($this->request->get['country_id']);

		if ($country_info) {
			$this->load->model('localisation/zone');

			$json = array(
				'country_id'        => $country_info['country_id'],
				'name'              => $country_info['name'],
				'iso_code_2'        => $country_info['iso_code_2'],
				'iso_code_3'        => $country_info['iso_code_3'],
				'address_format'    => $country_info['address_format'],
				'postcode_required' => $country_info['postcode_required'],
				'zone'              => $this->model_localisation_zone->getZonesByCountryId($this->request->get['country_id']),
				'status'            => $country_info['status']		
			);
		}

		$this->response->setOutput(json_encode($json));
	}	
}
?>