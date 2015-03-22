<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:iterator value="list" var="c">
<table border="0" cellpadding="0" cellspacing="1" bgcolor="#e6e6e6" width="100%">
  <tbody id="c1">
    <tr align="middle" class="tabbt">
      <td align="center" valign="middle">&nbsp;</td>
      <td align="center" valign="middle">课程专业名称</td>
      <td align="center" class="yellow">讲师</td>
      <td align="center" class="yellow">课时</td>
      <td align="center" class="yellow">原价</td>
      <td align="center" class="yellow">优惠价</td>
      <td align="center" valign="center" class="yellow">免费体验</td>
      <td align="center" valign="center" class="yellow">报名</td>
    </tr>
    <tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6" rowspan="7">
    		<div class="kebuyjg"><img src="images/banji_20.gif">
    			<div class="chose">80% 的人选择该课程<div class="chico"></div>
    			</div>
    		</div>
    	</td>
    	<td align="center" bgcolor="#f6f6f6">
    		<a target="_blank" href="http://wx.233.com/search/UserCenter/study/Class.asp?mid=9581&DoMain=jzs1">全科VIP保过班(建筑工程+三门公共课)（送教材）</a></td><td align="center" bgcolor="#f6f6f6"> 宋协清等 </td>
    		<td align="center" bgcolor="#f6f6f6"> 355</td>
    		<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">￥4000</span> </td>
    		<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">￥2100</span> </td>
    		<td align="center" bgcolor="#f6f6f6"><a href="http://wx.233.com/search/UserCenter/play/?mid=8023" target="_blank" class="audition"><img src="images/st.gif"></a></td><td align="center" bgcolor="#f6f6f6">
    			<div class="bmbg" onclick="CourseSelect(9581,this);" myclassid="9581" Price="2100"></div></td>
    </tr>

    <tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6">
    		<a target="_blank" href="http://wx.233.com/search/UserCenter/study/Class.asp?mid=9582&DoMain=jzs1">全科VIP保过班(机电工程+三门公共课)（送教材）</a></td>
    	<td align="center" bgcolor="#f6f6f6"> 朱文艺等 </td>
    	<td align="center" bgcolor="#f6f6f6"> 356</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">￥4000</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">￥2100</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="http://wx.233.com/search/UserCenter/play/?mid=8024" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg" onclick="CourseSelect(9582,this,0);" myclassid="9582" Price="2100"></div></td>
    </tr>

  </tbody>
 
</table>
</s:iterator>