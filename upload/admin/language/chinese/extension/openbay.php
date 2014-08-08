<?php
/**
 * $Author: http://www.opencartchina.com 
**/

// Heading 
$_['lang_heading_title']        = 'OpenBay Pro'; 
$_['lang_text_manager']         = 'OpenBay Pro manager'; 

// Text
$_['text_install']              = '安装';
$_['text_uninstall']            = '卸载';
$_['lang_text_success']         = '成功：设定已保存';
$_['lang_text_no_results']      = '没有符合条件的结果';
$_['lang_checking_version']     = '检查软件版本';
$_['lang_btn_manage']           = 'Manage';
$_['lang_btn_retry']            = '重试';
$_['lang_btn_save']             = '保存';
$_['lang_btn_cancel']           = '取消';
$_['lang_btn_update']           = '更新';
$_['lang_btn_settings']         = '设定';
$_['lang_btn_patch']            = 'Patch';
$_['lang_btn_test']             = '测试链接';
$_['lang_latest']               = '您使用的是最新版本';
$_['lang_installed_version']    = '已安装版本';
$_['lang_admin_dir']            = 'Admin directory';
$_['lang_admin_dir_desc']       = 'If you have changed your admin directory update it to the new location';
$_['lang_version_old_1']        = 'A new version is available. Your version is';
$_['lang_version_old_2']        = 'the latest is';
$_['lang_use_beta']             = '使用测试(Beta)版本';
$_['lang_use_beta_2']           = '不建议如此！';
$_['lang_test_conn']            = '测试 FTP 链接';
$_['lang_text_run_1']           = '执行更新';
$_['lang_text_run_2']           = '执行';
$_['lang_no']                   = '否';
$_['lang_yes']                  = '是';
$_['lang_language']             = 'API 接口接受语言';
$_['lang_getting_messages']     = '获取 OpenBay Pro 信息';

// Column
$_['lang_column_name']          = '插件名称';
$_['lang_column_status']        = '状态';
$_['lang_column_action']        = '操作';

// Error
$_['error_permission']          = '警告：您无权限修改 eBay 扩展功能！';
$_['lang_error_retry']          = '无法链接到 OpenBay 服务器。 ';

// Updates
$_['lang_use_pasv']                     = 'Use passive FTP';
$_['field_ftp_user']                    = 'FTP Username';
$_['field_ftp_pw']                      = 'FTP Password';
$_['field_ftp_server_address']          = 'FTP server address';
$_['field_ftp_root_path']               = 'FTP path on server';
$_['field_ftp_root_path_info']          = '(No trailing slash e.g. httpdocs/www)';
$_['desc_ftp_updates']                  = 'Enabling updates from here means you do not have to manually update your module using the standard drag and drop through FTP. Your FTP are not sent to the API.<br />';

//Updates
$_['lang_run_patch_desc']               = 'Post update patch<span class="help">Only needed if you manually update</span>';
$_['lang_run_patch']                    = 'Run patch';
$_['update_error_username']             = 'Username expected';
$_['update_error_password']             = 'Password expected';
$_['update_error_server']               = 'Server expected';
$_['update_error_admindir']             = 'Admin directory expected';
$_['update_okcon_noadmin']              = 'Connection OK but your OpenCart admin directory was not found';
$_['update_okcon_nofiles']              = 'Connection OK but OpenCart folders were not found! Is your root path correct?';
$_['update_okcon']                      = 'Connected to server OK. OpenCart folders found';
$_['update_failed_user']                = 'Could not login with that user';
$_['update_failed_connect']             = 'Could not connect to server';
$_['update_success']                    = 'Module has been updated (v.%s)';
$_['lang_patch_notes1']                 = 'To read about the recent and past updates';
$_['lang_patch_notes2']                 = 'click here';

