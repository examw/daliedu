package com.changh.eschool.dao.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Hibernate;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ExamCategoryDAO;
import com.changh.eschool.entity.ExamCategory;
import com.changh.eschool.entity.ExamCategory1;



public class HibernateExamCategoryDAO  extends HibernateDaoSupport implements ExamCategoryDAO {
	public List<ExamCategory1> findAll1() throws Exception {
		String hql ="from ExamCategory1";
		return this.getHibernateTemplate().find(hql);
		
	}

	public List<ExamCategory1> findByPid1(int pid) throws Exception {
		String hql="from ExamCategory1 c where c.examPid=?";
		Object[] params ={pid};
		return this.getHibernateTemplate().find(hql,params);
	}
	
	/////////////////////////////////////////////////////////////////
	public List<ExamCategory> findAll() throws Exception {
		String hql="select distinct c from ExamCategory c left join fetch c.children " +
				" sc where c.examPid=0 order by c.examOrderId";
		List<ExamCategory> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	public ExamCategory findById(int examId) throws Exception {
		return (ExamCategory) this.getHibernateTemplate().get(ExamCategory.class, examId);
	}

	public void update(int id,String examName) throws Exception {
		String hql ="select ec from ExamCategory ec where ec.id="+id;
		List list =this.getHibernateTemplate().find(hql);
		ExamCategory ec = (ExamCategory) list.get(0);
		ec.setExamName(examName);
		this.getHibernateTemplate().update(ec);
	}

	/*public void delete(int examId) throws Exception {
		if(null!=(ExamCategory) this.getHibernateTemplate().get(ExamCategory.class, examId)){
		this.getHibernateTemplate().delete(findById(examId));
		}
	}*/

	public void save(ExamCategory exam) throws Exception {
		this.getHibernateTemplate().save(exam);
	}

	public int fingByPid(int examPid) throws Exception {
		String hql ="select count(*) from ExamCategory ec where ec.examPid="+examPid;
		List list=this.getHibernateTemplate().find(hql);
		Long count =(Long) list.get(0);
		
		return  count.intValue();
	}

	public void delete(int examPid,int id) throws Exception {
		
		String hql ="select ec from ExamCategory ec where ec.examId="+examPid;
		List list =this.getHibernateTemplate().find(hql);
		ExamCategory ec = (ExamCategory) list.get(0);
		if(ec!=null){
		ec.setExamChildrenNum(ec.getExamChildrenNum()-1);
		this.getHibernateTemplate().update(ec);
		}
		String hql1 ="select ec from ExamCategory ec where ec.id="+id;
		List list1 = this.getHibernateTemplate().find(hql1);
		ExamCategory ec1 = (ExamCategory) list1.get(0);
		String hql2="select ec from ExamCategory ec where ec.examPid="
					+examPid+" and ec.examOrderId >"+ec1.getExamOrderId();
		List<ExamCategory> list2 =this.getHibernateTemplate().find(hql2);
		for(ExamCategory exam :list2){
			exam.setExamOrderId(exam.getExamOrderId()-1);
			this.getHibernateTemplate().update(exam);
		}
		String hql3="select ec from ExamCategory ec where ec.examPid="+ec1.getExamId();
		this.getHibernateTemplate().deleteAll(this.getHibernateTemplate().find(hql3));
		this.getHibernateTemplate().delete(ec1);
	}

	public ExamCategory findByIdExamAdd(int id) throws Exception {
		String hql ="select ec from ExamCategory ec where ec.id="+id;
		List list =this.getHibernateTemplate().find(hql);
		ExamCategory ec = (ExamCategory) list.get(0);
		int count =ec.getExamChildrenNum();
		ec.setExamChildrenNum(count+1);
		this.getHibernateTemplate().update(ec);
		String hql1 ="select ec from ExamCategory ec where ec.id="+id;
		List list1 =this.getHibernateTemplate().find(hql);
		ExamCategory ec1 = (ExamCategory) list.get(0);
		return ec1;
	}

	public List<ExamCategory> findByExamPid(int examPid) {
		String hql ="select ec from ExamCategory ec where ec.examPid = "+examPid;
		List<ExamCategory> list =this.getHibernateTemplate().find(hql);
		return list;
	}

	public boolean checkAdd(int examId) {
		String hql ="select count(*) from Grade g where g.examCategory.examId="+examId;
		Long countG =(Long) this.getHibernateTemplate().find(hql).get(0);
		/*String hql1 ="select count(*) from PackageCategory pc where pc.examId="+examId;
		Long countPC = (Long) this.getHibernateTemplate().find(hql1).get(0);*/
		if(countG.intValue()==0/*&&countPC.intValue()==0*/){
			return true;
		}
		return false;
	}
	public List<ExamCategory> findByStuId(final int stuId) throws Exception
	{
		Set<ExamCategory> list = new HashSet<ExamCategory>();
		List<Object[]> list1 =  (List<Object[]>)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
						String sql = "{Call proc_get_exam_from_package(?) }"; //调用存储过程
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
						String sql = "{Call proc_get_exam_from_grade(?) }"; //调用存储过程
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(0, stuId);
						return query.list();
					}
				}
			);
		for(Object[] obj:list1)
		{
			ExamCategory ec = new ExamCategory();
			//id exam_id exam_name pid childrenNum addtime orderId
			ec.setExamId((Integer) obj[1]);
			ec.setExamName((String) obj[2]);
			ec.setExamPid((Integer) obj[3]);
			list.add(ec);
		}
		for(Object[] obj:list2)
		{
			ExamCategory ec = new ExamCategory();
			//id exam_id exam_name pid childrenNum addtime orderId
			ec.setExamId((Integer) obj[1]);
			ec.setExamName((String) obj[2]);
			ec.setExamPid((Integer) obj[3]);
			list.add(ec);
		}
		return new ArrayList<ExamCategory>(list);
	}
	
	// 2013.07.18 for mobile
	@Override
	public List<ExamCategory1> search(String keywords) throws Exception {
		// TODO Auto-generated method stub
		//String hql = "select distinct c from ExamCategory  c left join fetch c.children where c.examName like '%"+keywords.replaceAll("%", "\\%")+"%'";
		String hql = "from ExamCategory1 where examName like '%"+keywords.replaceAll("%", "\\%")+"%'";
		return this.getHibernateTemplate().find(hql);
	}
	
}
