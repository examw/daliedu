use master 
go 
 
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'ESchoolSystemDB') 
 DROP DATABASE ESchoolSystemDB  --如果存在则删除 
GO 
--建库 
CREATE DATABASE ESchoolSystemDB 
ON PRIMARY( --PRIMARY 可选指定主文件组中的文件 
  
 NAME = 'ESchoolSystemDB_data', --主数据文件的逻辑名 
 FILENAME = 'D:\SQL\ESchoolSystemDB_data.mdf' , --主数据文件的物理名(要有D:/SQL这个文件夹)
 SIZE = 3MB,      --主数据文件初始大小 
 MAXSIZE = 5MB,    --主数据文件最大大小？？（设多大？）
 FILEGROWTH = 20%   --主数据文件的增长率  
)
LOG ON 
( 
  
 NAME = 'ESchoolSystemDB_log', 
 FILENAME = 'D:\SQL\ESchoolSystemDB.ldf' , 
 SIZE = 512KB, 
 MAXSIZE = 3MB, 
 FILEGROWTH = 20% 
)
 go 
--建表 
use ESchoolSystemDB  --必须使用ESchoolSystemDB这个数据库,不然你建立的表在master数据库里面 
go 
IF EXISTS(SELECT * FROM sys.objects WHERE name='tbStudent') 
  DROP TABLE tbStudent 
--1,创建学员表tbStudent-- 
CREATE TABLE tbStudent 
( 
 id bigint identity(1,1),--？？？--
 stu_id  bigint primary key ,
 stu_name varchar(20) unique not null,--用户名，唯一且不为空
 stu_password varchar(50) not null,--密码
 stu_email varchar(50) unique not null,--email，唯一且不为空
 stu_phone varchar(20),
 stu_mobile varchar(20),
 stu_trueName varchar(20),
 stu_sex varchar(2),
 stu_addr varchar(50),
 stu_pAddr varchar(50),
 stu_postcal varchar(20),
 stu_addTime datetime not null,
 stu_lastLoginTime datetime not null,
 stu_loginNumber  int not null,
 stu_loginIP  varchar(20),
 stu_score  int
)  
GO 
--为表tbStudent创建约束[在外添加约束]-- 
ALTER TABLE tbStudent 
  ADD --CONSTRAINT PK_stuNo      PRIMARY KEY(stuNo),--主键约束 
     --CONSTRAINT UQ_stuNo      UNIQUE (stuNo),--唯一约束 
      --CONSTRAINT CK_stuNo      CHECK(stuNo LIKE 'S253[0-9][0-9]'),--检查约束 
      CONSTRAINT CK_stuSex     CHECK(stu_sex='男' OR stu_sex='女'), 
      --CONSTRAINT CK_stuAge     CHECK(stuAge BETWEEN 15 AND 40), 
      --CONSTRAINT CK_stuSeat    CHECK(stuSeat<=30), 
      CONSTRAINT DF_stuAddress DEFAULT ('地址不详') FOR stu_addr --默认值设置 
  
GO 
--2,创建教师表tbTeacher-- 
IF EXISTS(SELECT * FROM sys.objects WHERE name='tbTeacher') 
  DROP TABLE tbTeacher
CREATE TABLE tbTeacher 
( 
    id int identity(1,1),
    tch_id int primary key,
    tch_username varchar(20) unique not null,
    tch_password varchar(50) not null,
    tch_name varchar(20),--真实姓名
    tch_phone varchar(20),
    tch_description varchar(200),--老师简介
    tch_lessons varchar(100),--所教课程
    tch_valuation varchar(200),--评价
    tch_score int ,--评分
    tch_imgURL varchar(100) --头像地址
) 
GO 
--为表tbTeacher创建约束-- 
--ALTER TABLE tbTeacher 
   --ADD CONSTRAINT PK_ExamNo         PRIMARY KEY(ExamNo), 
     --  CONSTRAINT CK_ExamNo         CHECK(ExamNo LIKE 'S2718[0-9][0-9]'), 
       --CONSTRAINT FK_stuNo          FOREIGN KEY(stuNo) REFERENCES stuInfo(stuNo),--外键约束 
  --     CONSTRAINT CK_writtenExam    CHECK(writtenExam BETWEEN 0 AND 100),        CONSTRAINT DF_writtenExam    DEFAULT 0 FOR writtenExam, 
    --   CONSTRAINT CK_LabExam        CHECK(LabExam BETWEEN 0 AND 100), 
      -- CONSTRAINT DF_LabExam        DEFAULT 0 FOR LabExam 
