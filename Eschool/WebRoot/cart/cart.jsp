<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>我的购物车</title>
<META name="ROBOTS" content="All" />
<link rel="stylesheet" type="text/css" href="../css/shop.css">
<script type="text/javascript" src="../js/jquery-1.4.3.js"></script>
<script type="text/javascript" src="../artDialog/jquery.artDialog.js?skin=default"></script>
<script type="text/javascript" src="../js/shop.js"></script>
<script type="text/javascript" src="../js/checkRegisterFromCart.js"></script>
<script type="text/javascript">
	var flag_1=0,logup=0;
	$(function(){
		$.ajax({
			url:"/common/area_exam.json",
			dataType:"json",
			success:function(data){
				areas = data.area;
				var exams = (data.exam).split(',');
				var max = areas.length>exams.length?areas.length:exams.length;
				for(var i=0;i<max;i++)
				{
					if(i<areas.length)
					{
						var a_option = $("<option value='"+areas[i].prov+"'>"+areas[i].prov+"</option>");
						$("#areaSelect_prov").append(a_option);
					}
					if(i<exams.length)
					{
						var e_option = $("<option value='"+exams[i]+"'>"+exams[i]+"</option>");
						$("#examSelect").append(e_option);
					}
				}
				$("#areaSelect_prov").val(areas[0].prov);
				var citys = (areas[0].city).split("|");
				$("#areaSelect_city").html("");
				for(var j=0;j<citys.length;j++)
				{
					var a_option = $("<option value='"+citys[j]+"'>"+citys[j]+"</option>");
					$("#areaSelect_city").append(a_option);
				}
				$("#areaSelect_city").val(citys[0]);
				$("#examSelect").val(exams[0]);
			}
		});
		$("#areaSelect_prov").change(function(){
			$("#areaSelect_city").html("");
			for(var i=0;i<areas.length;i++)
			{
				if($(this).val()==areas[i].prov)
				{
					var citys = (areas[i].city).split("|");
					for(var j=0;j<citys.length;j++)
					{
						var a_option = $("<option value='"+citys[j]+"'>"+citys[j]+"</option>");
						$("#areaSelect_city").append(a_option);
					}
					$("#areaSelect_city").val(citys[0]);
				}
			}
		});
		/* var user = "${student}";
		if(user)
		{
			$("#login1").css("display","block");
			$("#notlogin").css("display","none");
		}else
		{
			$("#logined").css("display","none");
			$("#notlogin").css("display","block");
		} */
		//弹出框关闭按钮
		$("#foot").load("/common/foot2.html");
		$(".wBox_close").live("click", function() {
            $($("#wBox").parents("div")[0]).css("display", "none");
        });
        //退出按钮
        $("#loginOut").live("click",function(){loginOut();});
		var packageIds = "${packageIds}";
		var gradeIds = "${gradeIds}";
		//alert(packageIds);
		setCookie("package",packageIds,15);
		setCookie("grade",gradeIds,15);
		$("#removeCart").click(function(){
			removeAll();
		});
		 $(".boxlink").live("click", function() {
                if ($("tr[class='shopp']").length!=0) {
                    var zsname = $("#zsname").val();
                    var lxphone = $("#lxphone").val();
                    var student = "${student.stuId}";      
                    if (!student) {
                        LoginDisplay(0);
                    }else if (zsname == ""||lxphone == "") {
                        $(".name-list").css("display", "block");
                        $("html,body").animate({ scrollTop: $(window).height() }, 1000);
                        $(".msg").css("display", "block");
                        $("#lxphone,#zsname").css("border","1px solid #FF0000");
                        //闪动效果
                        $(".name-list").fadeOut(500).fadeIn(500);
                    }else {
                        $("#log_tn").val(zsname);
                        $("#log_tel").val(lxphone);
                        $(".msg").css("display", "none");
                        if (zzjsMobile(lxphone) == 1){
                           CreateOrder(zsname, lxphone);
                        };
                    }
                }
                else
                    notice("请选择要购买的课程", 2,180);
        });
		//alert();
	});
	function DelShop(id,pType,index)
	{
		var content="",width=0;
        if(index==0){
            var ClassCname= $("#tr"+id+pType).find("td").eq(0).find("a").html();
            content="您确定将&nbsp;&nbsp;<span style=\"color: #008800;\">"+ClassCname+"</span>&nbsp;&nbsp;从购课车移除吗？";
            width=300;
        }else{
            content="您确定从购课车移除选定的多个课程吗？";
            width=310;
        }
        art.dialog({
            title: "温馨提示",
            content: "<span style=\"font-size:14px;\">"+content+"</span>",
            zIndex: 18008,
            icon: "question",
            width: width,
            lock: true,
            resize: false,
            fixed: true,
            button: [{ name: "确定", callback: function() { 
                $.ajax({
                    type: "POST",
                    async: true,
                    dataType: "json",
                    url: "./deleteItem",  
                    data: {"productId":id,"pType":pType},
                    success: function(json) {
                        if (json.ok == 1) {
                            var str_id=id.toString().replace(/[,]/ig,",#tr");
                            $("#tr"+str_id+pType).remove();
                            
                            var dellist="";
                            var len=$(".ca_tab1").length;
                            for (var j = 0; j < len; j++) {
                                if ($(".ca_tab1").eq(j).find("table tr").length==0) {
                                    if(dellist=="")
                                        dellist="#"+$(".ca_tab1").eq(j).attr("id");
                                    else
                                        dellist= dellist+",#"+$(".ca_tab1").eq(j).attr("id");
                                }
                            }
                            if(dellist!="")
                                $(dellist).remove();
                            if($(".ca_tab1").length==0){
                                $(".kclist").html("<span class=\"empty-img\"></span><div class=\"empty-txt\"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br />马上去<a href=\"/main.jsp\" style=\"color:blue\">选课</a></div>");
                                $(".conall").css("display", "none");
                            }
                            
                            checklist = "";
                            var checkbox = document.getElementsByName("m");
                            for (var i = 0; i < checkbox.length; i++) {
                                if (checkbox[i].checked) {
                                    checklist += checkbox[i].value + ",";
                                }
                            }
                            Goodpice=0;
                            Shopping=0;
                            var priclen=$(".tc1").length;
                            for (var l = 0; l < priclen; l++) {
                                if($(".tc1").eq(l).parent().attr("bgcolor")=="#f5f5f5"){
                                    Goodpice = Goodpice + parseInt($(".tc1").eq(l).html().toString().replace("￥",""))*1;
                                    Shopping+=1;
                                }
                            }
                            
                            $(".total2").html(Goodpice);
                            $("#num").html(Shopping);
							
						 //修改cookie的值
						   
                           setCookie("package",json.packageIds, 30);
                           setCookie("grade",json.gradeIds, 30);
                           GetAllPrice();
                        }else{
                            notice("移除失败", 2,100);
                        }
                    }
                });
            }}, { name: "取消"}]
        });
	}
	function GetAllPrice() {
            $.ajax({
                type: "POST",
                async: true,
                dataType: "json",
                url: "./getPrice",
                //data: "str=pice&myid=" + checklist.substring(0, checklist.length - 1),
                success: function(json) {
                    if (json.totalRMoney != null)
                        $("#TotalCoursePriceSave").html("￥" + json.totalRMoney);
                    /* if (json.picecount != null)
                        $("#allnum").html(json.picecount); */
                    if (json.totalOMoney != null)
                        $("#yuanjia").html("￥"+json.totalOMoney);
                    if (json.Sevenday != null) {
                        if (json.Sevenday == 1)
                            $("#Sevenday").css("display","block");
                        else
                            $("#Sevenday").css("display", "none");
                    }
                }
            });
    }
    function removeAll()
    {
    	if($("tr[class='shopp']").length==0)
    	{
    		notice("购物车里没有任何课程，可以去选课！",2,100);
    		return;
    	}
    	art.dialog({
            title: "温馨提示",
            content: "<span style=\"font-size:14px;\">"+"确定要删除购物车中的全部课程"+"</span>",
            zIndex: 18008,
            icon: "question",
            width: 300,
            lock: true,
            resize: false,
            fixed: true,
            button: [{ name: "确定", callback: function() { 
    			$.ajax({
    			type:"POST",
    			async:true,
    			dataType:"json",
    			url:"./removeAll",
    			success:function(data){
    			if(data)
    			{
    				//清空
    				$(".kclist").html("<span class=\"empty-img\"></span><div class=\"empty-txt\"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br />马上去<a href=\"/main.jsp\" style=\"color:blue\">选课</a>");

                    $(".conall").css("display", "none");
                    setCookie("package","",0);
                    setCookie("grade","",0);
    			}
    		}
    	}); }}, { name: "取消"}]});
    }
    function LoginDisplay(index) {
        $("#wBox").parents("div").css("display", "block");
        logup=index;
    }
    function showTelinput() {
    	var log_un = $("#log_un").val();
        var log_pwd = $("#log_pwd").val();
        var url = "../user/getFromUsername";
        $.ajax({
        	async:false,
            type: "POST",
            url: url,
            data: {"username":log_un,"password":log_pwd},
            dataType: 'json',
            success: function(data) {
                if (data.ok) {//用户名密码正确，检查姓名电话
                    t_tun = data.name;
                    t_tel = data.mobile;
                    if (t_tun == "null"||!t_tun) {
                        t_tun="";
                    }
                    if (t_tel == "null"||!t_tun) {
                        t_tel="";
                        $("#log_tip_o").html("下单需要填写手机号码和真实姓名");
                    }
                    $("#log_tn").attr("disabled", false);
                	$("#log_tel").attr("disabled", false);                    
                    $("#tr_tn").css("display", "block");
                    $("#log_tn").val(t_tun);
                    $("#tr_tel").css("display", "block");
                    $("#log_tel").val(t_tel);
                    $("#log_un_Tip").css("display", "block");
                    if(!$("#log_tip_o").html()||$("#log_tip_o").html()=="用户名或密码错误") $("#log_tip_o").html("您可以修改手机号码和真实姓名");
                    flag_1=1;
                }else
                {
                	//$("#tr_tn").css("display", "block");
                    //$("#tr_tel").css("display", "block");
                    $("#log_un_Tip").css("display", "block");
                    $("#log_tip_o").html("用户名或密码错误");
                }
               
            },
            error: function() {
/*                 $("#tr_tn").css("display", "block");
                $("#tr_tel").css("display", "block");
                $("#log_un_Tip").css("display", "block");
                $("#log_tn").attr("disabled", false);
                $("#log_tel").attr("disabled", false); */
            }
        });
        return false;
    }
    function CheckLogForms(obj) {
        var log_un = $("#log_un").val();
        var log_pwd = $("#log_pwd").val();
        var log_tun = $("#log_tn").val();
        var log_tel = $("#log_tel").val();
        if ((log_un.length < 2) || (log_un.length > 32)) {
            $("#log_un_Tip").css("display", "block");
            $("#log_tip_o").html("请正确填写用户名");
            return false;
        }
        else if (!CheckSafe(log_un)) {
            $("#log_un_Tip").css("display", "block");
            $("#log_tip_o").html("用户名不能含以下字符:'&<>?%,;:()`~!#$^*{}[]|+-=\"");
            return false;
        }

        if (log_pwd.length < 4 || log_pwd.length > 64) {
            $("#log_un_Tip").css("display", "block");
            $("#log_tip_o").html("密码长度不正确");
            return false;
        }
		if(!flag_1){
			 showTelinput();
			 if(!flag_1) return;
		}
        if (!$("#log_tn").attr("disabled")) {
            if (log_tun.length < 2 || log_tun.length > 16||!/^[\u4E00-\u9FA5]{2,5}$/.test(log_tun)) {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("请认真填写真实姓名");
                return false;
            }else if (!CheckSafe(log_tun)) {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("真实姓名不能含以下字符:'&<>?%,;:()`~!#$^*{}[]|+-=\"");
                return false;
            }
        }
        if (!$("#log_tel").attr("disabled")) {
            if (!checkTel(log_tel)) {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("请填写正确的手机号码");
                return false;
            }
        }
        userLogin(obj);
    }
     function CheckSafe(str) {
        var bads = "'&<>?%,;:()`~!#$^*{}[]|+-=\"";
        for (var i = 0; i < bads.length; i++) {
            if (str.indexOf(bads.substring(i, i + 1)) != -1) {
                return false;
                break;
            }
        }
        return true;
    }
    function userLogin(obj) {
        //var logState, logMsg;
		var log_un = $("#log_un").val();
        var log_pwd = $("#log_pwd").val();
        var log_tun = $("#log_tn").val();
        var log_tel = $("#log_tel").val();	
        var options = { "username": log_un, "password":log_pwd, "trueName": escape(log_tun), "mobile": log_tel};
        //$('#btdl').html("<img src='http://img.233.com/wx/img/bm/loading.gif' />");
        var url = "./loginFromCart";
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
                    		if(logup==1)
                    		{
                    			art.dialog({ id: "artdialog", title: "登录成功", icon: "loading", content: "<div class=\"aui-boxt\" style=\"width:240px;font-size:16px;\"><div>登录成功,正在加载购课车数据...</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
                            	window.setTimeout(function() {window.location.reload();}, 2000);
                    		}else{
                            	art.dialog({ id: "artdialog", title: "登录成功", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div><span id=\"timer\">(3)</span> 秒后自动生成订单</div></div>", zIndex: 18008, lock: true, time: 3, resize: false, fixed: true });
                            	var wait = 3 * 1000;
                            	for(var i = 1; i <= 3; i++) {
                                	window.setTimeout("update('#timer'," + i + "," + wait + ",'')", i * 1000);
                            	} 
                            	window.setTimeout(function() { CreateOrder(log_tun, log_tel); }, 3500);
                            }
                        }else
                        {
                        	$("#log_un_Tip").css("display", "block");
                			$("#log_tip_o").html("登录失败,请查检您的用户名与密码");
                			$('#btdl').html("<span class=\"zcbn\"><a target=_self href=\"javascript:CheckLogForms(this);\">登 录</a></span>");
                        }
            },
            error: function() {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("登录失败,请查检您的用户名与密码");
                $('#btdl').html("<span class=\"zcbn\"><a target=_self href=\"javascript:CheckLogForms(this);\">登 录</a></span>");
            }
        });
    }
    function update(obj,num, wait,value) {
        if(num == (wait/1000)) {
            $(obj).html(value);
        } else {
            printnr = (wait / 1000) - num;
            $(obj).html(value+"(" + printnr + ")");
        }
    }
    function CreateOrder(truename, tel) {
            $.ajax({
                type: "POST",
                async: true,
                dataType: "json",
                beforeSend: function() { loading("正在订单提交"); },
                complete: function() { dialoading.close(); },
                url: "../order/createOrder",
                data: {"truename":escape(truename),"mobile":tel},
                success: function(data) {
                    if (data.ok){
                        location.replace("../order/orderDetail?orderId="+data.orderId);
                    }else
                    	notice("订单生成失败！",2,100);
                },
                error:function()
                {
                	notice("系统异常,请刷新重试！",2,100);
                }
            });
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
        function zzjsMobile(obj) {
        var a = 0;
        if (obj.length != 11)
            notice("这个手机号不存在！", 2,180);
        else if (obj.substring(0, 2) != "13" && obj.substring(0, 2) != "14" && obj.substring(0, 2) != "15" && obj.substring(0, 2) != "18")
            notice("这个手机号不存在！", 2,180);
        else if (isNaN(obj))
            notice("手机号码请输入数字！", 2,190);
        else
            a = 1;
        return a;
    }
    function loading(content) {//加载
        dialoading = art.dialog({ id: "loading123", content: content, icon: "loading",lock: true, cancel: false, title: false, fixed: true });
    }
    function loginOut()
    {
    	$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:"../user/loginOut",
    		success:function(data)
    		{
    			if(data)
    			{
    				/* $("#logined").css("display","none");
    				$div = $('<div id="notlogin" ><a href="javascript:;" onclick="LoginDisplay(1);"><img src="../class/class/images/zhuce.gif"/></a><a href="javascript:;" onclick="LoginDisplay(1);"><img src="../class/class/images/denglu.gif"/></a></div>');
    				$(".login").append($div); */
    				window.location.reload();
    			}else
    			{
    				notice("登出失败,可能登录已经失效",2,100);
    			}
    		},
    		error:function()
    		{
    			notice("系统异常",2,100);
    		}
    		
    	});
    }
