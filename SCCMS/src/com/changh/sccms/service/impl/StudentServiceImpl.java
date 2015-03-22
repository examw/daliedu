package com.changh.sccms.service.impl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import org.apache.struts2.ServletActionContext;

import com.changh.sccms.dao.StudentDAO;
import com.changh.sccms.dao.TradeDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.ExamRecord;
import com.changh.sccms.entity.Student;
import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.entity.StudyRecord;
import com.changh.sccms.entity.Trade;
import com.changh.sccms.service.StudentService;
import com.changh.sccms.until.Constant;
import com.changh.sccms.until.DegistUtil;
import com.changh.sccms.until.ExcelStyleUtils;
import com.changh.sccms.until.TimeFormat;
import com.opensymphony.xwork2.ActionContext;


public class StudentServiceImpl implements StudentService {
	//injection
	private StudentDAO studentDao;	
	private TradeDAO tradeDao;
	
	public void setTradeDao(TradeDAO tradeDao) {
		this.tradeDao = tradeDao;
	}
	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}
	public List<Student>  studentList(int page,int pagesize,String sortName,String sortOrder) throws Exception{
		List<Student> list=null;
	    list = studentDao.findAll(page, pagesize, sortName, sortOrder);
		return list;
	}
	public void deleteStudent(int stuId) throws Exception {
		studentDao.delete(stuId);
		
	}
	public Student updateStudent(int stuId) throws Exception {
		Student stu=studentDao.findById(stuId);
		return stu;
	}
	public void modifyStudent(Student stu) throws Exception {
		studentDao.modify(stu);
	}
	
	public List<Student> studentSelect(String date,int page,int pagesize,String sortname,String sortorder) throws Exception {
		List<Student> list=studentDao.studentSelect(date,page,pagesize,sortname,sortorder);
		return list;
	}

	public void addStudent(Student stu) throws Exception {
		
		//�ٴ���֤���ݵĺϷ��ԣ�������������������
		
		/*ע��ɹ���ʾ��һ�ε�¼�����Ʋ���ѧԱ��Ϣ
		 * 1����¼������Ϊ1
		 * 2����¼ip
		 * 3����¼ʱ��
		 */
		stu.setStuLoginNumber(1);
		stu.setStuLoginIp(ServletActionContext.getRequest().getRequestURI());
		stu.setStuLastLoginTime(new Date());
		//����md5����,�������һص�ҵ���߼�����
		stu.setStuAddTime(new Date());
		stu.setStuPassword(DegistUtil.md5Digest(stu.getStuPassword()));
		//�������ݿ�
		studentDao.insert(stu);
	}
	public Student findByUsername(String username) throws Exception {

		return studentDao.findByUsername(username);
	}
	public Student findByEmail(String email) throws Exception {

		return studentDao.findByEmail(email);
	}
	public Student findById(int id) throws Exception {
		// TODO Auto-generated method stub
		return studentDao.findById(id);
	}
	public boolean updateAccount(int stuId, double money,String tradePattern,String content) throws Exception {
		// TODO Auto-generated method stub
		Student stu = studentDao.findById(stuId);
		
		if(stu!=null)
		{
			//2013.05.17�޸�	 ��ӹ���Ա�Ĳ�����Ϣ
			Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
			stu.setStuCash((((int)(stu.getStuCash()+money)*100))/100);
			studentDao.update(stu);//........
			//��ӽ��׼�¼
			Trade trade = new Trade();
			//��ֵ
			trade.setStuId(stuId);
			trade.setTradeCardBalance(stu.getStuCard());
			trade.setTradeCashBalance(stu.getStuCash());
			trade.setTradeOrderNo("SD"+TimeFormat.format(new Date()));
			trade.setTradePattern(tradePattern);
			trade.setTradeMoney(money);
			trade.setTradeTime(new Date());
			trade.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
			if(money>0)
			{
				trade.setTradeType(Constant.RECHARGE);
				trade.setTradeNote("����Ա"+admin.getAdmUsername()+"�ֶ���ֵ"+(content==null?"":content));
			}
			else 
			{
				trade.setTradeType(Constant.OTHER);//�����۷�
				trade.setTradeNote(content);
			}
			tradeDao.save(trade);
			return true;
		}
		return false;
	}
	public int getTotal(String date) {
		return studentDao.getTotal(date);
	}
	public List<Student> search(int page, int pagesize, String sortname,
			String sortorder, String str, String searchName) throws Exception {
		return studentDao.search(page, pagesize, sortname, sortorder, str, searchName);
	}
	public int getSearchTotal(String searchName, String str) throws Exception {
		return studentDao.getSearchTotal(searchName, str);
	}
	public List<StudyRecord> findStudyRecord(int stuId, int page, int pagesize,
			String sortname, String sortorder) {
		// TODO Auto-generated method stub
		return studentDao.findStudyRecord(stuId, page, pagesize, sortname, sortorder);
	}
	public List<ExamRecord> findExamRecord(int stuId, int page, int pagesize,
			String sortname, String sortorder) {
		// TODO Auto-generated method stub
		return studentDao.findExamRecord(stuId, page, pagesize, sortname, sortorder);
	}
	public Integer getStudyRecordTotal(int stuId) {
		// TODO Auto-generated method stub
		return studentDao.getStudyRecordTotal(stuId);
	}
	public Integer getExamRecordTotal(int stuId) {
		// TODO Auto-generated method stub
		return studentDao.getExamRecordTotal(stuId);
	}
	
	//2014.03.21
	//���excel��ʽ�������������ڵ�����excel
		public InputStream getExcelInputStream(List<Student> list) throws Exception {

			//��OutputStreamת��ΪInputStream   
	        ByteArrayOutputStream out = new ByteArrayOutputStream();  
	        //�����ݷ��������
			putDataOnOutputStream(out,list);   
			return new ByteArrayInputStream(out.toByteArray());   
		}   
		//��װ�˽����ݷ���������ķ���
		private void putDataOnOutputStream(OutputStream os,List<Student> list) {   
			jxl.write.Label label;   
			WritableWorkbook book;   
			try {   
				book = Workbook.createWorkbook(os);  

	            WritableSheet sheet = book.createSheet("ѧԱ�б�", 0);  

	            // ���ø��п��  

//	            sheet.setColumnView(0, 10);  //���

	            sheet.setColumnView(0, 30);  //����

	            sheet.setColumnView(1, 20);  //�绰

//	            sheet.setColumnView(3, 25);  //����ʱ��

	            sheet.setColumnView(2, 25);  //email

	            sheet.setColumnView(3, 15);  //qq

	            sheet.setColumnView(4, 25);  //����
	            
	            sheet.setColumnView(5, 15);  //����

	            // �����и�  

	            sheet.setRowView(0, 500);  

	            sheet.setRowView(1, 500);  

	            // ��һ��  

	            sheet.mergeCells(0, 0, 10, 0);  

	            label = new Label(0,0,"ѧԱ�б���");  

	            label.setCellFormat(ExcelStyleUtils.titleCellFormat(null, false, 16));  

	            sheet.addCell(label);  

	            // �ڶ���  

	            sheet.mergeCells(0, 1, 10, 1);  

	            Label line2 = new Label(0,1,new Date().toString());  

	            line2.setCellFormat(ExcelStyleUtils.titleCellFormat(Alignment.RIGHT, false, 14));  

	            sheet.addCell(line2);  
	            // ������  

	           // sheet.addCell(new Label(0, 2, "���", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(0, 2, "����", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(1, 2, "�绰", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            //sheet.addCell(new Label(3, 2, "����ʱ��", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(2, 2, "email", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(3, 2, "qq", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(4, 2, "����", ExcelStyleUtils.titleCellFormat(null, true, 12)));   
	            sheet.addCell(new Label(5, 2, "����", ExcelStyleUtils.titleCellFormat(null, true, 12))); 
	            // ѭ���������  
	                for(int j = 0 ; j < list.size() ; j++){  
	                	Student stu = list.get(j);
	                    //sheet.addCell(new Label(0, j+3, card.getId().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

	                    sheet.addCell(new Label(0, j+3, stu.getStuName(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

	                    sheet.addCell(new Label(1, j+3, stu.getStuMobile()==null?stu.getStuPhone():stu.getStuMobile(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

	                    //sheet.addCell(new Label(3, j+3, card.getCardAddTime().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

	                    sheet.addCell(new Label(2, j+3, stu.getStuEmail(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

	                    sheet.addCell(new Label(3, j+3, stu.getQICQ(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

	                    sheet.addCell(new Label(4, j+3, stu.getStuArea(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  
	                    
	                    sheet.addCell(new Label(5, j+3, stu.getStuExam(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  
	                }  
	            book.write();  

	            book.close();  

	        }catch(Exception e){  

	            e.printStackTrace();  

	        }  
	    }   
	@Override
	public List<Student> exportList(String area, String date) throws Exception {
		// TODO Auto-generated method stub
		return studentDao.exportList(area, date);
	}
	
	@Override
	public void updatePwdReset(int stuId) throws Exception {
		// TODO Auto-generated method stub
		Student stu = this.studentDao.findById(stuId);
		stu.setStuPassword(DegistUtil.md5Digest("123456"));
		//this.studentDao.update(stu);
	}
	
	@Override
	public boolean updateAccount(int stuId, double money, String content)
			throws Exception {
		Student stu = studentDao.findById(stuId);
		if(stu!=null)
		{
			//2013.05.17�޸�	 ��ӹ���Ա�Ĳ�����Ϣ
			Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
			stu.setStuCard((((int)(stu.getStuCard()-money)*100))/100);
			studentDao.update(stu);//........
			//��ӽ��׼�¼
			Trade trade = new Trade();
			//��ֵ
			trade.setStuId(stuId);
			trade.setTradeCardBalance(stu.getStuCard());
			trade.setTradeCashBalance(stu.getStuCash());
			trade.setTradeOrderNo("SD"+TimeFormat.format(new Date()));
			trade.setTradePattern("�ֶ��۷�(ѧϰ��)");
			trade.setTradeMoney(money);
			trade.setTradeTime(new Date());
			trade.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
			trade.setTradeType(Constant.OTHER);
			trade.setTradeNote("����Ա"+admin.getAdmUsername()+"�ֶ��۷�ѧϰ�� "+(content==null?"":content));
			tradeDao.save(trade);
			return true;
		}
		return false;
	}
	
	@Override
	public void updateDeviceIdReset(int stuId) throws Exception {
		// TODO Auto-generated method stub
		Student stu = this.studentDao.findById(stuId);
		stu.setDeviceIds(null);
		//this.studentDao.update(stu);
	}
	
	@Override
	public List<StudyRecord> findLimitStudyRecord(int stuId) throws Exception {
		return this.studentDao.findLimitRecord(stuId);
	}
	
	@Override
	public boolean updateListenNum(int recordId, int num) throws Exception {
		StudyRecord record = this.studentDao.findStudyRecord(recordId);
		if(record == null)
			return false;
		record.setHaveNum((record.getHaveNum()==null?3:record.getHaveNum())+num);
		return true;
	}
}
