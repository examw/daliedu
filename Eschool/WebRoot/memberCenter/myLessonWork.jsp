<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>我的作业</title>
<link type="text/css" rel="stylesheet" href="../images/Layout.css" />
<script language="javascript" src="../js/jquery-1.7.1.min.js"></script>
<script language="javascript" src="../js/UserLesson.js"></script>
<script type="text/javascript">
     $(function(){
      	$("#work_").addClass("hhover");
      });   
     
</script>
</head>
<body>
<%@include file="../common/memberHead.jsp"%>
<div class="center_ct01">
<div class="cut01 center"></div>
<div class="mainCut center">
<%@include file="../common/memberLeft.jsp"%>
<div class="RightList">
<p class="weizhi">当前位置：<a href="#">我的首页</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">课程作业</a>&nbsp;&nbsp;>&nbsp;&nbsp;<a href="#">我的作业</a></p>
<div class="List">
<ul>
<li class="wk_left">
<h1 class="MyWorkTop">
<span>
<ul>
<li id="xz">我的作业</li>
<li><a href="#">作业记录</a></li>
<li><a href="#">错题汇总</a></li>
</ul>
</span>
</h1>
<div class="Work">
<table cellspacing="0" cellpadding="0" border="0" width="515">
<tbody>
<tr>
   <td height="24" bgcolor="#f9f9f9" align="center" width="410" class="xxzx_ber_a"><strong>作业名称</strong></td>
   <td bgcolor="#f9f9f9" align="center" width="54" class="xxzx_ber_a"><strong>学&nbsp;分</strong></td>
   <td bgcolor="#f9f9f9" align="center" width="74" class="xxzx_ber_a"><strong>操&nbsp;作</strong></td>
</tr>
<s:iterator value="myLesson.classPackages" var="cp" status="col">
<tr>
   <td width="410" class="xxzx_ber_c font_14">
   &nbsp;<img name="myImg" id='img_${col.index+1}' alt="展开" src='../images/pic_011.gif' class="img_b"   onclick="showDivById('${col.index+1}','myDiv','myImg'),stra('${col.index+1}','查看详细','收&nbsp;起')"/>&nbsp;
          <a href="javascript:;"  onclick="showDivById('${col.index+1}','myDiv','myImg'),stra('${col.index+1}','查看详细','收&nbsp;起')" title='${cp.pkgName}'>${cp.pkgName}</a>
   </td>
   <td align="center" width="54" class="xxzx_ber_e font_12">
        
    </td>                            
    <td align="center" class="xxzx_ber_e font_a">
 		<a id='a${col.index+1}' class="disBtn"  name="aDis" href="javascript:;"   onclick="showDivById('${col.index+1}','myDiv','myImg'),stra('${col.index+1}','查看详细','收&nbsp;起')" >查看详细</a>
  </td>
</tr>
<tr>
   <td class="xxzx_ber_d font_14" colspan="6">
   <div name="myDiv" class="wzgk_oned center" id="${col.index+1}" style="display: none;">
   <table cellspacing="0" cellpadding="0" border="0" width="500">
   <tbody>
	<tr>
     <td bgcolor="#fff3db" align="center" width="410" style="line-height:26px;"><p class="back_g">课程名称</p></td>
     <td height="26" bgcolor="#fff3db" align="center" width="54" style="line-height:26px;">学&nbsp;分</td>
     <td height="26" bgcolor="#fff3db" align="center" width="74" style="line-height:26px;">操&nbsp;作</td>
   </tr>
   <s:iterator value="#cp.grade" var="g" status="status">
  	<tr>                                    
	<td  class="xxzx_ber_e font_14"> &nbsp;&nbsp;
       <a href='/member/myClass?gradeId=${g.gradeId}' title="${g.examCategory.examName}-${g.gradeCategory.gtypeName}">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a>
    </td>
    <td align="center"  class="xxzx_ber_e font_12">0</td>                          
    <td align="center" class="xxzx_ber_e font_12">
 		<a href="javascript:;">做作业</a>
  </td>
</tr>
   </s:iterator>
   </tbody>
   </table>
   </div>
  </td>
</tr> 
</s:iterator>
<s:iterator value="myLesson.grade" var="g" status="col">
<tr>                                    
	<td width="410" class="xxzx_ber_e font_14"> &nbsp;<img src="../images/pic_bh.gif">&nbsp;
       <a href="/member/myClass?gradeId=${g.gradeId}" title="${g.examCategory.examName}-${g.gradeCategory.gtypeName}">${g.examCategory.examName}-${g.gradeCategory.gtypeName}</a>
    </td>
    <td align="center" width="54" class="xxzx_ber_e font_14"> 0</td>                               
    <td align="center" width="74" class="xxzx_ber_e font_a">
 		<a href="/v_2012/usercenter/StudyCenter/myclass.aspx?code=${g.gradeId}">做作业</a>
  </td>
</tr>
  </s:iterator>
<!-- <tr>
   <td nowrap="nowrap" class="xxzx_ber_e font_14">&nbsp;
   <img src="../images/pic_bh.gif" class="img_b">&nbsp;
   <a href="/v_2012/usercenter/LessonWork/myClassWork.aspx?code=A555917158BAD9F5BF6B69B05941068D">
   建设工程经济--精华班</a>
   </td>
   <td align="center" class="xxzx_ber_e font_14">0</td>
   <td align="center" class="xxzx_ber_e font_14">
   <p class="x_ks"><a href="/v_2012/usercenter/LessonWork/myClassWork.aspx?code=A555917158BAD9F5BF6B69B05941068D" style="font-size:12px;">做作业</a></p>
   </td>            
</tr> -->
                                  
</tbody>
</table>
</div>
</li>
<li class="wk_right">
<span class="Tip center">
<p class="TipTitle">作业小贴士:</p>
<p>1. 作业只保存到课程结束，重要问题请注意留档。</p>
<p>2. 作业具体到课程的每一讲，有些课程的某些章节可能没有作业。。</p>
<p>3. 建议先学习然后再做作业 ，否则所做的作业没有学分</p>
</span>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">建设工程经济</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">建设工程项目管理</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">建设工程法规相...</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">专业工程管理实...</a></h2>
<h2><img src="../images/pic_bh.gif" width="18" height="15" /> <a href="#">专业工程管理实...</a></h2>
</li>
</ul>
</div>
</div>
</div>
<%@include file="../common/memberBottom.jsp"%>
</div>
</body>
</html>
