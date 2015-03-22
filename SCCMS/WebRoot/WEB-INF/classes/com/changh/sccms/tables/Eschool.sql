USE [ESchoolSystemDB]
GO
/****** Object:  Table [dbo].[tbStudent]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbStudent](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stu_id] [int] NOT NULL,
	[stu_username] [varchar](20) NOT NULL,
	[stu_password] [varchar](50) NOT NULL,
	[stu_email] [varchar](50) NULL,
	[stu_phone] [varchar](20) NULL,
	[stu_mobile] [varchar](20) NULL,
	[stu_name] [varchar](20) NULL,
	[stu_sex] [varchar](2) NULL,
	[stu_addr] [varchar](50) NULL,
	[stu_pAddr] [varchar](50) NULL,
	[stu_postcal] [varchar](20) NULL,
	[stu_addTime] [datetime] NULL,
	[stu_lastLoginTime] [datetime] NULL,
	[stu_loginNumber] [int] NULL,
	[stu_loginIP] [varchar](50) NULL,
	[stu_score] [int] NULL,
	[stu_card] [float] NULL,
	[stu_cash] [float] NULL,
	[stu_status] [int] NOT NULL,
	[stu_imgUrl] [varchar](300) NULL,
 CONSTRAINT [PK_stuId] PRIMARY KEY CLUSTERED 
(
	[stu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[stu_email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[stu_username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[stu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbStudyRecord]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbStudyRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[record_id] [int] NOT NULL,
	[stu_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[record_startTime] [datetime] NOT NULL,
	[record_ip] [varchar](20) NOT NULL,
	[grade_id] [int] NOT NULL,
	[record_name] [nvarchar](100) NULL,
 CONSTRAINT [PK_record] PRIMARY KEY CLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[record_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbTrade]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbTrade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[trade_id] [int] NOT NULL,
	[trade_time] [datetime] NOT NULL,
	[trade_money] [float] NOT NULL,
	[trade_ip] [varchar](20) NULL,
	[order_id] [int] NULL,
	[card_id] [varchar](50) NULL,
	[trade_type] [int] NULL,
	[trade_note] [varchar](1000) NULL,
	[stu_id] [int] NULL,
	[trade_pattern] [varchar](20) NULL,
	[trade_orderNo] [varchar](30) NULL,
	[trade_CardBalance] [float] NULL,
	[trade_CashBalance] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[trade_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbTeacher]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbTeacher](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tch_id] [int] NOT NULL,
	[tch_username] [varchar](20) NOT NULL,
	[tch_password] [varchar](50) NOT NULL,
	[tch_name] [varchar](20) NOT NULL,
	[tch_phone] [varchar](20) NULL,
	[tch_addTime] [datetime] NULL,
	[tch_description] [varchar](3000) NULL,
	[tch_lessons] [varchar](100) NULL,
	[tch_valuation] [varchar](1000) NULL,
	[tch_score] [int] NULL,
	[tch_imgURL] [varchar](100) NULL,
	[tch_status] [int] NOT NULL,
	[tch_sex] [varchar](2) NULL,
 CONSTRAINT [PK_tchId] PRIMARY KEY CLUSTERED 
(
	[tch_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tch_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[tch_username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbNote]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbNote](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[note_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[note_addTime] [datetime] NOT NULL,
	[note_content] [text] NOT NULL,
	[stu_id] [int] NOT NULL,
	[note_couresType] [int] NULL,
	[note_videotime] [float] NULL,
 CONSTRAINT [PK_noteId] PRIMARY KEY CLUSTERED 
(
	[note_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[note_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbOrder]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbOrder](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[order_id] [int] NOT NULL,
	[order_no] [varchar](40) NULL,
	[stu_id] [int] NOT NULL,
	[order_money] [float] NOT NULL,
	[order_invoice] [int] NULL,
	[order_status] [int] NOT NULL,
	[order_payment] [int] NULL,
	[order_addTime] [datetime] NOT NULL,
	[order_payTime] [datetime] NULL,
	[order_payType] [varchar](20) NULL,
	[adm_id] [int] NULL,
	[order_dealTime] [datetime] NULL,
	[order_note] [varchar](300) NULL,
	[order_isNeedSend] [int] NULL,
	[order_sendDetail] [varchar](2000) NULL,
	[order_price] [float] NULL,
 CONSTRAINT [PK_ORDERID] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[order_no] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbSend]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbSend](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[send_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[epc_id] [int] NULL,
	[send_status] [int] NOT NULL,
	[send_time] [datetime] NULL,
	[send_person] [varchar](20) NULL,
	[send_confirmTime] [datetime] NULL,
	[send_detail] [varchar](500) NULL,
	[send_addTime] [datetime] NULL,
	[epc_name] [varchar](30) NULL,
	[send_content] [varchar](20) NULL,
	[send_cost] [float] NULL,
	[send_receiveName] [varchar](20) NULL,
	[send_fullAddress] [varchar](200) NULL,
	[send_mobile] [varchar](20) NULL,
	[send_postalCode] [varchar](20) NULL,
	[send_type] [int] NULL,
	[send_expressNo] [varchar](50) NULL,
 CONSTRAINT [PK_SENDID] PRIMARY KEY CLUSTERED 
(
	[send_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[send_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbAskOrComplain]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbAskOrComplain](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ac_id] [int] NOT NULL,
	[grade_id] [int] NULL,
	[ac_name] [varchar](100) NOT NULL,
	[ac_type] [int] NOT NULL,
	[ac_status] [int] NOT NULL,
	[ac_addTime] [datetime] NOT NULL,
	[ac_content] [text] NOT NULL,
	[stu_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ac_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbReply]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbReply](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reply_id] [int] NOT NULL,
	[ac_id] [int] NULL,
	[reply_content] [text] NOT NULL,
	[reply_addTime] [datetime] NOT NULL,
	[reply_people] [varchar](20) NULL,
PRIMARY KEY CLUSTERED 
(
	[reply_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbRechargeRecord]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbRechargeRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rc_id] [int] NOT NULL,
	[rc_money] [float] NOT NULL,
	[rc_type] [int] NOT NULL,
	[rc_ip] [varchar](20) NOT NULL,
	[rc_cardId] [int] NOT NULL,
	[stu_id] [int] NOT NULL,
	[rc_addTime] [datetime] NOT NULL,
	[rc_isPresent] [int] NULL,
 CONSTRAINT [PK_TBRECHARGERECORD] PRIMARY KEY CLUSTERED 
(
	[rc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[rc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbQuestion]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[question_source] [int] NULL,
	[question_title] [varchar](100) NOT NULL,
	[question_content] [text] NOT NULL,
	[question_status] [int] NOT NULL,
	[stu_id] [int] NOT NULL,
	[question_addTime] [datetime] NOT NULL,
	[question_path] [varchar](200) NULL,
 CONSTRAINT [PK_QUESTIONID] PRIMARY KEY CLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[question_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbQuestionCollect]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbQuestionCollect](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[collect_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[stu_id] [int] NOT NULL,
	[collect_addTime] [datetime] NOT NULL,
 CONSTRAINT [PK_COLLECTID] PRIMARY KEY CLUSTERED 
(
	[collect_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[collect_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbCard]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbCard](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[card_id] [int] NOT NULL,
	[card_password] [varchar](50) NOT NULL,
	[card_value] [int] NOT NULL,
	[card_addTime] [datetime] NOT NULL,
	[card_overTime] [datetime] NOT NULL,
	[stu_id] [bigint] NULL,
	[card_useTime] [datetime] NULL,
	[card_isPresent] [int] NULL,
	[card_balance] [float] NULL,
 CONSTRAINT [PK_TBCARD] PRIMARY KEY CLUSTERED 
(
	[card_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbAnswer]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbAnswer](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[answer_id] [int] NOT NULL,
	[question_id] [int] NOT NULL,
	[tch_id] [int] NOT NULL,
	[answer_content] [text] NOT NULL,
	[answer_time] [datetime] NOT NULL,
	[answer_valuation] [int] NULL,
 CONSTRAINT [PK_ANSWERID] PRIMARY KEY CLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[answer_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbAddress]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbAddress](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[addr_id] [int] NOT NULL,
	[addr_receiveName] [varchar](20) NOT NULL,
	[addr_fullAddress] [varchar](100) NOT NULL,
	[addr_mobile] [varchar](20) NOT NULL,
	[addr_email] [varchar](50) NULL,
	[addr_phone] [varchar](20) NULL,
	[addr_postalCode] [varchar](20) NULL,
	[stu_id] [int] NOT NULL,
	[addr_isDefault] [int] NULL,
 CONSTRAINT [PK_TBADDRESS] PRIMARY KEY CLUSTERED 
(
	[addr_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbExamQuestion]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbExamQuestion](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[quest_id] [int] NOT NULL,
	[quest_ruleId] [int] NULL,
	[quest_paperId] [int] NULL,
	[quest_examId] [int] NULL,
	[quest_content] [text] NULL,
	[quest_answer] [text] NULL,
	[quest_analysis] [text] NULL,
	[quest_type] [int] NULL,
	[quest_optionNum] [int] NULL,
	[quest_orderId] [int] NULL,
	[quest_addTime] [datetime] NULL,
	[quest_linkQuestionId] [varchar](30) NULL,
	[quest_editor] [varchar](30) NULL,
	[quest_clickNum] [int] NULL,
	[quest_errorNum] [int] NULL,
	[quest_md5code] [varchar](64) NULL,
PRIMARY KEY CLUSTERED 
(
	[quest_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbExamPaper]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbExamPaper](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paper_id] [int] NOT NULL,
	[paper_examId] [int] NULL,
	[paper_e_gradeId] [int] NULL,
	[paper_e_g_cheaterId] [int] NULL,
	[paper_name] [varchar](256) NOT NULL,
	[paper_time] [int] NOT NULL,
	[paper_score] [int] NOT NULL,
	[paper_addTime] [datetime] NOT NULL,
	[paper_type] [int] NOT NULL,
	[paper_clickNum] [int] NULL,
	[paper_isChecked] [int] NULL,
	[paper_editor] [varchar](30) NULL,
	[paper_linkName] [varchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[paper_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbExamCategory]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbExamCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[exam_id] [int] NOT NULL,
	[exam_name] [varchar](50) NOT NULL,
	[exam_pid] [int] NULL,
	[exam_childrenNum] [int] NOT NULL,
	[exam_addTime] [datetime] NOT NULL,
	[exam_orderId] [int] NOT NULL,
	[isexpand] [varchar](5) NULL,
 CONSTRAINT [PK_TBEXAMCATEGORY] PRIMARY KEY CLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[exam_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbGradeCategory]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbGradeCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[gType_id] [int] NOT NULL,
	[gType_name] [varchar](20) NOT NULL,
 CONSTRAINT [PK_TBGRADECATEGORY] PRIMARY KEY CLUSTERED 
(
	[gType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[gType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbGrade]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbGrade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[grade_id] [int] NOT NULL,
	[exam_id] [int] NOT NULL,
	[gType_id] [int] NOT NULL,
	[tch_id] [int] NOT NULL,
	[grade_time] [int] NOT NULL,
	[grade_oPrice] [float] NOT NULL,
	[grade_rPrice] [float] NOT NULL,
	[grade_single] [int] NULL,
	[grade_addTime] [datetime] NOT NULL,
	[adm_id] [int] NOT NULL,
	[grade_dueTime] [datetime] NOT NULL,
	[deal_id] [int] NOT NULL,
	[grade_remark] [varchar](1000) NULL,
	[tch_Name] [varchar](50) NULL,
 CONSTRAINT [PK_TBGRADE] PRIMARY KEY CLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[grade_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbClassDetail]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbClassDetail](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class_id] [int] NOT NULL,
	[grade_id] [int] NOT NULL,
	[class_title] [varchar](30) NOT NULL,
	[class_orderId] [int] NOT NULL,
	[class_year] [int] NOT NULL,
	[class_addTime] [datetime] NOT NULL,
	[class_openTime] [datetime] NOT NULL,
	[class_ifFree] [int] NULL,
	[adm_id] [int] NOT NULL,
	[class_time] [int] NOT NULL,
	[tch_id] [int] NULL,
	[class_hdUrl] [varchar](60) NULL,
	[class_triUrl] [varchar](60) NULL,
	[class_audio] [varchar](60) NULL,
 CONSTRAINT [PK_TBCLASSDETAIL] PRIMARY KEY CLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[class_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbExpressCompany]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbExpressCompany](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[epc_id] [int] NOT NULL,
	[epc_name] [varchar](30) NOT NULL,
	[epc_url] [varchar](20) NOT NULL,
	[epc_phone] [varchar](15) NOT NULL,
	[epc_orderId] [int] NOT NULL,
	[epc_addr] [varchar](100) NULL,
 CONSTRAINT [PK_EPCID] PRIMARY KEY CLUSTERED 
(
	[epc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[epc_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbExamRule]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbExamRule](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rule_id] [int] NOT NULL,
	[paper_Id] [int] NOT NULL,
	[rule_title] [varchar](500) NULL,
	[rule_idInPaper] [int] NULL,
	[rule_type] [int] NULL,
	[rule_questionNum] [int] NULL,
	[rule_scoreForEach] [float] NULL,
	[rule_actualAddNum] [int] NULL,
	[rule_scoreSet] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[rule_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbLecture]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbLecture](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[lect_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
	[lect_content] [text] NOT NULL,
	[lect_addTime] [datetime] NOT NULL,
	[lect_orderId] [int] NOT NULL,
	[lect_timePoint] [int] NOT NULL,
	[lect_title] [nvarchar](50) NULL,
 CONSTRAINT [PK_TBLECTURE] PRIMARY KEY CLUSTERED 
(
	[lect_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[lect_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbItems]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[item_id] [int] NOT NULL,
	[order_id] [int] NOT NULL,
	[productId] [int] NOT NULL,
	[item_oPrice] [float] NOT NULL,
	[item_rPrice] [float] NOT NULL,
	[item_name] [varchar](50) NOT NULL,
	[item_pType] [int] NOT NULL,
	[item_sPrice] [float] NULL,
	[exam_id] [int] NULL,
	[item_present] [varchar](1000) NULL,
	[item_overTime] [datetime] NULL,
 CONSTRAINT [PK_ITEMID] PRIMARY KEY CLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[item_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbExamRecord]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbExamRecord](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paper_id] [int] NULL,
	[paper_name] [varchar](300) NULL,
	[stu_id] [int] NULL,
	[rcd_stauts] [int] NULL,
	[rcd_score] [float] NULL,
	[rcd_startTime] [datetime] NULL,
	[rcd_endTime] [datetime] NULL,
	[rcd_answers] [text] NULL,
	[rcd_scoreForEachRule] [varchar](500) NULL,
	[paper_score] [float] NULL,
	[stu_userName] [varchar](50) NULL,
	[rcd_scoreForEachQuestion] [text] NULL,
	[rcd_tempAnswer] [text] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbDeal]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbDeal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[deal_id] [int] NOT NULL,
	[deal_name] [varchar](30) NOT NULL,
	[deal_content] [text] NOT NULL,
	[deal_pkgId] [int] NULL,
	[deal_lastDate] [date] NULL,
 CONSTRAINT [PK_TBDEAL] PRIMARY KEY CLUSTERED 
(
	[deal_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[deal_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbComment]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbComment](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment_id] [int] NOT NULL,
	[comment_content] [nvarchar](500) NULL,
	[comment_score] [int] NULL,
	[stu_id] [int] NULL,
	[tch_id] [int] NULL,
	[comment_addTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbClassPackage]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbClassPackage](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pkg_id] [int] NOT NULL,
	[deal_id] [int] NULL,
	[pkg_name] [varchar](30) NOT NULL,
	[pType_id] [int] NOT NULL,
	[pkg_oPrice] [float] NULL,
	[pkg_rPrice] [float] NULL,
	[pkg_sPrice] [float] NULL,
	[pkg_description] [varchar](1000) NULL,
	[pkg_rMatureDate] [date] NOT NULL,
	[pkg_lMatureDate] [date] NULL,
	[pkg_totalTime] [int] NULL,
	[pkg_addTime] [datetime] NOT NULL,
	[adm_id] [int] NOT NULL,
	[pkg_present] [varchar](100) NULL,
	[pkg_includeCid] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[pkg_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbQuestionError]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbQuestionError](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[paper_id] [int] NULL,
	[quest_id] [int] NOT NULL,
	[stu_userName] [varchar](50) NULL,
	[error_addTime] [datetime] NULL,
	[error_type] [int] NOT NULL,
	[error_content] [varchar](500) NULL,
	[error_status] [int] NOT NULL,
	[error_dealTime] [datetime] NULL,
	[error_dealPerson] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbPackageCategory]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbPackageCategory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[pType_id] [int] NOT NULL,
	[pType_name] [varchar](20) NOT NULL,
	[exam_id] [int] NOT NULL,
	[pType_pid] [int] NOT NULL,
	[pType_childrenNum] [int] NOT NULL,
	[pType_orderId] [int] NOT NULL,
	[pType_addTime] [datetime] NOT NULL,
	[pType_description] [varchar](1000) NULL,
PRIMARY KEY CLUSTERED 
(
	[pType_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbMenu]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbMenu](
	[menu_id] [int] IDENTITY(1001,1) NOT NULL,
	[menu_name] [varchar](50) NOT NULL,
	[menu_address] [varchar](50) NULL,
	[menu_icon] [varchar](50) NULL,
	[menu_pid] [int] NOT NULL,
	[menu_number] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[menu_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbLog]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbLog](
	[log_id] [int] IDENTITY(1001,1) NOT NULL,
	[adm_id] [int] NULL,
	[adm_username] [varchar](50) NOT NULL,
	[operatetime] [datetime] NOT NULL,
	[operatetype] [int] NOT NULL,
	[logconten] [varchar](50) NOT NULL,
	[broswer] [varchar](100) NOT NULL,
	[ip] [varchar](50) NOT NULL,
	[adm_password] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbWebInfo]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbWebInfo](
	[webInfo_id] [int] IDENTITY(1001,1) NOT NULL,
	[webInfo_comName] [varchar](50) NOT NULL,
	[webInfo_comAddress] [varchar](255) NULL,
	[webInfo_comPostCode] [varchar](50) NULL,
	[webInfo_comEmail] [varchar](50) NULL,
	[webInfo_serviceTel] [varchar](50) NULL,
	[webInfo_officePhone] [varchar](50) NULL,
	[webInfo_comfax] [varchar](50) NULL,
	[webInfo_copyright] [varchar](50) NULL,
	[webInfo_index] [varchar](50) NULL,
	[webInfo_workday] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[webInfo_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbRole]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbRole](
	[role_id] [int] IDENTITY(1001,1) NOT NULL,
	[role_name] [varchar](255) NULL,
	[menu_id] [varchar](500) NULL,
	[role_describe] [varchar](500) NULL,
PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbAdministor]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbAdministor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[adm_id] [int] NOT NULL,
	[adm_username] [varchar](20) NOT NULL,
	[adm_password] [varchar](50) NOT NULL,
	[adm_name] [varchar](20) NOT NULL,
	[adm_addTime] [datetime] NULL,
	[adm_loginNumbers] [int] NULL,
	[adm_lastLoginTime] [datetime] NULL,
	[adm_lastLoginIP] [varchar](20) NULL,
	[adm_role] [int] NULL,
	[adm_status] [int] NULL,
	[role_id] [int] NULL,
 CONSTRAINT [PK_admId] PRIMARY KEY CLUSTERED 
(
	[adm_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[adm_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[adm_username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbStuDeal]    Script Date: 05/17/2013 14:47:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbStuDeal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stuDeal_id] [int] NOT NULL,
	[deal_id] [int] NULL,
	[stuDeal_status] [int] NULL,
	[stuDeal_time] [date] NULL,
	[stu_id] [int] NULL,
	[stu_username] [nvarchar](100) NULL,
	[stu_name] [nvarchar](50) NULL,
	[stu_cards] [nvarchar](50) NULL,
	[paytype] [nvarchar](50) NULL,
	[stu_address] [nvarchar](200) NULL,
	[stu_phone] [nvarchar](30) NULL,
	[stu_email] [nvarchar](50) NULL,
	[pkg_name] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[stuDeal_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [ConstraintIdForAddress]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAddress] ADD  CONSTRAINT [ConstraintIdForAddress]  DEFAULT ([dbo].[addrIdSequence]()) FOR [addr_id]
GO
/****** Object:  Default [ConstraintIdForAdmin]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAdministor] ADD  CONSTRAINT [ConstraintIdForAdmin]  DEFAULT ([dbo].[admIdSequence]()) FOR [adm_id]
GO
/****** Object:  Default [DF__tbAdminis__adm_r__1DE57479]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAdministor] ADD  DEFAULT ((0)) FOR [adm_role]
GO
/****** Object:  Default [DF__tbAdminis__adm_s__1ED998B2]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAdministor] ADD  DEFAULT ((0)) FOR [adm_status]
GO
/****** Object:  Default [ConstraintIdForAnswer]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAnswer] ADD  CONSTRAINT [ConstraintIdForAnswer]  DEFAULT ([dbo].[answerIdSequence]()) FOR [answer_id]
GO
/****** Object:  Default [DF__tbAskOrCo__ac_id__14B10FFA]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAskOrComplain] ADD  DEFAULT ([dbo].[acIdSequence]()) FOR [ac_id]
GO
/****** Object:  Default [DF__tbAskOrCo__ac_st__15A53433]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAskOrComplain] ADD  DEFAULT ((0)) FOR [ac_status]
GO
/****** Object:  Default [ConstraintIdForCard]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbCard] ADD  CONSTRAINT [ConstraintIdForCard]  DEFAULT ([dbo].[cardIdSequence]()) FOR [card_id]
GO
/****** Object:  Default [DF__tbCard__card_isP__19DFD96B]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbCard] ADD  DEFAULT ((0)) FOR [card_isPresent]
GO
/****** Object:  Default [DF__tbClassDe__class__412EB0B6]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbClassDetail] ADD  DEFAULT ((0)) FOR [class_ifFree]
GO
/****** Object:  Default [DF__tbExamCat__exam___24927208]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamCategory] ADD  DEFAULT ((0)) FOR [exam_pid]
GO
/****** Object:  Default [DF__tbExamCat__isexp__6F7F8B4B]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamCategory] ADD  DEFAULT ('false') FOR [isexpand]
GO
/****** Object:  Default [DF__tbExamPap__paper__5D2BD0E6]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamPaper] ADD  DEFAULT ([dbo].[paperIdSequence]()) FOR [paper_id]
GO
/****** Object:  Default [DF__tbExamQue__quest__6991A7CB]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamQuestion] ADD  DEFAULT ([dbo].[examQuestionIdSequence]()) FOR [quest_id]
GO
/****** Object:  Default [DF__tbExamRul__rule___62E4AA3C]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamRule] ADD  DEFAULT ([dbo].[ruleIdSequence]()) FOR [rule_id]
GO
/****** Object:  Default [ConstraintIdForEPC]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExpressCompany] ADD  CONSTRAINT [ConstraintIdForEPC]  DEFAULT ([dbo].[epcIdSequence]()) FOR [epc_id]
GO
/****** Object:  Default [DF__tbGrade__grade_s__2F10007B]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbGrade] ADD  DEFAULT ((1)) FOR [grade_single]
GO
/****** Object:  Default [ConstraintIdForItems]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbItems] ADD  CONSTRAINT [ConstraintIdForItems]  DEFAULT ([dbo].[itemsIdSequence]()) FOR [item_id]
GO
/****** Object:  Default [DF__tbItems__item_pr__37FA4C37]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbItems] ADD  DEFAULT (NULL) FOR [item_present]
GO
/****** Object:  Default [ConstraintIdForOrder]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbOrder] ADD  CONSTRAINT [ConstraintIdForOrder]  DEFAULT ([dbo].[orderIdSequence]()) FOR [order_id]
GO
/****** Object:  Default [ConstraintNoForOrder]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbOrder] ADD  CONSTRAINT [ConstraintNoForOrder]  DEFAULT ([dbo].[orderNoSequence]()) FOR [order_no]
GO
/****** Object:  Default [ConstraintIdForQuestion]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbQuestion] ADD  CONSTRAINT [ConstraintIdForQuestion]  DEFAULT ([dbo].[questionIdSequence]()) FOR [question_id]
GO
/****** Object:  Default [ConstraintIdForQCollect]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbQuestionCollect] ADD  CONSTRAINT [ConstraintIdForQCollect]  DEFAULT ([dbo].[collectIdSequence]()) FOR [collect_id]
GO
/****** Object:  Default [ConstraintIdForRR]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbRechargeRecord] ADD  CONSTRAINT [ConstraintIdForRR]  DEFAULT ([dbo].[rcIdSequence]()) FOR [rc_id]
GO
/****** Object:  Default [DF__tbRecharg__rc_is__7073AF84]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbRechargeRecord] ADD  DEFAULT ((0)) FOR [rc_isPresent]
GO
/****** Object:  Default [DF__tbReply__reply_i__220B0B18]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbReply] ADD  DEFAULT ([dbo].[replyIdSequence]()) FOR [reply_id]
GO
/****** Object:  Default [ConstraintIdForSend]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbSend] ADD  CONSTRAINT [ConstraintIdForSend]  DEFAULT ([dbo].[sendIdSequence]()) FOR [send_id]
GO
/****** Object:  Default [DF__tbSend__send_cos__753864A1]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbSend] ADD  DEFAULT ((0.0)) FOR [send_cost]
GO
/****** Object:  Default [ConstraintIdForStudent]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  CONSTRAINT [ConstraintIdForStudent]  DEFAULT ([dbo].[stuIdSequence]()) FOR [stu_id]
GO
/****** Object:  Default [DF_stuAddress]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  CONSTRAINT [DF_stuAddress]  DEFAULT ('µØÖ·²»Ïê') FOR [stu_addr]
GO
/****** Object:  Default [DF__tbStudent__stu_s__07020F21]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  DEFAULT ((0)) FOR [stu_score]
GO
/****** Object:  Default [DF__tbStudent__stu_c__07F6335A]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  DEFAULT ((0.00)) FOR [stu_card]
GO
/****** Object:  Default [DF__tbStudent__stu_c__08EA5793]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  DEFAULT ((0.00)) FOR [stu_cash]
GO
/****** Object:  Default [DF__tbStudent__stu_s__09DE7BCC]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  DEFAULT ((0)) FOR [stu_status]
GO
/****** Object:  Default [DF__tbStudent__stu_i__3335971A]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent] ADD  DEFAULT ('../upload/userface/no_face.gif') FOR [stu_imgUrl]
GO
/****** Object:  Default [ConstraintIdForTeacher]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbTeacher] ADD  CONSTRAINT [ConstraintIdForTeacher]  DEFAULT ([dbo].[tchIdSequence]()) FOR [tch_id]
GO
/****** Object:  Default [DF__tbTeacher__tch_s__15502E78]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbTeacher] ADD  DEFAULT ((0)) FOR [tch_status]
GO
/****** Object:  Default [DF__tbTrade__trade_i__02925FBF]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbTrade] ADD  DEFAULT ([dbo].[tradeIdSequence]()) FOR [trade_id]
GO
/****** Object:  Check [CK_stuSex]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudent]  WITH CHECK ADD  CONSTRAINT [CK_stuSex] CHECK  (([stu_sex]='ÄÐ' OR [stu_sex]='Å®'))
GO
ALTER TABLE [dbo].[tbStudent] CHECK CONSTRAINT [CK_stuSex]
GO
/****** Object:  ForeignKey [FK_TBADMIN_REFERENCE_TBROLE]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAdministor]  WITH CHECK ADD  CONSTRAINT [FK_TBADMIN_REFERENCE_TBROLE] FOREIGN KEY([role_id])
REFERENCES [dbo].[tbRole] ([role_id])
GO
ALTER TABLE [dbo].[tbAdministor] CHECK CONSTRAINT [FK_TBADMIN_REFERENCE_TBROLE]
GO
/****** Object:  ForeignKey [FK_TBANSWER_REFERENCE_TBQUESTI]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbAnswer]  WITH CHECK ADD  CONSTRAINT [FK_TBANSWER_REFERENCE_TBQUESTI] FOREIGN KEY([question_id])
REFERENCES [dbo].[tbQuestion] ([question_id])
GO
ALTER TABLE [dbo].[tbAnswer] CHECK CONSTRAINT [FK_TBANSWER_REFERENCE_TBQUESTI]
GO
/****** Object:  ForeignKey [FK_TBCLASSD_REFERENCE_TBGRADE]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbClassDetail]  WITH CHECK ADD  CONSTRAINT [FK_TBCLASSD_REFERENCE_TBGRADE] FOREIGN KEY([grade_id])
REFERENCES [dbo].[tbGrade] ([grade_id])
GO
ALTER TABLE [dbo].[tbClassDetail] CHECK CONSTRAINT [FK_TBCLASSD_REFERENCE_TBGRADE]
GO
/****** Object:  ForeignKey [FK_tbExamCategory_tbExamCategory]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamCategory]  WITH CHECK ADD  CONSTRAINT [FK_tbExamCategory_tbExamCategory] FOREIGN KEY([exam_id])
REFERENCES [dbo].[tbExamCategory] ([exam_id])
GO
ALTER TABLE [dbo].[tbExamCategory] CHECK CONSTRAINT [FK_tbExamCategory_tbExamCategory]
GO
/****** Object:  ForeignKey [FK__tbExamRul__paper__63D8CE75]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbExamRule]  WITH CHECK ADD FOREIGN KEY([paper_Id])
REFERENCES [dbo].[tbExamPaper] ([paper_id])
GO
/****** Object:  ForeignKey [FK_TBGRADE_REFERECE_TBEXAMCA]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbGrade]  WITH CHECK ADD  CONSTRAINT [FK_TBGRADE_REFERECE_TBEXAMCA] FOREIGN KEY([tch_id])
REFERENCES [dbo].[tbTeacher] ([tch_id])
GO
ALTER TABLE [dbo].[tbGrade] CHECK CONSTRAINT [FK_TBGRADE_REFERECE_TBEXAMCA]
GO
/****** Object:  ForeignKey [FK_TBGRADE_REFERENCE_TBEXAMCA]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbGrade]  WITH CHECK ADD  CONSTRAINT [FK_TBGRADE_REFERENCE_TBEXAMCA] FOREIGN KEY([exam_id])
REFERENCES [dbo].[tbExamCategory] ([exam_id])
GO
ALTER TABLE [dbo].[tbGrade] CHECK CONSTRAINT [FK_TBGRADE_REFERENCE_TBEXAMCA]
GO
/****** Object:  ForeignKey [FK_TBGRADE_REFERENCE_TBGRADEC]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbGrade]  WITH CHECK ADD  CONSTRAINT [FK_TBGRADE_REFERENCE_TBGRADEC] FOREIGN KEY([gType_id])
REFERENCES [dbo].[tbGradeCategory] ([gType_id])
GO
ALTER TABLE [dbo].[tbGrade] CHECK CONSTRAINT [FK_TBGRADE_REFERENCE_TBGRADEC]
GO
/****** Object:  ForeignKey [FK_ITEMS_REFERENCE_TBORDER]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbItems]  WITH CHECK ADD  CONSTRAINT [FK_ITEMS_REFERENCE_TBORDER] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbOrder] ([order_id])
GO
ALTER TABLE [dbo].[tbItems] CHECK CONSTRAINT [FK_ITEMS_REFERENCE_TBORDER]
GO
/****** Object:  ForeignKey [FK_TBLECTUR_REFERENCE_TBCLASSD]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbLecture]  WITH CHECK ADD  CONSTRAINT [FK_TBLECTUR_REFERENCE_TBCLASSD] FOREIGN KEY([class_id])
REFERENCES [dbo].[tbClassDetail] ([class_id])
GO
ALTER TABLE [dbo].[tbLecture] CHECK CONSTRAINT [FK_TBLECTUR_REFERENCE_TBCLASSD]
GO
/****** Object:  ForeignKey [FK_TBNOTE_REFERENCE_TBSTUDEN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbNote]  WITH CHECK ADD  CONSTRAINT [FK_TBNOTE_REFERENCE_TBSTUDEN] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tbStudent] ([stu_id])
GO
ALTER TABLE [dbo].[tbNote] CHECK CONSTRAINT [FK_TBNOTE_REFERENCE_TBSTUDEN]
GO
/****** Object:  ForeignKey [FK_TBORDER_REFERENCE_TBSTUDEN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbOrder]  WITH CHECK ADD  CONSTRAINT [FK_TBORDER_REFERENCE_TBSTUDEN] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tbStudent] ([stu_id])
GO
ALTER TABLE [dbo].[tbOrder] CHECK CONSTRAINT [FK_TBORDER_REFERENCE_TBSTUDEN]
GO
/****** Object:  ForeignKey [FK_TBQUESTI_REFERENCE_TBSTUDEN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbQuestion]  WITH CHECK ADD  CONSTRAINT [FK_TBQUESTI_REFERENCE_TBSTUDEN] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tbStudent] ([stu_id])
GO
ALTER TABLE [dbo].[tbQuestion] CHECK CONSTRAINT [FK_TBQUESTI_REFERENCE_TBSTUDEN]
GO
/****** Object:  ForeignKey [FK_QUESTION_REFERENCE_TBSTUDEN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbQuestionCollect]  WITH CHECK ADD  CONSTRAINT [FK_QUESTION_REFERENCE_TBSTUDEN] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tbStudent] ([stu_id])
GO
ALTER TABLE [dbo].[tbQuestionCollect] CHECK CONSTRAINT [FK_QUESTION_REFERENCE_TBSTUDEN]
GO
/****** Object:  ForeignKey [FK_TBRECHARGE_REFERENCE_TBSTUDEN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbRechargeRecord]  WITH CHECK ADD  CONSTRAINT [FK_TBRECHARGE_REFERENCE_TBSTUDEN] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tbStudent] ([stu_id])
GO
ALTER TABLE [dbo].[tbRechargeRecord] CHECK CONSTRAINT [FK_TBRECHARGE_REFERENCE_TBSTUDEN]
GO
/****** Object:  ForeignKey [FK_TBREPLY_REFERENCE_TBASKORCOMPLAIN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbReply]  WITH CHECK ADD  CONSTRAINT [FK_TBREPLY_REFERENCE_TBASKORCOMPLAIN] FOREIGN KEY([ac_id])
REFERENCES [dbo].[tbAskOrComplain] ([ac_id])
GO
ALTER TABLE [dbo].[tbReply] CHECK CONSTRAINT [FK_TBREPLY_REFERENCE_TBASKORCOMPLAIN]
GO
/****** Object:  ForeignKey [FK_SEND_REFERENCE_TBORDER]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbSend]  WITH CHECK ADD  CONSTRAINT [FK_SEND_REFERENCE_TBORDER] FOREIGN KEY([order_id])
REFERENCES [dbo].[tbOrder] ([order_id])
GO
ALTER TABLE [dbo].[tbSend] CHECK CONSTRAINT [FK_SEND_REFERENCE_TBORDER]
GO
/****** Object:  ForeignKey [FK_TBDEAL_REFERENCE_TBSTUDEAL]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStuDeal]  WITH CHECK ADD  CONSTRAINT [FK_TBDEAL_REFERENCE_TBSTUDEAL] FOREIGN KEY([deal_id])
REFERENCES [dbo].[tbDeal] ([deal_id])
GO
ALTER TABLE [dbo].[tbStuDeal] CHECK CONSTRAINT [FK_TBDEAL_REFERENCE_TBSTUDEAL]
GO
/****** Object:  ForeignKey [FK_TBSTUDYR_REFERENCE_TBSTUDEN]    Script Date: 05/17/2013 14:47:26 ******/
ALTER TABLE [dbo].[tbStudyRecord]  WITH CHECK ADD  CONSTRAINT [FK_TBSTUDYR_REFERENCE_TBSTUDEN] FOREIGN KEY([stu_id])
REFERENCES [dbo].[tbStudent] ([stu_id])
GO
ALTER TABLE [dbo].[tbStudyRecord] CHECK CONSTRAINT [FK_TBSTUDYR_REFERENCE_TBSTUDEN]
GO