GO 

--创建管理员表tbAdministrator
if exists(
   select * from sys.objects 
   where name='tbAdministor'
) 
    drop table tbAdministor
/*==============================================================*/
/* Table: tbAdministor                                          */
/*==============================================================*/
create table tbAdministor 
(
   ID                   int   identity(1,1),
   adm_id               int                            ,
   adm_username         varchar(20)                    not null,
   adm_password         varchar(50)                    not null,
   adm_name             varchar(20)                    null,
   adm_addTime          datetime                       null,
   adm_loginNumbers     int                            null,--登录次数--
   adm_lastLoginTime    datatime                       null,
   adm_lastLoginIP      varchar(20)                    null,
   adm_level            varchar(10)                    null,
   adm_status           int                            null,--帐号状态[0:为启用，1：启用]--
   constraint PK_TBADMINISTOR primary key clustered (adm_id)
);
--创建教师表tbTeacher--
if exists(
   select * from sys.objects 
   where name='tbTeacher'
     
) 
    drop table tbTeacher


/*==============================================================*/
/* Table: tbTeacher                                             */
/*==============================================================*/
create table tbTeacher 
(
   ID                   int                            null,
   tch_id               int                            null,
   tch_username         varchar(20)                    null,
   tch_password         varchar(50)                    null,
   tch_name             varchar(20)                    null,
   tch_description      varchar(1000)                  null,
   tch_addTime          datetime                       null,
   tch_loginNumbers     int                            null,
   tch_lastLoginTiem    datatime                       null,
   tch_lastLoginIP      varchar(20)                    null,
   tch_score            int                            null,
   tch_valuation        varchar(200)                   null,
   tch_status           int                            null
);
--创建学员表tbStudent--
if exists(
   select * from sys.objects 
   where name='tbStudent'
     
) 
    drop table tbStudent
/*==============================================================*/
/* Table: tbStudent                                             */
/*==============================================================*/
create table tbStudent 
(
   id                   bigint                         null,
   stu_id               bigint                         not null,
   stu_username         varchar(20)                    null,
   stu_password         varchar(50)                    null,
   stu_email            varchar(50)                    null,
   stu_phone            varchar(20)                    null,
   stu_mobile           varchar(20)                    null,
   stu_name             varchar(10)                    null,
   stu_sex              varchar(2)                     null,
   stu_addr             varchar(50)                    null,
   stu_pAddr            varchar(50)                    null,
   stu_postcal          varchar(10)                    null,
   stu_imgURL           varchar(50)                    null,
   stu_addTime          datetime                       null,
   stu_lastLoginTime    datetime                       null,
   stu_loginNumber      int                            null,
   stu_loginIP          varchar(20)                    null,
   stu_score            int                            null,
   stu_status           int                            null,
   constraint PK_TBSTUDENT primary key clustered (stu_id)
);
--创建考试分类表tbExamCategory--
if exists(
   select * from sys.objects 
   where name='tbExamCategory'
     
) 
    drop table tbExamCategory
/*==============================================================*/
/* Table: tbExamCategory                                        */
/*==============================================================*/
create table tbExamCategory 
(
   ID                   int                            null,
   exam_id              int                            not null,
   exam_name            varchar(50)                    null,
   exam_pid             int                            null,
   exam_childrenNum     int                            null,
   exam_addTime         datetime                       null,
   exam_orderId         int                            null,
   constraint PK_TBEXAMCATEGORY primary key clustered (exam_id)
);
--创建班级类型表tbGradeCategory--
if exists(
   select * from sys.objects 
   where name='tbGradeCategory'
     
) 
    drop table tbGradeCategory
