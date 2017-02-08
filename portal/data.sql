--  参考ecshop表设计 http://blog.csdn.net/xiaoxiaoqiye/article/details/50722912

-- ------------------------------------------------------
-- 表的结构 `aoaw_admin_action`
CREATE TABLE IF NOT EXISTS `aoaw_admin_action` (
`action_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
`parent_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '该id项的父id，对应本表的action_id字段',
`action_code` varchar(20) NOT NULL COMMENT '代表权限的英文字符串，对应汉文在语言文件中，如果该字段有某个字符串，就表示有该权限',
PRIMARY KEY (`action_id`),
KEY `parent_id` (`parent_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员权限列表树' AUTO_INCREMENT=104 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_admin_log`
CREATE TABLE IF NOT EXISTS `aoaw_admin_log` (
`log_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
`log_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '写日志时间',
`user_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '该日志所记录的操作者id，同ecs_admin_user的user_id',
`log_info` varchar(255) NOT NULL COMMENT '管理操作内容',
`ip_address` varchar(15) NOT NULL COMMENT '管理者登录ip',
PRIMARY KEY (`log_id`),
KEY `log_time` (`log_time`),
KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员操作日志表' AUTO_INCREMENT=158 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_admin_message`
CREATE TABLE IF NOT EXISTS `aoaw_admin_message` (
`message_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
`sender_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '发送该留言的管理员id，同ecs_admin_user的user_id',
`receiver_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '接收消息的管理员id，同ecs_admin_user的user_id，如果是给多个管理员发送，则同一个消息给每个管理员id发送一条',
`sent_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '留言发送时间',
`read_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '留言阅读时间',
`readed` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '留言是否阅读，1，已阅读；0，未阅读',
`deleted` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '留言是否已经是否已经被删除，1，已删除；0，未删除',
`title` varchar(150) NOT NULL COMMENT '留言的主题',
`message` text NOT NULL COMMENT '留言的内容',
PRIMARY KEY (`message_id`),
KEY `sender_id` (`sender_id`,`receiver_id`),
KEY `receiver_id` (`receiver_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员留言记录表' AUTO_INCREMENT=7 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_admin_user`
CREATE TABLE IF NOT EXISTS `aoaw_admin_user` (
`user_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号，管理员代号',
`user_name` varchar(60) NOT NULL COMMENT '管理员登录名',
`email` varchar(60) NOT NULL COMMENT '管理员邮箱',
`password` varchar(32) NOT NULL COMMENT '管理员登录秘密加密串',
`add_time` int(11) NOT NULL DEFAULT '0' COMMENT '管理员添加时间',
`last_login` int(11) NOT NULL DEFAULT '0' COMMENT '管理员最后一次登录时间',
`last_ip` varchar(15) NOT NULL COMMENT '管理员最后一次登录ip',
`action_list` text NOT NULL COMMENT '管理员管理权限列表',
`nav_list` text NOT NULL COMMENT '管理员导航栏配置项',
`lang_type` varchar(50) NOT NULL,
`agency_id` smallint(5) unsigned NOT NULL COMMENT '该管理员负责的办事处的id，同ecs_agency的agency_id字段。如果管理员没负责办事处，则此处为0',
`todolist` longtext COMMENT '记事本记录的数据',
PRIMARY KEY (`user_id`),
KEY `user_name` (`user_name`),
KEY `agency_id` (`agency_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='管理员资料权限列表' AUTO_INCREMENT=4 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_users`
CREATE TABLE IF NOT EXISTS `aoaw_users` (
`user_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员资料自增id',
`email` varchar(60) NOT NULL COMMENT '会员邮箱',
`user_name` varchar(60) NOT NULL COMMENT '用户名',
`password` varchar(32) NOT NULL COMMENT '用户密码',
`question` varchar(255) NOT NULL COMMENT '安全问题答案',
`answer` varchar(255) NOT NULL COMMENT '安全问题',
`sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '性别，0，保密；1，男；2，女',
`birthday` date NOT NULL DEFAULT '0000-00-00' COMMENT '生日日期',
`user_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户现有资金',
`frozen_money` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '用户冻结资金',
`pay_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '消费积分',
`rank_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '会员等级积分',
`address_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '收货信息id，取值表ecs_user_address ',
`reg_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '注册时间',
`last_login` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
`last_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '应该是最后一次修改信息时间，该表信息从其他表同步过来考虑',
`last_ip` varchar(15) NOT NULL COMMENT '最后一次登录ip',
`visit_count` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
`user_rank` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '会员登记id，取值ecs_user_rank',
`is_special` tinyint(3) unsigned NOT NULL DEFAULT '0',
`salt` varchar(10) NOT NULL DEFAULT '0',
`parent_id` mediumint(9) NOT NULL DEFAULT '0' COMMENT '推荐人会员id，',
`flag` tinyint(3) unsigned NOT NULL DEFAULT '0',
`alias` varchar(60) NOT NULL COMMENT '昵称',
`msn` varchar(60) NOT NULL COMMENT 'msn',
`qq` varchar(20) NOT NULL COMMENT 'qq号',
`office_phone` varchar(20) NOT NULL COMMENT '办公电话',
`home_phone` varchar(20) NOT NULL COMMENT '家庭电话',
`mobile_phone` varchar(20) NOT NULL COMMENT '手机',
`is_validated` tinyint(3) unsigned NOT NULL DEFAULT '0',
`credit_line` decimal(10,2) unsigned NOT NULL COMMENT '信用额度',
PRIMARY KEY (`user_id`),
UNIQUE KEY `user_name` (`user_name`),
KEY `email` (`email`),
KEY `parent_id` (`parent_id`),
KEY `flag` (`flag`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=21 ;
-- 表的结构 `aoaw_user_account`
CREATE TABLE IF NOT EXISTS `aoaw_user_account` (
`id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
`user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户登录后保存在session中的id号，跟users表中的user_id对应',
`admin_user` varchar(255) NOT NULL COMMENT '操作该笔交易的管理员的用户名',
`amount` decimal(10,2) NOT NULL COMMENT '资金的数目，正数为增加，负数为减少',
`add_time` int(10) NOT NULL DEFAULT '0' COMMENT '记录插入时间',
`paid_time` int(10) NOT NULL DEFAULT '0' COMMENT '记录更新时间',
`admin_note` varchar(255) NOT NULL COMMENT '管理员的被准',
`user_note` varchar(255) NOT NULL COMMENT '用户的被准',
`process_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '操作类型，1，退款；0，预付费，其实就是充值',
`payment` varchar(90) NOT NULL COMMENT '支付渠道的名称，取自payment的pay_name字段',
`is_paid` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已经付款，０，未付；１，已付',
PRIMARY KEY (`id`),
KEY `user_id` (`user_id`),
KEY `is_paid` (`is_paid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户资金流动表，包括提现和充值' AUTO_INCREMENT=7 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_account_log`
CREATE TABLE IF NOT EXISTS `aoaw_account_log` (
`log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增ID号',
`user_id` mediumint(8) unsigned NOT NULL COMMENT '用户登录后保存在session中的id号，跟users表中的user_id对应',
`user_money` decimal(10,2) NOT NULL COMMENT '用户该笔记录的余额',
`frozen_money` decimal(10,2) NOT NULL COMMENT '被冻结的资金',
`rank_points` mediumint(9) NOT NULL COMMENT '等级积分，跟消费积分是分开的',
`pay_points` mediumint(9) NOT NULL COMMENT '消费积分，跟等级积分是分开的',
`change_time` int(10) unsigned NOT NULL COMMENT '该笔操作发生的时间',
`change_desc` varchar(255) NOT NULL COMMENT '该笔操作的备注，一般是，充值或者提现。也可是是管理员后台写的任何在备注',
`change_type` tinyint(3) unsigned NOT NULL COMMENT '操作类型，0为充值，1为提现，2为管理员调节，99为其他类型',
PRIMARY KEY (`log_id`),
KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户帐号情况记录表，包括资金和积分等' AUTO_INCREMENT=42 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_user_address`
CREATE TABLE IF NOT EXISTS `aoaw_user_address` (
`address_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
`address_name` varchar(50) NOT NULL,
`user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '用户表中的流水号',
`consignee` varchar(60) NOT NULL COMMENT '收货人的名字',
`email` varchar(60) NOT NULL COMMENT '收货人的email',
`country` smallint(5) NOT NULL DEFAULT '0' COMMENT '收货人的国家',
`province` smallint(5) NOT NULL DEFAULT '0' COMMENT '收货人的省份',
`city` smallint(5) NOT NULL DEFAULT '0' COMMENT '收货人的城市',
`district` smallint(5) NOT NULL DEFAULT '0' COMMENT '收货人的地区',
`address` varchar(120) NOT NULL COMMENT '收货人的详细地址',
`zipcode` varchar(60) NOT NULL COMMENT '收货人的邮编',
`tel` varchar(60) NOT NULL COMMENT '收货人的电话',
`mobile` varchar(60) NOT NULL COMMENT '收货人的手机',
`sign_building` varchar(120) NOT NULL COMMENT '收货地址的标志性建筑名',
`best_time` varchar(120) NOT NULL COMMENT '收货人的最佳收货时间',
PRIMARY KEY (`address_id`),
KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='收货人的信息表' AUTO_INCREMENT=4 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_user_bonus`
CREATE TABLE IF NOT EXISTS `aoaw_user_bonus` (
`bonus_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '红包的流水号',
`bonus_type_id` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '红包发送类型.0,按用户如会员等级,会员名称发放;1,按商品类别发送;2,按订单金额所达到的额度发送;3,线下发送',
`bonus_sn` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '红包号,如果为0就是没有红包号.如果大于0,就需要输入该红包号才能使用红包',
`user_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '该红包属于某会员的id.如果为0,就是该红包不属于某会员',
`used_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '红包使用的时间',
`order_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '使用了该红包的交易号',
`emailed` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '猜的，应该是是否已经将红包发送到用户的邮箱；1，是；0，否；',
PRIMARY KEY (`bonus_id`),
KEY `user_id` (`user_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='已经发送的红包信息列表' AUTO_INCREMENT=122 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_user_feed`
CREATE TABLE IF NOT EXISTS `aoaw_user_feed` (
`feed_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
`user_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`value_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0',
`feed_type` tinyint(1) unsigned NOT NULL DEFAULT '0',
`is_feed` tinyint(1) unsigned NOT NULL DEFAULT '0',
PRIMARY KEY (`feed_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_user_rank`
CREATE TABLE IF NOT EXISTS `aoaw_user_rank` (
`rank_id` tinyint(3) unsigned NOT NULL AUTO_INCREMENT COMMENT '会员等级编号，其中0是非会员',
`rank_name` varchar(30) NOT NULL COMMENT '会员等级名称',
`min_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该等级的最低积分',
`max_points` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '该等级的最高积分',
`discount` tinyint(3) unsigned NOT NULL DEFAULT '0' COMMENT '该会员等级的商品折扣',
`show_price` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否在不是该等级会员购买页面显示该会员等级的折扣价格.1,显示;0,不显示',
`special_rank` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否事特殊会员等级组.0,不是;1,是',
PRIMARY KEY (`rank_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='会员等级配置信息' AUTO_INCREMENT=3 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_virtual_card`
CREATE TABLE IF NOT EXISTS `aoaw_virtual_card` (
`card_id` mediumint(8) NOT NULL AUTO_INCREMENT COMMENT '虚拟卡卡号自增id',
`goods_id` mediumint(8) unsigned NOT NULL DEFAULT '0' COMMENT '该虚拟卡对应的商品id，取值于表ecs_goods',
`card_sn` varchar(60) NOT NULL COMMENT '加密后的卡号',
`card_password` varchar(60) NOT NULL COMMENT '加密后的密码',
`add_date` int(11) NOT NULL DEFAULT '0' COMMENT '卡号添加日期',
`end_date` int(11) NOT NULL DEFAULT '0' COMMENT '卡号截至使用日期',
`is_saled` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否卖出，0，否；1，是',
`order_sn` varchar(20) NOT NULL COMMENT '卖出该卡号的交易号，取值表ecs_order_info',
`crc32` int(11) NOT NULL DEFAULT '0' COMMENT 'crc32后的key',
PRIMARY KEY (`card_id`),
KEY `goods_id` (`goods_id`),
KEY `car_sn` (`card_sn`),
KEY `is_saled` (`is_saled`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='虚拟卡卡号库' AUTO_INCREMENT=8 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_vote`
CREATE TABLE IF NOT EXISTS `aoaw_vote` (
`vote_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '在线调查自增id',
`vote_name` varchar(250) NOT NULL COMMENT '在线调查主题',
`start_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '在线调查开始时间',
`end_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '在线调查结束时间',
`can_multi` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '能否多选，0，可以；1，不可以',
`vote_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票人数也可以说投票次数',
PRIMARY KEY (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='网站调查信息记录表' AUTO_INCREMENT=3 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_vote_log`
CREATE TABLE IF NOT EXISTS `aoaw_vote_log` (
`log_id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票记录自增id',
`vote_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '关联的投票主题id，取值表ecs_vote',
`ip_address` varchar(15) NOT NULL COMMENT '投票的ip地址',
`vote_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '投票的时间',
PRIMARY KEY (`log_id`),
KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='投票记录表' AUTO_INCREMENT=5 ;
-- ------------------------------------------------------
-- 表的结构 `aoaw_vote_option`
CREATE TABLE IF NOT EXISTS `aoaw_vote_option` (
`option_id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '投票选项自增id',
`vote_id` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '关联的投票主题id，取值表ecs_vote',
`option_name` varchar(250) NOT NULL COMMENT '投票选项的值',
`option_count` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '该选项的票数',
PRIMARY KEY (`option_id`),
KEY `vote_id` (`vote_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='投票的选项内容表' AUTO_INCREMENT=8 ;