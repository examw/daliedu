CREATE    FUNCTION    admIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(adm_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(adm_id),@MINNUM-1)+1
               END
        FROM tbAdministor)
END;

if exists(select   *  from   sysobjects   where   name='ConstraintIdForAdmin')
begin
ALTER TABLE tbAdministor DROP CONSTRAINT ConstraintIdForAdmin
end;
alter table tbAdministor add constraint ConstraintIdForAdmin default dbo.admIdSequence() for adm_id;
--------------------------------------------
CREATE    FUNCTION    tradeIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(trade_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(trade_id),@MINNUM-1)+1
               END
        FROM tbTrade)
END;
if exists(select * from sysobjects where name='tbTrade')
begin
drop table tbTrade
end;
--　　交易时间、交易金额、交易类型、交易IP、交易订单号、充值卡号(非学习卡不填写，用 “--”替代)
create table tbTrade(
	id 	int  identity(1,1),
	trade_id int primary key default dbo.tradeIdSequence(),
	trade_time datetime not null,
	trade_money float not null,
	trade_ip varchar(20),
	order_id int ,
	card_id int,
	trade_type int, 
	trade_note varchar(1000) 
);
--------------------------------------------------------------
CREATE    FUNCTION    sendIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(send_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(send_id),@MINNUM-1)+1
               END
        FROM tbSend)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForSend')
begin
ALTER TABLE tbSend DROP CONSTRAINT ConstraintIdForSend
end;
alter table tbSend add constraint ConstraintIdForSend default dbo.sendIdSequence() for send_id;
------------------------------------------------------------------------------------
CREATE    FUNCTION    epcIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(epc_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(epc_id),@MINNUM-1)+1
               END
        FROM tbExpressCompany)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForEPC')
begin
ALTER TABLE tbExpressCompany DROP CONSTRAINT ConstraintIdForEPC
end;
alter table tbExpressCompany add constraint ConstraintIdForEPC default dbo.epcIdSequence() for epc_id;

-----------------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    paperIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(paper_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(paper_id),@MINNUM-1)+1
               END
        FROM tbExamPaper)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForExamPaper')
begin
ALTER TABLE tbExamPaper DROP CONSTRAINT ConstraintIdForExamPaper
end;
alter table tbExamPaper add constraint ConstraintIdForExamPaper default dbo.paperIdSequence() for paper_id;
-------

IF EXISTS(SELECT * FROM sys.objects WHERE name='tbExamPaper') 
DROP TABLE tbExamPaper 
create table tbExamPaper(
	id int identity(1,1),
	paper_id  int default dbo.paperIdSequence() primary key, --主键
	paper_examId int,	--试卷所属考试的小类
	paper_e_gradeId int,--所属考试类型下的班级id
	paper_e_g_cheaterId int,--该班级下的章节号
	paper_name varchar(256) not null, --试卷名称
	paper_time int not null,--按分钟存数字
	paper_score int not null,--试卷总分
	paper_addTime datetime not null,--试卷添加时间
	paper_type int not null,--试卷类型 1，练习 2 真题， 3 模拟题，4 题库
	paper_clickNum int, --参考人数
	paper_isChecked int,--是否审核（0-没有审核，1-已审核）
	paper_editor varchar(30)--编辑
);
alter table tbExamPaper add paper_linkName varchar(200);
select * from tbExamPaper;
---------------------------------------------------------------------------------------------------
CREATE    FUNCTION    ruleIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(rule_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(rule_id),@MINNUM-1)+1
               END
        FROM tbExamRule)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForExamRule')
begin
ALTER TABLE tbExamRule DROP CONSTRAINT ConstraintIdForExamRule
end;
alter table tbExamRule add constraint ConstraintIdForExamRule default dbo.ruleIdSequence() for rule_id;
-------------
IF EXISTS(SELECT * FROM sys.objects WHERE name='tbExamRule') 
DROP TABLE tbExamRule 
create table tbExamRule(
	id int identity(1,1),
	rule_id int default dbo.ruleIdSequence() primary key ,	--主键
	paper_Id int not null ,	--试卷id，外键【一套试卷有1到多个大题】
	rule_title varchar(500),	--大题标题
	rule_idInPaper int,			--属于该试卷第几大题
	rule_type int,				--试题类型 暂时四种（1，单选 2 多选 3 判断 4 问答）
	rule_questionNum int,		--试题总数
	rule_scoreForEach float,	--每题分数
	rule_actualAddNum int,		--实际添加数
	rule_scoreSet varchar(10),	--少选扣分
	FOREIGN KEY(paper_id) REFERENCES tbExamPaper(paper_id)
);
select * from tbExamRule;
------------------------------------------------------------------------------------------------
CREATE    FUNCTION    examQuestionIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(quest_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(quest_id),@MINNUM-1)+1
               END
        FROM tbExamQuestion)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForExamQuestion')
begin
ALTER TABLE tbExamQuestion DROP CONSTRAINT ConstraintIdForExamQuestion
end;
alter table tbExamQuestion add constraint ConstraintIdForExamQuestion default dbo.examQuestionIdSequence() for quest_id;
-------------
IF EXISTS(SELECT * FROM sys.objects WHERE name='tbExamQuestion') 
DROP TABLE tbExamQuestion
create table tbExamQuestion(
	id int identity(1,1),
	quest_id int default dbo.examQuestionIdSequence() primary key,--主键
	quest_ruleId int,--所属大题id
	quest_paperId int,--所属试卷id
	quest_examId int,--所属考试id
	quest_content text,--试题内容，带选项
	quest_answer text,--试题答案
	quest_analysis text,--试题答案解析
	quest_type int,--试题类型【1 单选 。。。】
	quest_optionNum int,--选项个数，非选择题无所谓选项
	quest_orderId int,--试题序号，针对所属大题的序号？？
	quest_addTime datetime,--试题添加时间
	quest_linkQuestionId int,--连题id
	quest_editor varchar(30),--编辑
	quest_clickNum int ,--做题次数
	quest_errorNum int,--错误次数
	quest_md5code varchar(64)--问题的md5加密字符串【去掉特殊符号】
);
alter table tbExamQuestion alter column quest_linkQuestionId varchar(30);
--------------------
--卷子名称列表 状态 花费时间 得分/总分 考试时间（开始时间，结束时间） 答案
create table tbExamRecord(
id int identity(1,1) primary key,
paper_id int,
paper_name varchar(300),
stu_id int,
rcd_stauts int,
rcd_score float,
rcd_startTime datetime,
rcd_endTime datetime,
rcd_answers text
);
alter table tbExamRecord add rcd_scoreForEachRule varchar(500);
alter table tbExamRecord alter column rcd_score float;
alter table tbExamRecord drop column paperScore;
alter table tbExamRecord add paper_score float;
alter table tbExamRecord add stu_userName varchar(50);
alter table tbExamRecord add rcd_scoreForEachQuestion text;
alter table tbExamRecord add rcd_tempAnswer text;
alter table tbExamRecord add rcd_testNum int;
alter table tbExamCategory add parentsId varchar(200);
--纠错表
create table tbQuestionError(
id int identity(1,1) primary key,
paper_id int,
quest_id int not null,
stu_userName varchar(50),--纠错人
error_addTime datetime,
error_type int not null,
error_content varchar(500),--错误信息
error_status int not null,--状态
error_dealTime datetime,--处理时间
error_dealPerson varchar(50)--处理人
)

select * from tbExamCategory where parentsId like '%1001%';