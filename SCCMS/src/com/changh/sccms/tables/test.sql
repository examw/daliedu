select * from tbOrder;
select g.* from tbGrade g join tbExamCategory ec on g.exam_id = ec.exam_id where exam_pid = 1002;

select * from tbStudent where stu_area like '%上海%';

select o.* from tbOrder o where o.stu_id =127 and o.order_status in(0,1,2,5);
select * from tbOrder o right join tbItems i on o.order_id = i.order_id where o.stu_id = 127 and i.item_name like '%一级建造%';
update tbOrder set order_price=2888.0 where order_id = 1027
sp_columns tbAdministor;
sp_columns tbCard;
alter table tbCard add card_balance float ;
select * from tbTeacher;
update tbTeacher set tch_imgUrl = '/SCCMS/upload/teacherface/20130412133923_.jpg' where tch_id =472 ;
delete from tbCard where card_id>100000060
select * from tbExamCategory where exam_pid=0;
select * from tbReply;
select * from tbAskOrComplain;
sp_columns tbOrder;
sp_columns tbItems;
select * from tbItems;
alter table tbItems add item_overTime datetime;

alter table tbStudent add stu_type int default 0;

select * from tbPackageCategory
select * from tbClassPackage

select cp.* from tbClassPackage cp join tbPackageCategory pc on cp.pType_id = pc.pType_id where exam_id = 1002 and cp.pkg_rMatureDate > 2014-03-15 ;

sp_columns tbExpressCompany
alter table tbExpressCompany add epc_addr varchar(100) 
insert into tbExpressCompany(epc_id,epc_name,epc_url,epc_phone,epc_orderId,epc_addr)
values(1001,'顺风','www.xxxx.com','400123456',1,'湖南省长沙市');
insert into tbExpressCompany(epc_id,epc_name,epc_url,epc_phone,epc_orderId,epc_addr)
values(1002,'申通','www.abcd.com','400123456',1,'湖南省长沙市');
--alter table tbOrder drop column order_no;
sp_columns tbCard;

--创建
CREATE    FUNCTION    idSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(card_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(card_id),@MINNUM-1)+1
               END
        FROM tbCard)
END
--
if exists(
   select * from sys.objects 
   where name='tbCard'
     
) 
    drop table tbCard
/*==============================================================*/
/* Table: tbCard                                                */
/*==============================================================*/
create table tbCard 
(
	id					int								identity(1,1),
   card_id              int							   default dbo.sqlSequence(),
   card_password        varchar(50)                    not null,
   card_value           int                            not null,
   card_addTime         datetime                       not null,
   card_overTime        datetime                       not null,
   stu_id               bigint                         ,
   card_useTime         datetime                       ,
   card_isPresent       int                            default 0,--是否增送【0:不送，1:送】
   constraint PK_TBCARD primary key clustered (card_id)
);
alter table tbCard alter column stu_id bigint;
insert into tbCard(card_password,card_value,card_addTime,card_overTime)values('sXif73sD',50,'2013-01-01','2014-01-01');
select * from tbCard where card_addTime>'2013-01-03';
delete from tbCard;
select top 5 * from tbCard where card_useTime is null order by card_addTime desc;