/*==============================================================*/
/* Table: tbGradeCategory                                       */
/*==============================================================*/
create table tbGradeCategory 
(
   id                   int                            null,
   gType_id             int                            not null,
   gType_name           varchar(20)                    null,
   constraint PK_TBGRADECATEGORY primary key clustered (gType_id)
);
--创建课程班级表tbGrade--
if exists(
   select * from sys.objects 
   where name='tbGrade'
     
) 
    drop table tbGrade
/*==============================================================*/
/* Table: tbGrade                                               */
/*==============================================================*/
create table tbGrade 
(
   id                   int                            null,
   grade_id             int                            not null,
   exam_id              int                            null,
   gType_id             int                            null,
   tch_id               int                            null,
   grade_time           int                            null,
   grade_oPrice         float                          null,--原价--
   grade_rPrice         float                          null,--优惠价--
   grade_single         int                            null,
   grade_addTime        datetime                       null,
   adm_id               int                            null,
   grade_dueTime        datetime                       null, --到期时间--
   deal_id              int                            null,
   constraint PK_TBGRADE primary key clustered (grade_id)
);

alter table tbGrade
   add constraint FK_TBGRADE_REFERENCE_TBGRADEC foreign key (gType_id)
      references tbGradeCategory (gType_id)
   constraint FK_TBGRADE_REFERENCE_TBEXAMCA foreign key (exam_id)
      references tbExamCategory (exam_id)

--创建课程套餐分类表tbPackageCategory--
if exists(
   select * from sys.objects 
   where name='tbPackageCategory'
     
) 
    drop table tbPackageCategory
/*==============================================================*/
/* Table: tbPackageCategory                                     */
/*==============================================================*/
create table tbPackageCategory 
(
   id                   int                            null,
   pType_id             int                            null,
   pType_name           varchar(20)                    null,
   exam_id              int                            null,
   pType_pid            int                            null,
   pType_childrenNum    int                            null,
   pType_orderId        int                            null,
   pType_addTime        datetime                       null,
   pType_description    varchar(1000)                  null
);
--创建课程套餐表tbClassPackage--
if exists(
   select * from sys.objects 
   where name='tbClassPackage'
     
) 
    drop table tbClassPackage
/*==============================================================*/
/* Table: tbClassPackage                                        */
/*==============================================================*/
create table tbClassPackage 
(
   id                   int                            null,
   pkg_id               int                            null,
   deal_id              int                            null,
   pkg_name             varchar(30)                    null,
   pType_id             int                            null,
   pkg_oPrice           float                          null,
   pkg_rPrice           float                          null,
   pkg_sPrice           float                          null,
   pkg_description      varchar(1000)                  null,
   pkg_rMatureDate      date                           null,
   pkg_lMatureDate      varchar(10)                    null,
   pkg_includeCid       varchar(20)                    null,
   pkg_totalTime        int                            null,
   pkg_addTime          datetime                       null,
   adm_id               int                            null,
   pkg_present          varchar(100)                   null
);
alter table tbClassPackage
   add constraint FK_TBCLASSP_REFERENCE_TBPACKAG foreign key ()
      references tbPackageCategory

--创建课程详细表tbClassDetail--
if exists(
   select * from sys.objects 
   where name='tbClassDetail'
     
) 
    drop table tbClassDetail
/*==============================================================*/
/* Table: tbClassDetail                                         */
/*==============================================================*/
create table tbClassDetail 
(
   id                   int                            null,
   class_id             int                            not null,
   grade_id             int                            null,
   class_title          varchar(30)                    null,
   class_orderId        int                            null,
   class_year           int                            null,
   class_addTime        datetime                       null,
   class_openTime       datetime                       null,
   class_free           int                            null,
   adm_id               int                            null,
   class_hdUrl          varchar(30)                    null,
   class_triUrl         varchar(30)                    null,
   class_audio          varchar(30)                    null,
   class_totalTime      int                            null,
   constraint PK_TBCLASSDETAIL primary key clustered (class_id)
);
alter table tbClassDetail
   add constraint FK_TBCLASSD_REFERENCE_TBGRADE foreign key (grade_id)
      references tbGrade (grade_id)
--创建讲义表tbLecture--
if exists(select * from sys.sysforeignkey where role='FK_TBLECTUR_REFERENCE_TBCLASSD') 
    alter table tbLecture
       delete foreign key FK_TBLECTUR_REFERENCE_TBCLASSD
