package com.changh.sccms.dao.impl;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.ClassPackageDAO;
import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Deal;
import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.ExamGrade;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.PackageCategory;

public class HibernateClassPackageDAO extends HibernateDaoSupport implements ClassPackageDAO{

	public List<PackageCategory> findByExamId(int examId) {
		String hql="select distinct p from PackageCategory p  where p.ptypePid=0 and p.examId="+examId+" order by p.ptypeOrderId";
		return this.getHibernateTemplate().find(hql);
	}
	
	public List<ClassPackage> findPackagesByExamId(int examId)
	{
		Date today = new Date(System.currentTimeMillis());
		String hql = "select distinct cp from ClassPackage cp,PackageCategory pc where cp.ptypeId = pc.ptypeId and pc.examId = ? and cp.pkgRMatureDate > ?";
		return this.getHibernateTemplate().find(hql, new Object[]{examId,today});
	}

	public List<ClassPackage> findByPtypeId(int ptypeId) {
		String hql ="select cp from ClassPackage cp where cp.ptypeId="+ptypeId;
		return this.getHibernateTemplate().find(hql);
	}

	public List<Grade> findByPkgId(int pkgId) {
		String hql ="select cp.pkgIncludeCid from ClassPackage cp where cp.pkgId="+pkgId;
		List<String> list = this.getHibernateTemplate().find(hql);
		String gradeIdString = list.get(0);
		String[] gradeId = gradeIdString.split(",");
		List gradeList = new ArrayList<Grade>();
		for(int i=0;i<gradeId.length;i++){
			if(!gradeId[i].trim().isEmpty()){
			String hql1 ="select g from Grade g where g.gradeId="+gradeId[i];
			List<Grade> gList= this.getHibernateTemplate().find(hql1);
			if(gList!=null&&gList.size()>0){
				gradeList.add(gList.get(0));
			}	}
		}
		return gradeList;
	}

	public List<Grade1> findGrade1ByPkgId(int pkgId) {
		String hql ="select cp.pkgIncludeCid from ClassPackage cp where cp.pkgId="+pkgId;
		List<String> list = this.getHibernateTemplate().find(hql);
		String gradeIdString = list.get(0);
		String[] gradeId = gradeIdString.split(",");
		List<Grade1> gradeList = new ArrayList<Grade1>();
		for(int i=0;i<gradeId.length;i++){
			if(!gradeId[i].trim().isEmpty()){
			String hql1 ="select g from Grade1 g where g.gradeId="+gradeId[i];
			List<Grade1> gList= this.getHibernateTemplate().find(hql1);
			if(gList!=null&&gList.size()>0){
				gradeList.add(gList.get(0));
			}	
			}
		}
		return gradeList;
	}
	public List<ExamGrade> gradeTree(int examId) {
		String hql ="select exam from ExamCategory exam where exam.examPid="+examId;
		List<ExamCategory> examList = this.getHibernateTemplate().find(hql);
		List list = new ArrayList<ExamGrade>();
		for(int i=0;i<examList.size();i++){
			ExamGrade eg = new ExamGrade();
			int gradeExamId = examList.get(i).getExamId();
			eg.setExamId(gradeExamId );
			eg.setText(examList.get(i).getExamName());
			String hql1 ="select g from Grade g where g.examCategory.examId="+gradeExamId;
			eg.setChildren(this.getHibernateTemplate().find(hql1));
			list.add(eg);
		}
		return list;
	}
	public List<Deal> findAllDeal() {
		String hql ="from Deal";
		List<Deal> list = this.getHibernateTemplate().find(hql);
		return list;
	}

	public ClassPackage findByPkgIncludeCid(ClassPackage classPackage) {
		String includeCid = classPackage.getPkgIncludeCid();
		if(includeCid==null||includeCid.trim().isEmpty()){
			classPackage.setPkgTotalTime(0);
			return classPackage;
		}
		String[] gradeId = includeCid.split(",");
		int pkgTotalTime =0;
		if(includeCid.indexOf(",")!=0)
			includeCid = ","+includeCid;
		if(includeCid.lastIndexOf(",")!=includeCid.length()-1){
			includeCid = includeCid+",";
		}
		for(int i=0;i<gradeId.length;i++){
			if(gradeId[i].trim().isEmpty()){continue;}
			String hql1 ="select g.gradeTime from Grade g where g.gradeId="+gradeId[i];
			List list = this.getHibernateTemplate().find(hql1);
			if(list!=null&&list.size()>0)
				pkgTotalTime=pkgTotalTime+(Integer)list.get(0);
			else{
				String idd = ","+gradeId[i]+",";
				String first = includeCid.substring(0,includeCid.indexOf(idd));
				String after = includeCid.substring(includeCid.indexOf(idd)+idd.length(),includeCid.length());
				includeCid = first+","+after;
				includeCid = includeCid.substring(1,includeCid.length()-1);
			}
		}
		classPackage.setPkgTotalTime(pkgTotalTime);
		classPackage.setPkgIncludeCid(includeCid);
		return classPackage;
	}

	public void save(ClassPackage classPackage) {
		this.getHibernateTemplate().save(classPackage);
	}

	public boolean checkPackage(int ptypeId) {
		String hql ="select COUNT(*) from ClassPackage cp where cp.ptypeId="+ptypeId ;
		Long l = (Long) this.getHibernateTemplate().find(hql).get(0);
		if( l.intValue()==0){
			return false;
		}else{
			return true;
			}
	}

