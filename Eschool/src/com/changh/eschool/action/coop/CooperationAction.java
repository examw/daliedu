package com.changh.eschool.action.coop;

import java.util.Date;

import org.apache.struts2.ServletActionContext;
import org.json.JSONObject;
import org.omg.CosNaming.NamingContextExtPackage.StringNameHelper;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.AjaxJson;
import com.changh.eschool.entity.Grade;
import com.changh.eschool.entity.Items;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.GradeService;
import com.changh.eschool.service.OrderService;
import com.changh.eschool.service.StudentService;
import com.changh.eschool.until.Constant;
import com.changh.eschool.until.DegistUtil;
import com.changh.eschool.until.StringUtil;

public class CooperationAction extends BaseAction{
	//合作方提交的学员信息封装对象
	//private Student stu = new Student();
	//注入service
	private StudentService studentService;
	
	private OrderService orderService;
	private GradeService gradeService;

	//输出信息
	private AjaxJson j = new AjaxJson();
	public String execute()throws Exception
	{
		j.setSuccess(false);
		String data = httpRequest.getParameter("data");
		if(null==data||data==""){
			j.setSuccess(false);
			return "success"; 
		}
		JSONObject json = new JSONObject(data);
		String username = (String) json.get("username");
		String stuName = json.getString("stuName");
		String key =json.getString("key");
		Student stu2 = new Student();
		if(StringUtil.isNotEmpty(username)&&StringUtil.isNotEmpty(key)&&null!=(studentService.findCooperate(username))&&key.equals(studentService.findCooperate(username).getCoopKey())){
			String courseId=json.getString("courseId");
			Grade g = gradeService.findById(Integer.parseInt(courseId));
			if(StringUtil.isNotEmpty(courseId)&&StringUtil.isNotEmpty(g)){
				 if(StringUtil.isNotEmpty(json.getString("stuPswd"))){
					 Student stu = new Student();
					 Student stu1 =studentService.findByUsername(stuName);	 
					 /**学员信息开始**/
					 //用户名去重
					 if(StringUtil.isNotEmpty(stu1)){
						 stu.setStuUsername("wx_"+stuName);
						 j.setUsername("wx_"+stuName);
					 }else{
						 stu.setStuUsername(stuName);
						 j.setUsername(stuName);
					 }
					 
					 //邮箱去重
					 String email = json.getString("email");
					 Student stu3 =studentService.findByEmail(email);
					 if(StringUtil.isNotEmpty(stu3)){
						 stu.setStuEmail("wx_"+email);
					 }else{
						 stu.setStuEmail(email);
					 }
					stu.setStuPassword(json.getString("stuPswd"));
					j.setPassword(stu.getStuPassword());
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
					//密码md5加密,（密码找回的业务逻辑？）
					stu.setStuPhone(json.getString("phone"));
					stu.setStuName(json.getString("realname"));
					studentService.addStudent(stu);
					stu2 =studentService.findByUsername(stu.getStuUsername());
				 }else{
					stu2 =studentService.findByUsername(stuName);
				 }
				/**学员信息结束**/
				 Items item = new Items();
				 item.setProductId(g.getGradeId());
				 item.setItemPType(Constant.SINGER_GRADE);
				 //如果类型是单班级
				 //可以单独购买
				 if(g!=null&&g.getGradeSingle()==0)
					{
						item.setExamId(g.getExamCategory().getExamPid());	
						item.setItemName(gradeService.findExamName(g.getGradeId())+"："+g.getName());
						item.setItemOPrice(g.getGradeOPrice());
						item.setItemRPrice(g.getGradeRPrice());
						//老学员价
						item.setItemSPrice(g.getGradeRPrice());
						//过期时间
						item.setItemOverTime(g.getGradeDueTime());	
						//System.out.println(items);
					}
				 orderService.saveOrder(stu2, g.getGradeRPrice(),item);
				 j.setSuccess(true);
			 }else{
				 j.setMsg("课程不存在");
			 }
			
		}else{
			j.setMsg("验证失败");
		}
		
		return "success";
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public void setOrderService(OrderService orderService) {
		this.orderService = orderService;
	}

	public AjaxJson getJ() {
		return j;
	}

	public void setGradeService(GradeService gradeService) {
		this.gradeService = gradeService;
	}

	public void setJ(AjaxJson j) {
		this.j = j;
	}
}
