package com.changh.sccms.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.Cookie;

import com.changh.sccms.dao.ClassPackageDAO;
import com.changh.sccms.dao.GradeDAO;
import com.changh.sccms.entity.CartItem;
import com.changh.sccms.entity.ClassPackage;
import com.changh.sccms.entity.Grade;
import com.changh.sccms.entity.Items;
import com.changh.sccms.service.CartService;
import com.changh.sccms.until.Constant;
import com.changh.sccms.until.Escape;

//���ﳵ���
//ȥ��Serializable�ӿ�
public class CartServiceImpl implements CartService
{
	//����, ���ﳵҳ��ĵ�������Ϣ��Ӧ��������
	private List<CartItem> items = new ArrayList<CartItem>();
	public List<CartItem> getItems() {
		return items;
	}

	public void setItems(List<CartItem> items) {
		this.items = items;
	}
	//	private double saveMoney ;
//	private double totalMoney;
	private GradeDAO gradeDao;
	private ClassPackageDAO classPackageDao;
	
	public void setGradeDao(GradeDAO gradeDao) {
		this.gradeDao = gradeDao;
	}

	public void setClassPackageDao(ClassPackageDAO classPackageDao) {
		this.classPackageDao = classPackageDao;
	}

	/**
	 * ����Ʒ���빺�ﳵ
	 * @param productId  ��Ʒid
	 * @param pType		  ��Ʒ����ײͻ򵥰༶
	 * @return
	 * @throws Exception
	 */
	public boolean add(int productId,int pType) throws Exception
	{
		//�ж��Ƿ���
		for(CartItem item:items)
		{
			if(item.getItem().getProductId()==productId&&item.getItem().getItemPType()==pType)
			{
				//�Ѿ������˾Ͳ����������
				item.setBuy(true);
				return false;
			}
		}
		//δ����,���뼯��
		CartItem cartItem = new CartItem();
		Items item = new Items();
		item.setProductId(productId);
		item.setItemPType(pType);
		//��������ǵ��༶
		if(pType==Constant.SINGER_GRADE)
		{
			Grade grade = gradeDao.findById(productId);
			//���Ե�������
			if(grade!=null&&grade.getGradeSingle()==0)
			{
				item.setExamId(grade.getExamCategory().getExamPid());	
				item.setItemName(gradeDao.findExamName(productId)+"��"+grade.getName());
				item.setItemOPrice(grade.getGradeOPrice());
				item.setItemRPrice(grade.getGradeRPrice());
				//��ѧԱ��
				item.setItemSPrice(grade.getGradeRPrice());
				//����ʱ��
				item.setItemOverTime(grade.getGradeDueTime());
				item.setItemNote(productId+"-");
				cartItem.setItem(item);
				cartItem.setBuy(true);
				items.add(cartItem);
				//System.out.println(items);
			}
		}else if(pType==Constant.CLASS_PACKAGE)
		{
			ClassPackage cp = classPackageDao.loadClassPackage(productId);
			if(cp!=null){	//2013.05.24�޸�
				item.setExamId(classPackageDao.findExamId(cp.getPtypeId()));
				item.setItemName(classPackageDao.findExamName(productId)+"��"+cp.getPkgName());
				item.setItemOPrice(cp.getPkgOPrice());
				item.setItemRPrice(cp.getPkgRPrice());
				item.setItemSPrice(cp.getPkgSPrice());
				item.setItemPresent(cp.getPkgPresent());
				item.setItemOverTime(cp.getPkgLMatureDate());
				item.setItemNote(setItemNote(cp.getPkgIncludeCid()));
				cartItem.setItem(item);
				cartItem.setBuy(true);
				items.add(cartItem);
			}
		}
		//System.out.println(items.size());
		return true;
	}
	private String setItemNote(String contains)
	{
		String note  = "";
		String arr[] = contains.split(",");
		for(String s : arr)
		{
			note += s+"-"+"###";
		}
		return note.substring(0,note.lastIndexOf("###"));
	}
	public CartItem delete(int productId,int pType)
	{
		for(CartItem item:items)
		{
			if(item.getItem().getProductId()==productId&&item.getItem().getItemPType()==pType)
			{
				item.setBuy(false);
				return item;
			}
		}
		return null;
	}

