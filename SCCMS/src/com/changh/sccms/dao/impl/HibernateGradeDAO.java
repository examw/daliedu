package com.changh.sccms.dao.impl;

import java.sql.Date;
import java.util.List;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.changh.sccms.dao.GradeDAO;
import com.changh.sccms.entity.ClassDetail;
import com.changh.sccms.entity.ExamCategory;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Grade1;
import com.changh.sccms.entity.GradeCategory;

public class HibernateGradeDAO extends HibernateDaoSupport implements GradeDAO {

	public List<Grade> findbyExamId(int id) {
		String hql ="select g from Grade g where g.examCategory.examId= "+id;
		List<Grade> list=this.getHibernateTemplate().find(hql);
		return list;
	}

	public List<Object[]> findByExamPid(int examId,int examPid) {
		/*String hql ="select exam.examName from ExamCategory  exam where exam.examId="+examId;
		List s = this.getHibernateTemplate().find(hql);
		Object examName = s.get(0);*/
		ExamCategory exam =(ExamCategory) this.getHibernateTemplate().get(ExamCategory.class, examPid);
		String hql1 ="select tch.tchName ,tch.tchId from Teacher tch where tch.tchLessons like '%"+exam.getExamName()+"%'";
		List<Object[]> list1 =this.getHibernateTemplate().find(hql1);
		if(list1!=null&&list1.size()!=0){
			return list1;
		}else{
			ExamCategory exam1 =(ExamCategory) this.getHibernateTemplate().get(ExamCategory.class, examId);
			hql1 ="select tch.tchName ,tch.tchId from Teacher tch where tch.tchLessons like '%"+exam1.getExamName()+"%'";
			List list2 =this.getHibernateTemplate().find(hql1);
			return list2;
		}
	}
	public List<Grade1> findByTchId(int tchId) {
		String hql ="from Grade1 g where g.teacher.tchId="+tchId;
		return this.getHibernateTemplate().find(hql);
	}

	public List<GradeCategory> findAll() {
		String hql="from GradeCategory";
		List list = this.getHibernateTemplate().find(hql);
		return list;
	}
	
	public List<ExamCategory> findByPid(int examPid){
		String hql ="select exam from ExamCategory  exam where exam.examPid="+examPid;
		List list = this.getHibernateTemplate().find(hql);
		return list;
	}

	public Grade findById(int gradeId) {
		return (Grade) this.getHibernateTemplate().get(Grade.class, gradeId);
	}

	public void delete(int gradeId) {
		String hql ="select classDetail from ClassDetail classDetail where gradeId="+gradeId;
		List<ClassDetail> list =this.getHibernateTemplate().find(hql);
		for(ClassDetail cd:list){
			String hql1 ="select lect from Lecture lect where classId ="+cd.getClassId();
			List list1 =this.getHibernateTemplate().find(hql1);
			this.getHibernateTemplate().deleteAll(list1);
		}
		this.getHibernateTemplate().deleteAll(list);
		this.getHibernateTemplate().delete(findById(gradeId));
	}

	public GradeCategory findByGtypeId(int gtypeId) {
		return (GradeCategory) this.getHibernateTemplate().get(GradeCategory.class, gtypeId);
	}

	public void update(Grade grade) {
		Grade g = findById(grade.getGradeId());
		g.setGradeOPrice(grade.getGradeOPrice());
		g.setGradeRPrice(grade.getGradeRPrice());
		g.setGradeRemark(grade.getGradeRemark());
		g.setGradeSingle(grade.getGradeSingle());
		g.setGradeDueTime(grade.getGradeDueTime());
		g.setExamCategory(grade.getExamCategory());
		g.setGradeCategory(grade.getGradeCategory());
		g.setTchId(grade.getTchId());
		g.setGradeName(grade.getGradeName());
		g.setTchName(grade.getTchName());
	}
	public void save(Grade grade) {
		this.getHibernateTemplate().save(grade);
	}

	public int getGradeId() {
		String hql = "select max(g.gradeId) from  Grade g";	
		Integer curr_id = (Integer)this.getHibernateTemplate().find(hql).get(0);//获取最大的id值
		if(curr_id == null){//如果没有记录,返回一个0001编号
			return 1001;
		}
		//2.根据当前id+1,获取下一个
		return curr_id+1;
	}
	
	public int getGCId() {
		String hql = "select max(gc.gtypeId) from  GradeCategory gc ";	
		Integer curr_id = (Integer)this.getHibernateTemplate().find(hql).get(0);//获取最大的id值
		if(curr_id == null){//如果没有记录,返回一个0001编号
			return 1001;
		}
		//2.根据当前id+1,获取下一个
		return curr_id+1;
	}
	
	public boolean saveGradeCategory(GradeCategory gc) {
		String hql = "from GradeCategory gc where gc.gtypeName ='"+gc.getGtypeName()+"'";
		List list = this.getHibernateTemplate().find(hql);
		if(list.size()!=0){
			System.out.println(list.size());
			return false;
		}else{
			this.getHibernateTemplate().save(gc);
			return true;
		}
		
	}
	
	public List<Grade1> findGradeByExamPidAndGradeCategory(String gtypeName,
			int examId) {
		Date today = new Date(System.currentTimeMillis());
		String hql ="select grade from Grade1 grade where grade.gradeCategory.gtypeName="+"'"+gtypeName+"'"
			+" and grade.examCategory.examPid="+examId+" and grade.gradeDueTime >'"+today+"'";
		List<Grade1> list = this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()!=0){
			return list;
		}else{
			String hql1 ="select grade from Grade1 grade where grade.gradeCategory.gtypeName="+"'"+gtypeName+"'"
					+" and grade.examCategory.examId="+examId+" and grade.gradeDueTime >'"+today+"'";
			return this.getHibernateTemplate().find(hql1);
		}
		
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
	//2014.03.17
	public List<Grade> findbyExamPid(int pid) {
		String hql ="select g from Grade g,ExamCategory ec where g.examCategory.examId= ec.examId and ec.examPid="+pid;
		List<Grade> list=this.getHibernateTemplate().find(hql);
		return list;
	}
	//2014.06.09
	@Override
	public void update(Integer gradeId, String dataFileUrl) {
		Grade g = findById(gradeId);
		if(g == null) return;
		g.setDataDownloadUrl(dataFileUrl);
	}
}
