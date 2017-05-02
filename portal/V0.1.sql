-- woucloud.com
-- 沃云-充满财富和智慧的云平台
-- 权限
-- 用户与博客关系表，当只想要哪几个人可以看时，也可能直接加一个角色，角色配置权限,app_id 0默认为平台，

-- 用户表参考wordpress 来源：http://www.moke8.com/article-16358-1.html  后面这个更清楚 http://www.bkjia.com/PHPjc/1116239.html
CREATE TABLE IF NOT EXISTS 'wou_users' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,
'user_login' varchar(60) NOT NULL DEFAULT '',  
'user_pass' varchar(255) NOT NULL DEFAULT '',  
'user_nicename' varchar(50) NOT NULL DEFAULT '',  
'user_email' varchar(100) NOT NULL DEFAULT '',  
'user_url' varchar(100) NOT NULL DEFAULT '',  
'user_registered' datetime NOT NULL DEFAULT '0000-00-00 00:00:00',  
'user_activation_key' varchar(255) NOT NULL DEFAULT '',  
'user_status' int(11) NOT NULL DEFAULT '0',  
'display_name' varchar(250) NOT NULL DEFAULT '',
'app_id' int(11) NOT NULL DEFAULT '0',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'user_login_key' ('user_login'),  KEY 'user_nicename' ('user_nicename')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=2 ;

CREATE TABLE IF NOT EXISTS 'wou_usermeta' (  
'umeta_id' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'user_id' bigint(20) unsigned NOT NULL DEFAULT '0',  
'meta_key' varchar(255) DEFAULT NULL,  
'meta_value' longtext,  
PRIMARY KEY ('umeta_id'),  KEY 'user_id' ('user_id'),  KEY 'meta_key' ('meta_key'(191))) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

-- 角色表
CREATE TABLE IF NOT EXISTS 'wou_roles' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'role_name' varchar(50) NOT NULL DEFAULT '',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '', 
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 用户与角色关联表
CREATE TABLE IF NOT EXISTS 'wou_user_role' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'user_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'role_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'user_id' ('user_id'),  KEY 'role_id' ('role_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;


-- 权限表  权限类型：删除、编辑、新增、查看、下载、
CREATE TABLE IF NOT EXISTS 'wou_rights' (
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,
'right_type' varchar(50) NOT NULL DEFAULT '',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 角色与权限关联表
CREATE TABLE IF NOT EXISTS 'wou_role_right' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'role_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'right_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'role_id' ('role_id'),  KEY 'right_id' ('right_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 用户组表
CREATE TABLE IF NOT EXISTS 'wou_group' (
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,
'group_name' varchar(50) NOT NULL DEFAULT '',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 用户与用户组关联表
CREATE TABLE IF NOT EXISTS 'wou_group_user' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'user_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'group_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'user_id' ('user_id'),  KEY 'group_id' ('role_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 角色与用户组关联表
CREATE TABLE IF NOT EXISTS 'wou_group_role' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'role_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'group_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'role_id' ('role_id'),  KEY 'group_id' ('group_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 菜单表
CREATE TABLE IF NOT EXISTS 'wou_menus' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'menu_name' varchar(50) NOT NULL DEFAULT '',
'menu_url' varchar(120) NOT NULL DEFAULT '',
'parent_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'parent_id' ('parent_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 页面元素表
CREATE TABLE IF NOT EXISTS 'wou_elements' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'element_code' varchar(50) NOT NULL DEFAULT '',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 文件表
CREATE TABLE IF NOT EXISTS 'wou_files' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,
'file_uuid' varchar(50) NOT NULL DEFAULT '',
'file_name' varchar(120) NOT NULL DEFAULT '',
'file_dir' varchar(120) NOT NULL DEFAULT '',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'file_uuid' ('file_uuid')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 功能操作表
CREATE TABLE IF NOT EXISTS 'wou_actions' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'action_name' varchar(50) NOT NULL DEFAULT '',
'action_code' varchar(50) NOT NULL DEFAULT '',
'action_url' varchar(120) NOT NULL DEFAULT '',
'parent_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'parent_id' ('parent_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5 ;

-- 菜单与权限关联表
CREATE TABLE IF NOT EXISTS 'wou_right_menu' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'menu_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'right_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'menu_id' ('menu_id'),  KEY 'right_id' ('right_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

-- 网页元素与权限关联表
CREATE TABLE IF NOT EXISTS 'wou_right_element' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'element_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'right_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'element_id' ('element_id'),  KEY 'right_id' ('right_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

-- 网页元素与权限关联表
CREATE TABLE IF NOT EXISTS 'wou_right_file' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'file_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'right_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'file_id' ('file_id'),  KEY 'right_id' ('right_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

-- 功能操作与权限关联表
CREATE TABLE IF NOT EXISTS 'wou_right_action' ( 
'ID' bigint(20) unsigned NOT NULL AUTO_INCREMENT,  
'action_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'right_id' bigint(20) unsigned NOT NULL DEFAULT '0',
'app_id' int(11) NOT NULL DEFAULT '0',
'remark' varchar(250) NOT NULL DEFAULT '',  
PRIMARY KEY ('ID'),  KEY 'app_id' ('app_id'),  KEY 'action_id' ('action_id'),  KEY 'right_id' ('right_id')) 
ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=5;

