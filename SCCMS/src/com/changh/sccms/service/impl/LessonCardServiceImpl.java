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

import com.changh.sccms.dao.LessonCardDAO;
import com.changh.sccms.entity.Administrator;
import com.changh.sccms.entity.LessonCard;
import com.changh.sccms.entity.StudyCard;
import com.changh.sccms.service.LessonCardService;
import com.changh.sccms.until.ExcelStyleUtils;
import com.changh.sccms.until.GridDataUtil;
import com.changh.sccms.until.PasswordCreaterUtil;
import com.opensymphony.xwork2.ActionContext;

public class LessonCardServiceImpl implements LessonCardService{
	//injection
	private LessonCardDAO lessonCardDao;
	
	public void setLessonCardDao(LessonCardDAO LessonCardDao)throws Exception {
		this.lessonCardDao = LessonCardDao;
	}
	/**
	 * ���ݲ����趨����ѧϰ��
	 */
	public void createCards(int num, Date month, int pwdNum,
		String includeClassIds,String className,String prefix) throws Exception {
	// TODO Auto-generated method stub
		List<LessonCard> list = new ArrayList<LessonCard>();
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		for(int i=0;i<num;i++)
		{
			LessonCard card = new LessonCard();
			card.setCardOverTime(month);
			card.setCardPassword(PasswordCreaterUtil.createPassword(pwdNum));
			card.setCardAddTime(new Date());//���ʱ��
			card.setIncludeClassIds(includeClassIds);	//�����γ�ID
			card.setClassName(className);	//��������
			card.setCreateUsername(admin.getAdmUsername());
			card.setPrefix(prefix);
			card.setStuId(0);
			list.add(card);
		}
		lessonCardDao.createCards(list);
	}	
	//find all
	public List<LessonCard> findAll() throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("ϵͳ����Ա"))
			return lessonCardDao.findAll(null);
		return lessonCardDao.findAll(admin.getAdmUsername());
	}
	//find all of the dateָ�����ڵ�����
	public List<LessonCard> findAll(Date date) throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("ϵͳ����Ա"))
			return lessonCardDao.findAll(date,null);
		return lessonCardDao.findAll(date,admin.getAdmUsername());
	}
	//�ҳ��������ɵ�ǰN��
	public List<LessonCard> findTopN(int num) throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("ϵͳ����Ա"))
			return lessonCardDao.findTopN(num,null);
		return lessonCardDao.findTopN(num,admin.getAdmUsername());
	}
	//�ҳ��������ɵ�ǰN��������ҳ
	public List<LessonCard> findTopN(int num,int page,int pagesize,String sortName,String sortorder)throws Exception
	{
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("ϵͳ����Ա"))
			return lessonCardDao.findTopN(num, page, pagesize, sortName,sortorder,null);
		return lessonCardDao.findTopN(num, page, pagesize, sortName,sortorder,admin.getAdmUsername());
	}
	//��ͨ��ҳ
	public Map<String,Object> findPage(int page, int pagesize, String sortName,String sortorder)
			throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("ϵͳ����Ա"))
		{
			List<LessonCard> list =  lessonCardDao.findPage(page, pagesize, sortName,sortorder,null);
			int total =(int)lessonCardDao.findTotal(null);
			return GridDataUtil.gridMap(list, total);
		}else{
			List<LessonCard> list =  lessonCardDao.findPage(page, pagesize, sortName,sortorder,admin.getAdmUsername());
			int total =(int)lessonCardDao.findTotal(admin.getAdmUsername());
			return GridDataUtil.gridMap(list, total);
		}
	}
	
	//���excel��ʽ�������������ڵ�����excel
	public InputStream getExcelInputStream(List<LessonCard> list) throws Exception {

		//��OutputStreamת��ΪInputStream   
        ByteArrayOutputStream out = new ByteArrayOutputStream();  
        //�����ݷ��������
		putDataOnOutputStream(out,list);   
		return new ByteArrayInputStream(out.toByteArray());   
	}   
	//��װ�˽����ݷ���������ķ���
	private void putDataOnOutputStream(OutputStream os,List<LessonCard> list) {   
		jxl.write.Label label;   
		WritableWorkbook book;   
		try {   
			book = Workbook.createWorkbook(os);  

            WritableSheet sheet = book.createSheet("���ο��б�", 0);  

            // ���ø��п��  

//            sheet.setColumnView(0, 10);  //���

            sheet.setColumnView(0, 30);  //����

            sheet.setColumnView(1, 15);  //����

//            sheet.setColumnView(3, 25);  //����ʱ��

            sheet.setColumnView(2, 25);  //����ʱ��

            sheet.setColumnView(3, 15);  //��ֵ

            sheet.setColumnView(4, 15);  //�Ƿ�����

            // �����и�  

            sheet.setRowView(0, 500);  

            sheet.setRowView(1, 500);  

            // ��һ��  

            sheet.mergeCells(0, 0, 10, 0);  

            label = new Label(0,0,"ѧϰ���б���");  

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

            sheet.addCell(new Label(1, 2, "����", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            //sheet.addCell(new Label(3, 2, "����ʱ��", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            sheet.addCell(new Label(2, 2, "����ʱ��", ExcelStyleUtils.titleCellFormat(null, true, 12)));  
            
            sheet.addCell(new Label(3, 2, "�����γ�", ExcelStyleUtils.titleCellFormat(null, true, 12)));  

            // ѭ���������  
                for(int j = 0 ; j < list.size() ; j++){  
                	LessonCard card = list.get(j);
                    //sheet.addCell(new Label(0, j+3, card.getId().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(0, j+3, card.getCardNo().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(1, j+3, card.getCardPassword(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    //sheet.addCell(new Label(3, j+3, card.getCardAddTime().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  

                    sheet.addCell(new Label(2, j+3, card.getCardOverTime().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  
                    sheet.addCell(new Label(3, j+3, card.getClassName().toString(), ExcelStyleUtils.contentCellFormat(null, true, 10)));  
                }  
            book.write();  

            book.close();  

        }catch(Exception e){  

            e.printStackTrace();  

        }  
    }   
	//find by id
	public LessonCard findById(int cardId) throws Exception {
		return lessonCardDao.findById(cardId);
	}
	
	@Override
	public Map<String, Object> findPageByParam(int page, int pagesize,
			String sortName, String sortorder, String params)throws Exception {
		Administrator admin = (Administrator) ActionContext.getContext().getSession().get("admin");
		if(admin.getRole().getRoleName().equals("ϵͳ����Ա"))
		{
			List<LessonCard> list =  lessonCardDao.findPageByParams(page, pagesize, sortName,sortorder,null,params);
			int total =(int)lessonCardDao.findTotalByParams(null,params);
			return GridDataUtil.gridMap(list, total);
		}else{
			List<LessonCard> list =  lessonCardDao.findPageByParams(page, pagesize, sortName,sortorder,admin.getAdmUsername(),params);
			int total =(int)lessonCardDao.findTotalByParams(admin.getAdmUsername(),params);
			return GridDataUtil.gridMap(list, total);
		}
	}
}  

