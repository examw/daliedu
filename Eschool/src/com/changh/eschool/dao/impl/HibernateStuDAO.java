package com.changh.eschool.dao.impl;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.StudentDAO;
import com.changh.eschool.entity.Cooperate;
import com.changh.eschool.entity.Student;
import com.changh.eschool.entity.Teacher;


public class HibernateStuDAO extends HibernateDaoSupport implements StudentDAO{
	//找出所有，
	public List<Student> findAll()throws Exception
	{
		String hql ="from Student";
		List<Student> list = this.getHibernateTemplate().find(hql);
		return list;
	}
	/*
	 * 找出添加时间在d1，和d2之间的所有学员
	 * 参数：d1，d2 两个时间，必须d1先于d2
	 */
	public List<Student> select(String date) throws Exception {
		//创建Date对象
		Date endDate = new Date();
		//创建基于当前时间的日历对象
		Calendar cl = Calendar.getInstance();
		cl.setTime(endDate);
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
		SimpleDateFormat dd = new SimpleDateFormat("yyyy-MM-dd"); 
		//格式化开始日期和结束日期
		String start = dd.format(startDate);
		String end = dd.format(endDate);
		//如果(flag！=month) &&  (flag！=week), 则查询的就是当天的数据
		String hql = "from Student where stuAddTime > '" + start +"' and stuAddTime <= '"+end+"'";
		//String hql = "from Student where stuAddTime between ? and ?";
		//Object[] params={start,end};
		List<Student> list=this.getHibernateTemplate().find(hql);
		return list;
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
		System.out.println(stu.getStuId());
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
	public void update(Student stu) throws Exception {
		// TODO Auto-generated method stub
		this.getHibernateTemplate().saveOrUpdate(stu);
	}
	//	查询指定用户名的学员
	public Student findByUsername(String username) throws Exception {
		// TODO Aut
		String hql = "from Student where stuUsername=?";
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
		String hql = "from Student where stuEmail=?";
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
	public boolean isExist(String username, String email) throws Exception {
		// TODO Auto-generated method stub

		String hql = "from Student  where stuUsername =? or stuEmail =?";
		Object[] params ={username,email}; 
		List<Student> list = this.getHibernateTemplate().find(hql, params);
		//为空表示不存在
		return !list.isEmpty();
	}
	public Student findByStuId(int stuId) {
		// TODO Auto-generated method stub
		String hql ="from Student s where s.stuId="+stuId;
		return (Student) this.getHibernateTemplate().find(hql).get(0);
	}

	
	/**********************************************/
	/*合作机构查询*/
	/**********************************************/
	
	public Cooperate findCooperate(String url){
		
		List<Cooperate> list = this.getHibernateTemplate()
				.find("from Cooperate  c where c.coopUrl=?",url);
		if(!list.isEmpty()){
			return list.get(0);
		}else{
			return null;
		}
	}
	/**********************************************/
	/*按手机号查询	2014.04.11*/
	/**********************************************/
	@Override
	public Student findByMobilePhone(String phone) {
		// TODO Auto-generated method stub
		String hql = "from Student where stuMobile = ?";
		Object[] params = {phone};
		List<Student> list = this.getHibernateTemplate()
				.find(hql,params);
		if(!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	/**********************************************/
	/*按TOken查询	2014.04.11*/
	/**********************************************/
	@Override
	public Student findByToken(String token) {
		String hql = "from Student where stuToken = ?";
		Object[] params = {token};
		List<Student> list = this.getHibernateTemplate()
				.find(hql,params);
		if(list!=null&&!list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
}