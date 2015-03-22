function ChangeColor1(id,msg, st) {
        if (st == 0)
        { $("#" + id).attr("class", "line1px_2");
          $("#" + id).html(msg);
        }
        else
        { $("#" + id).attr("class", "line1px"); }
    }
function CheckQICQ(){
 	var qq=$("#reg_qq").val();
 	var reg=/^\d{5,10}$/; 
 	if(qq!=""&&!reg.test(qq)){
 		$("#reg_qq_msg").html('请输入正确格式的QQ号码');
 		$("#reg_qq_msg").attr("class","line1px_3");
 		ckqq=false;
 		return false;
 	}else if(qq==""){
 		$("#reg_qq_msg").html('请输入您的QQ号码');
 		$("#reg_qq_msg").attr("class","line1px");
 		ckqq=true;
 		return true;
 	}else{
 		$("#reg_qq_msg").html('QQ号码输入正确');
 		$("#reg_qq_msg").attr("class","line1px_4");
 		ckqq=true;
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
		span.attr("class","line1px_3");
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
					span.attr("class","line1px_4");
					flag = true;
				} else {
					span.html("<p class='error'>电话号码已注册</p>");
					span.attr("class","line1px_3");
					flag = false;
				}
			}
		});
		return flag;
	}
}
function checkMsgCode(input, span, url) {
	var flag = false;
	if (!input.val() || !$.trim(input.val())) {
		span.html("验证码不能为空");
		span.attr("class","line1px_3");
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
					span.attr("class","line1px_3");
					flag = false;
				} else {
					span.html("&nbsp;验证码正确");
					span.attr("class","line1px_4");
					flag = true;
				}
			}
		});
		return flag;
	}
}
function CheckMail(obj, id) {
        var objval = $("#" + obj).val();
        if (!checkIsEmailNumber(objval) && objval != '') {
            $("#" + id).html("&nbsp;Emial格式错误！| 例：233@233.com");
            $("#" + id).attr("class", "line1px_3");
        }
        else if (objval == '') {
            $("#" + id).html("&nbsp;邮件不能为空哦！| 例：233@233.com");
            $("#" + id).attr("class", "line1px_3");
        }else if(checkIsEmailNumber(objval)&&objval!='')
        {
        	$.ajax({
        		async:true,
        		type:"POST",
        		url:"../user/checkEmail",
        		data:{"email":objval},
        		dataType:"json",
        		success:function(data)
        		{
        			if(!data)
        			{
        				 $("#" + id).html('&nbsp;恭喜,可以使用');
        		         $("#" + id).attr("class", "line1px_4");
        			}else
        			{
        				$("#" + id).html('&nbsp;很遗憾已被使用');
       		         	$("#" + id).attr("class", "line1px_3");
        			}
        		},
        		error:function()
        		{
        			$("#" + id).html('&nbsp;系统异常,请刷新网页重试');
   		         	$("#" + id).attr("class", "line1px_3");
        		}
        	});
        }
    }

    function CheckNull(obj, msg, id, vmsg) {
        if ($("#" + obj).val() == '') {
            $("#" + id).html(msg);
            $("#" + id).attr("class", "line1px_3");
        }
        else {
            $("#" + id).html(vmsg);
            $("#" + id).attr("class", "line1px_4");
        }
    }
    function checkIsEmailNumber(strWord) {
        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (reg.test(strWord))
            return true;
        else
            return false;
    }

    function CheckSafe(str) {
    	var reg = /^[0-9a-zA-z_]+$/;
    	return reg.test(str);
        /*var bads = "'&<>?% ,;:()`~!#$^*{}[]|+-=\"";
        for (var i = 0; i < bads.length; i++) {
            if (str.indexOf(bads.substring(i, i + 1)) != -1) {
                return false;
                break;
            }
        }
        return true;*/
    }

    function fopen(obj)
    { $("#" + obj).show(); }
    function fclose(obj)
    { $("#" + obj).hide(); }
    function ChangeColor(id, st) {
        if (st == 0)
        { $("#" + id).attr("class", "line1px_2"); }
        else
        { $("#" + id).attr("class", "line1px"); }
    }

    function CheckLength(obj, msg, id, sNum, mNum, cstyle) {
        if (obj.length >= sNum && obj.length < mNum) {
            $("#" + id).html(msg);
            $("#" + id).attr("class", cstyle);
        }
    }
