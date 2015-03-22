<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<script  type="text/javascript">

    //表单验证
     function CheckLogForms(){
        var un = $("#username");
        var pw = $("#password");
        var auto = $("input[name='isauto']:checked");
        if(un.val().replace(/^\s+|\s+$/g,'') == ''){
            $("#loginmsg").hide().fadeIn(300).html('请输入用户名');
            un.focus();
            $("#reg_pwd").removeClass("box2_puthover").addClass("box2_putlink");
            $("#reg_nc").removeClass("box2_putlink").addClass("box2_puthover");
            return false;
        }
        if(pw.val().replace(/^\s+|\s+$/g,'') == ''){
            $("#loginmsg").hide().fadeIn(300).html('请输入密码');
            pw.focus();
            $("#reg_nc").removeClass("box2_puthover").addClass("box2_putlink");
            $("#reg_pwd").removeClass("box2_putlink").addClass("box2_puthover");
            return false;
        }
        var sendDatas;
        if(auto.length==0)
        	sendDatas = {username:encodeURIComponent(encodeURIComponent(un.val())), password:pw.val(), GMT:new Date().getTime()};
        else
        	sendDatas = {username:encodeURIComponent(encodeURIComponent(un.val())), password:pw.val(), GMT:new Date().getTime(),auto:auto.val()};
        alert(sendDatas);
        $.ajax({
                type: "GET",
                contentType: "text/html;utf-8",
                url: "/user/login",
                data: sendDatas,
                dataType: 'html',
                success: function (result){  
                    if(result=="true"){
                       location.reload();
                    }else{   
                       $("#loginmsg").hide().fadeIn(300).html('用户名或密码错误');
                    }
                }
        });  
    }
    </script>
     <div class="loglf2"><TABLE width=390  height="220" border=0 align="center" cellPadding=5 cellSpacing=0 >
  <TBODY>
  <TR height=20>
    <td height="44" align="right" valign="middle" class="ft14" >&nbsp;</td>
    <TD align="left" valign="middle"><p>已有网校账号，可直接登录</p></TD>
  </TR>
  <TR height=20>
    <td width="137" align="right" valign="middle" class="ft14" ><div align="right"><font color="red">*</font>用户名:</div></td>
    <TD width="343" height="48" align="left" valign="middle">
      
       <div  class="box2_putlink" onmouseover="this.className='box2_puthover'" onmouseout="this.className='box2_putlink'" onmouseup="this.className='box2_puthover'" onmousedown="this.className='box2_puthover'">
        <input  name="username" type="text" id="username" size="20" class="box2_input" value="${cookie.eschool_user.value }">
        </div>
      </TD>
  </TR>
  <tr height="20">
    <td align="right" valign="middle" class="ft14" ><div align="right"><font color="red">*</font>密码:</div></td>
    <td height="29" align="left" valign="middle"><div id="reg_nc" class="box2_putlink" onmouseover="this.className='box2_puthover'" onmouseout="this.className='box2_putlink'" onmouseup="this.className='box2_puthover'" onmousedown="this.className='box2_puthover'"> 
      <input  name="password" type="password" id="password" size="20" class="box2_input">
        </div></td>
  </tr>
  <!-- <tr height="20" id="renzhenmabox" style="display:none;">
    <td align="right" valign="middle" class="ft14" ><div align="right"><font color="red">*</font>认证码:</div></td>
    <td height="29" align="left" valign="middle"><div id="reg_nc" style="width:100px; float:left;" class="box2_putlink" onmouseover="this.className='box2_puthover'" onmouseout="this.className='box2_putlink'" onmouseup="this.className='box2_puthover'" onmousedown="this.className='box2_puthover'"> 
      <input  name="rzminput" type="text" id="urzm" size="20" class="box2_input"></div><div style="float:left; margin-left:15px; line-height:32px;"><img id="rzmimg" src="/search/user/GetCode.asp" /></div>
        </td>
  </tr>   -->
  <TR>
    <td align="right" class="ft14" ><input type="checkbox" value="1" name="isauto"/></td>
    <td align="left" class="ft14" >自动登录</td>
  </TR>
  <TR>
    <td align="center" class="ft14" ></td>
    <td align="center" class="ft14" ><span class="zcbn"><a href="javascript:;" onclick="CheckLogForms();">登 录</a></span><span style="color:#D00;" id="loginmsg"></span></td>
  </TR>
  </TBODY>
</TABLE></div>
