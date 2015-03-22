package com.changh.sccms.service.impl;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import jxl.Workbook;
import jxl.format.Alignment;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;

import com.changh.sccms.dao.RechargeRecordDAO;
import com.changh.sccms.dao.StudyCardDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.RechargeRecord;
import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.StudyCardService;
import com.changh.sccms.until.ExcelStyleUtils;
import com.changh.sccms.until.GridDataUtil;
import com.changh.sccms.until.PasswordCreaterUtil;
import com.opensymphony.xwork2.ActionContext;

public class StudyCardServiceImpl implements StudyCardService{
	//injection
	private StudyCardDAO studyCardDao;
	private RechargeRecordDAO rechargeRecordDao;
	public void setStudyCardDao(StudyCardDAO studyCardDao)throws Exception {
		this.studyCardDao = studyCardDao;
	}
	
	public void setRechargeRecordDao(RechargeRecordDAO rechargeRecordDao) {
		this.rechargeRecordDao = rechargeRecordDao;
	}

	/**
	 * 根据参数设定生成学习卡
	 */
	public void createCards(int num, int value, Date month, int pwdNum,
		int isPresent,String prefix) throws Exception {
	// TODO Auto-generated method stub
		List<StudyCard> list = new ArrayList<StudyCard>();
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		for(int i=0;i<num;i++)
		{
			StudyCard card = new StudyCard();
			card.setCardOverTime(month);
			card.setCardPassword(PasswordCreaterUtil.createPassword(pwdNum));
			card.setCardAddTime(new Date());//添加时间
			card.setCardValue(value);
			card.setCardBalance(value);
			card.setCardIsPresent(isPresent);
			card.setCreateUsername(admin.getAdmUsername());
			card.setPrefix(prefix);
			list.add(card);
		}
		studyCardDao.createCards(list);
	}	
	//find all
	public List<StudyCard> findAll() throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("系统管理员"))
			return studyCardDao.findAll(null);
		return studyCardDao.findAll(admin.getAdmUsername());
	}
	//find all of the date指定日期的所有
	public List<StudyCard> findAll(Date date) throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("系统管理员"))
			return studyCardDao.findAll(date,null);
		return studyCardDao.findAll(date,admin.getAdmUsername());
	}
	//找出最新生成的前N个
	public List<StudyCard> findTopN(int num) throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("系统管理员"))
			return studyCardDao.findTopN(num,null);
		return studyCardDao.findTopN(num,admin.getAdmUsername());
	}
	//找出最新生成的前N个，带分页
	public List<StudyCard> findTopN(int num,int page,int pagesize,String sortName,String sortorder)throws Exception
	{
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("系统管理员"))
			return studyCardDao.findTopN(num, page, pagesize, sortName,sortorder,null);
		return studyCardDao.findTopN(num, page, pagesize, sortName,sortorder,admin.getAdmUsername());
	}
	//普通分页
	public Map<String,Object> findPage(int page, int pagesize, String sortName,String sortorder)
			throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("系统管理员"))
		{
			List<StudyCard> list =  studyCardDao.findPage(page, pagesize, sortName,sortorder,null);
			int total =(int)studyCardDao.findTotal(null);
			return GridDataUtil.gridMap(list, total);
		}else{
			List<StudyCard> list =  studyCardDao.findPage(page, pagesize, sortName,sortorder,admin.getAdmUsername());
			int total =(int)studyCardDao.findTotal(admin.getAdmUsername());
			return GridDataUtil.gridMap(list, total);
		}
	}
	
	//获得excel格式的输入流，用于导出成excel
	public InputStream getExcelInputStream(List<StudyCard> list) throws Exception {

		//将OutputStream转化为InputStream   
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
        //把数据放入输出流
		putDataOnOutputStream(out,list);   
		return new ByteArrayInputStream(out.toByteArray());   
	}   
	//封装了将数据放入输出流的方法
	private void putDataOnOutputStream(OutputStream os,List<StudyCard> list) {   
		jxl.write.Label label;   
		WritableWorkbook book;   
		try {   
			book = Workbook.createWorkbook(os);  

            WritableSheet sheet = book.createSheet("学习卡列表", 0);  

            // 设置各列宽度  

//            sheet.setColumnView(0, 10);  //编号

            sheet.setColumnView(0, 30);  //卡号

            sheet.setColumnView(1, 15);  //密码

//            sheet.setColumnView(3, 25);  //生成时间

            sheet.setColumnView(2, 25);  //过期时间

            sheet.setColumnView(3, 15);  //面值

            sheet.setColumnView(4, 15);  //是否赠送

            // 设置行高  

            sheet.setRowView(0, 500);  

            sheet.setRowView(1, 500);  

            // 第一行  

            sheet.mergeCells(0, 0, 10, 0);  

            label = new Label(0,0,"学习卡列表表格");  

            label.setCellFormat(ExcelStyleUtils.titleCellFormat(null, false, 16));  

            sheet.addCell(label);  

            // 第二行  

            sheet.mergeCells(0, 1, 10, 1);  

            Label line2 = new Label(0,1,new Date().toString());  

            line2.setCellFormat(ExcelStyleUtils.titleCellFormat(Alignment.RIGHT, false, 14));  

            sheet.addCell(line2);  
            // 第三行  

           // sheet.addCell(new Label(0, 2, "编号", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(0, 2, "卡号", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(1, 2, "密码", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            //sheet.addCell(new Label(3, 2, "生成时间", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(2, 2, "过期时间", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(3, 2, "面值", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(4, 2, "是否赠送", ExcelStyleUtils.titleCellFormat(null, true, 12)));              
            // 循环输出内容  
                for(int j = 0 ; j < list.size() ; j++){  
                	StudyCard card = list.get(j);
                    //sheet.addCell(new Label(0, j+3, card.getId().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(0, j+3, card.getCardNo().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(1, j+3, card.getCardPassword(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    //sheet.addCell(new Label(3, j+3, card.getCardAddTime().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(2, j+3, card.getCardOverTime().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(3, j+3, card.getCardValue().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(4, j+3, card.getPresent(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                }  
            book.write();  

            book.close();  

        }catch(Exception e){  

            e.printStackTrace();  

        }  
    }   
	//find by id
	public StudyCard findById(int cardId) throws Exception {
		return studyCardDao.findById(cardId);
	}
	
	@Override
	public Map<String, Object> findPageByParam(int page, int pagesize,
			String sortName, String sortorder, String params)throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("系统管理员"))
		{
			List<StudyCard> list =  studyCardDao.findPageByParams(page, pagesize, sortName,sortorder,null,params);
			int total =(int)studyCardDao.findTotalByParams(null,params);
			return GridDataUtil.gridMap(list, total);
		}else{
			List<StudyCard> list =  studyCardDao.findPageByParams(page, pagesize, sortName,sortorder,admin.getAdmUsername(),params);
			int total =(int)studyCardDao.findTotalByParams(admin.getAdmUsername(),params);
			return GridDataUtil.gridMap(list, total);
		}
	}
	
	//2014.06.12
	@Override
	public Map<String, Object> findRecord(int cardId) throws Exception {
		List<RechargeRecord> list = this.rechargeRecordDao.findByCardId(cardId);
		return GridDataUtil.gridMap(list, list.size());
	}
}  

