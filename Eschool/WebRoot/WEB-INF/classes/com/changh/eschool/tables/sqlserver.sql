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

alter table Category add comment_addTime dal