	//��ý�ʡ��Ǯ
	public double getSavedMoney()
	{
		double money=0;
		for(CartItem item:items)
		{
			if(item.isBuy())
			{
				money = money + (item.getItem().getItemOPrice()-item.getItem().getItemRPrice());
			}
		}
		return money;
	}
	//����Żݼ���Ǯ��
	public double getTotalRMoney()
	{
		double money = 0;
		for(CartItem item:items)
		{
			if(item.isBuy())
			{
				money = money+item.getItem().getItemRPrice();
			}
		}
		return money;
	}
	//���ԭ����Ǯ��
	public double getTotalOMoney()
	{
		double money = 0;
		for(CartItem item:items)
		{
			if(item.isBuy())
			{
				money = money+item.getItem().getItemOPrice();
			}
		}
		return money;
	}
	//��ѧԱ��
	public double getStuMoney() {
		double money = 0;
		for(CartItem item:items)
		{
			if(item.isBuy())
			{
				money = money+item.getItem().getItemSPrice();
			}
		}
		return money;
	}
	//��չ��ﳵ
	public void remove() 
	{
		items.clear();
	}
	//��ȡ�Ѿ�����ļ���
	public List<CartItem> getBuyPros() {
		// TODO Auto-generated method stub
		List<CartItem> list = new ArrayList<CartItem>();
		for(CartItem item:items)
		{
			if(item.isBuy())
			{
				list.add(item);
			}
		}
		return list;
	}
	//��ȡ�Ѿ�ɾ���ļ���
	public List<CartItem> getDeletePros() {
		// TODO Auto-generated method stub
		List<CartItem> list = new ArrayList<CartItem>();
		for(CartItem item:items)
		{
			if(!item.isBuy())
			{
				list.add(item);
			}
		}
		return list;
	}
	//�ָ�
	public void recovery(int productId,int pType)  {
		// TODO Auto-generated method stub
		for(CartItem item:items)
		{
			if(item.getItem().getProductId()==productId&&item.getItem().getItemPType()==pType)
			{
				item.setBuy(true);
				return;
			}
		}
	}
	//��cookie�������
	public List<CartItem> getProFromCookie(Cookie packageCookie, Cookie gradeCookie) throws Exception {
		//�ײ�
		if(packageCookie!=null)
		{
			String pkgIds = Escape.unescape(packageCookie.getValue());
			//System.out.println("packagecookie"+pkgIds);
		if(pkgIds!=null&&!pkgIds.equals(""))
		{
			try{
				String[] pids = pkgIds.split(",");
				for(String s : pids)
				{
					//����session���ﳵ
					add(Integer.parseInt(s),0);
				}
			}catch(NumberFormatException e1)
			{
				e1.printStackTrace();
				//���cookie�е�����
				packageCookie.setValue("");
			}catch(Exception e)
			{
				e.printStackTrace();
				throw e;
			}
		}
		}
		//�༶
		if(gradeCookie!=null)
		{
			String gradeIds = Escape.unescape(gradeCookie.getValue());
			//System.out.println("gradeCookie"+gradeIds);
			if(gradeIds!=null&&!gradeIds.equals(""))
			{
			String[] gids = gradeIds.split(",");
			try{
				for(String s : gids)
				{
					add(Integer.parseInt(s),1);
				}
			}catch(NumberFormatException e1)
			{
				e1.printStackTrace();
				//���cookie�е�����
				gradeCookie.setValue("");
			}catch(Exception e)
			{
				e.printStackTrace();
				throw e;
			}
		}
		}
		return getBuyPros();
	}
	public String getProIds(int pType) {
		// TODO Auto-generated method stub
		StringBuffer buf = new StringBuffer();
		for(CartItem item:items)
		{
			if(item.isBuy()&&item.getItem().getItemPType()==pType)
			{
				buf.append(item.getItem().getProductId());
				buf.append(",");
			}
		}
		if(buf.length()>0){ buf.deleteCharAt(buf.length()-1);}
		return buf.toString();
	}
	public List<CartItem> getProFromIds(String pkgIds, String gradeIds)
			throws Exception {
		if (pkgIds != null && !pkgIds.equals("")) {
			try {
				String[] pids = pkgIds.split(",");
				for (String s : pids) {
					// ����session���ﳵ
					add(Integer.parseInt(s), 0);
				}
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		if (gradeIds != null && !gradeIds.equals("")) {
			String[] gids = gradeIds.split(",");
			try {
				for (String s : gids) {
					add(Integer.parseInt(s), 1);
				}
			} catch (NumberFormatException e1) {
				e1.printStackTrace();
				// ���cookie�е�����
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		return getBuyPros();
	}
}