	public void savePackageCategory(PackageCategory packageCategory) {
		String hql ="select count(*) from PackageCategory  pc where pc.ptypePid="+packageCategory.getPtypePid();
		Long count = (Long) this.getHibernateTemplate().find(hql).get(0);
		packageCategory.setPtypeOrderId(count.intValue()+1);
		String hql1 ="select pc from PackageCategory pc where pc.ptypeId="+packageCategory.getPtypePid();
		List list = this.getHibernateTemplate().find(hql1);
		if(list!=null&&list.size()>0){
			PackageCategory pc = (PackageCategory) this.getHibernateTemplate().find(hql1).get(0);
			pc.setPtypeChildrenNum(count.intValue()+1);
			this.getHibernateTemplate().update(pc);
		}
		this.getHibernateTemplate().save(packageCategory);
	}

	public PackageCategory loadCategory(int ptypeId) {
		String hql="select pc from PackageCategory  pc where pc.ptypeId="+ptypeId;
		return (PackageCategory) this.getHibernateTemplate().find(hql).get(0);
	}

	public void ModifyPackageCategory(PackageCategory packageCategory) {
		String hql="select pc from PackageCategory  pc where pc.ptypeId="+packageCategory.getPtypeId();
		PackageCategory pc = (PackageCategory) this.getHibernateTemplate().find(hql).get(0);
		pc.setPtypeName(packageCategory.getPtypeName());
		pc.setPtypeDescription(packageCategory.getPtypeDescription());
		this.getHibernateTemplate().update(pc);
	}

	public boolean deletePackageCategory(int ptypeId) {
		//找到当前的套餐
		String hql1="select pc from PackageCategory pc where pc.ptypeId="+ptypeId;
		PackageCategory pc = (PackageCategory) this.getHibernateTemplate().find(hql1).get(0);
		String hql5=" from PackageCategory pc where pc.ptypePid="+ptypeId;
		String hql6 ="from ClassPackage cp where cp.ptypeId="+ptypeId;
		//查看是否有具体套餐
		List list6 = this.getHibernateTemplate().find(hql6);
		//查看是否有只套餐
		List list5 = this.getHibernateTemplate().find(hql5);
		if((list5!=null&&list5.size()>0)||(list6!=null&&list6.size()>0)){
			return false;
		}
		//找到其父类的套餐
		String hql2="select pc from PackageCategory pc where pc.ptypeId="+pc.getPtypePid();
		List list2 = this.getHibernateTemplate().find(hql2);
		//如果存在父类
		if(list2!=null&&list2.size()>0){
			PackageCategory parentPC = (PackageCategory) this.getHibernateTemplate().find(hql2).get(0);
			parentPC.setPtypeChildrenNum(parentPC.getPtypeChildrenNum()-1);
		}
		//将排序order大于当前的套餐order-1
		String hql3="select pc from PackageCategory pc where pc.ptypePid="
					+pc.getPtypePid()+" and pc.ptypeOrderId >"+pc.getPtypeOrderId();
		List<PackageCategory> list1 = this.getHibernateTemplate().find(hql3);
			if(list1!=null&&list1.size()>0){
				for(PackageCategory p:list1){
					p.setPtypeOrderId(p.getPtypeOrderId()-1);
					this.getHibernateTemplate().update(p);
				}
		}	
		this.getHibernateTemplate().delete(pc);
		//删除当前套餐
		return true;
	}

	public ClassPackage loadClassPackage(int pkgId) {
		return (ClassPackage) this.getHibernateTemplate().get(ClassPackage.class, pkgId);
	}
	public Deal findByDealId(int dealId) {
		return (Deal) this.getHibernateTemplate().get(Deal.class, dealId);
	}

	public void ModifyClassPackage(ClassPackage classPackage) {
		this.getHibernateTemplate().update(classPackage);
	}

	public void DeleteClassPackage(int pkgId) {
		String hql ="select cp from ClassPackage cp where cp.pkgId=" +pkgId;
		this.getHibernateTemplate().delete(this.getHibernateTemplate().find(hql).get(0));
	}

	public void AddDeal(Deal deal) {
		this.getHibernateTemplate().save(deal);
		
	}

	public int findDealId() {
		String hql ="select max(d.dealId) from Deal d ";
		Integer id=	(Integer) this.getHibernateTemplate().find(hql).get(0);
		if(id==null){
			return 1001;
		}else{
			return id+1;
		}
	}
	public int getClassPackageId() {
		String hql = "select max(cp.pkgId) from  ClassPackage cp";	
		Integer curr_id = (Integer)this.getHibernateTemplate().find(hql).get(0);//获取最大的id值
		if(curr_id == null){//如果没有记录,返回一个0001编号
			return 1001;
		}
		//2.根据当前id+1,获取下一个
		return curr_id+1;
	}
	public int getPackageCategoryId() {
		String hql = "select max(pc.ptypeId) from PackageCategory pc";	
		Integer curr_id = (Integer)this.getHibernateTemplate().find(hql).get(0);//获取最大的id值
		if(curr_id == null){//如果没有记录,返回一个0001编号
			return 1001;
		}
		//2.根据当前id+1,获取下一个
		return curr_id+1;
	}

	public void update(Deal deal) {
		this.getHibernateTemplate().update(deal);
	}

	public void delet(Deal deal) {
		this.getHibernateTemplate().delete(deal);
	}
	
	public List<PackageCategory> findPackageId(int ptypePid){
		String hql="select category from PackageCategory category where category.ptypePid="+ptypePid;
		return this.getHibernateTemplate().find(hql);
	}
	public List<ClassPackage> findPackage(int ptypeId){
		Date today = new Date(System.currentTimeMillis());
			String hql="select classPackage from ClassPackage classPackage where classPackage.pkgRMatureDate >'"+today+"'and classPackage.ptypeId="+ptypeId;
		return this.getHibernateTemplate().find(hql);
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

}
