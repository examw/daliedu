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
		
		//再次验证数据的合法性？？？？？？？？？？
		
		/*注册成功表示第一次登录，完善部分学员信息
		 * 1，登录次数置为1
		 * 2，登录ip
		 * 3，登录时间
		 */
		stu.setStuLoginNumber(1);
		stu.setStuLoginIp(ServletActionContext.getRequest().getRequestURI());
		stu.setStuLastLoginTime(new Date());
		//密码md5加密,（密码找回的业务逻辑？）
		stu.setStuAddTime(new Date());
		stu.setStuPassword(DegistUtil.md5Digest(stu.getStuPassword()));
		//加入数据库
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
			//2013.05.17修改	 添加管理员的操作信息
			Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
			stu.setStuCash((((int)(stu.getStuCash()+money)*100))/100);
			studentDao.update(stu);//........
			//添加交易记录
			Trade trade = new Trade();
			//充值
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
				trade.setTradeNote("管理员"+admin.getAdmUsername()+"手动充值"+(content==null?"":content));
			}
			else 
			{
				trade.setTradeType(Constant.OTHER);//其他扣费
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
	//获得excel格式的输入流，用于导出成excel
		public InputStream getExcelInputStream(List<Student> list) throws Exception {

			//将OutputStream转化为InputStream   
	        ByteArrayOutputStream out = new ByteArrayOutputStream();  
	        //把数据放入输出流
			putDataOnOutputStream(out,list);   
			return new ByteArrayInputStream(out.toByteArray());   
		}   
		//封装了将数据放入输出流的方法
		private void putDataOnOutputStream(OutputStream os,List<Student> list) {   
			jxl.write.Label label;   
			WritableWorkbook book;   
			try {   
				book = Workbook.createWorkbook(os);  

	            WritableSheet sheet = book.createSheet("学员列表", 0);  

	            // 设置各列宽度  

//	            sheet.setColumnView(0, 10);  //编号

	            sheet.setColumnView(0, 30);  //姓名

	            sheet.setColumnView(1, 20);  //电话

//	            sheet.setColumnView(3, 25);  //生成时间

	            sheet.setColumnView(2, 25);  //email

	            sheet.setColumnView(3, 15);  //qq

	            sheet.setColumnView(4, 25);  //地区
	            
	            sheet.setColumnView(5, 15);  //考试

	            // 设置行高  

	            sheet.setRowView(0, 500);  

	            sheet.setRowView(1, 500);  

	            // 第一行  

	            sheet.mergeCells(0, 0, 10, 0);  

	            label = new Label(0,0,"学员列表表格");  

	            label.setCellFormat(ExcelStyleUtils.titleCellFormat(null, false, 16));  

	            sheet.addCell(label);  

	            // 第二行  

	            sheet.mergeCells(0, 1, 10, 1);  

	            Label line2 = new Label(0,1,new Date().toString());  

	            line2.setCellFormat(ExcelStyleUtils.titleCellFormat(Alignment.RIGHT, false, 14));  

	            sheet.addCell(line2);  
	            // 第三行  

	           // sheet.addCell(new Label(0, 2, "编号", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(0, 2, "姓名", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(1, 2, "电话", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            //sheet.addCell(new Label(3, 2, "生成时间", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(2, 2, "email", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(3, 2, "qq", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

	            sheet.addCell(new Label(4, 2, "地区", ExcelStyleUtils.titleCellFormat(null, true, 12)));   
	            sheet.addCell(new Label(5, 2, "考试", ExcelStyleUtils.titleCellFormat(null, true, 12))); 
	            // 循环输出内容  
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
			//2013.05.17修改	 添加管理员的操作信息
			Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
			stu.setStuCard((((int)(stu.getStuCard()-money)*100))/100);
			studentDao.update(stu);//........
			//添加交易记录
			Trade trade = new Trade();
			//充值
			trade.setStuId(stuId);
			trade.setTradeCardBalance(stu.getStuCard());
			trade.setTradeCashBalance(stu.getStuCash());
			trade.setTradeOrderNo("SD"+TimeFormat.format(new Date()));
			trade.setTradePattern("手动扣费(学习卡)");
			trade.setTradeMoney(money);
			trade.setTradeTime(new Date());
			trade.setTradeIp(ServletActionContext.getRequest().getRemoteAddr());
			trade.setTradeType(Constant.OTHER);
			trade.setTradeNote("管理员"+admin.getAdmUsername()+"手动扣费学习卡 "+(content==null?"":content));
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
