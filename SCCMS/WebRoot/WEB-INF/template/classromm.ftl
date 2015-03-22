<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
<title>优异网校-${pkgName}-${g.examCategory.examName}${g.gradeCategory.gtypeName}主讲:${g.teacher.tchName} - ${classDetail.classTitle}</title>
   	<link href="/css/learn.css" rel="stylesheet" type="text/css" />
   	<link rel="stylesheet" type="text/css" href="/common/images/common.css">
    <link href="../artDialog/skins/default.css?4.1.2" rel= "stylesheet" />
    <script src="../js/shop.js" type="text/javascript" ></script>
    <script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
    <script src="../artDialog/jquery.artDialog.js?skin=default" type="text/javascript"></script> 
    <script src="../js/jwplayer.min.js" type="text/javascript"></script>
    <script src="../js/flashplay.js" type="text/javascript"></script>
    <style type="text/css">
/*<![CDATA[*/
        .wsharebox
        {
            float: left;
            height: auto;
            padding: 10px;
            width: 400px;
        }
        .Tinfo
        {
            display: inline;
            float: left;
            width: 100%;
        }
        .Tinfo .Tywen
        {
            color: #333333;
            display: inline;
            float: left;
            font: 16px/27px "Microsoft YaHei" ,SimHei;
            height: 27px;
            text-align: left;
            width: auto;
        }
        .Tinfo .zishu
        {
            color: #AAAAAA;
            float: right;
            padding-top: 5px;
        }
        .xsyy
        {
            float: left;
            height: auto;
            margin-top: 8px;
            text-align: left;
            width: 100%;
        }
        .share_out
        {
            width: 100%;
            float: left;
            height: 77px;
            background: url(/main/images/learn1.png) repeat-x 0px -826px;
        }
        .share_out .slf, .srg
        {
            width: 4px;
            height: 77px;
            float: left;
            background: url(/main/images/learn1.png) -6px -440px no-repeat;
            overflow: hidden;
        }
        .share_out .srg
        {
            float: right;
            background: url(/main/images/learn1.png) -11px -440px no-repeat;
        }
        .share_out textarea
        {
            width: 97%;
            height: 70px;
            float: left;
            display: inline;
            border: 0px;
            font: normal 12px "Microsoft YaHei";
            color: #333;
            overflow: auto;
            padding: 0px 5px;
            margin-top: 5px;
            background: url(/main/images/233bg.png) no-repeat scroll center -5px transparent;
        }
    /*]]>*/
    </style>
</head>
<body>
  <div class="l-top" style="">
        <div class="tps">
            把优异网校放入收藏夹，随时享受高清视频课程<input class="add-F" onclick="AddFavorite(1)" type="submit" value="加入收藏" /><input class="add-x"
            onclick="Shortcut()" type="submit" value="放入桌面" /><a href="javascript:void(0)" id="not-tips-fav" onclick="AddFavorite(2)">不再提示</a>
            <form action="#" id="Shortcut" target="_blank"></form>
        </div><a class="close" href="javascript:void(0)" onclick="AddFavorite(0)">关闭</a>
  </div>
  <div class="top">
  <div class="harder">
    <div class="logo"><a href="javascript:;"><img src="/common/images/logo.png" alt="优异网校"/></a></div>
    <div style="z-index: 999; position: relative;" class="logoFull">
        <div class="area">
            <div id="area-all">
                <ul id="head">
                    <li id="Myrecords" class="out" onmouseover="this.className='on'" onmouseout="this.className='out'">
                        <a href="javascript:void(0)"><span class="bfjl">播放记录</span></a>
                        <div class="lnavp" id="Playrecords">
                           <ul class="navlist">
                           </ul>
                        </div>
                    </li>
                    <li id="Myrecords1" class="out" onmouseover="this.className='on'" onmouseout="this.className='out'">
                        <a href="javascript:void(0)"><span class="gwc">购课车</span></a>
                        <div class="lnavp" id="Playrecords">
                            <ul class="navlist" id="myshop">
                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>