if exists(
   select * from sys.objects 
   where name='tbLecture'
     
) 
    drop table tbLecture
/*==============================================================*/
/* Table: tbLecture                                             */
/*==============================================================*/
create table tbLecture 
(
   id                   int                            null,
   lect_id              int                            not null,
   class_id             int                            null,
   lect_content         varchar(1000)                  null,
   lect_addTime         datetime                       null,
   lect_orderId         int                            null,
   lect_timePoint       int                            null,
   constraint PK_TBLECTURE primary key clustered (lect_id)
);

alter table tbLecture
   add constraint FK_TBLECTUR_REFERENCE_TBCLASSD foreign key (class_id)
      references tbClassDetail (class_id)

--创建协议表tbDeal--\
if exists(
   select * from sys.objects 
   where name='tbDeal'
) 
    drop table tbDeal
/*==============================================================*/
/* Table: tbDeal                                                */
/*==============================================================*/
create table tbDeal 
(
   id                   int                            null,
   deal_id              int                            not null,
   deal_name            varchar(30)                    null,
   deal_content         varchar(2000)                  null,
   constraint PK_TBDEAL primary key clustered (deal_id)
);

--创建学员学习记录表tbStudyRecord--
if exists(
   select * from sys.objects 
   where name='tbStudyRecord'
     
) 
    drop table tbStudyRecord


/*==============================================================*/
/* Table: tbStudyRecord                                         */
/*==============================================================*/
create table tbStudyRecord 
(
   id                   int                            null,
   record_id            int                            null,
   stu_id               int                            null,
   class_id             int                            null,
   record_startTime     datetime                       null,
   record_endTime       datetime                       null,
   record_ip            varchar(20)                    null,
   grade_id             int                            null
);

alter table tbStudyRecord
   add constraint FK_TBSTUDYR_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id)

--创建学员笔记表tbNote--
if exists(
   select * from sys.objects 
   where name='tbNote'
     
) 
    drop table tbNote


/*==============================================================*/
/* Table: tbNote                                                */
/*==============================================================*/
create table tbNote 
(
   id                   int                            null,
   note_id              int                            null,
   class_id             int                            null,
   note_addTime         datetime                       null,
   note_content         varchar(1000)                  null,
   stu_id               bigint                         null
);

alter table tbNote
   add constraint FK_TBNOTE_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id)

--创建问题详细表tbQuestion
if exists(
   select * from sys.objects 
   where name='tbQuestion'
     
) 
    drop table tbQuestion


/*==============================================================*/
/* Table: tbQuestion                                            */
/*==============================================================*/
create table tbQuestion 
(
   id                   int                            null,
   question_id          int                            null,
   exam_id              int                            null,
   grade_id             int                            null,
   class_id             int                            null,
   问题出处                 char(10)                       null,
   question_title       varchar(50)                    null,
   question_content     varchar(500)                   null,
   question_status      int                            null,
   stu_id               bigint                         null,
   question_addTime     datetime                       null
);

alter table tbQuestion
   add constraint FK_TBQUESTI_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id)
--创建答案表tbAnswer--
if exists(
   select * from sys.objects 
   where name='tbAnswer'
     
) 
    drop table tbAnswer


/*==============================================================*/
/* Table: tbAnswer                                              */
/*==============================================================*/
create table tbAnswer 
(
   id                   int                            null,
   answer_id            int                            null,
   question_id          int                            null,
   tch_id               int                            null,
   answer_content       varchar(500)                   null,
   answer_time          datetime                       null,
   answer_valuation     int                            null
);

--创建问题收藏表--
if exists(
   select * from sys.objects 
   where name='tbQuestionCollect'
     
) 
    drop table tbQuestionCollect
/*==============================================================*/
/* Table: tbQuestionCollect                                     */
/*==============================================================*/
create table tbQuestionCollect 
(
   id                   int                            null,
   collect_id           int                            null,
   question_id          int                            null,
   stu_id               bigint                         null,
   collect_addTime      datatime                       null
);

alter table tbQuestionCollect
   add constraint FK_TBQUESTI_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id)
