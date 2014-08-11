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

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_account_customer->addCustomer($this->request->post);

			$this->customer->login($this->request->post['email'], $this->request->post['password']);

			unset($this->session->data['guest']);

			// Default Shipping Address
			// if ($this->config->get('config_tax_customer') == 'shipping') {
			// 	$this->session->data['shipping_country_id'] = $this->request->post['country_id'];
			// 	$this->session->data['shipping_zone_id'] = $this->request->post['zone_id'];
			// 	$this->session->data['shipping_postcode'] = $this->request->post['postcode'];				
			// }

			// Default Payment Address
			// if ($this->config->get('config_tax_customer') == 'payment') {
			// 	$this->session->data['payment_country_id'] = $this->request->post['country_id'];
			// 	$this->session->data['payment_zone_id'] = $this->request->post['zone_id'];			
			// }

			$this->redirect($this->url->link('account/success'));
		}

		if(isset($this->error['email'])){
			$this->data['error'] = $this->error['email'];
		}

		if(isset($this->error['warning'])){
			$this->data['error'] = $this->error['warning'];
		}

		if(isset(  $this->error['password'] )){
			$this->data['error'] =   $this->error['password'] ;
		}


		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/register.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/register.tpl';
		} else {
			$this->template = 'default/template/account/register.tpl';
		}

		$this->response->setOutput($this->render());	
	}

	protected function validate() {
	

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
		// agree check
		// if ($this->config->get('config_account_id')) {
		// 	$this->load->model('catalog/information');

		// 	$information_info = $this->model_catalog_information->getInformation($this->config->get('config_account_id'));

		// 	if ($information_info && !isset($this->request->post['agree'])) {
		// 		$this->error['warning'] = sprintf($this->language->get('error_agree'), $information_info['title']);
		// 	}
		// }

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