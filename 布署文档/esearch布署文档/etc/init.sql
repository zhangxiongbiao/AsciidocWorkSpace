--初始化ES_PROPERTY表
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('69071620587BD24D90C8431310E8C16D', 'sfzh', '身份证号', '用于标识该列为身份证号', null, null, '张雄彪', '2015-09-29 10:40:38.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('4AEB98723735D0B09C0BAD1CD2FB4F70', 'rksj', '入库时间', '标识该列为入库时间', null, null, '张雄彪', '2015-09-29 16:01:11.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('03F22FE2B64DB4C1DBE65DE1143BCE79', 'gxsj', '更新时间', '标识该列为更新时间', null, null, '张雄彪', '2015-09-29 16:01:58.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('C1950BD89ECC1131B9644556866F8AC0', 'is_store', '存储索引', '标识该列需要存储索引', null, null, '张雄彪', '2015-09-30 14:41:31.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('16DD5A1A739DB97DD798437D24CC8B10', 'not_result', '非结果列', '不作为结果列显示', null, null, '张雄彪', '2015-10-09 10:52:43.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('6D2F31226884C184DF0BF11D276EE00C', 'pk', '主键', '主键列', null, null, '张雄彪', '2015-09-30 14:41:59.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('8604847BCBAFF2781BFF902F01AAEF24', 'date', '日期列', '标注该列为日期列', null, null, '张雄彪', '2015-10-09 10:25:02.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('968EBFA0945AAC986CA736195784E83D', 'csrq', '出生日期', '标注该列为出生日期列', null, null, '张雄彪', '2015-10-09 10:25:17.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('018CC39A8EADFCDB8DA894C2A680ECFF', 'not_query', '非查询列', '标识该列不是查询列', null, null, '张雄彪', '2015-10-09 11:32:48.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('AF001A8D9BBEE2B66D85556E4ED89818', 'is_notAnalyzed', '不分词处理', '额外为该列建立一个不分词的列，其列名为当前列列名_BAK。如XM_BAK', null, null, '张雄彪', '2015-10-09 14:28:53.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('15632236A2BBA294AFC6AD4BAAE1ED47', 'not_show', '不显示', '该列在页面上不显示，同not_result不同的是：not_result控制返回结果中是否存在，而它控制是否需要在页面上显示', null, null, '张雄彪', '2015-11-12 15:15:44.000000');
insert into "GONGANYUN2"."ES_PROPERTY" ("ID","PROPERTY_CODE","PROPERTY_NAME","NOTE","MEMO1","MEMO2","UPDATE_USER","UPDATE_TIME") values ('4C5C63F2061DDFEDF3F1E5D2ED9F9991', 'key', '关键列', '用于描述云搜索中连接各表的关键列，如sfzh，case_id，wpph等', null, null, '张雄彪', '2015-11-12 15:24:51.000000');


--添加参数URL_ESEARCH2，请注意修改后面的访问地址 
insert into wmf_param values(GUID(),'URL_ESEARCH2','全文检索管理2','全文检索管理2的路径','http://localhost:8080/esearch2','');

insert into wmf_param (param_id    ,param_key   ,param_name  ,param_effect,param_value ,note) values(GUID(),'IS_CLUSTER','是否全文检索集群','是否全文检索集群','false',null);

--挂接菜单
insert into wmf_menu values('601028','601','全文检索管理2','','folder.gif','/','tabpane1',1,1,'');
insert into wmf_menu values('601028001','601028','全文检索管理2','','folder.gif','/','tabpane1',1,1,'');
insert into wmf_menu values('601028001001','601028001','索引表管理','','data_manage.png','$!{URL_ESEARCH2}/manage/IndexTable_init.do','_self',1,1,'');
insert into wmf_menu values('601028001002','601028001','索引节点管理','','data_manage.png','$!{URL_ESEARCH2}/manage/Node_list.do','_self',1,1,'');
insert into wmf_menu values('601028001003','601028001','查询方案管理','','data_manage.png','$!{URL_METADATA}/query/queryScheme_list.do','tabpanel',1,1,'');

--加入超级管理员的所有菜单权限
insert into wmf_role_menu_mapping
(
select guid(), role_id, menu_id from wmf_role, wmf_menu where role_id = 'ROLE_001'
and menu_id not in (select menu_id from wmf_role_menu_mapping where role_id = 'ROLE_001')
);