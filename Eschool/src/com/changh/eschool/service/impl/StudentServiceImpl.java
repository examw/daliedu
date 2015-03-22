package com.changh.eschool.service.impl;

import java.net.URLEncoder;
import java.util.Date;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.Cookie;

import org.apache.struts2.ServletActionContext;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.changh.eschool.dao.AddressDAO;
import com.changh.eschool.dao.StudentDAO;
import com.changh.eschool.entity.Address;
import com.changh.eschool.entity.Cooperate;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;
import com.changh.eschool.until.DegistUtil;
import com.changh.eschool.until.PropertiesUtil;


public class StudentServiceImpl implements StudentService {
	//injection
	private StudentDAO studentDao;	
	private AddressDAO addressDao;
	
	public void setAddressDao(AddressDAO addressDao) {
		this.addressDao = addressDao;
	}
	public void setStudentDao(StudentDAO studentDao) {
		this.studentDao = studentDao;
	}
	public Student studentUpdate(int stuId) throws Exception {
		Student stu=studentDao.findById(stuId);
		return stu;
	}
	public void updateStudent(Student stu) throws Exception {
		studentDao.update(stu);
	}
	
	public List<Student> studentSelect(String date) throws Exception {
		List<Student> list=studentDao.select(date);
		return list;
	}

