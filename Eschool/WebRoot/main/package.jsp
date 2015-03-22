<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<script type="text/javascript">
	function MyPackageIDCookieTF(mid){
	if((","+MyPackageIDCookie+",").indexOf(","+mid+",")==-1){
		return false;
	}else{
		return true;
	}
	}
	$(function(){
	MyPackageIDCookie = getCookie('package');
	$(".bmbg1[myclassid]").each(function(){
		if( MyPackageIDCookieTF($(this).attr("myclassid")) == true){
			$(this).attr("class","bmbg2");
		}
	});	});	
</script>
<table border="0" cellpadding="0" cellspacing="1" bgcolor="#e6e6e6" width="100%">
  <tbody>
  <s:iterator value="p" var="c" status="status"><tr align="middle" class="tabbt">
      <td align="center" valign="middle">&nbsp;</td>
      <td align="center" valign="middle">课程专业名称</td>
      <td align="center" class="yellow">讲师</td>
      <td align="center" class="yellow">课时</td>
      <td align="center" class="yellow">原价</td>
      <td align="center" class="yellow">优惠价</td>
      <td align="center" valign="center" class="yellow">免费体验</td>
      <td align="center" valign="center" class="yellow">报名</td>
    </tr><s:iterator value="#c" var="cp" status="col"><s:if test="#col.getIndex()==0">
    <tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6" rowspan="<s:property value="#c.size" />">
    		<div class="kebuyjg"><img src="images/banji_20.gif"><div class="chose">80% 的人选择该课程<div class="chico"></div>
    			</div>
    		</div>
    	</td>
    	<td align="center" bgcolor="#f6f6f6"><a  href="javascript:;">${cp.pkgName}</a></td>
    	<td align="center" bgcolor="#f6f6f6"><s:iterator value="#cp.tch" var="st"><a href="/main/teacherShow?tchId=${st.tchId}"target="_blank">${st.tchName}&nbsp;</a></s:iterator></td>
    	<td align="center" bgcolor="#f6f6f6">${cp.pkgTotalTime}</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">${cp.pkgOPrice}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">${cp.pkgRPrice}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="/main/audition?pkgId=${cp.pkgId}" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg1" onclick="CourseSelect(${cp.pkgId},this,0);" myclassid="${cp.pkgId }" Price="${cp.pkgRPrice }"></div></td>  
    </tr></s:if> <s:else>
    <tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6"><a	href="javascript:;">${cp.pkgName}</a></td>
    	<td align="center" bgcolor="#f6f6f6"><s:iterator value="#cp.tch" var="st"><a href="/main/teacherShow?tchId=${st.tchId}"target="_blank">${st.tchName}&nbsp;</a></s:iterator></td>
    	<td align="center" bgcolor="#f6f6f6">${cp.pkgTotalTime}</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">${cp.pkgOPrice}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">${cp.pkgRPrice}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="/main/audition?pkgId=${cp.pkgId}" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg1" onclick="CourseSelect(${cp.pkgId},this,0);" myclassid="${cp.pkgId }" Price="${cp.pkgRPrice }"></div></td>
    </tr></s:else></s:iterator></s:iterator> 
    </tbody>
</table>
