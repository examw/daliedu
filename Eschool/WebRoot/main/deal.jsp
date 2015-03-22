<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title></title>
<META name="ROBOTS" content="All">
<link href="/css/common.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<script src="/js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="/artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script> 
<script language="javascript">
$(function(){
	//发送ajax请求,加载new.jsp信息
	$("#top").load("../common/head1.jsp?math="+Math.random());
	$("#foot").load("/system/webInfo");
			
	});
</script>
</head>
<body>

<style> 
.main{width:950px;overflow:hidden;margin-bottom:10px;*margin-bottom:5px; background-color:#FFF} 
.main ul li.one_a{width:960px;float:left;margin-right:10px;} 
.main ul li.one_a h1{display:block;height:36px;*height:33px;line-height:36px;color:#000000;*padding-top:3px;text-align:center;font-size:20px;font-family:&quot;黑体&quot;, &quot;宋体&quot;; } 
.main ul li.one_b{width:260px;float:left;color:#414141;} 
/*内容样式*/ 
.content{border:1px solid #d6d6d6;_margin-top:-3px;padding-top:15px;padding-bottom:55px;} 
.content p{padding-left:26px;padding-right:16px;line-height:25px;} 
.content p a{color:#c70f00;text-decoration:underline;} 
.content p.p_one{padding-left:145px;} 
.content p.p_two{padding-top:10px;padding-bottom:10px;color:#000;} 
.content table{color:#414141; text-align:center;} 
.content table tr td{font-size:14px;} 
.size_one{font-size:14px;color:#c70f00;} 
.size_two{color:#c70f00;} 
.size_15{font-size:15px;color:#000;} 
.font_s12{font-size:12px; line-height:20px;} 
</style>
<script language="javascript">
function switchTag(tag,content,k,n,stylea,styleb){	 
	for(i=1;i<=n;i++){
		if (i==k){
			document.getElementById(tag+i).className=stylea;
			document.getElementById(content+i).style.display="block";
		}else{
			document.getElementById(tag+i).className=styleb;
			document.getElementById(content+i).style.display="none";
		}
	}
}
// JavaScript Document
function check(){      
    if(document.getElementById("name").value==""){      
        alert("对不起，姓名不能为空！");      
        return false;      
    }      
    if(document.getElementById("number").value==""){      
        alert("身份证号不能为空！");      
        return false;      
    }      
    if(document.getElementById("address").value==""){      
        alert("地址不能为空！");      
        return false;      
    }      
    if(document.getElementById("tel").value==""){      
        alert("电话不能为空！");      
        return false;      
    }      
    if(document.getElementById("email").value==""){      
        alert("email不能为空！");      
        return false;      
    }    
	
	obj=document.getElementsByName("stuDeal.pkgName")
	var ischecked=false
	for(j=0;j<obj.length;j++)
	{
		if(obj[j].checked)
		{
			ischecked=true;
			break;
		}
	}

	if(!ischecked){      
		alert("请选择报考专业之后再进行提交！");      
		return false;      
	}      
}      
</script>
<div class="top" id="top">
</div>
<div class="main center">
	<!--当前位置-->
	    <ul>
    	 <!--内容左边-->
    	<li class="one_a">
        	<h1>${stuDeal.deal.dealName}</h1>
<div class="content" style="border-top:0px;">${stuDeal.deal.dealContent}</div>
<FORM id=form1 name=form1 onSubmit="return check();" action="/main/updateStuDeal"  method=post target=_blank>
<INPUT type=hidden value="${stuDeal.stuDealId}" name="stuDeal.stuDealId"> 
<INPUT type=hidden value="${stuDeal.deal.dealId}" name="stuDeal.deal.dealId"> 
<TABLE cellSpacing=1 cellPadding=0 width=900 align=center bgColor=#cecece border=0 >
<TBODY>
<TR>
<TD bgColor=#ffffff colSpan=4 height=25>
	<P align=center>
		<SPAN class="listmon listmon">
		<LABEL><INPUT type=checkbox CHECKED value=checkbox name=checkbox> </LABEL>
  		<span class="font_s12">我同意以上条款并报名中华考试网年网校${stuDeal.pkgName}辅导</span>
  		</SPAN>
   </P>
  </TD>
</TR>
<TR>
<TD bgColor=#ffffff colSpan=4 height=5 align=left ><span class="font_s12"><STRONG>重要提醒：</STRONG></span><BR>  
<span class="font_s12"><FONT color=#ff0000>　　a.用户报名春季攻势套餐辅导必须签署协议，否则不能享受后续服务；<BR>
  　　b.用户在春季攻势套餐协议中所填信息必须真实，且与用户的注册信息一致；<BR>
  　　c.网校2013年一级建造师春季攻势套餐2013年4月1日前签署并符合上述内容生效；<BR>
  　　d.办理重学手续，甲方须于成绩公布之日起30个工作日内（以乙方收到时间为准），提交本协议、身份证及成绩单的传真件。 </FONT></span></TD>
</TR>
<TR>
<TD align=middle bgColor=#ffffff colSpan=4 height=5></TD>
</TR>
<TR >
<TD align=right width=101 bgColor=#ffffff height=25 style="font-size:12px"><SPAN class=listmon ><STRONG>姓 名：</STRONG></SPAN></TD>
<TD width=132 align="left" bgColor=#ffffff><INPUT id=name maxLength=10 size=15 name="stuDeal.stuName"></TD>
<TD align=right width=86 bgColor=#ffffff style="font-size:12px"><SPAN class=listmon><STRONG>身份证号：</STRONG></SPAN></TD>
<TD width=226 align="left" bgColor=#ffffff><INPUT id=number maxLength=20 name="stuDeal.stuCards"></TD>
</TR>
<TR>
<TD align=right bgColor=#ffffff height=20 rowSpan=2 style="font-size:12px"><SPAN class=listmon><STRONG>报考专业：</STRONG></SPAN></TD>
<TD align=left bgColor=#ffffff colSpan=3>
<INPUT type=radio value="${stuDeal.pkgName}" name="stuDeal.pkgName" checked="checked">${stuDeal.pkgName}
</TD>
</TR>
<TR>
<TD align=left bgColor=#ffffff colSpan=4 height=16></TD>
</TR>
<TR>
<TD align=right bgColor=#ffffff height=25 style="font-size:12px"><SPAN class=listmon><STRONG>交费方式：</STRONG></SPAN></TD>
<TD colSpan=3 align="left" bgColor=#ffffff style="font-size:12px"><SPAN class=listmon>
  <INPUT type=radio value=邮局汇款 name="stuDeal.paytype"> 邮局汇款 
  <INPUT type=radio value=网上支付、银行、电话银行 name=stuDeal.paytype>网上支付、银行、电话银行 <INPUT type=radio value=学习卡 name=stuDeal.paytype>学习卡 <INPUT type=radio value=公司实地交费 name=stuDeal.paytype>公司实地交费</SPAN> 
</TD>
</TR>
<TR>
<TD align=right bgColor=#ffffff height=25 style="font-size:12px"><SPAN class=listmon><STRONG>联系地址：</STRONG></SPAN></TD>
<TD bgColor=#ffffff colSpan=3 align=left><INPUT id=address size=50 name="stuDeal.stuAddress"></TD></TR>
<TR>
<TD align=right bgColor=#ffffff height=25 style="font-size:12px"><SPAN class=listmon><STRONG>联系电话：</STRONG></SPAN></TD>
<TD bgColor=#ffffff colSpan=3 align=left><INPUT id=tel name="stuDeal.stuPhone"></TD></TR>
<TR>
<TD align=right bgColor=#ffffff height=25 style="font-size:12px"><SPAN class=listmon><STRONG>电子邮件：</STRONG></SPAN></TD>
<TD bgColor=#ffffff colSpan=3 align=left><INPUT id=email name="stuDeal.stuEmail"></TD></TR>
<TR>
<TD bgColor=#ffffff height=30></TD>
<TD bgColor=#ffffff colSpan=3><LABEL><INPUT type=submit value=提交 name=Submit> <INPUT type=reset value=重置 name=Submit2> </LABEL></TD></TR></TBODY></TABLE></FORM>
</P>
          </div>
        </li>
       
    </ul>
    
</div>



<div class="clear"></div>
<div class="gouke" id="foot">
  
</div>
<div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div class="logingc" id="wxregistbox" style="height:380px;display:none;"></div>

</body>
</html>
