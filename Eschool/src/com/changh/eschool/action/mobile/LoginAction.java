package com.changh.eschool.action.mobile;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;

import com.changh.eschool.action.BaseAction;
import com.changh.eschool.entity.Student;
import com.changh.eschool.service.StudentService;

public class LoginAction extends BaseAction {
	private String username;
	private String password;
	private String deviceId;
	private StudentService studentService;
	private Map<String, Object> result = new HashMap<String, Object>();

	public String execute() {
		if (deviceId == null || deviceId.trim().equals("")) {
			result.put("OK", 0);
			result.put("msg", "登录失败,必须进行应用升级!");
		} else {
			try {
				Student stu = studentService
						.login(username, password, deviceId);
				if (stu == null) {
					result.put("OK", 0);
					result.put("msg", "用户名或密码错误,或者非常用设备登录");
				} else {
					result.put("OK", 1);
					result.put("msg", "登录成功");
					result.put("uid", stu.getStuId());
				}
			} catch (Exception e) {
				e.printStackTrace();
				result.put("OK", 0);
				result.put("msg", "系统错误");
			}
		}
		Cookie c = new Cookie("JSESSIONID", httpRequest.getSession().getId());
		c.setPath("/");
		httpResponse.addCookie(c);
		return "success";
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Map<String, Object> getResult() {
		return result;
	}

	public void setStudentService(StudentService studentService) {
		this.studentService = studentService;
	}

	public String getDeviceId() {
		return deviceId;
	}

	public void setDeviceId(String deviceId) {
		this.deviceId = deviceId;
	}
}
