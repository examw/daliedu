package com.changh.sccms.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.StudentDAO;
import com.changh.sccms.entity.ExamRecord;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.StudyRecord;


public class HibernateStuDAO extends HibernateDaoSupport implements StudentDAO{
	//找出所有，
	public List<Student> findAll(final int page, final int pagesize, final String sortname,
			final String sortorder) throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Student order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	/*
	 * 找出添加时间在d1，和d2之间的所有学员
	 * 参数：d1，d2 两个时间，必须d1先于d2
	 */
	public List<Student> studentSelect(final String date,final int page,final int pagesize,final String sortname,final String sortorder) throws Exception {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						//创建Date对象
						Date newdate = new Date();
						//创建基于当前时间的日历对象
						Calendar cl1 = Calendar.getInstance();
						cl1.setTime(newdate);
						cl1.add(Calendar.DATE, 1);
						Calendar cl = Calendar.getInstance();
						cl.setTime(newdate);
						
						//今天的数据
						if(date.equals("taday")){
							cl.add(Calendar.DATE, -1);
						 }
						//距离今天，一个月内数据
						if(date.equals("month")){
							cl.add(Calendar.MONTH, -1);
						}
						 //距离今天，一周内的数据
						if(date.equals("week")){
							cl.add(Calendar.DATE, -7);
						 }
						//距离今天，两个月的数据
						if(date.equals("premonth")){
							cl.add(Calendar.MONTH,-2);
						}
						Date startDate = cl.getTime();
						Date endDate = cl1.getTime();
						SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd"); 
						//格式化开始日期和结束日期
						String start = dd.format(startDate);
						String end = dd.format(endDate);
						String hql = "from Student where stuAddTime > '" + start +"' and stuAddTime <= '"+end+"' order by "+sortname+" "+sortorder;;
						Query query=session.createQuery(hql);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
		
	}
	/*
	 * 根据id进行删除
	 */
	//!!!!!!!!!!!!!!!!!!!!!!!!!!!!是否要加锁？!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	public void delete(int id) throws Exception {
		this.getHibernateTemplate().delete(findById(id));
	}
	/*
	 * 向数据库中添加一条记录
	 */
	public void insert(Student stu) throws Exception {
		this.getHibernateTemplate().save(stu);
		
	}
	/*
	 * 根据id进行查询
	 */
	public Student findById(int id) throws Exception {
		return (Student) this.getHibernateTemplate().get(Student.class, id);
	}
	/*
	 *修改学员信息 
	 */
	public void modify(Student stu) throws Exception {
		// TODO Auto-generated method stub
		String hql="from Student where stuId=?";
		Object[] params={stu.getStuId()};
		List<Student> list=this.getHibernateTemplate().find(hql,params);
		Student stu1 =list.get(0);
		stu1.setStuPhone(stu.getStuPhone());
		stu1.setStuMobile(stu.getStuMobile());
		stu1.setStuAddr(stu.getStuAddr());
		stu1.setStuStatus(stu.getStuStatus());
		stu1.setDeviceNum(stu.getDeviceNum());
		this.getHibernateTemplate().update(stu1);
	}
	//	查询指定用户名的学员
	public Student findByUsername(String username) throws Exception {
		// TODO Aut
		String hql = "from Student where stuUsername=?"; //2014.03.14修改 User --> Student
		Object[] params = {username};
		List<Student> list = this.getHibernateTemplate()
				.find(hql,params);
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	//	查询指定Email的学员
	public Student findByEmail(String email) throws SQLException {
		String hql = "from Student where stuEmail=?";  	//2014.03.14修改 User --> Student
		Object[] params = {email};
		List<Student> list = this.getHibernateTemplate()
				.find(hql,params);
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	//分页查询
	public List<Student> findPage(final int page,final int size)
	{
		return (List)this.getHibernateTemplate().execute(
			new HibernateCallback()
			{
				public Object doInHibernate(Session session)
				{
					//使用session执行分页查询代码
					String hql="from Student";
					Query query=session.createQuery(hql);
					query.setFirstResult((page-1)*size);
					query.setMaxResults(size);
					return query.list();
				}
			}
		);
	}
	
	public void update(Student stu) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().update(stu);
	}
	public int getTotal(String date) {
		//创建Date对象
		Date newDate = new Date();
		//创建基于当前时间的日历对象
		Calendar cl1 = Calendar.getInstance();
		cl1.setTime(newDate);
		Calendar cl = Calendar.getInstance();
		cl.setTime(newDate);
		//今天的数据
		if(date.equals("taday")){
			cl.add(Calendar.DATE, -1);
		 }
		//距离今天，一个月内数据
		if(date.equals("month")){
			cl.add(Calendar.MONTH, -1);
		}
		 //距离今天，一周内的数据
		if(date.equals("week")){
			cl.add(Calendar.DATE, -7);
		 }
		//距离今天，两个月的数据
		if(date.equals("premonth")){
			cl.add(Calendar.MONTH,-2);
		}
		Date startDate = cl.getTime();
		Date endDate = cl1.getTime();
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd"); 
		//格式化开始日期和结束日期
		String start = dd.format(startDate);
		String end = dd.format(endDate);
		String hql="";
		if(date.equals("all")){
			hql ="select count(*) from Student";
		}else{
			hql="select count(*) from Student where stuAddTime > '" + start +"' and stuAddTime <= '"+end+"'";
		}
		Long total = (Long) this.getHibernateTemplate().find(hql).get(0);
		return total.intValue();
	}
	
	
	public List<Student> search(final int page,final int pagesize,final String sortname,
			final String sortorder,final String str,final String searchName) throws Exception {
		// TODO Auto-generated method stub
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from Student where "+searchName+" like ? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setString(0, ("%"+str+"%"));
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	
	public int getSearchTotal(String searchName,String str) throws Exception{
		String hql="select count(*) from Student where "+searchName+" like '%"+str+"%'";
		Long total=(Long) this.getHibernateTemplate().find(hql).get(0);
		return total.intValue();	
	}
	public List<StudyRecord> findStudyRecord(final int stuId,final int page,final int pagesize,final String sortname,final String sortorder) {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from StudyRecord where stuId =? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setInteger(0, stuId);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public List<ExamRecord> findExamRecord(final int stuId,final int page,final int pagesize,final String sortname,final String sortorder) {
		return (List)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//使用session执行分页查询代码
						String hql="from ExamRecord where stuId =? order by "+sortname+" "+sortorder;
						Query query=session.createQuery(hql);
						query.setInteger(0, stuId);
						query.setFirstResult((page-1)*pagesize);
						query.setMaxResults(pagesize);
						return query.list();
					}
				}
			);
	}
	public Integer getStudyRecordTotal(int stuId) {
		String hql="select count(*) from StudyRecord where stuId=?";
		Object[] param={stuId};
		Long total=(Long) this.getHibernateTemplate().find(hql,param).get(0);
		return total.intValue();	
	}
	public Integer getExamRecordTotal(int stuId) {
		String hql="select count(*) from ExamRecord where stuId=?";
		Object[] param={stuId};
		Long total=(Long) this.getHibernateTemplate().find(hql,param).get(0);
		return total.intValue();
	}
	
	@Override
	public List<Student> exportList(String area, String date) {
		// TODO Auto-generated method stub
		String hql = "from Student where stuArea like '"+area+"' and stuAddTime > "+date;
		return this.getHibernateTemplate().find(hql);
	}
	
	@Override
	public List<StudyRecord> findLimitRecord(int stuId) {
		String hql = "from StudyRecord r where r.stuId =? and r.useNum >= r.haveNum order by r.id asc";
		Object[] params = {stuId};
		return  this.getHibernateTemplate().find(hql,params);
	}
	@Override
	public StudyRecord findStudyRecord(int recordId) {
		String hql="from StudyRecord where recordId=?";
		Object[] params={recordId};
		List<StudyRecord> list=this.getHibernateTemplate().find(hql,params);
		if(list == null || list.size()==0){
			return null;
		}
		return list.get(0);
	}
	@Override
	public void updateRecord(StudyRecord record) {
		this.getHibernateTemplate().update(record);
	}
}