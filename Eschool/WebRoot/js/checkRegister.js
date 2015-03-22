//检查email
function checkEmail(input, span, url) {
	// input,span为jquery对象�
	var flag = false;
	if (!input.val() || !$.trim(input.val())) {
		span.html("<p class='error'>Email不能为空</p>");
		return false;
	} else {
		var reg = /[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+/;
		if (!reg.test(input.val())) {
			span.html("<p class='error'>Email不合法</p>");
			return false;
		} else {
			$.ajax({
				async : false,
				url : url,
				type : "post",
				data : "email=" + input.val(),
				success : function(data) {
					if (data) {
						span.html("<p class='error'>该Email已经被注册</p>");
						flag = false;
					} else {
						span.html("<p class='succ'>&nbsp;</p>");
						flag = true;
					}
				}
			});
			return flag;
		}

	}
}
// 检查QQ
function checkQICQ(input, $qqInfo) {
	var qq = input.val();
	var reg = /^\d{5,10}$/;
	if (qq != "" && !reg.test(qq)) {
		$qqInfo.html("<p class='error'>请输入正确格式的QQ号码</p>");
		return false;
	} else if (qq == "") {
		$qqInfo.html("");
		return true;
	} else {
		$qqInfo.html("<p class='succ'>QQ号输入正确</p>");
		return true;
	}
}
// 检查用户名
function checkUsername(input, span, url) {
	var flag = false;
	var name = input.val();
	var $nameInfo = span;
	var length = name.length;
	if (length < 4 || length > 20) {
		$nameInfo.html("<p class='error'>用户名不合法</p>");
		return false;
	} else {
		var reg = /^[0-9a-zA-Z_]+$/;
		if (reg.test(name)) {
			$.ajax({
				async : false,
				url : url,
				type : "post",
				data : "username=" + input.val(),
				success : function(data) {
					if (data) {
						span.html("<p class='error'>该用户名已被注册</p>");
						flag = false;
					} else {
						span.html("<p class='succ'>&nbsp;</p>");
						flag = true;
					}
				}
			});
			return flag;
		} else {
			$nameInfo.html("<p class='error'>用户名不合法</p>");
			return false;
		}
	}
}
// 检查密码
function checkPassword(input, $pwdInfo) {
	var pwd = input.val();
	//
	var reg = /^[0-9a-zA-Z_]+$/;
	if (pwd.length < 6 || pwd.length > 20 || !reg.test(pwd)) {
		$pwdInfo.html("<p class='error'>密码不合法</p>");
		return false;
	} else {
		$pwdInfo.html("<p class='succ'>&nbsp;</p>");
		return true;
	}
}
// 检查重复密码
function checkRepeatPwd(input1, input2, $pwd1Info) {
	if (!checkPassword(input1, $pwd1Info)) {
		$pwd1Info.html("<p class='error'>您输入的密码不合法</p>");
		return false;
	}
	var pwd = input1.val();
	var pwd1 = input2.val();
	if (pwd1 && (!pwd1.indexOf(pwd) && pwd.length == pwd1.length)) {
		$pwd1Info.html("<p class='succ'>&nbsp;</p>");
		return true;
	} else {

		$pwd1Info.html("<p class='error'>两次密码不一致，请重新输入</p>");
		return false;
	}

}
// 检查验证码
function checkImage(input, $numInfo, url) {
	var code = input.val();
	if (!code || !$.trim(code)) {
		$numInfo.html("<p class='error'>验证码不能为空</p>");
		return false;
	} else {
		var flag = false;
		$.ajax({
			async : false,
			url : url, // "SCCMS/user/getCode?"
			type : "post",
			data : "code=" + code,
			success : function(data) {
				if (!data) {
					$numInfo.html("<p class='error'>验证码输入有误</p>");
					flag = false;
				} else {
					$numInfo.html("<p class='succ'>&nbsp;</p>");
					flag = true;
				}
			}
		});
		return flag;
	}
}
function checkName(input, span) {
	var name = input.val();
	if (!name || !$.trim(name)) {
		span.html("<p class='error'>请输入真实姓名</p>");
		return false;
	}// 可以不填
	var reg = /^[\u4E00-\u9FA5]{2,5}$/;
	if (!reg.test(name) || /^[A-Za-z]+[\u4E00-\u9FA5]+$/.test(name)) {
		span.html("<p class='error'>请输入真实姓名</p>");
		return false;
	} else {
		span.html("<p class='succ'>&nbsp;</p>");
		return true;
	}

}
function checkPhone(input, span) {
	var phone = input.val();
	if (!phone || !$.trim(phone)) {
		span.html("<p class='error'>请输入电话号码</p>");
		return false;
	}// 可以不填
	var reg1 = /^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;// ���(0��ͷ)
	var reg2 = /^1[34568]\d{9}$/;// �ֻ�(13,15,18)
	if (!reg2.test(phone)) {
		span.html("<p class='error'>电话号码不合法</p>");
		return false;
	} else {
		var flag = false;
		$.ajax({
			async : false,
			url : "/user/checkMobile", // "SCCMS/user/getCode?"
			type : "post",
			data : "phone=" + phone,
			success : function(data) {
				if (!data) {
					span.html("<p class='succ'>&nbsp;</p>");
					flag = true;
				} else {
					span.html("<p class='error'>电话号码已注册</p>");
					flag = false;
				}
			}
		});
		return flag;
	}
}
function checkDeal(input, span) {
	if (!input.attr('checked')) {
		span.html("请阅读并同意协议");
		return false;
	}
	return true;
}
function checkMsgCode(input, span, url) {
	var flag = false;
	if (!input.val() || !$.trim(input.val())) {
		span.html("<p class='error'>验证码不能为空</p>");
		return false;
	} else {
		$.ajax({
			async : false,
			url : url,
			type : "post",
			data : "msgCode=" + input.val(),
			success : function(data) {
				if (!data) {
					span.html("<p class='error'>验证码不正确请重新获取</p>");
					flag = false;
				} else {
					span.html("<p class='succ'>&nbsp;</p>");
					flag = true;
				}
			}
		});
		return flag;
	}
}
var t,mis=60;
function requestSmsCode(input,span,url)
{
	if(checkPhone(input,span))
	{
		$.ajax({
			async : true,
			url : url,
			type : "post",
			data : "userPhone=" + input.val(),
			success : function(data) {
				if (data) {
					t = self.setInterval(function(){
						$("#getSmsCode").val("获取验证码"+mis);
						mis--;
						if(mis == 0)
						{
							t=window.clearInterval(t);
							mis == 60;
							$("#getSmsCode").val("获取验证码");
							$("#getSmsCode").removeAttr("disabled");
							$("#getSmsCode").css("color","white");
						}
					},1000);
				}
			}
		});
		$("#getSmsCode").attr("disabled","disabled");
		$("#getSmsCode").css("color","grey");
	}
}
function checkAll()
{
	return checkUsername($("#username"),$("#usernameInfo"),"/user/checkUsername")&checkPassword($("#pwd"),$("#pwdInfo"))&checkRepeatPwd($("#pwd"),$("#pwd2"),$("#pwd2Info"))&checkName($("#name"),$("#nameInfo"))&checkPhone($("#mobile"),$("#mobileInfo"))&checkDeal($("#deal"),$("#dealInfo"))&checkEmail($("#email"),$("#emailInfo"),'/user/checkEmail')&checkQICQ($("#qq"),$("#qqInfo"))&checkMsgCode($("#msgCode"),$("#msgCodeInfo"),'/user/checkSmsCode');
}