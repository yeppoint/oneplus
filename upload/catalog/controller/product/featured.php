<?php
class ControllerProductFeatured extends Controller{
    //get produect  ..then var_dump it
    public function Index(){
        $this->load->language('product/featured');

        $this->data['featured_product'] = $this->language->get('featured_product');
        $this->data['all_product'] = $this->language->get('all_product');

        $this->load->model('catalog/product');
        $this->load->model('tool/image');


        $products = explode(',', $this->config->get('featured_product'));
      
        //featured_products
        $this->data['featured_products'] = array();

        foreach ($products as $product_id) {
            $product_info = $this->model_catalog_product->getProduct($product_id);

            if ($product_info) {
                $this->data['featured_products'][] = array(
                    'product_id' => $product_info['product_id'],
                    'name'       => $product_info['name'],
                    'image'      => $this->model_tool_image->resize($product_info['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
                    'price'      => $product_info['price'],
                    'href'       => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
                );
            }
        }   
        //all products
        $this->data['all_products'] = array();
        $all_products = $this->model_catalog_product->getProducts();
        foreach ($all_products as $product) {
              $this->data['all_products'][] = array(
                    'product_id' => $product['product_id'],
                    'name'       => $product['name'],
                    'image'      => $this->model_tool_image->resize($product['image'], $this->config->get('config_image_thumb_width'), $this->config->get('config_image_thumb_height')),
                    'price'      => $product['price'],
                    'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
                );
        }

        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/featured.tpl')) {
            $this->template = $this->config->get('config_template') . '/template/product/featured.tpl';
        } else {
            $this->template = 'default/template/product/featured.tpl';
        }

        $this->children = array(
            'common/header',
            'common/footer'
        );

        $this->response->setOutput($this->render());
    }
}