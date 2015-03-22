package com.changh.eschool.dao.impl;

import java.io.Serializable;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.eschool.dao.ClassPackageDAO;
import com.changh.eschool.entity.ClassPackage;
import com.changh.eschool.entity.Deal;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.PackageCategory;
import com.changh.eschool.entity.StuDeal;

public class HibernateClassPackageDAO extends HibernateDaoSupport implements ClassPackageDAO,Serializable{

	//查找当前考试类别下面的所有套餐
	public List<ClassPackage> findClassPackage(int examId) {
		Date today = new Date(System.currentTimeMillis());
		String hql ="select classPackage from ClassPackage classPackage where classPackage.examId="+examId+" and classPackage.pkgRMatureDate >'"+today+"'";
		return this.getHibernateTemplate().find(hql);
	}
	
	public int findPackageCategory(String ptypeName,int examId){
		String hql ="select category.ptypeId from PackageCategory category where category.ptypeName = "+"'"+ptypeName+"'"+" and category.examId="+examId;
		List list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()!=0){
			return (Integer) list.get(0);
		}else{
			return 0;
		}
	}
	public List<PackageCategory> findPackageId(int ptypePid){
		String hql="select category from PackageCategory category where category.ptypePid="+ptypePid;
		return this.getHibernateTemplate().find(hql);
	}
	public List<ClassPackage> findPackage(int ptypeId){
		Date today = new Date(System.currentTimeMillis());
			String hql="select new ClassPackage(pkgId,pkgName,pkgRPrice,pkgTotalTime) from ClassPackage classPackage where classPackage.pkgRMatureDate >'"+today+"'and classPackage.ptypeId="+ptypeId;
		return this.getHibernateTemplate().find(hql);
	}
	public ClassPackage findById(int pkgId) {
		// TODO Auto-generated method stub
		return (ClassPackage) this.getHibernateTemplate().get(ClassPackage.class, pkgId);
	}
	public List<Grade> findByPkgId(int pkgId) {
		String hql ="select cp.pkgIncludeCid from ClassPackage cp where cp.pkgId="+pkgId;
		List<String> list = this.getHibernateTemplate().find(hql);
		String gradeIdString = list.get(0);
		String[] gradeId = gradeIdString.split(",");
		List gradeList = new ArrayList<Grade>();
		for(int i=0;i<gradeId.length;i++){
			if(gradeId[i].trim().isEmpty()){continue;}
			String hql1 ="select g from Grade g where g.gradeId="+gradeId[i];
			List<Grade> list1 = this.getHibernateTemplate().find(hql1);
			if(list1!=null&&list1.size()!=0){
				gradeList.add(list1.get(0));
			}
		}
		return gradeList;
	}

	public int findExamId(int ptypeId) {
		String hql ="select category.examId from PackageCategory category where category.ptypeId="+ptypeId;
		return (Integer) this.getHibernateTemplate().find(hql).get(0);
	}
	public String findExamName(final int pkgId) throws Exception {
		// TODO Auto-generated method stub
		return (String)this.getHibernateTemplate().execute(
				new HibernateCallback()
				{
					public Object doInHibernate(Session session)
					{
						//String sql ="select distinct ec.* from tbExamCategory ec join (select pc.* from (select cp.* from (select i.* from tbItems i join tbOrder o on i.order_id = o.order_id where o.stu_id ="+stuId+" and o.order_status in (1,2,3)) temp,tbClassPackage cp where (temp.productId = cp.pkg_id and temp.item_pType=0)) temp2 join tbPackageCategory pc on pc.pType_id = temp2.pType_id) pc2 on ec.exam_id = pc2.exam_id";
						String sql = "{Call proc_getSecondExamNameOfPkg(?) }"; //调用存储过程
						SQLQuery query = session.createSQLQuery(sql);
						query.setInteger(0, pkgId);
						return query.list().get(0);
					}
				}
			);
	}

	public Deal findByDealId(int dealId) {
		String hql = "from Deal where dealId="+dealId;
		return (Deal) this.getHibernateTemplate().find(hql).get(0);
	}

	public void saveStuDeal(StuDeal sd) {
		this.getHibernateTemplate().save(sd);
	}

	public void update(StuDeal sd) {
		this.getHibernateTemplate().update(sd);
	}

	public void deleteStuDeal(StuDeal sd) {
		this.getHibernateTemplate().delete(sd);
	}

	public StuDeal findByStuDealId(int stuDealId) {
		String hql ="from StuDeal where stuDealId="+stuDealId;
		return (StuDeal) this.getHibernateTemplate().find(hql).get(0);
	}

	public Deal findDealByPkgId(int pkgId) {
		String hql = "from Deal where dealPkgId ="+pkgId;
		List list =  this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0){
			return (Deal) list.get(0);
		}else{
			return null;
		}
	
	}

	public int findStuDealId() {
		String hql ="select max(sd.stuDealId) from StuDeal sd ";
		Integer id=	(Integer) this.getHibernateTemplate().find(hql).get(0);
		if(id==null){
			return 1001;
		}else{
			return id+1;
		}
	}

	public List<StuDeal> findStuDealByStuId(final int stuId,final int page,final int pagesize) {
		return (List<StuDeal>) this.getHibernateTemplate().execute(new HibernateCallback() {
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				String hql ="from StuDeal where stuId ="+stuId+"order by stuDealId desc ";
				Query query = session.createQuery(hql);
				query.setFirstResult((page-1)*pagesize);
				query.setMaxResults(pagesize);
				return query.list();
			}
		});
		
	}
	
	public int findStuDealTotal(int stuId){
		String hql ="select count(*) from StuDeal where stuId ="+stuId;
		List list = this.getHibernateTemplate().find(hql);
		return ((Long)list.get(0)).intValue();
	}

	public List<PackageCategory> findByExamId(int examId) {
		String hql ="from PackageCategory pc where pc.examId="+examId+" and pc.ptypePid=0";
		return this.getHibernateTemplate().find(hql);
	}


}