--
--创建订单表tbOrder--
if exists(
   select * from sys.objects 
   where name='tbOrder'
     
) 
    drop table tbOrder

/*==============================================================*/
/* Table: tbOrder                                               */
/*==============================================================*/
create table tbOrder 
(
   id                   bigint                         null,
   order_id             bigint                         null,
   order_no             varchar(20)                    null,
   stu_id               bigint                         null,
   order_money          float                          null,
   order_invoice        varchar(50)                    null,
   order_status         int                            null,
   order_payment        int                            null,
   order_addTime        datetime                       null,
   order_payTime        datetime                       null,
   order_payType        varchar(20)                    null,
   adm_id               int                            null,
   order_dealTime       datetime                       null
);

alter table tbOrder
   add constraint FK_TBORDER_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id)

--创建订单详细表tbItems--

if exists(
   select * from sys.objects 
   where name='tbItems'
     
) 
    drop table tbItems

/*==============================================================*/
/* Table: tbItems                                                 */
/*==============================================================*/
create table tbItems 
(
   id                   bigint                         null,
   item_id              bigint                         null,
   order_id             bigint                         null,
   productId            int                            null,
   item_oPrice          float                          null,
   item_rPrice          float                          null,
   item_name            varchar(50)                    null,
   item_pType           int                            null
);

alter table tbItems
   add constraint FK_ITEMS_REFERENCE_TBORDER foreign key ()
      references tbOrder

--创建寄送表tbSend--
if exists(
   select * from sys.objects 
   where name='tbSend'
     
) 
    drop table tbSend
/*==============================================================*/
/* Table: tbSend                                                */
/*==============================================================*/
create table tbSend 
(
   id                   int                            null,
   send_id              int                            null,
   order_id             bigint                         null,
   epc_id               int                            null,
   send_orderId         varchar(20)                    null,
   send_status          int                            null,
   send_time            datetime                       null,
   send_person          varchar(20)                    null,
   send_confirmTime     datetime                       null
);
--创建快递公司表tbExpressCompany--
if exists(
   select * from sys.objects 
   where name='tbExpressCompany'
     
) 
    drop table tbExpressCompany

/*==============================================================*/
/* Table: tbExpressCompany                                      */
/*==============================================================*/
create table tbExpressCompany 
(
   id                   int                            null,
   epc_id               int                            null,
   epc_name             varchar(30)                    null,
   epc_url              varchar(20)                    null,
   epc_phone            varchar(15)                    null,
   epc_orderId          int                            null
);
    
--创建学员账户表tbAccount--
if exists(
   select * from sys.objects 
   where name='tbAccount'
     
) 
    drop table tbAccount

/*==============================================================*/
/* Table: tbAccount                                             */
/*==============================================================*/
create table tbAccount 
(
   id                   bigint                         null,
   account_id           bigint                         null,
   stu_id               bigint                         null,
   account_card         float                          null,
   account_cash         float                          null
);

alter table tbAccount
   add constraint FK_TBACCOUN_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id);

--创建学习卡表--
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
   id                   int                            null,
   card_id              int                            not null,
   card_password        varchar(50)                    null,
   card_value           int                            null,
   card_addTime         datetime                       null,
   card_overTime        datetime                       null,
   stu_id               bigint                         null,
   card_useTime         datetime                       null,
   card_isPresent       int                            null,
   constraint PK_TBCARD primary key clustered (card_id)
);
 --创建充值记录表--

if exists(
   select * from sys.objects
   where name='tbRechargeRecord'
) 
    drop table tbRechargeRecord

go
/*==============================================================*/
/* Table: tbRechargeRecord                                      */
/*==============================================================*/
create table tbRechargeRecord 
(
   id                   int                            null,
   rc_id                int                            not null,
   rc_money             float                          null,
   rc_type              int                            null,
   rc_ip                varchar(20)                    null,
   rc_cardId            int                            null,
   stu_id               bigint                         null,
   rc_addTime           datetime                       null,
   constraint PK_TBRECHARGERECORD primary key clustered (rc_id)
);
alter table tbRechargeRecord
   add constraint FK_TBRECHARGE_REFERENCE_TBSTUDEN foreign key (stu_id)
      references tbStudent (stu_id);