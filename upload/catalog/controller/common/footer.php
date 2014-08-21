<?php  
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');
		
		/*pan change begin*/
		$this->load->model('catalog/information');
		
		$this->data['informations'] = array();
		
		
		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$this->data['informations'][] = array(
					'title' => $result['title'],
					/*改*/
					'description' => html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8'),
					/*改--the end--*/
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id']
					)
				);
			}
    	}
		/*pan change the end*/

		$this->data['powered'] = sprintf($this->language->get('text_powered'),  date('Y', time()));

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}

		$this->render();
	}
}
?>