select * from tbCard order by card_id asc
select * from tbGrade
select * from tbExamCategory where exam_name like '%公%'
select * from tbStudent e join tbOrder o on e.stu_id = o.stu_id;
select * from tbOrder where order_status =1 and stu_id = 127;
select * from tbItems;
select * from tbTeacher where tch_username like '%王%';
select * from tbClassPackage;
select * from tbAdministor where adm_id like '%10%';
select * from tbSend;
select * from tbAskOrComplain
update tbSend set send_expressNo ='201303271012' where send_id = 1003;
select * from tbOrder;
select * from tbMenu;
--select * from tbExamPaper;
update tbExamPaper set paper_clickNum = 1 where id = 4;
select * from tbExamRecord;
select rcd_answers from tbExamRecord where id=11;
select * from tbQuestionError;
select * from tbExamRule;
update tbExamRule set rule_actualAddNum = 0 where id = 8
select * from tbExamQuestion where quest_ruleId = 1001;
update tbExamQuestion set quest_optionNum = 4 where id = 20
select * from tbExamQuestion where quest_id in (1001,1010,1003);
select top 1 quest_LinkQuestionId from tbExamQuestion order by quest_orderId asc;
sp_columns tbItems;
sp_columns tbOrder;
sp_columns tbSend;
sp_columns tbExamCategory;
sp_columns tbClassPackage;
sp_columns tbGrade;
sp_columns tbDeal;
sp_columns tbQuestion;
sp_columns tbTeacher
sp_columns tbStudent;
sp_columns tbLecture;
sp_columns tbTrade
sp_columns tbRechargeRecord
sp_columns tbAdministor
sp_columns tb_tbClassPackage_tbGrade
sp_columns tbExamQuestion;
sp_columns tbExamRecord;
sp_columns tbMenu;
sp_columns 
sp_columns 
select * from tbTrade where trade_time < 2012-01-01;
delete from tbTrade where order_id = 1023;
delete from tbSend;
select * from tbStudent;
select * from tbReply;
select * from tbTeacher;
select * from tbMenu;
alter table tbTeacher alter column tch_valuation varchar(1000);
alter table tbTeacher alter column tch_description varchar(3000);
select * from tbOrder o join (select i.*,cp.deal_id from tbItems i join tbClassPackage cp on i.productId= cp.pkg_id where i.item_pType=0 and cp.deal_id is not null) dd on o.order_id = dd.order_id;

insert into tbOrder(order_id,order_no,stu_id,order_money,order_invoice,order_status,order_addTime)
values(1,'1000001',125,500.0,1,0,'2013-01-05');
insert into tbOrder(order_id,order_no,stu_id,order_money,order_invoice,order_status,order_addTime)
values(2,'1000002',125,500.0,0,1,'2013-01-05');
insert into tbOrder(order_id,order_no,stu_id,order_money,order_invoice,order_status,order_addTime)
values(3,'1000003',125,500.0,1,2,'2013-01-06');
insert into tbOrder(order_id,order_no,stu_id,order_money,order_invoice,order_status,order_addTime)
values(4,'1000004',125,500.0,1,3,'2013-01-06');
update tbOrder set order_payType ='200|300' where order_id=2;
insert into tbItems(item_id,order_id,productId,item_oPrice,item_rPrice,item_name,item_pType)
values(1,1,1,500.00,300.00,'一级建造师建筑工程全科VIP套餐 ',0);
insert into tbItems(item_id,order_id,productId,item_oPrice,item_rPrice,item_name,item_pType)
values(2,1,1,500.00,200.00,'建设工程经济精讲班',1);
insert into tbSend(order_id,send_content,send_status,send_type)
values(1014,'作图教材',0,0);
update tbOrder set order_payType ='200|300',order_payTime='2013-01-08' where order_id=2;
update tbOrder set order_payType ='0:3776.0' where order_id=1014;
update tbOrder set order_status = 2 where order_id=3;
update tbOrder set order_money = 500.0 where order_id=2;
update tbOrder set order_payType ='200|300',order_payTime='2013-01-08',order_status=1 where order_id=2;
update tbStudent set stu_email ='lala@qq.com' where stu_id = 130;
select * from tbOrder where 1=1 and order_id like '%3\%' or '1\%'='1%';
select * from tbOrder where 1=1and order_id=1;

