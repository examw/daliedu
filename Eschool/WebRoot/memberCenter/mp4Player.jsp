<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head id="Head1">
    <title>${g.examCategory.examName}-${g.gradeCategory.gtypeName}</title>
    <link href="../css/mp4player2.css" rel="stylesheet" type="text/css" />
    <link href="../css/base.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
    .lecture_centenr{height:600px;}
    .conter{height:540px;}
    .ctr_tab{height:317px;}
    .tab_nr{height:280px;}
    .player_r_chat{height:270px;}
    #msgList{height:120px;}
    .tab_bt ul li{width: 57px;}
    .nr_kttw input{width:208px;}
    .chatie6{_width:200px;}
    </style>
    <script type="text/javascript">window.UEDITOR_HOME_URL= "/ueditor/"</script>
	<script src="../js/jquery-1.4.3.js" type="text/javascript"></script>
	<script type="text/javascript" src="/ueditor/editor_config.js"></script>
	<script type="text/javascript" src="/ueditor/editor_all.js"></script>
  
	</head>
<body>
<div class="aspNetHidden">
<input type="hidden" name="__VIEWSTATE" id="__VIEWSTATE" value="/wEPDwUKLTIxODU3MDE1NGRky/y6RHCBG+nvQ8hWSAcxcUjctmHD1PVur0Wka4Kc4p8=" />
</div>

<div class="aspNetHidden">

	<input type="hidden" name="__EVENTVALIDATION" id="__EVENTVALIDATION" value="/wEWBgK18PXpDAKH38V4Auv3gd4CArLHh9sGAuLN0/8JAqmHj5oGTg3X1Mikl+elR8hggwVQhlRrlZ6l8uiOWLqbv68rYqE=" />