</div>
	<div class="mulu">
        <div class="mulun">
            <div class="box">
                <div class="bx-title">		
                   <span class="btxt1">
                   <h1>
                   <h1><span class="f14 fb whiteTxt fl">${examName}:${pkgName}${g.examCategory.examName}${g.gradeCategory.gtypeName}:</span>
                   <span class="mb10 orangeTxt fl">${classDetail.classTitle}</span>        
                   <span class="fr whiteTxt"> 
                   <a class="paid" target="_blank" onclick='CourseSelect();' href="javascript:;">立即购买</a>
                   	</span> 
                   </h1>  
                   </span>     
                </div>
            </div>
            <div class="cont ainer vidrt" style="width: 862px; height: 528px;background: url('/main/images/bg2.png')">
            <div id="playerContent"></div>
                <div class="rightlist">                 
                    <div class="rtmulu">
                        <div class="rtbot1" style="cursor: pointer;">
                            <a href="/member/classroomHD?classId=${classDetail.classId}">高清视频</a>
                        </div>
                        <div class="rtbot2" style="cursor: pointer;">
                            <a href="/member/classroom?classId=${classDetail.classId}">三分视频</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="submenu" style="display: none;">
            <div class="su_head">
                <span>记笔记</span><a class="close" href="javascript:;" onclick="$('.submenu').hide()">关闭</a>
            </div>
            <div class="su_txt">
                <textarea class="ke-textarea" id="ke-textarea" tabindex="0"></textarea>
                <div class="submenu_y_3">
                	<span></span><a class="btn" href="javascript:;" onclick="$('#ke-textarea').val('')">清空</a><a class="btn" href="javascript:;" onclick="AddNote()">提交</a>
                </div>
            </div>
        </div>
    </div>
    <div class="l-wrap">
        <div class="l-bar" style="margin-left: 320px">
            <div class="bar">
                <div id="kmenu">
                    <ul>
                        <li class="out" onmouseout="this.className='out'"
                        onmouseover="this.className='on'">
                            <a href="javascript:void(0)" onclick="ShowBiji(0,'');"><span>学习笔记</span></a>
                            <div class="lnavp navlist biji">
                                <a class="notes1" href="javascript:;" onclick="ShowAddBiji()">记笔记</a> <a href="javascript:;" onclick="ShowBiji(0,'');">查看笔记</a>
                            </div>
                        </li>
                        <li><a class="drill" href="javascript:;" id="lianxiurl">课后练习</a></li>
                        <li class="out2" onmouseout="this.className='out2'" onmouseover="this.className='on2'">
                            <a href="javascript:void(0)" style="font-weight: bold;"><span>&nbsp;&nbsp;&nbsp;&nbsp;下&nbsp;载</span></a>
                            <div class="lnavp navlist biji">
                                <a class="btnx" href="javascript:;" id="mp3url">音频课件</a> 
                                <a class="btnx" href="javascript:;" id="jiangyiurl">本章讲义</a>
                                <a class="btnx" href="javascript:;" id="shoujiurl" target="_blank">手机视频</a>
                            </div>
                        </li>
                    </ul>
                </div>
                <a class="mk-btn" href="/search/UserCenter/examCenter/examlist.asp?ks=192" target="_blank">在线模考</a> 
                <a class="wen-btn" href="/memberCenter/addQuestion.jsp" id="hywd" target="_blank">你问我答</a>
                <div class="kTab2">
                    <a class="p-right" href="javascript:void(0)" title="点击观看下一讲课程" id="n_right">下一讲</a>
                    <a class="p-left" href="javascript:void(0)" title="点击观看上一讲课程" id="n_left">上一讲</a>
                </div>
            </div><br clear="all" />
        </div>
        <div class="mainSub1">
            <div class="ml-left">
                <div class="l-sub1" id="l-zl">
                    <div class="kTab" id="kcbj">
                        <div class="bt1 on">
                            <a href="javascript:void(0)">课程目录</a>
                        </div>
                        <div class="bt1">
                            <a href="javascript:void(0)">学习笔记</a>
                        </div>
                    </div>
                    <div class="colist_c" id="MyChapter">
                        <h3 id="liebieo"></h3>
                        <div class="contant copli" style="overflow: hidden; position: relative; padding: 0px;">
                            <div class="jscroll-c" style="top: -10px; z-index: 1200; position: relative; padding-right: 15px;">
                            <div style="height: 0px; overflow: hidden;"></div>
                                <ul class="nav" id="listz"></ul>
                                <div style="clear: both"></div>
                            </div>
                            <div class="jscroll-e" style="height: 100%; top: 0px; right: 0pt; -moz-user-select: none; position: absolute; overflow: hidden; z-index: 9999; width: 15px; background: url(&quot;/main/images/s_bg2.png&quot;) repeat-y scroll right 0pt transparent;">
                            <div class="jscroll-u" style="position: absolute; top: 0px; width: 100%; left: 0pt; background: url(&quot;/main/images/s_bg2.png&quot;) repeat scroll 0pt 0pt transparent; overflow: hidden; height: 15px;">
                          </div>
                                <div class="jscroll-h" style="background: url(&quot;/main/images/s_bg2.png&quot;) repeat-y scroll -45px 0pt transparent; position: absolute; left: 0pt; -moz-user-select: none; border: 1px solid rgb(237, 115, 20); top: 16px; width: 13px; height: 70.6775px;">
                                </div>
                                <div class="jscroll-d" style="position: absolute; bottom: 0px; width: 100%; left: 0pt; background: url(&quot;/main/images/s_bg2.png&quot;) repeat scroll 0pt -15px transparent; overflow: hidden; height: 15px;">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="colist_c" id="MyBiji" style="padding-top: 10px; display: none">
                        <p class="tit_classify"><span>做笔记</span></p>
                        <div class="md_add_gs" id="showShareSay">
                            <div class="share_out">
                                <textarea class="wordBiji" id="wordSay" maxlen="300" name="word" onclick="if($(this).val()=='在这里写下你的笔记吧！'){$(this).val('');}">在这里写下你的笔记吧！</textarea>
                            </div>
                            <div class="share_action">
                                <a class="num_ts" href="javascript:;" onclick="AddBiji()">提 交</a><span id="noteSay">还可以输入<strong>150</strong>个字</span>
                            </div>
                        </div>
                        <div class="feeds-list" style="text-align: center; margin: 30px 0px;"><img src="/main/images/loading24.gif" /></div>
                    </div>
                </div>
                <div class="blk10"></div>
                <div class="l-sub1" id="xgkec">
                    <div class="kTab bt1 on">
                        <a href="javascript:void(0)">相关课程</a>
                    </div>
                    <div class="xgkc" style= "text-align: center; margin: 10px 0px;"><img src="/main/images/loading24.gif" /></div>
                </div>
                <div class="blk10" id="xgkec1"></div>
            </div>
            <div class="ml-right">
                <div class="gmkcw gmkc" id="gmsc">
                    <a class="jrgwc" onclick="InsShop()"></a> 
                    <a class="jrljgm"  onclick='CourseSelect();'></a>
                    <div class="tb-cart tb-action-hint" style="display: none;">
                        <a class="J_Close" href="javascript:;" onclick="$('.tb-cart').hide();" title="关闭">关闭</a>
                        <div class="chen"> 成功</div>
                        <div class="tb-txt">
                            <h4>课程已成功添加到购课车！</h4>
                            <p id="bid">购物车共有<strong id="kcnum">0</strong>个课程，合计：<strong class="tb-price">0</strong>元</p><span class="tb-skin"><a class="tb-long-btn" href="/cart/cartList"
                            target="_blank" title="去购课车结算">去购课车结算</a></span><span><a class="J_GuanBi" href="javascript:;" onclick="$('.tb-cart').hide();" title="再逛逛"></a></span>
                        </div>
                    </div>
                </div>
                <div class="msdy" style='display:block;'>
                    <div class="mspic">
                        <a href="http://www.youeclass.com${g.teacher.tchImgUrl}" target="_blank"><img src="http://www.youeclass.com${g.teacher.tchImgUrl}" /></a>
                    </div>
                    <div class="mstxt">
                        <div class="txt1">名师<span>${g.teacher.tchName}</span>
                        </div>
                        <a class="txt2" href="/main/teacher/teacher${g.teacher.tchId}.html" target="_blank">名师简介</a>  
                        <a class="txt3" target="_blank" href="/memberCenter/addQuestion.jsp">向老师提问</a>                  
                    </div>
                </div>
                <div class="box_con">
                    <div class="box_tt">
                        <strong>名师答疑</strong><a class="more" href="/question/questionList"target="_blank">更多&gt;&gt;</a>
                    </div>
                    <div class="tabbox">
                        <ul>
                            <li class="on"><a href="javascript:;" onclick="ShowWendaList(-1)">全部</a></li>
                            <li><a href="javascript:;" onclick="ShowWendaList(1)">已解决</a></li>
                            <li><a href="javascript:;" onclick="ShowWendaList(0)">未解决</a></li>
                        </ul>
                    </div>
                    <div class="nwwd" style="text-align: center; margin: 30px 0px;"><img src="/main/images/loading24.gif" /></div>
                </div>
                <div class="gugao"></div>
                <div class="box_con">
                    <div class="box_tt">
                        <strong>最受欢迎课程</strong>
                    </div>
                    <div class="mod_cont">
                        <ol class="big_score" id="divbest">
                            <li style="text-align: center; margin: 30px 0px;">
                            <img src="/main/images/loading24.gif" /></li>
                        </ol>
                    </div>
                </div>
            </div><br clear="all" />
        </div>
		<!-- 登录,注册框 -->
		<div class="logingc" id="wxregistbox" style="height:530px;display:none;"></div>
        <div id="lgin" style="display: none;">
            <table align="center" width="390" height="220" cellspacing="0" cellpadding="5" border="0">
                <tbody>
                    <tr height="20">
                        <td align="right" valign="middle" height="44" class="ft14">
                            &nbsp;
                        </td>
                        <td align="left" valign="middle" id="loginmsg">
                            <p>
                                已有优异网校账号，可直接登录</p>
                        </td>
                    </tr>
                    <tr height="20">
                        <td align="right" width="137" valign="middle" class="ft14">
                            <div align="right">
                                <font color="red">*</font>用户名:</div>
                        </td>
                        <td align="left" width="343" valign="middle" height="48">
                            <div onmousedown="this.className='box2_puthover'" onmouseup="this.className='box2_puthover'"
                                onmouseout="this.className='box2_putlink'" onmouseover="this.className='box2_puthover'"
                                class="box2_putlink" id="reg_nc">
                                <input type="text" class="box2_input" size="20" id="username" name="username">
                            </div>
                        </td>
                    </tr>
                    <tr height="20">
                        <td align="right" valign="middle" class="ft14">
                            <div align="right">
                                <font color="red">*</font>密码:</div>
                        </td>
                        <td align="left" valign="middle" height="29">
                            <div onmousedown="this.className='box2_puthover'" onmouseup="this.className='box2_puthover'"
                                onmouseout="this.className='box2_putlink'" onmouseover="this.className='box2_puthover'"
                                class="box2_putlink" id="reg_pwd">
                                <input type="password" class="box2_input" size="20" id="password" name="password">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="ft14">
                        </td>
                        <td align="center" class="ft14">
                            <span class="zcbn"><a onclick="CheckLogForms();" href="javascript:;">登 录</a></span>
                        </td>
                    </tr>
                </tbody>
            </table>
        </div>
 </div>
	<iframe 
		src="http://www.youeclass.com/common/foot2.html" frameborder="0" height="px" scrolling="auto" width="100%" noresize="noresize">
	</iframe>
        <div class="footer">    
    </div>
     <script  type="text/javascript">
	    var examwplay;
	    var qymid="1001";
		var gradeId="${g.gradeId}";
		var classId="${classDetail.classId}";
		var nextdid = "${nextId}";
		var lastdid = "${prevId}";
		var Playrecordstr = "";
		var total="${g.gradeTime}";
		var videotime = 0;	
		var loginSate=0;
		var logindialog;
		var HaveDetailTF= "${classDetail.classHdUrl}";
		var MyClassCName = "${g.examCategory.examName}-${g.gradeCategory.gtypeName}";
		var MyClassTitle = "${classDetail.classTitle}";
		var tingTF = "${classDetail.classIfFree}";
		var Playrecordstr = "";
		var videotime = 0;
		var payflag = ${payflag};
		var t_name="${g.teacher.tchName}";
		var userName ="";
		var isMaxthon = navigator.userAgent.indexOf("Maxthon")>-1;
		var artdialog;
		$(function(){
			$.post("/user/stuSession",function(data){
				username=data;
				if(data==false){
				$("#head").prepend("li><a id='registbox' onclick='showRegbox()' title='注册网校会员' href='javascript:;'><span class='wn'>免费注册</span></a></li><li>|</li><li><a id='loginbox' onclick='ShowLogin()' title='登录网校' href='javascript:;'><span class='wn'>用户登录</span></a></li>");
			}else{
				$("#head").prepend("<li style='color: #FFF;'><span class='wn'>hi,<s:property value='#session.student.stuUsername'/>&nbsp;&nbsp;<em title='安全退出，保护您的帐号安全'id='tuichu'>退出</em></span></li><li>|</li><li><a class='cblue3' target='_blank' href='/memberCenter/member.jsp'><span class='wn'><strong>会员中心</strong></span></a></li>");
			}
			},"json");
		});
	    $(document).ready(function() {
	    	if(userName==false){
	    		loginSate=0;
	    	}else{
	    		loginSate=1;
	    	}
	    	//最好课程
			GetBestMyClass();
			//相关课程
	    	GetPackage();
	    	//问题
	    	setTimeout(function(){ShowWendaList(-1);},2000);
	    	setTimeout(function(){AddFavorite(2);},5000);
	    	//播放记录
	    	LoadPlayrecords()
	    	//判断是否购买该课程
	    	 if(payflag==1){ 
            $(".bx-title2,#gmsc,#cprice,#hywd,#xgkec,#xgkec1,.paid").css("display","none");
            
        	}
	    	//购物车焦点触发事件
	    	$("#Myrecords1").hover(function() {
            if ($("#myshop").find("li").size() == 0) {
                $("#myshop").html("<li style=\"text-align:center; margin:30px 0px; \"><img src=\"/main/images/loading24.gif\"><\/li>");
                GetAllECart(0);
            } 
        	});
        	//收藏夹焦点触发事件
        	$("#Myrecords2").hover(function() {
            if ($("#Collection").find("li").size() == 0) {
                GetCollection();
            } 
        	});
        	//注销
        	$("#tuichu").click(function(){
        		loginOut();
           /*  $.get("/search/member/logout.asp");
            //return false;
            setTimeout(function(){location.reload();},1500); */  
        	}); 
        	//笔记和课程切换
        	$("#kcbj div a").click(function() {
            var temp = $(this).html();
           
            switch (temp) {
                case "课程目录": $("#MyBiji").hide(); $("#MyPaper").hide(); $("#MyChapter").show(); break;
                case "学习笔记": $("#MyChapter").hide(); $("#MyPaper").hide(); $("#MyBiji").show(); GetBijiList(); break;
            }
            $("#kcbj div").removeClass("on");
            $(this).parent().addClass("on");
        	});
        	//样式切换
        	$(".tabbox li").click(function(){
            $(".tabbox li").removeClass();
            $(this).addClass("on");
       		 });  
        	//笔记
            $("#wordSay,#title").live("keyup", function() {
                 var maxlen = $(this).attr("maxlen") * 1;
                 var tid = $(this).attr("id");
                 var clas=$(this).parent().parent().attr("class");
                 var obj=$(this).parent().parent().find("#noteSay");
                 if(clas=="wsharebox"){
                     if($(this).attr("name")=="title")
                         obj=$(this).parent().parent().find("#noteSay").eq(0);
                     else
                         obj=$(this).parent().parent().find("#noteSay").eq(1);
                 }
                 if (StrLength($(this).val()) - maxlen > 0) {
                     var temp = Math.ceil((StrLength($(this).val()) - maxlen) / 2);
                     obj.html("已超过 <strong style=\"color:#ff0000\">"+temp+"</strong> 个字");
                 } else {
                     var temp = Math.ceil((maxlen - StrLength($(this).val())) / 2);
                     obj.html("还能输入 <strong>" + temp + "</strong> 个字");
                 }
             });
	    });
	    //收藏网址
	    function AddFavorite(n) {
    	var sURL = "http://www.youeclass.com/", sTitle = "优异网校，助你一次通关取证";    
    	switch (n) {
        case 1:
            try {
                //alert(1);
                window.external.addFavorite(sURL, sTitle);
            }
            catch (e) {
                try {
                    //alert(2);
                    window.sidebar.addPanel(sTitle, sURL, "");
                }
                catch (e) {
                    //alert(3);
                    $.dialog({ title: '加入收藏失败', icon: 'warning', content: "加入收藏失败，请使用Ctrl+D进行添加", zIndex: 18008 });
                }
            }
           	SetCookie('isShowFav', 0, 24 * 30);
            break;
        	case 2:
            $(".l-top").slideUp();
            SetCookie('isShowFav', 0, 24 * 30); 
            break;
    		}
    	} 
	    function SetCookie(objName, objValue, objHours) {
	        var str = objName + "=" + escape(objValue);
	        if (objHours > 0) {
	            var date = new Date();
	            var ms = objHours * 3600 * 1000;
	            date.setTime(date.getTime() + ms);
	            str += "; expires=" + date.toGMTString() + "";
	        }
	        document.cookie = str + ";path=/search/UserCenter/";
	        document.cookie = str + ";path=/search/UserCenter/";
	    }
	    function GetCookie(objName) {
	        var arrStr = document.cookie.split("; ");
	        for (var i = 0; i < arrStr.length; i++) {
	            var temp = arrStr[i].split("=");
	            if (temp[0] == objName) return unescape(temp[1]);
	        }
	    }
	    //学习记录
	    function LoadPlayrecords() {
	    	if(loginSate==1){
	    		if (Playrecordstr == "") {
		       		$("#Playrecords").html('<div class="jltxt"><img src="/main/images/loading.png"></div>');
		       		var html="";
		       		$.post(
		       			"/course/studyRecordList",
		       			function (studyRecord){
							if(studyRecord!=null){
								if(studyRecord.length>0){
									for(var i=0;i<studyRecord.length;i++){
										if(i==0){
											html +="<li class='ico2'>"+studyRecord[i].recordName+"<li><font style='color:#ff0000'>正在播发...<\/font><\/>";
										}else{
											html +="<li class='ico'>"+studyRecord[i].recordName+"<\/li><li>上次"+studyRecord[i].recordStartTime+"&nbsp;<a href='?classId="+studyRecord[i].classId+"'>继续播放...<\/a><\/li>";
										}
									}
									$("#Playrecords").html('<ul class="navlist"><li><a class="remove" href="javascript:;" onclick="javascript:clearPlayrecords();">清除记录</a></li>' + html + '</ul>');
								}else{
									$("#Playrecords").html("<ul class=\"navlist\"><li>您暂时没用学习记录<\/li><\/ul>");
								}
							}else{
								$("#Playrecords").html("<ul class=\"navlist\"><li>系统异常，稍后再试<\/li><\/ul>");
							}
						}
		       		);

	    	}
	    	
	    	}else{
	    		 $("#Playrecords").html("<ul class=\"navlist\"><li>您还未登录,登录查看您的学习记录<\/li><\/ul>");
	    	}
		} 
		//清空学习记录
		function clearPlayrecords() {
		    $.post("/course/studyRecordDelete", 
		    		function(ok) {
		    		if(ok==true){
		    			$("#Playrecords").html('<ul class="navlist"><li><a class="remove" href="javascript:;" onclick="javascript:clearPlayrecords();">清除记录</a></li><li style="margin-top:5px;text-align:center;padding:10px 0px;">您的观看历史已清空。</li></ul>')
		    		}	
		    });
		}
	    //购物车列表
     	function GetAllECart(type) {
        var taboy = "";
        var html="";
        var pricecount = 0;
        var price = 0;
        if(loginSate==1){
            $.ajax({
                type: "GET",
                url: "/cart/simpleList",
                dataType: "json",
                cache: false,
                success: function(result) {
                    if (result.length==0) {
                        taboy = "<li class='ico2'>您的购物车中没有任何课程！<\/li>"; 
                    }
                    if (result.length != 0) {
                        if (result.length > 0) {
                            for (var i = 0; i < result.length; i++) {
                                taboy += "<li class='ico2'>" + unescape(result[i].item.itemName) + "<\/li><li><em class='lf'>￥" + result[i].item.itemRPrice + "<\/em><a class='rt' onclick='DelShop("+result[i].item.productId+","+result[i].item.itemPType+")' href='javascript:void(0);'>删除<\/a><\/li>";
                                price = price + parseInt(result[i].item.itemRPrice);
                                pricecount = pricecount + 1;
                                html=html+result[i].item.productId+",";
                                
                            };
                        } ;
                        /* setCookie("WangXiao=MyClassID",result.listMyCID,30);   */
                    }
                    if(html==""){
                      	html="0";
                    }
                    else{
                     	html=html.substring(0,html.length-1);	
                    } 
                    taboy = "<li><a class='remove' href='javascript:;' onclick='removeAll()'>清除记录<\/a><\/li>"+taboy+"<li class='settl'><a href='/search/bm/' class='set' target='_blank'>去购物车结算<\/a><\/li>";  
                    $("#myshop").html(taboy);
                    if(type=="1"){                
                    $("#kcnum").html(pricecount);
                    $(".tb-price").html(price);                        
                    $(".tb-cart").css("display","block");
                  }
                }
            });
        }else{
            $("#myshop").html("<li>购课车里还没有课程<\/li>");
        }
    }
    
    //删除指定科目
    function DelShop(id,pType)
	{
		if(loginSate==1){
		var content="",width=0;   
        content="您确定将课程从购课车移除吗？";
        width=300;
        art.dialog({
            title: "温馨提示",
            content: "<span style=\"font-size:14px;\">"+content+"</span>",
            zIndex: 18008,
            icon: "question",
            width: 300,
            lock: true,
            resize: false,
            fixed: true,
            button: [{ name: "确定", callback: function() { 
                $.ajax({
                    type: "POST",
                    async: true,
                    dataType: "json",
                    url: "/cart/deleteItem",  
                    data: {"productId":id,"pType":pType},
                    success: function(json) {
                        if (json.ok == 1) {
						 //修改cookie的值
                           setCookie("package",json.packageIds, 30);
                           setCookie("grade",json.gradeIds, 30);
                           GetAllECart(0);
                        }else{
                            notice("移除失败", 2,100);
                        }
                    }
                });
            }}, { name: "取消"}]
        });
	  }else {
            LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
      }
	}
	//清空购物车
	function removeAll()
    {
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
    			url:"/cart/removeAll",
    			success:function(data){
    			if(data)
    			{
    				//清空
                    setCookie("package","",0);
                    setCookie("grade","",0);
                    GetAllECart(0);
    			}
    		}
    	}); }}, { name: "取消"}]});
    }
  
    //退出
	 function loginOut()
    {
    	$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:"/user/loginOut",
    		success:function(data)
    		{
    			if(data)
    			{
					location.reload();
    			}else
    			{
    				notice("登出失败",2,100);
    			}
    		},
    		error:function()
    		{
    			notice("系统异常",2,100);
    		}
    		
    	});
    }
	//登录或者注册
  	 function ShowLogin()
    {
        if(typeof(logindialog)!="undefined"){logindialog.close();}
        logindialog = art.dialog({
            title  :"优异网校会员登录",
            content: $("#lgin")[0],
            zIndex : 18008,
            padding:0
        }); 
    }
    //表单验证
     function CheckLogForms(){
        var un = $("#username");
        var pw = $("#password");
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
        var sendDatas = {username:encodeURIComponent(encodeURIComponent(un.val())), password:pw.val(), GMT:new Date().getTime()};
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
    //cookies
    function getCookie(name) {
	var cookieValue = "";
	var search = name + "=";
	if (document.cookie.length > 0) {
		offset = document.cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = document.cookie.indexOf(";", offset);
			if (end == -1) end = document.cookie.length;
			cookieValue = unescape(document.cookie.substring(offset, end));
		};
	}
	return unescape(cookieValue);
	}
	function setCookie(cookieName,cookieValue,DayValue) {
	var expire = "";
	var day_value=1;
	if (DayValue != null) {
		day_value=DayValue;
	}
	expire = new Date((new Date()).getTime() + day_value * 86400000);
	expire = "; expires=" + expire.toGMTString();
	document.cookie = cookieName + "=" + escape(cookieValue) +";path=/"+ expire;
	}
	
	$(document).ready(function(){
		GetChapterList();
		if(HaveDetailTF==""){
			playTipsObj = art.dialog({
				title:"温馨提示",
				content:" <div class=\"aui-boxt\"><div class=\"aui_iconBgx\"></div><div class=\"bq\">本讲课程暂无内容，请稍后再来学习!</div></div>",
				zIndex : 18008,
				lock  : true,
				resize:false,
				fixed:true
			});
		}
		else{
			if(tingTF=="1"||payflag==1){
				StartPlay();
			}else{
				playTipsObj = art.dialog({
					title:"温馨提示",
					content:" <div class=\"aui-boxt\"><div class=\"aui_iconBgx\"></div><div class=\"bq\">抱歉！本讲课程为收费课程，请购买该课程后再来学习!<br>详情咨询：400-0086-044<a class=\"btn2\" target=\"_blank\" onclick='CourseSelect();' href=\"javascript:;\"> 立即购买</a></div></div>",
					zIndex : 18008,
					lock  : true,
					resize:false,
					fixed:true
				});
			}
		}
		
		$("#n_right").click(function(){
			if(nextdid!=0)
				window.location = "?classId="+nextdid ;
			else 
				notice("没有下一讲了，请选择其它的课件学习！",3);   
		});
		$("#n_left").click(function(){
			if(lastdid!=0)				
				window.location = "?classId="+lastdid ;
			else 
				notice("没有上一讲了，请选择其它的课件学习！",3); 
		});	 	
	});  
	//目录
	function GetChapterList()
	{
		$("#MyChapter").html("<img src=\"/main/images/loading.png\">");
		$.ajax({
			type:"get",
			contentType:"text/html;utf-8",
			url:"/member/contents",
			data:{gradeId:gradeId,payflag:payflag},
			dataType: 'json',
			success: function (result){
				var html = "",state="",childHtml="",childListNO=0,temp=0,lname="";
				var wordlength=36;
				if(result.length!=0)
				{
					html = "<h3>"+MyClassCName+"（共"+total+"讲),更新到"+result.length+"讲</h3>";
					html+="</div>";
					html+="<div class=\"contant\"><div class=\"copli\" style=\"height:400px;margin:0px;padding:0px;\"><ul class=\"nav\" style=\"height:390px;overflow:auto;margin:0px;padding:0px;width:100%\">";
					for (var i=0;i<result.length;i++){
								childHtml="";
								isFree=(result[i].classIfFree==1)?"<span class=\"free\">免费</span>":"";
								childListNO++;
								playIcon = "";
								if(result[i].classId==classId)
								{
									playIcon = "bg";
									temp = i;
								}
								lname = unescape(result[i].classTitle);
								lname= (StrLength(lname)-wordlength>0)?lname.substring(0,wordlength)+"...":lname;
								playIcon=childHtml+='<li><a href="?classId='+result[i].classId+'" title="'+unescape(result[i].classTitle)+'" classId="'+result[i].classId+'" class="'+playIcon+'"  target="_self"><span>'+(parseInt(childListNO)<10?"0"+parseInt(childListNO):parseInt(childListNO))+'、'+lname+'</span>'+isFree+'</a></li>';
						if(childHtml==''){
							html+='<li style="display:none"><a class="expanded" ></a><ul class="navigation">'+childHtml+'</ul></li>';
						}else{
							html+='<li><a  ></a><ul class="navigation">'+childHtml+'</ul></li>';
						}
					}
					html+="</ul><div style=\"clear:both\"></div></div>";
				}
				else
				{
					html = "<h3>"+MyClassCName+" 加载失败 <a href=\"javascript:;\" onclick=\"GetChapterList()\">点击重新加载</a>";
				}
				$("#MyChapter").html(html);
						
				$(".nav > li > a").click(function() {
					$(this).toggleClass('expanded').toggleClass('collapsed').parent().find('ul').slideToggle('medium');
				});
				$("#MyChapter .cg_title a").click(function(){
					$(".cg_title").find("a").each(function(){
						$(this).html("第<strong>"+(parseInt($(this).attr("ChapterNO"))+1)+"</strong>章").removeClass("on");
					});
					$(this).addClass("on");
				});
				$("#MyChapter .cg_title a").eq(temp).click();
			},
			error: function (e) {/*错误处理*/},
			async:true,
			cache:false
		});
	}
	//播放器
	function StartPlay()
	{
		examwplay = jwplayer("playerContent").setup({
			    flashplayer: '/js/player.swf',			   
                'file':HaveDetailTF ,
				width: '100%',
				height: '100%',
				controlbar: 'bottom',
				image:'/main/images/bg2.png',
				"skin":"/js/stormtrooper.zip",	
				provider: 'http',
				autostart: 'true'
            });
	}
	//笔记
	function ShowBiji(NoteID, content) {
        if (NoteID > 0) {
            $("#showShareSay").find("#wordSay").attr("NoteID", NoteID);
            $("#MyBiji .tit_classify").html("<span>编辑笔记 " + NoteID + "</span>");
        }
        else {
            $("#l-zl #kcbj div").eq(1).find("a").click();
        }
        $("#showShareSay").find("#wordSay").val(unescape(content));
        //$(document).scrollTop($(".l-sub1").position().top);
        $("html,body").animate({ scrollTop: $("#l-zl").position().top }, 2000);
    }
	//显示笔记
	 function ShowAddBiji() {
        if ($('.submenu').is(":visible")) {
            $('.submenu').slideUp();
            setTimeout(function() { $('.submenu').slideDown(); }, 500);
        }
        else {
            $('.submenu').slideDown();
        }
    }
	//动态添加笔记
    function AddNote() {
        $(".submenu_y_3").find("span").html("");
        var Content = $("#ke-textarea").val(); //内容不能为空
        if (StrLength(Content) > 1000) { $(".submenu_y_3").find("span").html("长度不要超过500字", 2); return; }
        if (StrLength(Content) < 10) { $(".submenu_y_3").find("span").html("长度不能小于10", 2); return; }
        if(loginSate==1){
        	 loading("提交中。。。");
	        $.ajax({
	            type: "POST",
	            url: "/course/addNote",
	            data: {"note.noteVideotime":examwplay.getPosition(),"note.noteCouresType" : 1, "note.classId": classId, "note.noteContent": escape(Content)},
	            dataType: 'json',
	            success: function(result) {
	                dialoading.close();
	                if (result==true) {
	                    $(".submenu_y_3").find("span").html("发布成功", 2);
	                    $("#ke-textarea").val("");
	                    GetBijiList();
	                }
	                else {
	                    $(".submenu_y_3").find("span").html("发布失败");
	                }
	            }
				,
	            error: function(e) { /*notice("载入错误",3);错误处理*/ }
				,
	            async: true,
	            cache: false
	        });
        }else{
        	LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
        }
       
    }
	
    function AddBiji() {
    	var videotime =examwplay.getPosition();
        var Content = $("#showShareSay").find("#wordSay").val();
        var NoteID = $("#showShareSay").find("#wordSay").attr("NoteID");
        if (StrLength(Content) > 1000) { notice("问题内容请不要超过500字", 2); return; }
        if (StrLength(Content) < 10) { notice("请输入有意义的内容，长度不能小于10", 2); return; }
        if (Content == "请简明清晰地提出您的疑问") { notice("请输入有意义的内容", 2); return; }
        if(loginSate==1){
        	loading("提交中。。。");
	        $.ajax({
	            type: "POST",
	            url: "/course/addNote",
	            data: {"note.noteVideotime":videotime,"note.noteCouresType" : 1, "note.classId": classId, "note.noteContent": escape(Content), "note.noteId": NoteID },
	            dataType: 'json',
	            success: function(result) {
	                dialoading.close();
	                if (result) {
	                    if (NoteID > 0) { succeed("修改成功", 2); } else { succeed("发布成功", 2); }
	                    $("#showShareSay").find("#wordSay").val("").attr("NoteID", 0);
	                    GetBijiList();
	                }
	                else {
	                    notice('添加失败，请重试', 2);
	                }
	            }
				,
	            error: function(e) { /*notice("载入错误",3);错误处理*/ }
				,
	            async: true,
	            cache: false
	        });
        
        }else{
        	LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
        }
        
    	}
    function Shortcut() {
     	$("#Shortcut").submit();
    }
		
	function GetBijiList() {
    if (loginSate == 1) {
        $.ajax({
            type: "GET",
            url: "/course/listNote",
            data: { classId: classId, type: 1}, //Act=getstudybiji&TypeID=7786&MyNote=0&Page=1
            dataType: 'json',
            success: function(result) {
                if (result !=null) {
                    var html = "", nickname = "", delstr;
                    if (result.length > 0) {
                        for (i = 0; i < result.length; i++) {
                            //html+="<h4><strong>"+(i+1)+"</strong>、"+unescape(result.NoteList[i].Content)+"<span>("+result.NoteList[i].AddTime+") </span> <a class=\"delNote\" href=\"javascript:void(0)\"  value="+result.NoteList[i].NoteID+" eid=\""+eid+"\"> 删除</a></h4>";
                            html += "<div class=\"f-item\"><h4 class=\"fstitle\" style=\"text-align:left\"><a title=\"点击观看此时间段视频\" time=\"" + result[i].noteVideotime + "\" did=\"" + result[i].classId + "\" mid=\"" + result[i].classId + "\" class=\"watchVideo\" style=\"color:#0082CB;\" href=\"javascript:void(0)\">课程" + result[i].noteVideotime + "：</a>" + unescape(result[i].noteContent) + "</h4><div class=\"fDate\"><span class=\"operate\"><a href=\"javascript:void(0)\"  value=" + result[i].noteId + " class=\"edit\" onclick=\"ShowBiji(" + result[i].noteId + ",'" + result[i].noteContent + "')\">编辑</a> | <a href=\"javascript:void(0)\"  value=" + result[i].noteId + " class=\"delete\" onclick=\"DelNote(" + result[i].noteId + ")\">删除</a></span><span class=\"fstime\">" + result[i].noteAddTime + "</span></div></div>";
                        }
                    }
                    else {
                        html += "<div class=\"No-text\">暂无笔记，去发表您对这道题目的笔记吧</div>";
                    }
                    $(".feeds-list").html(html).slideDown();
                    $("#MyBiji .tit_classify").html("<span>写笔记</span>");
                    $("#MyBiji .tit_classify").attr("NoteID", 0);
                }

            }
				,
            error: function(e) { /*notice("载入错误",3);错误处理*/ }
				,
            async: true,
            cache: false
        });
    }
    else {
        $(".feeds-list").html("<div class=\"No-text\">您还未登录，登录后即可发表您的笔记。</div>");
    }
	}
	//删除笔记
	function DelNote(NoteID) {
        if (loginSate) {
            art.dialog({ id: "deldialog", content: "<div style=\"white-space:nowrap;\">确定删除该笔记吗？</div>", button: [{ name: "删除", callback: function() {
                $.ajax({
                    type: "GET",
                    url: "/course/deleteNote",
                    data: {noteId: NoteID},
                    dataType: 'json',
                    success: function(result) {
                        if (result) {
                            succeed("删除成功", 2);
                            $("#showShareSay").find("#wordSay").attr("NoteID", 0);
                            GetBijiList();
                        }
                    }
					,
                    error: function(e) { /*notice("载入错误",3);错误处理*/ }
					,
                    async: true,
                    cache: false
                });
            }, focus: true
            }, { name: "取消"}], lock: true, zIndex: 18008, opacity: 0.1, icon: "question"
            });
        }
        else {
            LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
        }
    }
    //相关课程
    function GetPackage(){
        var html = "<div class='tjketc'><table width='100%' cellspacing='1' cellpadding='0' border='0' bgcolor='#efefef'><tbody>";        
        $(".xgkc").html("<div style=\"text-align:center; margin:30px 0px; \"><img src=\"/main/images/loading24.gif\"></div>");
        $.ajax({
            type: "POST",
            url: "/course/find",
            data: {classId:classId},
            dataType: 'json',
            success: function(result) {
                if(result!=null){
                    if (result.length > 0) {   
                    	html += "<tr align='center'><td valign='center' height='25' bgcolor='#e9eef1' align='center'>课程专业名称</td><td width='59' height='25' bgcolor='#e9eef1' align='center'>讲师</td><td width='37' height='25' bgcolor='#e9eef1' align='center'>课时</td><td width='48' bgcolor='#e9eef1' align='center'>原价</td><td width='54' bgcolor='#e9eef1' align='center'>优惠价</td><td width='60' valign='center' height='25' bgcolor='#e9eef1' align='center'>免费体验</td><td width='58' valign='center' height='25' bgcolor='#e9eef1' align='center'>报名</td></tr>";                     
                        for (var i = 0; i < result[0].length; i++) {
                          /*   if(i==0)
                                html += "<tr align='center'><td valign='center' height='25' bgcolor='#e9eef1' align='center'>课程专业名称</td><td width='59' height='25' bgcolor='#e9eef1' align='center'>讲师</td><td width='37' height='25' bgcolor='#e9eef1' align='center'>课时</td><td width='48' bgcolor='#e9eef1' align='center'>原价</td><td width='54' bgcolor='#e9eef1' align='center'>优惠价</td><td width='60' valign='center' height='25' bgcolor='#e9eef1' align='center'>免费体验</td><td width='58' valign='center' height='25' bgcolor='#e9eef1' align='center'>报名</td></tr>";
                             */
                            html += "<tr><td height='25' bgcolor='#ffffff' align='center' class='cBlue1'><a target='_blank' href='javascript:void(0)'> "+unescape(result[0][i].pkgName)+" </a></td><td height='25' bgcolor='#ffffff' align='center'>"+unescape(result[0][i].tch[0].tchName)+"</td><td height='25' bgcolor='#ffffff' align='center'>"+result[0][i].pkgTotalTime+"</td><td bgcolor='#ffffff' align='center'>￥"+result[0][i].pkgOPrice+"</td><td bgcolor='#ffffff' align='center' class='cDRed'>￥"+result[0][i].pkgRPrice+"</td><td height='25' bgcolor='#ffffff' align='center'><a style='color:#FF3300' target='_blank' href='?mid="+result[0][i].pkgId+"'><div class='vbg'>试听</div></a></td><td height='25' bgcolor='#ffffff' align='center'><a onclick='f_CourseSelect("+result[0][i].pkgId+",0);' href='javascript:;'><div class='bmbg'></div></a></td></tr>";
                        }
                        for(var i = 0; i < result[1].length; i++){
                        	html += "<tr><td height='25' bgcolor='#ffffff' align='center' class='cBlue1'><a target='_blank' href='javascript:void(0)'> "+unescape(result[1][i].name)+" </a></td><td height='25' bgcolor='#ffffff' align='center'>"+unescape(result[1][i].teacher.tchName)+"</td><td height='25' bgcolor='#ffffff' align='center'>"+result[1][i].gradeTime+"</td><td bgcolor='#ffffff' align='center'>￥"+result[1][i].gradeOPrice+"</td><td bgcolor='#ffffff' align='center' class='cDRed'>￥"+result[1][i].gradeRPrice+"</td><td height='25' bgcolor='#ffffff' align='center'><a style='color:#FF3300' target='_blank' href='?mid="+result[1][i].gradeId+"'><div class='vbg'>试听</div></a></td><td height='25' bgcolor='#ffffff' align='center'><a  onclick='f_CourseSelect("+result[1][i].gradeId+",1);' href='javascript:;'><div class='bmbg'></div></a></td></tr>";
                        }
                        html+="</tbody></table></div>";
                    }else 
                        $(".xgkc").css("display","none");
                    $(".xgkc").html(html);
                }else
                    $(".xgkc").html("<div class='tjketc'>暂无相关课程</div>");
            }
			,
            error: function(e) { notice("请求错误",2); }
			,
            async: true,
            cache: false
        });
    }
    //报名
  function f_CourseSelect(myid,type){
		//套餐cookie
		var MyPackageIDCookie = getCookie('package');
		//班级cookie
		var MyGradeIDCookie = getCookie('grade');
		if(type==0)
		{
			if(MyPackageIDCookie==''){
				setCookie('package',myid,15);
			}else{
				setCookie('package',MyPackageIDCookie+','+myid,15);
			};
		}else
		{
			if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			};
		};
		window.open("/cart/cartList");
		
	} 
	//名师答疑                             
    function ShowWendaList(AskType)
	{
		$(".nwwd").html("<img src=\"/main/images/loading.png\">");
		$.ajax({
			type: "GET",
			contentType: "text/html;utf-8",
			url: "/question/classQuestion",
			data: {classId:classId,type:AskType,count:5},
			dataType: 'json',
			success: function (result) {
				if(result!=null)
				{
					var html="";
					if(result.length>0)
					{
						for( var i=0;i<result.length;i++)
						{
							content = result[i].questionTitle==""?unescape(result[i].questionContent):unescape(result[i].questionTitle);
							html+="<ul class='box-bd'><li><div class='asking-ct'><p class='asking-item-title'><a title='"+content+"' target=\"_blank\" href='/question/loadQuestion?questionId="+result[i].questionId+"'>"+content+"</a></p><p class='asking-item-desc'>已有"+result[i].tbAnswers.length+"个回答</p></div></li>";
						}
					}
					else
					{
						html="<li>暂时没有提问</li>";
					}
					$(".nwwd").html(html);
				}
				else
				{
					$(".nwwd").html("加载失败，请稍后再试，<a href=\"javascript:;\" onclick=\"ShowWendaList("+AskType+")\">点击重新加载</a>");
				}
			}
			,
			error: function (e) {notice("载入错误",3);/*错误处理*/}
			,
			async:true,
			cache:false
		});	
	}
	//最受欢迎的课程
	   function GetBestMyClass(){
        var html = "";
        $("#divbest").html("<li style=\"text-align:center; margin:30px 0px; \"><img src=\"/main/images/loading24.gif\"></li>");
        $.ajax({
            type: "POST",
            url: "/course/findHot",
            dataType: 'json',
            success: function(result) {
                if(result!=null){
                    if (result.length > 0) {                        
                        for (i = 0; i < result.length; i++) {
                            if(i==0)
                            	html += "<li class='mod_first'><div class='mod_pic_txt'><a target='_blank' href='/main/exam"+result[i][4]+".html' class='mod_poster' title='"+unescape(result[i][1])+"'><em>"+(i+1)+"</em><img src=''><div class='mod_sign'><span class='mod_HD'></span></div><span class='mod_mask'></span></a><div class='mod_txt'><h6><a target='_blank' href='/main/exam"+result[i][4]+".html'>"+unescape(result[i][1])+"</a> </h6><strong class='c_txt3'>"+result[i][0]+"</strong></div></div></li>";
                             else
                                html += "<li><em>"+(i+1)+"</em><h6><a title='"+unescape(result[i][1])+"' target='_blank' href='/main/exam"+result[i][4]+".html'><span>"+unescape(result[i][1])+"</span></a></h6><strong class='c_txt3'>"+result[i][0]+"</strong> </li>";    
                        }
                    }else 
                        html="";
                    $("#divbest").html(html);
                }
            }
			,
            error: function(e) { notice("请求错误",2); }
			,
            async: true,
            cache: false
        });
    }
    // 加入购物车
    function InsShop(id) {
        if(loginSate==1){
           setCookie("grade","1001",30);
           GetAllECart(1);
        }else {
            LoginTishi("您还没有登录，请先登录或注册优异网校免费会员再操作！");
        }
    }
    //立即购买
    function CourseSelect(){
	 	//套餐cookie
		var MyPackageIDCookie = getCookie('package');
		//班级cookie
		var MyGradeIDCookie = getCookie('grade');
	 	var pkgId="${pkgId}";
	 	if(pkgId==""){
	 		var myid=${g.gradeId};
	 		if(MyGradeIDCookie==''){
				setCookie('grade',myid,15);
			}else{
				setCookie('grade',MyGradeIDCookie+','+myid,15);
			};
			window.open("/cart/cartList");
	 	}else{
	 		myid=parseInt(pkgId);
	 		if(MyPackageIDCookie==''){
				setCookie('package',myid,15);
			}else{
				setCookie('package',MyPackageIDCookie+','+myid,15);
			};
			window.open("/cart/cartList");
	 	}
	} 
    //像老师提问
   function ShowAsk() {
        var content = "";
        if (payflag=="1") {
            content = "<div class=\"wsharebox\"><div class=\"Tinfo\"><div class=\"Tywen\">请写下您要问的问题：</div><div id=\"noteSay\" tid=\"title\" class=\"zishu\">还能输入 <span>50</span> 个字</div></div><div class=\"share_out share_outx\" style=\"height:40px;\"><textarea style=\"height:40px;background:url(about:blank)\" onblur=\"if(this.value==''){this.value='请简明清晰地提出您的疑问';this.style.color='#666'}\" onfocus=\"if(this.value=='请简明清晰地提出您的疑问'){this.value='';this.style.color='#666'}\" value=\"请简明清晰地提出您的疑问\" maxlen=\"100\" id=\"title\" name=\"title\"  onclick=\"if($(this).val()=='请简明清晰地提出您的疑问'){$(this).val('');}\">请简明清晰地提出您的疑问</textarea></div><div class=\"Tinfo\"><div class=\"Tywen\">请写下您的问题补充(选填)：</div><div id=\"noteSay\"  tid=\"wordSay\" class=\"zishu\">还能输入 <span>500</span> 个字</div></div><div class=\"share_out share_outx\"><textarea maxlen=\"1000\" id=\"wordSay\" name=\"word\"></textarea></div><div id=\"AskHelp\"></div><div class=\"share_action\"><span id=\"AskInto\" style=\"float:left;color:#ff0000\"></span><a class=\"num_ts\" href=\"javascript:;\" onclick=\"AddAsk()\" style=\"color:#fff\">提交问题</a></div><br clear=\"all\"></div>";
            askdialog = art.dialog({ id: "askdialog", content: content, lock: true, opacity: 0.1, padding: 0, title: "名师答疑", zIndex: 18008, fixed: true });
        }
        else {
            content = "<div class=\"wsharebox\"><div class=\"xsyy\"><span class=\"font14\"></span></div><div class=\"share_action\"><span id=\"AskInto\" style=\"float:left;color:#ff0000\"></span><a class=\"num_ts\" href=\"javascript:;\" onclick=\"AddAsk()\" style=\"color:#fff\">向学员提问</a></div><br clear=\"all\"></div>";
            art.dialog({ id: "deldialog", content: "<div style=\"white-space:nowrap;\">您还未购买本课程，不能使用名师答疑功能。<br><br>您也可以选择向其他学员提问。<form target=\"_blank\" id=\"RedoForm\" action=\"/search/UserCenter/task/Wenda/Ask.aspx?Types=5&CourseID=" + MyClassID + "&ClassID=" + ExamOlNum + "\" method=\"post\"></form></div>", button: [{ name: "向学员提问", callback: function() { $("#RedoForm").submit(); }, focus: true }, { name: "取消"}], lock: true, opacity: 0.1, icon: "question", zIndex: 18008 });
        }
    }
    //提交问题
     function AddAsk() {
        $("#AskInto").html("");
        var Score = 1;
        var Title = $("#title").val();
        if (StrLength(Title) > 100) { notice("问题标题请不要超过50字", 2); return; }
        if (StrLength(Title) < 10) { notice("请输入有意义的内容，长度不能小于10", 2); return; }
        if (Title == "请简明清晰地提出您的疑问") { notice("请输入有意义的内容", 2); return; }

        var Content = $(".wsharebox").find("#wordSay").val();
        loading("提交中。。。");
        $.ajax({
            type: "POST",
            url: "/search/UserCenter/task/Wenda/Ask.ashx",
            data: { Act: "AddAsk", ClassID: ExamOlNum, Types: 5, TypeID: MyClassID, Score: Score, Content: escape(Content), Title: escape(Title),Teacher:t_name },
            dataType: 'json',
            success: function(result) {
                dialoading.close();
                if (result.S == "1") {
                    askdialog.close();
                    succeed("发布成功，<a style=\"color:#336699\" target=\"_blank\" href=\"/search/UserCenter/task/Wenda/Answer.aspx?AskID=" + result.AskID + "\">点击查看问答详细</a>", 60);
                    //location.replace("succeed.asp?AskID="+result.AskID+"&ClassID="+result.ClassID);
                }
                else {
                    $("#AskInto").html(result.msg);
                }
            }
			,
            error: function(e) { /*notice("载入错误",3);错误处理*/ }
			,
            async: true,
            cache: false
        });
    }
	function StrLength(str){
		var i,sum;
		sum=0;
		for(i=0;i<str.length;i++){
			if ((str.charCodeAt(i)>=0) && (str.charCodeAt(i)<=255))
			sum=sum+1;
			else{
				sum=sum+2;
			}
		}
		return sum;
	}
	
  	function notice(content,t)
	{//提示框
		dianotice = art.dialog({id:"notice",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"warning",lock:true,opacity:0.1,time:t,title: false,fixed:true,zIndex : 18008});
	}
	
	function loading(content)
	{//提示框
		dialoading = art.dialog({id:"loading123",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"loading",cancel:false,title: false,fixed:true,zIndex : 18008});
	}
	//登录提示
	 function LoginTishi(content){
        playTipsObj = art.dialog({
            title: "温馨提示",
            content: " <div class=\"aui-boxt\">"+content+"</div>",
            zIndex: 18008,
            lock: true,
            resize: false,
            fixed: true,
            button:[{name:"立即登录",callback: function () {ShowLogin();}},{name:"立即注册",callback: function () {window.open("/user/register.jsp");}},{name:"取消"}]
        });
    }
	function succeed(content,t)
	{
		artdialog = art.dialog({id:"artdialog",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true,title: false,zIndex : 18008});
	}  
	function showRegbox(){
		$("#wxregistbox").load("/common/regist.jsp")
			var wxregistbox = art.dialog({ id: "wxregistbox", content: $("#wxregistbox")[0], lock: true, padding: 5, opacity: 0.5, fixed: true, title: "注册网校" });
			return false;
	}
     </script>
</body>
