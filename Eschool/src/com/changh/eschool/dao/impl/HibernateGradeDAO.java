package com.changh.eschool.dao.impl;

import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.GradeDAO;
import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.GradeCategory;



public class HibernateGradeDAO extends HibernateDaoSupport implements GradeDAO,Serializable {

	public List<Grade> findGradeByExamPidAndGradeCategory(String gtypeName,
			int examId) {
		Date today = new Date(System.currentTimeMillis());
		String hql ="select grade from Grade grade where grade.gradeCategory.gtypeName="+"'"+gtypeName+"'"
			+" and grade.examCategory.examPid="+examId+" and grade.gradeDueTime >'"+today+"'";
		List<Grade> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()!=0){
			return list;
		}else{
			String hql1 ="select grade from Grade grade where grade.gradeCategory.gtypeName="+"'"+gtypeName+"'"
					+" and grade.examCategory.examId="+examId+" and grade.gradeDueTime >'"+today+"'";
			return this.getHibernateTemplate().find(hql1);
		}
		
	}

	public List<GradeCategory> findAll() {
		String hql="from GradeCategory";
		return this.getHibernateTemplate().find(hql);
	}
	
	public Grade findById(int gradeId) {
		// TODO Auto-generated method stub
		return (Grade) this.getHibernateTemplate().get(Grade.class, gradeId);
	}
	public List<Grade> findByStuId(final int stuId) throws Exception {
		// TODO Auto-generated method stub
		/*List<ExamCategory> list = new ArrayList<ExamCategory>();*/
		List<Object[]> list1 =  (List<Object[]>)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
						String sql = "{Call proc_get_package_by_stuId(?) }"; //调用存储过程
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(0, stuId);
						return query.list();
					}
				}
			);
		List<Object[]> list2 =  (List<Object[]>)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
						String sql = "{Call proc_get_grade_by_stuId(?) }"; //调用存储过程
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(0, stuId);
						return query.list();
					}
				}
			);
		StringBuffer buf = new StringBuffer();
		buf.append("where g.gradeId in (");
		for(Object[] obj :list1)
		{
			
			buf.append(obj[15]);
			buf.append(",");
		}
		for(Object[] obj :list2)
		{
			
			buf.append(obj[1]);
			buf.append(",");
		}
		String sql = buf.substring(0, buf.length()-1)+")";
		return findByCriteria(sql);
	}
	public List<Grade> findByCriteria(String criteria)
	{
		String hql = "from Grade g "+criteria;
		return this.getHibernateTemplate().find(hql);
	}

	public List<Grade> findByTchId(int tchId) {
		String hql ="from Grade g where g.teacher.tchId="+tchId;
		return this.getHibernateTemplate().find(hql);
	}
	public String findExamName(final int gradeId) throws Exception {
		// TODO Auto-generated method stub
		return  (String)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
						String sql = "{Call proc_getSecondExamNameOfGrade(?) }"; //调用存储过程
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(0, gradeId);
						return query.list().get(0);
					}
				}
			);
	}
	
	@Override
	public List<Grade> findByIds(String ids) throws Exception {
		// TODO Auto-generated method stub
		String hql = "from Grade where gradeId in ("+ids+")";
		return this.getHibernateTemplate().find(hql);
	}

	@Override
	public List<Grade> findGradeList(final int stuId, int examId) throws Exception {
		// TODO Auto-generated method stub
				/*List<ExamCategory> list = new ArrayList<ExamCategory>();*/
				List<Object[]> list1 =  (List<Object[]>)this.getHibernateTemplate().execute(
						new HibernateCallback()
						{
							public Object doInHibernate(Session session)
							{
								//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
								String sql = "{Call proc_get_package_by_stuId(?) }"; //调用存储过程
								SQLQuery query = session.createSQLQuery(sql);
								query.setInteger(0, stuId);
								return query.list();
							}
						}
					);
				List<Object[]> list2 =  (List<Object[]>)this.getHibernateTemplate().execute(
						new HibernateCallback()
						{
							public Object doInHibernate(Session session)
							{
								//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
								String sql = "{Call proc_get_grade_by_stuId(?) }"; //调用存储过程
								SQLQuery query = session.createSQLQuery(sql);
								query.setInteger(0, stuId);
								return query.list();
							}
						}
					);
				StringBuffer buf = new StringBuffer();
				buf.append("where g.gradeId in (");
				for(Object[] obj :list1)
				{
					
					buf.append(obj[15]);
					buf.append(",");
				}
				for(Object[] obj :list2)
				{	
					buf.append(obj[1]);
					buf.append(",");
				}
				String sql = buf.substring(0, buf.length()-1)+") and ( g.examCategory.examPid="+examId+" or g.examCategory.examId="+examId+")";
				return findByCriteria(sql);
	}
}