select * from tbStudent where stu_id = 125;
update tbStudent set stu_card=0,stu_cash=0 where stu_id =125;
alter table tbSend add send_detail varchar(500);
alter table tbSend add send_addTime datetime;
alter table tbSend add send_cost float default 0.0;
alter table tbSend drop column send_cost;
alter table tbSend add epc_name varchar(30);
alter table tbSend add send_content varchar(20);
alter table tbSend add addr_id int;
alter table tbSend drop column addr_id;
alter table tbSend drop column send_orderId;
alter table tbSend add send_receiveName varchar(20);
alter table tbSend add send_fullAddress varchar(200);
alter table tbSend add send_mobile varchar(20);
alter table tbSend add send_postalCode varchar(20);
alter table tbSend add send_type int;
alter table tbSend add send_expressNo varchar(50);
update tbSend set send_expressNo='201303261030' where send_id =1001;
alter table tbItems add item_sPrice float;
alter table tbTrade alter column trade_pattern varchar(20);
alter table tbTrade add trade_orderNo varchar(30);
alter table tbTrade add trade_CardBalance float;
alter table tbTrade add trade_CashBalance float;
alter table tbOrder alter column order_no varchar(40);
alter table tbOrder add order_note varchar(300);
alter table tbOrder add order_isNeedSend int;
alter table tbOrder add order_sendDetail varchar(2000);
alter table tbOrder add order_price float;
alter table tbOrder add adm_username varchar(50);
update tbItems set item_sPrice = 300 where item_id =1;
update tbItems set item_sPrice = 200 where item_id =2;




insert into tbSend(send_id,order_id,send_status,send_detail,send_addTime)
values(1,2,0,'发票；一级建造师全科教材','2012/12/28 12:00:00');
select * from tbSend;
update tbSend set send_cost =20.0 where id = 7 
delete from tbSend;

sp_columns tbQuestion;
alter table tbQuestion alter column question_source int;

create table log4sccms
(
	id bigint identity(1,1) primary key,
	message varchar(200),
);
select * from log4sccms;
alter table tbTeacher alter column tch_id int default (dbo.sqlSequence());
alter table tbStudent alter column stu_email varchar(50) null;
alter table tbStudent alter column stu_LoginIp varchar(50) null;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForTeacher')
begin
ALTER TABLE tbTeacher DROP CONSTRAINT ConstraintIdForTeacher
end
alter table tbTeacher add constraint ConstraintIdForTeacher default dbo.tchIdSequence() for tch_id;

if exists(select   *  from   sysobjects   where   name='tchIdSequence')
begin
drop function tchIdSequence
end
CREATE    FUNCTION    tchIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(tch_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(tch_id),@MINNUM-1)+1
               END
        FROM tbTeacher)
END
alter table tbTeacher add constraint ConstraintIdForTeacher default dbo.tchIdSequence() for tch_id;
select * from tbTeacher;
delete from tbTeacher;

select * from tbItems i join tbClassPackage cp on (i.item_id = cp.pkg_id and i.item_pType=0) join tbGrade g on (i.item_id = g.grade_id and i.item_pType=1)    

SELECT * FROM sys.Tables


ALTER TABLE tbAdministor add admin_url varchar(500);
alter table tbAdministor add role_id int
ALTER TABLE tbRole add role_describe varchar(500);

-------------------------------------------------
select * from (
    select ROW_NUMBER() OVER(
        order by o2.order_addTime desc) as pos, 
        o2.*
        from
         (select distinct o1.* from
            tbOrder o1, tbItems i
            where o1.order_id  = i.order_id and o1.stu_id =127 and i.item_name like '%一级建造%'
        ) as o2) as sp where pos between 0 and 10;

---------------------------------
select * from tbExamRecord;
update tbExamRecord set stu_id=1002 where id<8
select rank from(select ROW_NUMBER() OVER(order by er.rcd_Score desc) as rank,er.* from tbExamRecord er)as er1 where er1.stu_id=1002 and er1.paper_id=1001

select t.* from tbTrade t,tbStudent s where t.stu_id = s.stu_id and s.stu_username = 'hahaha' order by t.trade_time desc;  