</script>
</head>
<body>
<div class="top">
  <div class="harder">
    <div class="logo"><a href="../main.jsp">t<img src="../class/class/images/logo.png" alt="网校"/></a></div>
    
    <div class="login">
<!--     <s:if test="#session.student==null"> -->    
 	<div id="notlogin" >
    <a href="javascript:;" onclick="LoginDisplay(1);"><img src="../class/class/images/zhuce.gif"/></a> 　
    <a href="javascript:;" onclick="LoginDisplay(1);"><img src="../class/class/images/denglu.gif"/></a>
    </div>
<!--     </s:if>
    <s:else> -->
    <div id="logined">
    	<span style="color:white">欢迎&nbsp;<a href="../member/center">${student.stuUsername }</a></span>&nbsp;&nbsp;
    	<a href="javascript:;" id="loginOut">退出</a>&nbsp;&nbsp;
    	<a href="../member/center" target="">个人中心</a>
   </div>
<!--     </s:else>  -->
    </div>
    <div class="clear"></div>
  </div>
</div>


<div id="wapper">
        <div class="cont">
            <div class="bmlc">
                <ul class="lct">
                    <li class="on">购课车</li>
                    <li>生成订单</li>
                    <li>付款</li>
                    <li>完成</li>
                </ul>
            </div>
            <div class="bmqd">
                <div class="title">
                    <span class="flt">购课清单</span>
                    <div class="status-wrapper">
                    <div class="total-fee">
                       <a class="btn-go" href="javascript:;" id="removeCart">清空购物车</a>
                    </div>
                    </div>
                </div>
   <s:if test="list.size!=0">
    <div class="kclist">   	
        <ul class="s-chk">
            <li class="b1">课程名称</li>
            <li class="b3">网校名称</li>
            <li class="b3">原价</li>
            <li class="b2">现价</li>
            <li class="b3">操作</li>
        </ul>
        <div class="ca_tab1" id="shop_undefined">
            <table border="0" cellpadding="0" cellspacing="1" style="background-color: #EAEAEA">
                <tbody>
                	<s:iterator value="list" var="cartitem" status="col">
                    <tr class="shopp" id="tr${cartitem.item.productId }${cartitem.item.itemPType}">
                        <td align="center" class="b1" style=
                        "background-color: #F5F5F5"><a class="noday7" href=
                        "javascript:;">${cartitem.item.itemName}</a></td>

                        <td align="center" class="b3" style=
                        "background-color: #F5F5F5">网校</td>

                        <td align="center" class="b3" style=
                        "background-color: #F5F5F5"><strong>￥${cartitem.item.itemOPrice }</strong></td>

                        <td align="center" class="b2" style=
                        "background-color: #F5F5F5"><span class=
                        "tc1">￥${cartitem.item.itemRPrice}</span></td>

                        <td align="center" class="b3" style=
                        "background-color: #F5F5F5"><a class="del" href=
                        "javascript:;" onclick="DelShop(${cartitem.item.productId },${cartitem.item.itemPType },0)">删除</a></td>
                    </tr>
                   </s:iterator>
                </tbody>
                
            </table>
        </div>
    </div>
                <div class="conall">
                    <div class="total-price">