	public void addStudent(Student stu) throws Exception {
		
		//再次验证数据的合法性？？？？？？？？？？
		
		//加入添加时间
		stu.setStuAddTime(new Date());
		//加入状态信息，默认正常状态
		stu.setStuStatus(1);
		/*注册成功表示第一次登录，完善部分学员信息
		 * 1，登录次数置为1
		 * 2，登录ip
		 * 3，登录时间
		 */
		stu.setStuLoginNumber(1);
		stu.setStuLoginIp(ServletActionContext.getRequest().getRemoteAddr());
		stu.setStuLastLoginTime(new Date());
		stu.setStuImgUrl("../upload/userface/no_face.gif");//默认图像地址
		stu.setDeviceNum(1);	//初始化为1个
		//密码md5加密,（密码找回的业务逻辑？）
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
	/**
	 *登录的业务逻辑
	 */
	public Student login(String username, String password) throws Exception {
		Student stu = studentDao.findByUsername(username);
		if(stu!=null&&stu.getStuPassword().equals(DegistUtil.md5Digest(password))&&stu.getStuStatus()==1)
		{
			//表示用户和密码都正确,并且帐号状态正常
			//更新用户信息，绑session
				//登录次数加1
			stu.setStuLoginNumber(stu.getStuLoginNumber()+1);
				//登录ip
			stu.setStuLoginIp(ServletActionContext.getRequest().getRemoteAddr());
				//登录时间
			stu.setStuLastLoginTime(new Date());
			//更新用户信息
			studentDao.update(stu);
			//绑cookie
			Cookie cookie = new Cookie("eschool_user", username);
			//设置cookie生存时间
			cookie.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
			//设置路径
			cookie.setPath("/");
			ServletActionContext.getResponse().addCookie(cookie);
			return stu;
		}else
			return null;
	}
	public Student login(String username, String password,String deviceId) throws Exception {
		Student stu = studentDao.findByUsername(username);
		//用户设备号不为空, 没有初始化数量,默认为1
		if(stu.getDeviceNum()==null||stu.getDeviceNum()==0){
			stu.setDeviceNum(1);
		}
		if(deviceId == null || deviceId.trim().equals("")){	//如果没有带deviceId,不能登陆
			return null;
		}
		if(stu!=null&&stu.getStuPassword().equals(DegistUtil.md5Digest(password))&&stu.getStuStatus()==1)
		{
			//表示用户和密码都正确,并且帐号状态正常
			if(stu.getDeviceIds() == null||stu.getDeviceIds().trim().equals("")){
				//用户的设备号为空,第一次注册设备号
				stu.setDeviceIds(deviceId+",");	//设置用户的设备号
			}else{
				if(!(","+stu.getDeviceIds()).contains((","+deviceId+","))){	//如果设备ID不一致
					String[] ids = null;
					try{
						ids = stu.getDeviceIds().split(","); //拆分字符串
					}catch(Exception e){}
					if(ids!=null && ids.length < stu.getDeviceNum()){	//允许的设备个数大于已存的设备号个数,可以用
						stu.setDeviceIds(stu.getDeviceIds()+deviceId+",");
					}else{
						return null;
					}
				}
			}
			//更新用户信息，绑session
				//登录次数加1
			stu.setStuLoginNumber(stu.getStuLoginNumber()+1);
				//登录ip
			stu.setStuLoginIp(ServletActionContext.getRequest().getRemoteAddr());
				//登录时间
			stu.setStuLastLoginTime(new Date());
			//更新用户信息
			studentDao.update(stu);
			//绑cookie
			Cookie cookie = new Cookie("eschool_user", username);
			//设置cookie生存时间
			cookie.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
			//设置路径
			cookie.setPath("/");
			ServletActionContext.getResponse().addCookie(cookie);
			return stu;
		}else
			return null;
	}
	/**
	 *登录的业务逻辑
	 */
	public Student login(String username, String password,Integer auto) throws Exception {
		Student stu = studentDao.findByUsername(username);
		if(stu!=null&&stu.getStuPassword().equals(DegistUtil.md5Digest(password))&&stu.getStuStatus()==1)
		{
			//表示用户和密码都正确,并且帐号状态正常
			//更新用户信息，绑session
				//登录次数加1
			stu.setStuLoginNumber(stu.getStuLoginNumber()+1);
				//登录ip
			stu.setStuLoginIp(ServletActionContext.getRequest().getRemoteAddr());
				//登录时间
			stu.setStuLastLoginTime(new Date());
			if(auto!=null&&auto.equals(1))
			{
				String token = DegistUtil.md5Digest(stu.getStuUsername()+"|"+stu.getStuPassword());
				Cookie cookie = new Cookie("daliwx_token", token);
				//设置cookie生存时间
				cookie.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
				//设置路径
				cookie.setPath("/");
				ServletActionContext.getResponse().addCookie(cookie);
				stu.setStuToken(token);
			}
			//更新用户信息
			studentDao.update(stu);
			//绑cookie
			Cookie cookie = new Cookie("eschool_user", username);
			//设置cookie生存时间
			cookie.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
			//设置路径
			cookie.setPath("/");
			ServletActionContext.getResponse().addCookie(cookie);
			return stu;
		}else
			return null;
	}
	/**
	 * 密码找回，发个 带链接的邮件 点这个链接来重置密码
	 */
	public boolean findPwd(String username, String email1,JavaMailSender mailSender,SimpleMailMessage mailMessage) throws Exception {
		// TODO Auto-generated method stub
//		Student stu = studentDao.findByUsername(username);
//		if(stu!=null 
//				&& stu.getStuEmail().equals(email1)
//				)
		if(email1==null||email1.trim().isEmpty()) return false;
		Student stu = studentDao.findByEmail(email1);
		if(stu!=null)
		{
			//!!!!!!!!!!!!!注意这个链接地址将来要修改的！！！！！！！！！！！！
			StringBuffer buf = new StringBuffer("<html><head></head><body><h3>尊敬的");
			StringBuffer addr = new StringBuffer();
			buf.append(username);
			buf.append("</h3>您好！<p>要重设您的密码，请访问下面的链接：重设密码地址. </p>");
			buf.append("<p><a href='");
			//此处地址需要修改
			addr.append(PropertiesUtil.getOptValue("findpwd"));
			addr.append("user/resetPwd?username=");
			addr.append(stu.getStuUsername());
			addr.append("&actionCode=");
			addr.append(URLEncoder.encode(stu.getStuPassword(),"utf-8"));	//+号不能用
			//addr.append("&expire=");//有效期设置问题
			buf.append(addr.toString());
			buf.append("'>");
			buf.append(addr.toString());
			buf.append("</a></p><p>如果通过点击以上链接无法访问，请将该网址复制并粘贴至新的浏览器窗口中。<br>如果您错误地收到了此电子邮件，您无需执行任何操作来取消密码找回！您的帐户密码将不会被修改。</p></body></html> ");
			MimeMessage mimeMessage = mailSender.createMimeMessage();
			MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"GB2312");
			helper.setFrom(mailMessage.getFrom());
			helper.setSubject(mailMessage.getSubject());
			helper.setTo(email1);
			helper.setText(buf.toString(),true);
	        mailSender.send(mimeMessage);
	        return true;
		}
		return false;
	}
	/**
	 * 重置密码
	 */
	public void resetPwd(String username, String password) throws Exception {
		// TODO Auto-generated method stub
		Student stu = studentDao.findByUsername(username);
		if(stu == null) return;
		stu.setStuPassword(DegistUtil.md5Digest(password));
		studentDao.update(stu);
	}
	/**
	 * 从购物车处注册
	 */
	public boolean registerFromCart(Student stu) throws Exception {
		// TODO Auto-generated method stub
		//将用户信息加入数据库，绑session
		//被占用注册失败
		if(studentDao.isExist(stu.getStuUsername(), stu.getStuEmail()))
		{
			return false;
		}
		addStudent(stu);
		////////加入数据库后stu变持久对象，而主键所赋的值并不是真实的值而是名为Id的值，问题！！！
		///每次还要多查一次表，影响速度
		stu = findByUsername(stu.getStuUsername());
		//////////////
		//绑session
		ServletActionContext.getRequest().getSession().setAttribute("student", stu);
		//绑cookie
		Cookie cookie = new Cookie("eschool_user", stu.getStuUsername());
		//设置cookie生存时间
		cookie.setMaxAge(60*60*24*30); //单位是秒，时间为一个月
		//设置路径
		cookie.setPath("/");
		ServletActionContext.getResponse().addCookie(cookie);
		return true;
	}
	public List<Address> findAddrListByStuId(int stuId) throws Exception {
		// TODO Auto-generated method stub
		return addressDao.findByStuId(stuId);
	}
	public void addAddr(Address addr,int stuId) throws Exception {
		// TODO Auto-generated method stub
		addr.setStuId(stuId);
		addr.setAddrIsDefault(0);
		addressDao.save(addr);
	}
	public void updateAddr(Address addr) throws Exception {
		// TODO Auto-generated method stub
		addressDao.update(addr);
	}
	public Address findAddr(int aid)throws Exception
	{
		return addressDao.findById(aid);
	}
	public void updateDefaultAddr(int aid, int stuId) throws Exception {
		// TODO Auto-generated method stub
		Address addr1 = addressDao.findById(aid);
		if(addr1==null)
		{
			return;
		}
		Address addr2 = addressDao.findDefault(stuId);
		if(addr2!=null)
		{
			if(addr2.getAddrId()==aid)
			{
				return;
			}
			addr2.setAddrIsDefault(0);
			//addressDao.update(addr2);
		}
		addr1.setAddrIsDefault(1);
		//addressDao.update(addr1);
		
	}
	public Student findByStuId(int stuId) {
		return studentDao.findByStuId(stuId);
	}
	public Student findByNameAndPwd(String username, String password)
			throws Exception {
		// TODO Auto-generated method stub
		Student stu = studentDao.findByUsername(username);
		if(stu!=null&&stu.getStuPassword().equals(DegistUtil.md5Digest(password))&&stu.getStuStatus()==1)
		{
			return stu;
		}else
		{
			return null;
		}
	}
	@Override
	public Cooperate findCooperate(String url) {
		// TODO Auto-generated method stub
		return studentDao.findCooperate(url);
	}
	
	/**
	 * 按手机号查找学员
	 * 2014.04.11
	 */
	public Student findByMobilePhone(String phone){
		if(phone == null ||phone.trim().isEmpty()) return null;
		return studentDao.findByMobilePhone(phone);
	}
	/**
	 * 
	 */
	public Student findByToken(String token){
		if(token == null ||token.trim().isEmpty()) return null;
		return studentDao.findByToken(token);
	}
}