</div>
    <!--顶部-->
    <div class="min_navbox">
        <div class="min_nav center">
            <ul>
                <li class="m_n_1" title="中华考试网"></li>
                <li class="m_n_2">
                    <dl>
                        <dt id="classInfo">
                            <span id="lblClassInfo">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</span></dt>
                        <dd id="relateTitle">
                        	${classDetail.classTitle}
                            </dd>
                    </dl>
                </li>
                <li class="m_n_3">
                    <dl>
                        <dd>
                            <a href="/member/center">返回学习中心</a></dd>
                    </dl>
                </li>
            </ul>
        </div>
    </div>
    <!--顶部结束-->
    <!--讲课-->
    <div class="lecture center">
        <span class="lecture_span">
            <dl>
                <dt>主讲：<a id="hlkTeacherName" style="color: red" href="/main/teacherShow?tchId=${g.teacher.tchId}" target="_blank">${g.teacher.tchName}</a>老师</dt>
                <dd class="ddx_8">
                    <a href="javascript:;" class="banzhuren">在线班主任</a>
                </dd>
                <dd class="ddx_7">
                        <a id="hlkEvaluate" href="/web_teacher/teachershow.asp?id=682" target="_blank">我要评价</a></dd>
            </dl>
        </span>
        <div class="lecture_centenr" style="border-top: 0px;">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="top" id="videoLeft" width="260px;">
                        <ul>
                            <li class="ctr_left">
                                <div class="ctr_bt">
                                    请选择合适的听课模式：
                                    <a id="hlkWideVedio" href="/member/classroom?classId=${classId}">三分屏</a>
                                    <a id="hlkAudio" href="/member/classroomHD?classId=${classId}">高清</a>
                                </div>
                                <div class="ctr_video">
                                    
                                    <div id="playercontiner">
                                    </div>
                                </div>
                                <div class="ctr_tab">
                                    <span class="tab_bt">
                                        <ul class="tab_ul">
                                            <li class="xz">小节</li>
                                            <li>目录</li>
                                            <li>答疑</li>
                                            <li style="border-right: 0px; width: 64px;">班主任</li>
                                        </ul>
                                    </span>
                                    <div class="tab_nr">
                                        <ul class="nr_bzxj" id="partList">
                                        	<s:iterator value="classDetail.lect" var="lect" status="col">
                                        	<s:if test="#col.getIndex()==0">
                                        		 <li>
                                              	<a href="javascript:void(0);" class="hover" partid='${lect.lectId}' chapterid='0' target="rightmain" onclick="seekPlay(${lect.lectTimePoint},${lect.lectId})">${lect.lectTitle}</a>
                                              </li> 
                                        	</s:if><s:else>
                                        	 <li>
                                              	<a href="javascript:void(0);" class="" partid='${lect.lectId}' chapterid='0' target="rightmain" onclick="seekPlay(${lect.lectTimePoint},${lect.lectId})">${lect.lectTitle}</a>
                                              </li> 
                                        	</s:else>
                                              
                                            </s:iterator>                       
                                        </ul>
                                    </div>
                                    <div class="tab_nr" style="display: none; position: relative;">
                                        <ul id="relateList">
                                            <li class="nr_ktml">
                                                <ul>   
                                                  <s:iterator value="g.classDetails" var="cd" status="col"> 
                                                  		<s:if test="#col.getIndex()<9">
                                                        <li><a href="/member/classroom?classId=${g.itemId }_${cd.classId}" class="relatetitle" id="" title="${cd.classTitle}">第0${col.index+1}讲：${cd.classTitle}</a></li>
                                                        </s:if>
                                                        <s:else>
                                                        <li><a href="/member/classroom?classId=${g.itemId }_${cd.classId}" class="relatetitle" id="" title="${cd.classTitle}">第${col.index+1}讲：${cd.classTitle}</a></li>
                                                        </s:else>
                                                  </s:iterator>    
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab_nr" style="display: none;_width:220px;">
                                        <ul id="addQuestion">
                                            <li class="nr_kttw center">
                                                <div class="title">
                                                    <label for="questionTitle">
                                                        请输入标题：</label><span id="quesMsg" style="color: red;"></span></div>
                                                <div>
                                                    <input id="questionTitle" type="text" /></div>
                                                <div class="title">
                                                    问题详细描述：</div>
                                                <div>
                                                    <textarea id="questionContent" cols="50" rows="10"></textarea></div>
                                                    <script type="text/javascript">
								   						var editor;
								        				editor = new UE.ui.Editor( { 
								           				toolbars:[['bold', 'italic', 'underline', 'strikethrough','removeformat','forecolor']],
								            			initialContent:"",
								             			initialFrameWidth:215,
								        				initialFrameHeight:110,
								        				elementPathEnabled:false,
								        				focus:true
								        				//pasteplain:true        //纯文本粘贴
								        				} );
								        				editor.render('questionContent');
														</script> 
                                                <div class="kttw_spc" id="addQuesBtnContainer">
                                                    <button type="button" onclick="addQuestion()">
                                                    </button>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="tab_nr" style="display: none;">
                                        <div class="player_r_chat" style="width: 232px;" id="chat">
                                            <div class="chat_layera" style="display: none;">
                                                <span>
                                                    <dl>
                                                        <dt class="chat_layeradt">
                                                            <dl>
                                                                <dt><em></em></dt>
                                                                <dd>
                                                                    在线<em></em></dd>
                                                            </dl>
                                                        </dt>
                                                        <dd class="chat_layeradd" title="关闭">
                                                        </dd>
                                                    </dl>
                                                </span>
                                                <div class="chat_y">
                                                    <ul>
                                                        <li class="yh_bt">班主任</li>
                                                        <li id="teacherList">
                                                        </li>
                                                        <li class="yh_bt">在线同学</li>
                                                        <li id="classmateList">
                                                        </li>
                                                    </ul>
                                                </div>
                                            </div>
                                            <span class="player_r_cspan">
                                                <dl>
                                                    <dd class="dd_1">
                                                    </dd>
                                                    <dd class="dd_2">
                                                        聊天<em></em></dd><dd class="dd_3" id="c_t_name"></dd><dd class="dd_4" style="float: right;"></dd></dl>
                                            </span>
                                            <div id="msgList">
                                            </div>
                                            <textarea name="" cols="" rows="" class="par_wbb" id="txtMsg" style="padding: 3px"></textarea>
                                            <span class="player_r_bspan">
                                                <dl>
                                                    <dt></dt>
                                                    <dd style="float: right; margin-right: 10px;">
                                                        <button type="button" class="anniu" title="发送" onclick="chat_send()">
                                                        </button>
                                                    </dd>
                                                </dl>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li class="ctr_right"><span class="ctr_sj"></span></li>
                        </ul>
                    </td>
                    <td valign="top">
                        <div class="conter_box">
                            <span class="span_bt">
                                <h1>
                                    <em>
                                        <a href="javascript:void(0);" id="hlkExercise" style="color:gray;">课堂练习</a>
                                        [<a id="hlkMediaDown" class="thickbox" href="javascript:;showDenyInfo()">下载课件</a>]
                                        [<a id="hlkNoteDown" class="thickbox" href="javascript:;showDenyInfo()">下载讲义</a>]
                                        [<span style="cursor: pointer" onclick="top.rightmain.webPrint();">打印</span>]</em>
                                        <label onclick="loadRelateNote()" style="cursor:pointer" title="点击切换到讲义">讲义</label></h1>
                            </span>
                            <div class="conter" style="border-top: 0px;">
                            		<input type="hidden" value="${classDetail.classId}" id=classId>
      								<iframe id="rightmain" src="/memberCenter/lecture/lecture${classDetail.classId}.html" noteurl="/member/lectureList?classId=${classDetail.classId}" name="rightmain" width="100%" height="100%"
                                    style="background: white;" title="课堂讲义" frameborder="0"></iframe>
                            </div>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
    <!--讲课结束-->
    <!--浮动条-->
    <div class="floating_box">
        <div class="floating center">
            <dl>
                <dt class="floating_left">
                    <ul>
                        <li><a id="hlkQuestionCenter" href="#" target="_blank">答疑中心</a></li>
                        <li><a id="hlkBookShop" href="#" target="_blank">考试书店</a></li>                       
                        <li><a id="hlkOnlineExam" href="#" target="_blank">在线模考</a></li>
                        <li><a href="javascript:void(0);" onclick="openCalculater();return false;">计算器</a></li>
                        <li style="margin-top:10px;margin-left:10px;">
                            <!--JiaThis Button BEGIN -->
                            <div id="ckepop">
	                            <a href="http://www.jiathis.com/share" class="jiathis jiathis_txt" target="_blank"><img src="http://v2.jiathis.com/code_mini/images/btn/v1/jiathis1.gif" border="0" /></a>
                            </div>
                            <script type="text/javascript" src="http://v2.jiathis.com/code_mini/jia.js" charset="utf-8"></script>
                            <!-- JiaThis Button END -->
                        </li>
                    </ul>
                </dt>
            </dl>
        </div>
    </div>
     <input type="hidden" id="timer"/>
    <!--浮动条结束-->
    <div id="back">
    </div>
    <!--底部内容-->
    <div  id="foot">
    <iframe 
		src="http://www.youeclass.com/common/foot2.html" frameborder="0" height="px" scrolling="auto" width="100%" noresize="noresize">
	</iframe>
    </div>
    <!--底部内容结束-->
    <input type="hidden" name="relateid" id="relateid" value="129819" />
    <input type="hidden" name="userid" id="userid" value="8699115" />
    <input type="hidden" name="markTime" id="markTime" value="2.09" />
    <input type="hidden" name="exerciseState" id="exerciseState" />
    <input type="hidden" name="commentType" id="commentType" value="3" />
    <input type="hidden" id="lessonUp" value="700" />
    <input type="hidden" id="lessonTop" value="702" />