//Help tab
$_['lang_help_title']                   = 'Information on help & support';
$_['lang_help_support_title']           = 'Support';
$_['lang_help_support_description']     = 'You should read our FAQ section to see if your question is already answered <a href="http://shop.openbaypro.com/index.php?route=information/faq" title="OpenBay Pro for OpenCart support FAQ">here</a>. <br />If you cannot find an answer then you can create a support ticket, <a href="http://support.welfordmedia.co.uk" title="OpenBay Pro for OpenCart support site">click here</a>';
$_['lang_help_template_title']          = 'Creating eBay templates';
$_['lang_help_template_description']    = 'Information for developers &amp; designers on creating custom templates for their eBay listings, <a href="http://shop.openbaypro.com/index.php?route=information/faq&topic=30" title="OpenBay Pro HTML templates for eBay">click here</a>';

$_['lang_tab_help']                     = 'Help';
$_['lang_help_guide']                   = 'User guides';
$_['lang_help_guide_description']       = 'To download and view the eBay and Amazon user guides <a href="http://shop.openbaypro.com/index.php?route=information/faq&topic=37" title="OpenBay Pro user guides">click here</a>';

$_['lang_mcrypt_text_false']            = 'PHP function "mcrypt_encrypt" is not enabled. Contact your hosting provider.';
$_['lang_mb_text_false']                = 'PHP library "mb strings" is not enabled. Contact your hosting provider.';
$_['lang_ftp_text_false']               = 'PHP FTP functions are not enabled. Contact your hosting provider.';
$_['lang_error_oc_version']             = 'Your version of OpenCart is not tested to work with this module. You may experience problems.';
$_['lang_patch_applied']                = 'Patch applied';
$_['faqbtn']                            = 'View FAQ';
$_['lang_clearfaq']                     = 'Clear hidden FAQ popups';
$_['lang_clearfaqbtn']                  = 'Clear';

// Ajax elements
$_['lang_ajax_ebay_shipped']            = 'The order will be marked as shipped on eBay automatically';
$_['lang_ajax_play_shipped']            = 'The order will be marked as shipped on Play.com automatically';
$_['lang_ajax_amazoneu_shipped']        = 'The order will be marked as shipped on Amazon EU automatically';
$_['lang_ajax_amazonus_shipped']        = 'The order will be marked as shipped on Amazon US automatically';
$_['lang_ajax_play_refund']             = 'A refund will be issued to play.com for this order automatically';
$_['lang_ajax_refund_reason']           = 'Refund reason';
$_['lang_ajax_refund_message']          = 'Refund message';
$_['lang_ajax_refund_entermsg']         = 'You must enter a refund message';
$_['lang_ajax_refund_charmsg']          = 'Your refund message must be less than 1000 characters';
$_['lang_ajax_refund_charmsg2']         = 'Your message cannot contain the characters > or <';
$_['lang_ajax_courier']                 = 'Courier';
$_['lang_ajax_courier_other']           = 'Other courier';
$_['lang_ajax_tracking']                = 'Tracking #';
$_['lang_ajax_tracking_msg']            = 'You must enter a tracking id, use "none" if you do not have one';
$_['lang_ajax_tracking_msg2']           = 'Your tracking ID cannot contain the characters > or <';
$_['lang_ajax_tracking_msg3']           = 'You must select courier if you want to upload tracking no.';
$_['lang_ajax_tracking_msg4']           = 'Please leave courier field empty if you want to use custom courier.';

$_['lang_title_help']                   = 'Need help with OpenBay Pro?';
$_['lang_pod_help']                     = 'Help';
$_['lang_title_manage']                 = 'Manage OpenBay Pro; updates, settings and more';
$_['lang_pod_manage']                   = 'Manage';
$_['lang_title_shop']                   = 'OpenBay Pro store; addons, templates and more';
$_['lang_pod_shop']                     = 'Store';

$_['lang_checking_messages']            = 'Checking for messages';
$_['lang_title_messages']               = 'Messages &amp; notifications';