function CheckUserName(obj, id) {
        var objvalue,flag=false;
        objvalue = $("#" + obj).val();
        if (!CheckSafe(objvalue)||objvalue.length < 4 || objvalue.length > 16) {
            $("#" + id).html('&nbsp;用户名只能是数字字母下划线，4-16位');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
        if (objvalue != '') {
            if (objvalue.length >= 4 && objvalue.length <= 16 && /^[0-9a-zA-Z_]+$/.test(objvalue))
            {
            	$.ajax({
            		async:false,
            		type:"POST",
            		url:"../user/checkUsername",
            		data:{"username":objvalue},
            		dataType:"json",
            		success:function(data)
            		{
            			if(!data)
            			{
            				 $("#" + id).html('&nbsp;恭喜,可以使用');
            		         $("#" + id).attr("class", "line1px_4");
            				flag=true;
            			}else
            			{
            				$("#" + id).html('&nbsp;很遗憾已被使用');
           		         	$("#" + id).attr("class", "line1px_3");
            				flag=false;
            			}
            		},
            		error:function()
            		{
            			$("#" + id).html('&nbsp;系统异常,请刷新网页重试');
       		         	$("#" + id).attr("class", "line1px_3");
        				flag=false;
            		}
            	});
            	return flag;
            }
            else
            { //CheckLength(objvalue, '&nbsp;用户名格式错误请在4－16位之间！', id, 2, 16, 'line1px_3'); 
            	 $("#" + id).html('&nbsp;用户名不合法');
                 $("#" + id).attr("class", "line1px_3");
                 return false;
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，用户名不能为空！');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
    }
    function CheckTrueName(obj, id) {
        var objvalue;
        objvalue = $.trim($("#" + obj).val());
        //真实姓名这里做了修改
        if (objvalue != '') {
            if (objvalue.length >= 2 && objvalue.length <= 16 &&/^[\u4E00-\u9FA5]{2,5}$/.test(objvalue)) {
                $("#" + id).html('&nbsp;真实姓名格式正确！');
                $("#" + id).attr("class", "line1px_4");
                return true;
            }
            else {
            	$("#" + id).html('&nbsp;真实姓名不合法哦！');
                $("#" + id).attr("class", "line1px_3");
                return false;
            }
        }
        else {
        	$("#" + id).html('&nbsp;此项为必填项，真实姓名不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
    }
    function isPosInteger(number) {
        var regex = /^\d+$/;
        if (regex.test(number))
            return true;
        else
            return false;
    }
    function CheckTelNum(obj, id) {
        var objval = $("#" + obj).val();
        if (objval == '') {
            $("#" + id).html('&nbsp;此项为必填项，手机号码不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
        else {
            if (checkTel(objval))
            { setstyle(id, 'block', 'line1px_4', '&nbsp;手机号码格式正确！'); }
            else
            { setstyle(id, 'block', 'line1px_3', '&nbsp;手机号码格式不正确！'); }
        }

    }
    function checkTel(TelNum) {
        var mobile = TelNum;
        var reg0 = /^13\d{9}$/;
        var reg1 = /^15\d{9}$/;
        var reg2 = /^18\d{9}$/;
        var reg3 = /^14\d{9}$/;
        var my = false;
        if (reg0.test(mobile)) my = true;
        if (reg1.test(mobile)) my = true;
        if (reg2.test(mobile)) my = true;
        if (reg3.test(mobile)) my = true;
        if (!my) {
            return false;
        } else {
            return true;
        }
    }
    function CheckPassWord(obj, id) {
        var objval = $("#" + obj).val();
        if (objval != '') {
            if (/^[0-9A-Za-z_]+$/.test(objval) && objval.length >= 6 && objval.length < 16) {
                $("#" + id).html('&nbsp;格式正确可以使用！');
                $("#" + id).attr("class", "line1px_4");
            }
            else {
                //CheckLength(objval, '&nbsp;密码格式错误请在6-16位之间！', id, 6, 16, 'line1px_3');
            	$("#" + id).html('&nbsp;密码可以是数字字母下划线,6-16位');
                $("#" + id).attr("class", "line1px_3");
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，密码不能为空！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    function PasswordEquals(obj1, obj2, id) {
        var objval1 = $("#" + obj1).val();
        var objval2 = $("#" + obj2).val();
        if (objval1 != '') {
            if (objval2.length >= 6 && objval2.length < 16) {
                if (objval1 != objval2) {
                    $("#" + id).html('&nbsp;重复密码与原密码不一致！');
                    $("#" + id).attr("class", "line1px_3");
                }
                else {
                    $("#" + id).html('&nbsp;格式正确可以使用！');
                    $("#" + id).attr("class", "line1px_4");
                }
            }
            else {
                CheckLength(objval1, '&nbsp;密码格式错误请在6-16位之间！', id, 6, 16, 'line1px_3');
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，重复密码不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    //-----------------------------------------------------------------------------------------------
    function CheckAllForms(obj) {
        var A = new Array(6);
        var B = new Array(6);
        for (var i = 0; i < A.length; i++)
            A[i] = true;
        B[0] = "setstyle('reg_nc_msg','block','line1px_3','&nbsp;用户名只能是数字字母下划线，4-16位')";
        B[1] = "setstyle('reg_pwd_msg','block','line1px_3','&nbsp;密码可以是数字字母下划线，6-16位');";
        B[2] = "setstyle('reg_tname_msg','block','line1px_3','&nbsp;真实姓名填写错误！')";
        B[3] = "setstyle('telNum_info','block','line1px_3','&nbsp;联系电话格式错误！')";
		B[4] = "setstyle('reg_mail_msg','block','line1px_3','&nbsp;邮件地址格式错误！')";
		B[5] = "setstyle('reg_code_msg','block','line1px_3','&nbsp;验证码错误！')";
        var sUser = $("#reg_nc").val();
        var sPass = $("#reg_pwd").val();
        var name = $("#reg_tname").val();
        var tel = $("#telNum").val();
		var email = $("#reg_mail").val();
		var code = $("#reg_code").val();
        if (sUser == '' || !CheckSafe(sUser))
        { A[0] = false; }
        else {
            if (sUser.length >= 2 && sUser.length < 16)
                A[0] = true;
            else
                A[0] = false;
        }

        if (sPass == '' || !$.trim(sPass))
        { A[1] = false; }
        else {
            if (sPass.length >= 6 && sPass.length < 16 &&CheckSafe(sPass))
                A[1] = true;
            else
                A[1] = false;
        }
        if (!CheckTrueName('reg_tname','reg_tname_msg'))//!!!!!!!!!!!!!!!!!!
            A[2] = false;
        if (!checkTel(tel))
            A[3] = false;
        if(email==''||!checkIsEmailNumber(email))
        	A[4]=false;
        if(code==''||!checkMsgCode($("#reg_code"),$("#reg_code_msg"),'/user/checkSmsCode'))
        	A[5]=false;
        var flag = true;
        for (var i = 0; i < A.length; i++)
        { if (!A[i]) flag = false; }
        if (!flag) {
            for (var j = 0; j < A.length; j++)
            { if (!A[j]) eval(B[j]); }
            $('#reg_err_msg').html('请正确填写带 * 项的注册信息');
            $('#reg_err_msg').css("display", "block");
            $('#reg_err_msg').attr("class", "line1px_3");
            return false;
        }
        else {
            userRegister(obj);
            return true;
        }
    }
    function userRegister(obj) {
        var logMsg="用户名或email被占用";
        var TpLogName = $("#reg_nc").val();
       // var freewx = $("#freetype").val();
        var truename=$("#reg_tname").val();
        var telp=$("#telNum").val();
        var email=$("#reg_mail").val();
        var qq = $("#reg_qq").val();
        var options = { "username": TpLogName, "password": $("#reg_pwd").val(), "mobile": telp, "truename": escape(truename), "email": email,
        		"area":$("#areaSelect_prov").val()+"(省)"+$("#areaSelect_city").val()+"(市/区)",
        		"exam":$("#examSelect").val(),"QICQ":qq
        };
        $('#btzc').html("<img src='http://img.233.com/wx/img/bm/loading.gif' />");
        var url = "../cart/registerFromCart";
        $.ajax({
            type: "POST",
            //contentType: "text/html;gb2312",
            url: url,
            data: options,
            dataType: 'json',
            success: function(data) {
                if (data) {
                    $('#wBox').remove();
                    $('#wBox_overlay').remove();
                    if (logup==1){//$("tr[class='shopp']").length==0 || $(".ca_tab1").html() == null) {
                         art.dialog({ id: "artdialog", title: "注册成功", icon: "loading", content: "<div class=\"aui-boxt\" style=\"width:240px;font-size:16px;\"><div>注册成功,正在加载购课车数据...</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
                         window.setTimeout(function() {window.location.reload();}, 2000);
                    } else {
                         art.dialog({ id: "artdialog", title: "注册成功", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div><span id=\"timer\">(3)</span> 秒后自动生成订单</div></div>", zIndex: 18008, lock: true, time: 3, resize: false, fixed: true });
                         var wait = 3 * 1000;
                         for(var i = 1; i <= 3; i++) {
                               window.setTimeout("update('#timer'," + i + "," + wait + ",'')", i * 1000);
                         } 
                         window.setTimeout(function() { CreateOrder(truename, telp); }, 3500);
                        }
                }
                else {
                    $("#reg_err_msg").attr("class", "line1px_3").html("注册失败，" + logMsg);
                    $('#btzc').html("<span class=\"zcbn\" onclick=\"CheckAllForms(this);\">注册报名</span>");
                }
            },
            error: function() {
                $('#btzc').html("<span class=\"zcbn\" onclick=\"CheckAllForms(this);\">注册报名</span>");
            }
        });
    }
    function setstyle(obj, show, css, msg) {
        $("#" + obj).html(msg);
        $("#" + obj).attr("class", css);
    }
    //获取验证码
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