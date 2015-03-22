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

//购物车组件
//去掉Serializable接口
public class CartServiceImpl implements CartService
{
	//属性, 购物车页面的的所有信息都应包含进来
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
	 * 将商品加入购物车
	 * @param productId  商品id
	 * @param pType		  商品类别，套餐或单班级
	 * @return
	 * @throws Exception
	 */
	public boolean add(int productId,int pType) throws Exception
	{
		//判断是否购买
		for(CartItem item:items)
		{
			if(item.getItem().getProductId()==productId&&item.getItem().getItemPType()==pType)
			{
				//已经购买了就不再往车里加
				item.setBuy(true);
				return false;
			}
		}
		//未购买,加入集合
		CartItem cartItem = new CartItem();
		Items item = new Items();
		item.setProductId(productId);
		item.setItemPType(pType);
		//如果类型是单班级
		if(pType==Constant.SINGER_GRADE)
		{
			Grade grade = gradeDao.findById(productId);
			//可以单独购买
			if(grade!=null&&grade.getGradeSingle()==0)
			{
				item.setExamId(grade.getExamCategory().getExamPid());	
				item.setItemName(gradeDao.findExamName(productId)+"："+grade.getName());
				item.setItemOPrice(grade.getGradeOPrice());
				item.setItemRPrice(grade.getGradeRPrice());
				//老学员价
				item.setItemSPrice(grade.getGradeRPrice());
				//过期时间
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
			if(cp!=null){	//2013.05.24修改
				item.setExamId(classPackageDao.findExamId(cp.getPtypeId()));
				item.setItemName(classPackageDao.findExamName(productId)+"："+cp.getPkgName());
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

	//获得节省的钱
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
	//获得优惠价总钱数
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
	//获得原价总钱数
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
	//老学员价
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
	//清空购物车
	public void remove() 
	{
		items.clear();
	}
	//获取已经购买的集合
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
	//获取已经删除的集合
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
	//恢复
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
	//从cookie里读数据
	public List<CartItem> getProFromCookie(Cookie packageCookie, Cookie gradeCookie) throws Exception {
		//套餐
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
					//加入session购物车
					add(Integer.parseInt(s),0);
				}
			}catch(NumberFormatException e1)
			{
				e1.printStackTrace();
				//清空cookie中的内容
				packageCookie.setValue("");
			}catch(Exception e)
			{
				e.printStackTrace();
				throw e;
			}
		}
		}
		//班级
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
				//清空cookie中的内容
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
					// 加入session购物车
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
				// 清空cookie中的内容
			} catch (Exception e) {
				e.printStackTrace();
				throw e;
			}
		}
		return getBuyPros();
	}
}
