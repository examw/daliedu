<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优异网校-${pkgName}-${g.examCategory.examName}${g.gradeCategory.gtypeName}主讲:${g.teacher.tchName} - ${classDetail.classTitle}</title>
<link rel="stylesheet" type="text/css" href="/common/images/common.css">
<link href="/main/css/play.css" type="text/css" rel="stylesheet" />
<script src="../js/jquery-1.7.1.min.js" type="text/javascript"></script>
<script src="../js/jwplayer.min.js" type="text/javascript"></script>
<script type='text/javascript' src='/artDialog/jquery.artDialog.js?skin=blue'></script> 
<body>
<div class="top">
  <div class="harder">
    <div class="logo"><a href="javascript:;"><img src="/common/images/logo.png" alt="优异网校"/></a></div>
    <div style="z-index: 9999; position: relative;" class="logoFull">
        <div class="area">
            <div id="area-all">
                <ul>
                	<s:if test="#session.student==null">
                    <li><a id="registbox" onclick="showRegbox()" title="注册网校会员" href="javascript:;"><span class="wn">免费注册</span></a></li>
                    <li>|</li>
                    <li><a id="loginbox" onclick="ShowLogin()" title="登录网校" href="javascript:;">
                        <span class="wn">用户登录</span></a></li>
                    </s:if>
                    <s:else>
                    	<li style="color: #FFF;"><span class="wn">hi,<s:property value="#session.student.stuUsername"/>&nbsp;&nbsp;<em title="安全退出，保护您的帐号安全"
                        id="tuichu">退出</em></span></li>
                		<li>|</li>
                		<li><a class="cblue3" target="_blank" href="/memberCenter/member.jsp"><span class="wn"><strong>会员中心</strong></span></a></li>
                    </s:else>
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

<!--banner结束-->
<div class="videoBg">
<!--videoArea开始-->
	<div class="videoArea">
    <h1><span class="f14 fb whiteTxt fl">${examName}:${pkgName}${g.examCategory.examName}${g.gradeCategory.gtypeName}:</span><span class="mb10 orangeTxt fl">${classDetail.classTitle}</span>
    <span class="mb10 orangeTxt fl"><a id="hlkWideVedio" style="color: red;" href="/member/classroom?classId=${classDetail.classId}">&nbsp;&nbsp;三分屏</a>
    <a id="hlkAudio" style="color: red;" href="/member/classroomHD?classId=${classDetail.classId}">高清</a></span>
    <span class="fr whiteTxt">  <a class="paid"  onclick='CourseSelect();' >立即购买</a></span></h1>
    <!--videoFlash开始-->
    <div class="videoFlash">
    <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#f1f9fb">
            <tr>
                <td id="hdvplayer" style="width: 860px; height: 508px;">
                    <!-- <div id="playerContent" style="width: 100%; height: 100%;"> -->
                    <IFRAME id="playerContent" frameBorder=0 width="860" height="508"  scrolling="no"></IFRAME>
                    <!-- </div> -->
                </td>
                <td>
                </td>
            </tr>
        </table>
    </div>
    <!--videoFlash结束-->
     <!--videoFunction开始-->
 	<div class="videoFunction">
    <a href="javascript:void(0)" class="n_left" id="n_left">上一讲</a>
    <a href="javascript:void(0)" class="n_right" id="n_right">下一讲</a>
    <a href="javascript:void(0)" class="n_right"  id="treelist">目&nbsp;录</a>
    <a href="javascript:void(0)" id="donwloadbt" class="n_right"  style="font-weight: bold;">下&nbsp;载</a>
    <a onclick='CourseSelect();'  class="buyIt"></a>
    </div>
    <!--videoFunction结束-->
 	</div>  
 
    <div class="colist_c" id="MyChapter" style="display:none"></div>
    
    
    <div class="logingc" id="wxregistbox" style="height:530px;display:none;"></div>
    <div class="loginStr" id="wxlogbox" style="height:249px;display:none;"></div>
