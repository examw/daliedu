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

------------------------------------
CREATE    FUNCTION    stuIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(stu_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(stu_id),@MINNUM-1)+1
               END
        FROM tbStudent)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForStudent')
begin
ALTER TABLE tbStudent DROP CONSTRAINT ConstraintIdForStudent
end;
alter table tbStudent add constraint ConstraintIdForStudent default dbo.stuIdSequence() for stu_id;
-------------------------------------------------
if exists(
   select * from sys.objects 
   where name='tbAddress'
) 
drop table tbAddress
/*==============================================================*/
/* Table: tbAddress                                             */
/*==============================================================*/
create table tbAddress
(
	id					int								identity(1,1),
   addr_id              int							   	,
   addr_receiveName	    varchar(20)						not null,
   addr_fullAddress		varchar(100)					not null,
   addr_mobile	    	varchar(20)						not null,
   addr_email 			varchar(50)						,--邮箱
   addr_phone			varchar(20)						,--座机						
   addr_postalCode		varchar(20)						,--邮编
   stu_id				int 							not null,
   addr_isDefault		int								,--0:不是，1：是默认地址
   constraint PK_TBADDRESS primary key clustered (addr_id)
);
CREATE    FUNCTION    addrIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(addr_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(addr_id),@MINNUM-1)+1
               END
        FROM tbAddress)
END;
alter table tbAddress add constraint ConstraintIdForAddress default dbo.addrIdSequence() for addr_id;
------------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    orderIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(order_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(order_id),@MINNUM-1)+1
               END
        FROM tbOrder)
END;

if exists(select   *  from   sysobjects   where   name='ConstraintIdForOrder')
begin
ALTER TABLE tbOrder DROP CONSTRAINT ConstraintIdForOrder
end;
alter table tbOrder add constraint ConstraintIdForOrder default dbo.orderIdSequence() for order_id;
--------------------------------------------------------------------------------------------------------
if exists(select   *  from   sysobjects   where   name='orderNoSequence')
begin
drop function orderNoSequence
end;
CREATE    FUNCTION    orderNoSequence()
RETURNS    varchar(50)
AS
BEGIN
    DECLARE    @DAT    varchar(10)
    DECLARE    @MAXID  INT
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1001   
    SET    @MAXNUM=1999999999
    SET    @DAT=convert(varchar(10),getdate(),112)
    SET    @MAXID=(SELECT CASE   
            WHEN    ISNULL(MAX(order_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(order_id),@MINNUM-1)+1
               END
        FROM tbOrder)
    RETURN (@DAT+convert(varchar,@MAXID))
END;
if exists(select   *  from   sysobjects   where   name='ConstraintNoForOrder')
begin
ALTER TABLE tbOrder DROP CONSTRAINT ConstraintNoForOrder
end;
alter table tbOrder add constraint ConstraintNoForOrder default dbo.orderNoSequence() for order_no;
--------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    itemsIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(item_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(item_id),@MINNUM-1)+1
               END
        FROM tbItems)
END;

if exists(select   *  from   sysobjects   where   name='ConstraintIdForItems')
begin
ALTER TABLE tbItems DROP CONSTRAINT ConstraintIdForItems
end;
alter table tbItems add constraint ConstraintIdForItems default dbo.itemsIdSequence() for item_id;
--------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    rcIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(rc_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(rc_id),@MINNUM-1)+1
               END
        FROM tbRechargeRecord)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForRR')
begin
ALTER TABLE tbRechargeRecord DROP CONSTRAINT ConstraintIdForRR
end;
alter table tbRechargeRecord add constraint ConstraintIdForRR default dbo.rcIdSequence() for rc_id;
-------------------------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    acIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(ac_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(ac_id),@MINNUM-1)+1
               END
        FROM tbAskOrComplain)
END;
CREATE    FUNCTION    replyIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(reply_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(reply_id),@MINNUM-1)+1
               END
        FROM tbReply)
END;
-----------------------------------------------------------------------------------------------
CREATE    FUNCTION    questionIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(question_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(question_id),@MINNUM-1)+1
               END
        FROM tbQuestion)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForQuestion')
begin
ALTER TABLE tbQuestion DROP CONSTRAINT ConstraintIdForQuestion
end;
alter table tbQuestion add constraint ConstraintIdForQuestion default dbo.questionIdSequence() for question_id;
-------------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    answerIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(answer_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(answer_id),@MINNUM-1)+1
               END
        FROM tbAnswer)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForAnswer')
begin
ALTER TABLE tbAnswer DROP CONSTRAINT ConstraintIdForAnswer
end;
alter table tbAnswer add constraint ConstraintIdForAnswer default dbo.answerIdSequence() for answer_id;
-------------------------------------------------------------------------------------------------------------
CREATE    FUNCTION    collectIdSequence()
RETURNS    INT
AS
BEGIN
    DECLARE    @MINNUM    INT
    DECLARE    @MAXNUM    INT
    SET    @MINNUM=1   
    SET    @MAXNUM=1999999999
    RETURN(    SELECT CASE   
            WHEN    ISNULL(MAX(collect_id),@MINNUM-1)+1 >@MAXNUM THEN    0
            ELSE    ISNULL(MAX(collect_id),@MINNUM-1)+1
               END
        FROM tbQuestionCollect)
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForQCollect')
begin
ALTER TABLE tbQuestionCollect DROP CONSTRAINT ConstraintIdForQCollect
end;
alter table tbQuestionCollect add constraint ConstraintIdForQCollect default dbo.collectIdSequence() for collect_id;
--------------------------------------------------------------------------------------------------------
--select   *  from   sysobjects
if exists(select   *  from   sysobjects   where   name='sqlSequence')
begin
drop function sqlSequence
end
CREATE    FUNCTION    cardIdSequence()
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
END;
if exists(select   *  from   sysobjects   where   name='ConstraintIdForCard')
begin
ALTER TABLE tbCard DROP CONSTRAINT ConstraintIdForCard
end
alter table tbCard add constraint ConstraintIdForCard default dbo.cardIdSequence() for card_id;