<script src="../js/jwplayer.min.js" type="text/javascript"></script>
<script src="../js/thickbox_original.js" type="text/javascript"></script> 
<script type="text/javascript">
       var playerid = "playercontiner",
        player = jwplayer(playerid),
        fileUrl = "${classDetail.classHdUrl}",
        standbyFileUrl = "${classDetail.classHdUrl}",
        comefrom = 2;
    function playerSetup() {
        player.setup({
            'flashplayer': '/js/player.swf',
            'file':  location.hash.indexOf("standbyserver")>0 ? standbyFileUrl : fileUrl,
            'controlbar': 'bottom',
            'width': '100%',
            'height': '225',
            'provider': 'http',
            'autostart': 'true',
            'stretching': 'fill',
            "skin":"/js/stormtrooper.zip"	          //fill:画面填充窗口，custom:自定义画面大小
            //'videowidth': '240',
            //'videoheight': '180',
           /*  'lastposition': $("#markTime").val(), //最后播放位置
            'logovisible':logovisible+"" */
        }).onReady(function () {
            playReady();
        }).onPlay(function (state) {
            playing();
        }).onIdle(function () {
            changeMarkTime(true);
            //$.get(ajaxUrl, { 'cmd': 'addHistory' }, function (data) { });
        }).onComplete(function () {
            onComplete();
        }).onError(function () {
            onError();
        });
    }
    playerSetup();
    
    function addQuestion() {
    if ($.trim($("#questionTitle").val()) == "") {
        $("#questionTitle").css("border-color", "red").keyup(function () { $(this).css("border-color", "") });
        return;
    }
    if (editor.getContent() == "") {
        showQuesMsg("请输入内容！");
        return;
    }
    var pathStr = "${g.examCategory.examName}>${g.examCategory.examName}${g.gradeCategory.gtypeName} > ${classDetail.classTitle} > 视频讲座";
    var data1 = {"examId":"${g.examCategory.examPid}","gradeId":"${g.gradeId}",
        			"classId":"${classDetail.classId}","questionSource":1,
        			"questionTitle":$.trim($("#questionTitle").val()),"questionContent":editor.getContent(),"questionPath":pathStr
        			};
     $.ajax({
        async:true,
        url:"/member/addQuestion",
        type:"POST",
        data:data1,
        success:function(data){
        	if(data)
        	{
        		 $("#questionTitle").val("");
            	 editor.setContent("");
           		 showQuesMsg("<img src='/images/confirm_01.gif' width='15' height='15' align='absmiddle' /> 添加成功");
        	}
        	},
        error:function(){ showQuesMsg("服务器繁忙，请稍后再试！");}
        });   			
	}
	function showQuesMsg(msg) {
	    $("#quesMsg").html(msg);
	    setTimeout("$('#quesMsg').html('')", 1000 * 3);
	}
	</script>
       