<div id="foot"></div>
</div>
<script type="text/javascript">
 	$(function(){
			//发送ajax请求,加载new.jsp信息
			$("#foot").load("/system/webInfo");
		});
		var examwplay;
		var gradeId="${g.gradeId}";
		var classId="${classDetail.classId}";
		var nextdid = "${nextId}";
		var lastdid = "${prevId}";
		var Playrecordstr = "";
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
		var userName ="<s:property value="#session.student.stuUsername"/>";
		var isMaxthon = navigator.userAgent.indexOf("Maxthon")>-1;


$(document).ready(function(){	
		    if(userName==""){
	    		loginSate=0;
	    	}else{
	    		loginSate=1;
	    	}
	    	GetChapterList();
	    	//播放记录
	    	LoadPlayrecords();
	    	//判断是否购买该课程
	    	 if(payflag==1){ 
            $(".paid,.buyIt").css("display","none");
            
        	}
	    	//购物车焦点触发事件
	    	$("#Myrecords1").hover(function() {
            if ($("#myshop").find("li").size() == 0) {
                $("#myshop").html("<li style=\"text-align:center; margin:30px 0px; \"><img src=\"/main/images/loading24.gif\"><\/li>");
                GetAllECart(0);
            } 
        	});
        	//注销
        	$("#tuichu").click(function(){
        		loginOut();
       
        	}); 
		
			if(HaveDetailTF==""){
			playTipsObj = art.dialog({
				title:"温馨提示",
				content:" <div class=\"aui-boxt\"><div class=\"aui_iconBgx\"></div><div class=\"bq\">本讲课程暂无内容，请稍后再来学习!</div></div>",
				zIndex : 18008,
				lock  : true,
				resize:false,
				fixed:true
			});
			}else{
			if(tingTF=="1"||payflag==1){
				StartPlay();
			}else{
				playTipsObj = art.dialog({
					title:"温馨提示",
					content:" <div class=\"aui-boxt\"><div class=\"aui_iconBgx\"></div><div class=\"bq\">抱歉！本讲课程为收费课程，请购买该课程后再来学习!<br>详情咨询：4000-525-585</div></div>",
					zIndex : 18008,
					lock  : true,
					resize:false,
					fixed:true
					});
				}
			}
		
		$("#n_right").click(function(){
			if(nextdid!=0)
				window.location = "/member/classroomHD?classId="+nextdid ;
			else 
				notice("没有下一讲了，请选择其它的课件学习！",3);   
		});
		$("#n_left").click(function(){
			if(lastdid!=0)				
				window.location = "/member/classroomHD?classId="+lastdid ;
			else 
				notice("没有上一讲了，请选择其它的课件学习！",3); 
		});	
		$("#treelist").click(function(){
			playTipsObj = art.dialog({
				title:"章节列表",
				content:$("#MyChapter")[0],
				zIndex : 18008,
				lock  : true,
				resize:false,
				fixed:true,
				padding:0
			}); 
		});
 
	});	 
	//目录
	function GetChapterList()
	{
		$("#MyChapter").html("<img src=\"../artDialog/skins/icons/loading.png\">");
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
					/* html = "<h3>"+MyClassCName+"（共"+result.length+"讲，已更新到第"+5+"章"+ ((2>0)?"课程录制中……":"更新完成")+"）</h3>"; */
					html+="</div>";
					html+="<div class=\"contant\"><div class=\"copli\" style=\"height:400px;margin:0px;padding:0px;\"><ul class=\"List\" style=\"height:390px;overflow:auto;margin:0px;padding:0px;width:100%\">";
					for (i=0;i<result.length;i++){
						childHtml="";
						/* if (result.List[i].List.length>0){
							for (n=0;n<result.List[i].List.length;n++){ */
								
								isFree=(result[i].classIfFree==1)?"<span class=\"free\">免费</span>":"";
								childListNO++;
								playIcon = "";
								if(result[i].classId==classId)
								{
									playIcon = "bg";
									temp = i;
								}
								//playIcon=result.List[i].List[n].classId==classId?'bg':'';
								lname = unescape(result[i].classTitle);
								lname= (StrLength(lname)-wordlength>0)?lname.substring(0,wordlength)+"...":lname;
								playIcon=childHtml+='<li><a href="/member/classroomHD?classId='+result[i].classId+'" title="'+unescape(result[i].classTitle)+'" classId="'+result[i].classId+'" class="'+playIcon+'"  target="_self"><span>'+(parseInt(childListNO)<10?"0"+parseInt(childListNO):parseInt(childListNO))+'、'+lname+'</span>'+isFree+'</a></li>';
							/*}
						 }else{
							childHtml='';
						} */
						if(childHtml==''){
							html+='<li style="display:none"><a class="expanded" ></a><ul class="navigation">'+childHtml+'</ul></li>';
						}else{
							html+='<li><a  ></a><ul class="navigation">'+childHtml+'</ul></li>';
						}
					}
					html+="</ul><div style=\"clear:both\"></div></div>";
					//html+="</ul><div style=\"clear:both\"></div></div></div>";
				}
				else
				{
					html = "<h3>"+MyClassCName+" 加载失败 <a href=\"javascript:;\" onclick=\"GetChapterList()\">点击重新加载</a>";
				}
				$("#MyChapter").html(html);
				$(".nav > li > a").click(function() {
					$(this).toggleClass('expanded').toggleClass('collapsed').parent().find('ul').slideToggle('medium');
				});
			},
			error: function (e) {/*错误处理*/},
			async:true,
			cache:false
		});
	}
	//播放记录
	function LoadPlayrecords() {
	    	if(loginSate==1){
	    		if (Playrecordstr == "") {
		       		$("#Playrecords").html('<div class="jltxt"><img src="../artDialog/skins/icons/loading.png"></div>');
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
                    taboy = "<li><a class='remove' href='javascript:;' onclick='removeAll()'>清除记录<\/a><\/li>"+taboy+"<li class='settl'><a href='/cart/cartList' class='set' target='_blank'>去购物车结算<\/a><\/li>";  
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
            LoginTishi("您还没有登录，请先登录或注册中华考试网免费会员再操作！");
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
  	//登录
 	function ShowLogin(){
		$("#wxlogbox").load("/common/login.jsp")
			var loginbox = art.dialog({ id: "loginbox", content: $("#wxlogbox")[0], lock: true, padding: 10, opacity: 0.5, fixed: true, title: "登录网校" });
			return false;
    }
    //注册
	function showRegbox(){
		$("#wxregistbox").load("/common/regist.jsp")
			var wxregistbox = art.dialog({ id: "wxregistbox", content: $("#wxregistbox")[0], lock: true, padding: 5, opacity: 0.5, fixed: true, title: "注册网校" });
			return false;
	}

	 //购买 
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
    //cookies
    function GetCookie(objName) {
    var arrStr = document.cookie.split("; ");
    for (var i = 0; i < arrStr.length; i++) {
        var temp = arrStr[i].split("=");
        if (temp[0] == objName) return unescape(temp[1]);
    }
    } 
    
    
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
	//播放器
	function StartPlay()
	{
		player = jwplayer("playerContent").setup({
			    flashplayer: '/js/player.swf',			   
                'file':HaveDetailTF ,
				width: '100%',
				height: '100%',
				controlbar: 'bottom',
				image:'/main/images/bg2.png',
				"skin":"/js/stormtrooper.zip",	
				provider: 'http',
				autostart: 'true',
				'stretching': 'fill'
            });
    
     	 
  /*    player =jwplayer('playerContent').setup({
    'flashplayer': '../js/player.swf',
    'file': '974775C2453576C5-1.flv',
    'streamer': 'rtmpt://192.168.1.236:5080/oflaDemo',
    'stretching': 'fill',
    'width': '862',
    'height': '510',
     dock: false 
  	}); */
			
	}
	//长度
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
	//提示框
  	function notice(content,t)
	{
		dianotice = art.dialog({id:"notice",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"warning",lock:true,opacity:0.1,time:t,title: false,fixed:true,zIndex : 18008});
	}
	//提示框
	function loading(content)
	{
		dialoading = art.dialog({id:"loading123",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"loading",cancel:false,title: false,fixed:true,zIndex : 18008});
	}
	//提示框
	function succeed(content,t)
	{
		artdialog = art.dialog({id:"artdialog",content:"<div style=\"white-space:nowrap;\">"+content+"</div>",icon:"succeed",lock:true,opacity:0.1,time:t,fixed:true,title: false,zIndex : 18008});
	}
</script>          
</body>
</html>
