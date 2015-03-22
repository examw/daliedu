alter table tbStudyRecord drop column record_endTime;删除 学习记录结束时间
delete from tbStudyRecord where id=1
alter table tbStudyRecord add record_name nvarchar(100);

//添加评价老师表

create table tbComment(
	id  int identity(1,1),
	comment_id int primary key,
	comment_content nvarchar(500),
	comment_score int,
	stu_id int,
	tch_id int,	
)

alter table tbComment add comment_addTime datetime

//修改协议表
alter table tbDeal add deal_pkgId int;
//添加学生协议表表

create table tbStuDeal(
	id  int identity(1,1),
	stuDeal_id int primary key,
	deal_id int,
	stuDeal_status int,
	stuDeal_time date,
	constraint FK_TBDEAL_REFERENCE_TBSTUDEAL foreign key (deal_id)
    references tbDeal (deal_id),
)
create table cooperate(
	id int identity(1,1) primary key,
	coop_name nvarchar(250) default null,
	coop_key nvarchar(100) not null,
	coop_url nvarchar(100) not null unique,
	updatetime datetime default NULL ,
    addtime datetime default null,
    coop_phone nvarchar(100) default null,
    coop_qq nvarchar(100) default null,
    coop_email nvarchar(250) default null
)

drop table cooperate
alter table tbStuDeal add stu_id int;
alter table tbStuDeal  add package_status int
alter table tbStuDeal drop column   package_status
alter table tbStuDeal  add stu_name nvarchar(50);
alter table tbStuDeal  add stu_username nvarchar(100);
alter table tbStuDeal  add stu_cards nvarchar(50);
alter table tbStuDeal add pkg_name nvarchar(50);
alter table tbStuDeal add paytype nvarchar(50);
alter table tbStuDeal add stu_address nvarchar(200);
alter table tbStuDeal drop column stu_examname;
alter table tbStuDeal add stu_phone nvarchar(30);
alter table tbStuDeal add stu_email nvarchar(50);
alter table tbDeal add deal_lastDate date;
alter table tbGrade add tch_Name varchar(50);
alter table tbClassDetail drop column class_audio
alter table tbClassDetail add class_audio varchar(60);

select * from tbStudyRecord