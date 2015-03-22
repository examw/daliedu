//验证邮箱
function checkEmail(input,span,url) {
	//input,span须为jquery对象
	var flag = false;
	if (!input.val() || !$.trim(input.val())) {
		span.html("Email不能为空");
		return false;
	} else {
		var reg = /[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+/;
		if (!reg.test(input.val())) {
			span.html("请输入正确的Email地址");
			return false;
		} else {
			$.ajax({
				async : false,
				url : url,
				type : "post",
				data : "email=" + input.val(),
				success : function(data) {
					if (!data) {
						span.html("该Email已经被注册");
						flag = false;
					} else {
						span.html("<img src='/SCCMS/cms/images/label3.gif'>");
						flag = true;
					}
				}
			});
			return flag;
		}

	}
}
//验证用户名
function checkUsername(input,span,url) {
	var flag=false;
	var name = input.val();
	var $nameInfo = span;
	// 计算昵称的字符长度
	var length = name.length;
	if (length < 4 || length > 20) {
		$nameInfo.html("用户名不合法");
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
					if (!data) {
						span.html("该用户名已经被注册");
						flag = false;
					} else {
						span.html("<img src='/SCCMS/cms/images/label3.gif'>");
						flag = true;
					}
				}
			});
			return flag;
		} else {
			$nameInfo.html("用户名不合法");
			return false;
		}
	}
}
//验证密码
function checkPassword(input,$pwdInfo) {
	var pwd = input.val();
	//密码规则
	//var reg = /[a-zA-z0-9]+/;
	if (pwd.length < 6 || pwd.length > 20
			//|| !reg.test(pwd)
			) {
		$pwdInfo.html("密码不合法");
		return false;
	} else {
		$pwdInfo.html("<img src='/SCCMS/cms/images/label3.gif'>");
		return true;
	}
}
//重复密码
function checkRepeatPwd(input1,input2,$pwd1Info) {
	var pwd = input1.val();
	var pwd1 = input2.val();
	if (pwd1 && (!pwd1.indexOf(pwd) && pwd.length == pwd1.length)) {
		$pwd1Info.html("<img src='/SCCMS/cms/images/label3.gif'>");
		return true;
	} else {

		$pwd1Info.html("两次不一致,请重新输入");
		return false;
	}

}
//验证验证码
function checkImage(input,$numInfo,url) {
	var code = input.val();
	if (!code || !$.trim(code)) {
		$numInfo.html("验证码不能为空");
		return false;
	} else {
		var flag = false;
		$.ajax({
			async : false,
			url : url,	//"SCCMS/user/getCode?"
			type : "post",
			data : "code=" + code,
			success : function(data) {
				if (!data) {
					$numInfo.html("验证码输入有误");
					flag = false;
				} else {
					$numInfo.html("<img src='/SCCMS/cms/images/label3.gif'>");
					flag = true;
				}
			}
		});
		return flag;
	}
}
function checkPhone(input,span)
{
	var phone = input.val();
	var reg1 =/^((0\d{2,3})-)(\d{7,8})(-(\d{3,}))?$/;//座机(0开头)
	var reg2 =/^1[358]\d{9}$/;//手机(13,15,18)
	if(!reg1.test(phone)&&!reg2.test(phone))
	{
		span.html("号码不合法，请重新输入");
		return false;
	}else
	{
		span.html("<img src='/SCCMS/cms/images/label3.gif'>");
		return true;
	}
}