<!--                         <div class="favorable" style="width:100%;line-height:22px;"><strong>网校新年特惠：</strong><font style="color: rgb(255, 51, 0);">全场满2000减500,满1000减300,满600减150,满300减60&nbsp;&nbsp;&nbsp;&nbsp;<font style="font-weight: bold;">活动时间：2月1日 - 2月3日</font>&nbsp;&nbsp;&nbsp;&nbsp;</font><font>提示：生成订单，输入劵号，立减金额</font><br><font style="color:#666;">新学员报三科及以上9折优惠；老学员报一科、两科享受9折优惠，报三科及以上8折优惠！套餐班、保过班不参与打折</font></div>
                        <div class="favorable" style="width:100%;line-height:22px; display:none;" id="Sevenday">
                            <strong>233网校保障：</strong><font style="color: #F30">该课程已加入考试大保障服务计划,承诺学习7天,不满意可无理由退款！
                                <a href="http://www.233.com/wangxiao/huodong/7days.html" target="_blank">[查看详细说明]</a></font></div> -->
                        <div class="total">
                            选中<span class="f18" id="allnum">1</span> 件课程 　所选全部课程原价：<span class="f18" style="text-decoration: line-through;
                                font-weight: normal" id="yuanjia">￥${totalOMoney}</span>;&nbsp;&nbsp;&nbsp;所选课程折后总价：<span class="f20" id="TotalCoursePriceSave">￥${totalRMoney}</span>
                        </div>
                    </div>
                    <ul class="name-list" style="display:none;">
                        <li><strong>真实姓名：</strong><input id="zsname" value="${student.stuName }" type="text"></li>
                        <li><strong>联系电话：</strong><input id="lxphone" value="${student.stuMobile }" type="text"></li>
                    </ul>
                    <a href="javascript:;" target="_self" class="boxlink" style="margin-top: 5px;">生成订单</a> <a class="jxxk" target="_self" href="/">继续选课</a>
                    <div class="msg" style="display: none;">
                        <span>没有填写真实姓名或联系方式</span></div>
                </div>
               </s:if>
            </div> 
           
        
        <s:else>
        	<!-- <div class="kclist empty-txt">
        <strong>您的购课车是空的，赶快行动吧！您可以：</strong><br>
        马上去<a href="http://wx.233.com" target="_blank">选课</a> 或 <a href=
        "/search/UserCenter/free.asp?guest=1" target="_blank">免费体验</a>
    </div> -->
        <div class="kclist"><span class="empty-img"></span><div class="empty-txt"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br>马上去<a href="../main.jsp" style="color:blue">选课</a></div></div>
        </s:else> <br clear="all">
        </div>
        <div id="foot">
        </div>
    </div>