<script src="../js/player.js" type="text/javascript"></script>
<script type="text/javascript">
    /*页面效果*/
    $(function () { $(".buttom_one span").toggle(function () { $(this).addClass("xz"); $(".player_right").hide(); }, function () { $(this).removeClass("xz"); $(".player_right").show(); }); });
    $(function () { $(".chat_layeradt").hover(function () { $(".player_r_xz").show(); }, function () { $(".player_r_xz").hide(); $(".player_r_xz").hover(function () { $(".player_r_xz").show(); }, function () { $(".player_r_xz").hide(); }); }); });
    $(function () { $(".dd_2").bind("click",function () {if(hasTeacher) $(".chat_layera").show(); }); $(".chat_layeradd").click(function () { $(".chat_layera").hide(); }); });
    $(function () { $(".biaoqing").click(function () { $(".player_r_biaoqing").show(); }); $(".player_r_biaoqing").hover(function () { $(".player_r_biaoqing").show(); }, function () { $(".player_r_biaoqing").hide(); }); });
    $(function () {
        $(".kc").toggle(
		function () {
		    $(this).addClass("xz");
		    $(this).parent().next().children("ul").slideUp(200);
		},
		function () {
		    $(this).removeClass("xz");
		    $(this).parent().next().children("ul").slideDown("slow");
		});
    });
    $(function () {
        $(".start dt,.start dd").click(function () {
            $(".start").hide();
            $(".starta").show();
            $(".centent").hide();
        });
        $(".starta dt,.starta dd").click(function () {
            $(".starta").hide();
            $(".start").show();
            $(".centent").show();
            if($("#commentlist").html().length<30)
                loadComment();
        });
        $(".start dt").click();
    });
    var comeFrom =1;
    $(function () {
        $(".banzhuren").bind("click",function() {
            if(hasTeacher){
                $(".tab_bt .tab_ul li").last().click();
                $(".dd_2").click();
            }
        });
        $("#hlkExercise").click(function () {
            if(comefrom==1||comefrom==3) {
                loadExercise('rightmain');
            } else {
                showDenyInfo();
            }
        });
        $.each($(".tab_bt .tab_ul li"), function (i, li) {
            $(this).click(function () {
                if((i>1&&comeFrom==2 )||(comeFrom==3&&i>1)){
                    showDenyInfo();
                    return ;
                }
                $(".tab_ul li").removeClass("xz");
                var divList = $(".tab_nr");
                divList.hide();
                if(i!=3||(i==3&&hasTeacher))divList.eq(i).show();
                $(this).addClass("xz");
                if (i == 1) relateScrollSync();
                if (i == 3 && hasTeacher) start_chat();
            });
        });
    });
   
    $(function () {
        $(".ctr_sj").toggle(
		    function () {
		        $(this).addClass("xz");
		        $(".ctr_left").css({"margin-left":-1000});
                $("#videoLeft").css("width","1px");
		    },
		    function () {
		        $(this).removeClass("xz");
		        $(".ctr_left").css({"margin-left":0});
                $("#videoLeft").css("width","260px");
		});
    });
    function loadRelateNote(){
        var frame = $("#rightmain");
        if(frame.attr("src").indexOf("?time=")<0){
            frame.attr("src",frame.attr("noteurl")+"?time="+new Date().getTime());
        };
    };
</script>
<script type="text/javascript">
	var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
	document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<script type="text/javascript">
try {
var pageTracker = _gat._getTracker("UA-7275494-4");
pageTracker._addOrganic("soso", "w");
pageTracker._addOrganic("sogou", "query");
pageTracker._addOrganic("yodao", "q");
pageTracker._addOrganic("baidu", "word");
pageTracker._initData();
pageTracker._trackPageview();
} catch(err) {}</script>
</body>
</html>