<div style="display: none">
        <div class="wBox_hide wBox_overlayBG" id="wBox_overlay">
        </div>
        <div id="wBox">
            <div class="wBox_popup">
                <table>
                    <tbody>
                        <tr>
                            <td class="wBox_tl">
                            </td>
                            <td class="wBox_b">
                            </td>
                            <td class="wBox_tr">
                            </td>
                        </tr>
                        <tr>
                            <td class="wBox_b">
                                <div style="width: 10px;">
                                    &nbsp;</div>
                            </td>
                            <td>
                                <div class="wBox_body">
                                    <table class="wBox_title">
                                        <tbody>
                                            <tr>
                                                <td class="wBox_dragTitle" style="cursor: move;">
                                                    <div class="wBox_itemTitle">
                                                        注册或登录</div>
                                                </td>
                                                <td width="20px" title="关闭">
                                                    <div class="wBox_close" >
                                                    </div>
                                                </td>
                                            </tr>
                                        </tbody>
                                    </table>
                                    <div id="wBoxContent" class="wBox_content">
                                        <div class="loginbox">
                                            <div class="loglf">
                                                <table width="550" height="400" cellspacing="0" cellpadding="5" border="0">
                                                    <tbody>
                                                        <tr height="20">
                                                            <td height="35" align="center" colspan="3">
                                                                <span class="ftitle">新会员报名注册</span><input type="hidden" value="" id="freetype" name="freetype">
                                                            </td>
                                                        </tr>
                                                        <tr height="20">
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font>用户名:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="text" maxlength="16" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_nc_msg',1);CheckUserName('reg_nc','reg_nc_msg');"
                                                                    onfocus="this.style.borderColor='#99E300';this.select();ChangeColor1('reg_nc_msg','请输入用户名',0)" id="reg_nc"
                                                                    class="INPUT" tabindex="1" name="reg_nc" style="border-color: rgb(163, 191, 168);" />
                                                            </td>
                                                            <td width="242" height="30">
                                                                <div id="reg_nc_msg" class="line1px">
                                                                    &nbsp;用户名只能是数字字母下划线，4-16位</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 密码:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="password" maxlength="32" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_pwd_msg',1);CheckPassWord('reg_pwd','reg_pwd_msg');"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_pwd_msg',0)" id="reg_pwd"
                                                                    class="INPUT" tabindex="2" name="reg_pwd" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_pwd_msg" class="line1px">
                                                                    &nbsp;6~16个字符，包括字母、数字、下划线，区分大小写</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 确认密码:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="password" onblur="this.style.borderColor='#A3BFA8';ChangeColor('re_pwd_msg',1);PasswordEquals('reg_pwd','re_pwd','re_pwd_msg')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('re_pwd_msg',0)" class="INPUT"
                                                                    maxlength="32" id="re_pwd" tabindex="3" name="re_pwd" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="re_pwd_msg" class="line1px">
                                                                    &nbsp;请再输入一遍您上面输入的密码</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 真实姓名:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="text" maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_tname_msg',1);CheckTrueName('reg_tname','reg_tname_msg')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_tname_msg',0)" id="reg_tname"
                                                                    class="INPUT" tabindex="4" name="reg_tname" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_tname_msg" class="line1px">
                                                                    &nbsp;便于客服短时间内确认您的订单和汇款</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 手机号码:</div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('telNum_info',1);checkPhone($('#telNum'),$('#telNum_info'))"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('telNum_info',0)" id="telNum"
                                                                    class="INPUT" tabindex="5" name="telNum" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div class="line1px" id="telNum_info">
                                                                    &nbsp;课程开通后,我们将以手机短信通知您</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red"></font></div>
                                                            </td>
                                                            <td width="168" height="30" align="left">
                                                                <input type="button" id="getSmsCode" class="countDownBt-active" style="margin-left:5px" onclick="requestSmsCode($('#telNum'),$('#telNum_info'),'/user/requestSmsCode');" value="获取验证码">
                                                            </td>
                                                            <td height="30">
                                                                <div class="line1px" id="telNum_info">
                                                                   </div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 短信验证码:</div>
                                                            </td>
                                                            <td height="30" align="left">
                                                                <input type="text" maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_code_msg',1);CheckNull('reg_code','&nbsp;验证码为空！','reg_code_msg','&nbsp;验证码正确！');checkMsgCode($('#reg_code'),$('#reg_code_msg'),'/user/checkSmsCode');"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_mail_msg',0)" id="reg_code"
                                                                    class="INPUT" name="reg_code" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_code_msg" class="line1px">
                                                                    &nbsp;请填写手机接收的短信验证码</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red">*</font> 电子邮件:</div>
                                                            </td>
                                                            <td height="30" align="left">
                                                                <input type="text" maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_mail_msg',1);CheckNull('reg_mail','&nbsp;邮件为空！','reg_mail_msg','&nbsp;Email格式正确！');CheckMail('reg_mail','reg_mail_msg')"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_mail_msg',0)" id="reg_mail"
                                                                    class="INPUT" name="reg_mail" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_mail_msg" class="line1px">
                                                                    &nbsp;请填写邮件地址,有消息会邮件给您</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    <font color="red"></font> QQ号码:</div>
                                                            </td>
                                                            <td height="30" align="left">
                                                                <input type="text" maxlength="30" onblur="this.style.borderColor='#A3BFA8';ChangeColor('reg_qq_msg',1);CheckNull('reg_qq','&nbsp;QQ为空！','reg_qq_msg','&nbsp;QQ格式正确！');CheckQICQ();"
                                                                    onfocus="this.style.borderColor='#99E300';ChangeColor('reg_mail_msg',0)" id="reg_qq"
                                                                    class="INPUT" name="reg_mail" style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_qq_msg" class="line1px">
                                                                    &nbsp;请填写QQ号码</div>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                        	<td width="110" height="30" align="right" class="ft14">
                                                                <div align="right">
                                                                    	地区和考试:&nbsp;</div>
                                                            </td>
                                                        	<td height="30" colspan="2">
                                                        		<div class="select_border" style="margin-left:5px">
																	<div class="container">
																		<select name="" class="select" id="areaSelect_prov" style="width:120px">
						
																		</select>
																		<select name="" class="select" id="areaSelect_city" style="width:120px;">
						
																		</select>
																	</div>
																</div>
																<div class="select_border" style="margin-left:5px">
																	<div class="container">
																	<select name="" class="select" id="examSelect">
																	</select>
																	</div>
																</div>
                                                        	</td>
                                                        </tr>
                                                        <tr>
                                                            <td height="30" align="center">
                                                            </td>
                                                            <td height="30" align="center" id="btzc">
                                                                <span class="zcbn" onclick="CheckAllForms(this);">注册报名</span>
                                                            </td>
                                                            <td height="30">
                                                                <div id="reg_err_msg" class="line1px">
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                            <div class="logrt">
                                                <table width="300" cellspacing="0" cellpadding="5" border="0">
                                                    <tbody>
                                                        <tr height="20">
                                                            <td width="300" height="35" align="center" class="ft18" colspan="2">
                                                                <span class="ftitle">已注册会员报名登录</span>
                                                            </td>
                                                        </tr>
                                                        <tr height="20">
                                                            <td width="90" height="35" align="right" class="ft14">
                                                                <div style="width: 90px;">
                                                                    用户名:</div>
                                                            </td>
                                                            <td width="190" height="35" align="left">
                                                                <input type="text" maxlength="30" size="21" onblur="this.style.borderColor='#A3BFA8';"
                                                                    onfocus="this.style.borderColor='#99E300'" class="INPUT" id="log_un" name="log_un"
                                                                    style="border-color: rgb(163, 191, 168);" value="${cookie.eschool_user.value }">
                                                            </td>
                                                        </tr>
                                                        <tr height="20">
                                                            <td width="90" height="35" align="right" class="ft14">
                                                                <div style="width: 90px;">
                                                                    密码:</div>
                                                            </td>
                                                            <td width="190" height="35" align="left">
                                                                <input type="password" maxlength="32" size="21" onblur="this.style.borderColor='#A3BFA8';showTelinput(this);"
                                                                    onfocus="this.style.borderColor='#99E300'" class="INPUT" id="log_pwd" name="log_pwd"
                                                                    style="border-color: rgb(163, 191, 168);">
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none; height: 20px; line-height: 20px;" id="log_un_Tip">
                                                            <td width="300" valign="middle" align="center" style="font-size: 12px; background: #e2f5ff;"
                                                                colspan="2">
                                                                <div class="line1px_5" id="log_tip_o">
                                                                    您的所注册的帐号需要填写真实姓名与手机号码</div>
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none;" id="tr_tn">
                                                            <td width="90" height="35" align="right" class="ft14">
                                                                <div style="width: 90px;">
                                                                    真实姓名:</div>
                                                            </td>
                                                            <td width="190" height="35" align="left">
                                                                <input type="text" maxlength="30" size="21" onblur="this.style.borderColor='#A3BFA8';" disabled="disabled"
                                                                    onfocus="this.style.borderColor='#99E300'" class="INPUT" id="log_tn" name="log_tn">
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none;" id="tr_tel">
                                                            <td width="90" height="35" align="right" class="ft14">
                                                                <div style="width: 90px;">
                                                                    手机号码:</div>
                                                            </td>
                                                            <td width="190" height="35" align="left">
                                                                <input type="text" maxlength="30" size="21" onblur="this.style.borderColor='#A3BFA8';" disabled="disabled"
                                                                    onfocus="this.style.borderColor='#99E300'" class="INPUT" id="log_tel" name="log_tel">
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td width="90" height="25" align="right" class="ft14">
                                                                &nbsp;
                                                            </td>
                                                            <td width="190" height="25" align="center" id="btdl">
                                                                <span onclick="CheckLogForms(this)" class="zcbn">登录报名</span>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </td>
                            <td class="wBox_b">
                                <div style="width: 10px;">
                                    &nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="wBox_bl">
                            </td>
                            <td class="wBox_b">
                            </td>
                            <td class="wBox_br">
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>
