<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link  href="/main/css/style.css" rel="stylesheet" type="text/css" ></link>
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
  	<#if list??>
  	<#list list as c>
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
   <#list c as cp>
   		<#if cp_index==0>
   		<tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6" rowspan="${c?size}">
    		<div class="kebuyjg"><img src="images/package_${cp.ptypeId?c}.gif"><div class="chose">80% 的人选择该课程<div class="chico"></div>
    			</div>
    		</div>
    	</td>
    	<td align="center" bgcolor="#f6f6f6"><a  href="javascript:;">${cp.pkgName}</a></td>
    	<td align="center" bgcolor="#f6f6f6"><#list cp.tch as st><a href="/main/teacher/teacher${st.tchId?c}.html"target="_blank">${st.tchName}&nbsp;</a></#list></td>
    	<td align="center" bgcolor="#f6f6f6">${cp.pkgTotalTime}</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">${cp.pkgRPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">${cp.pkgRPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="/main/audition?pkgId=${cp.pkgId?c}" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg1" onclick="CourseSelect(${cp.pkgId?c},this,0);" myclassid="${cp.pkgId?c}" Price="${cp.pkgRPrice?c }"></div></td>  
    </tr>
   		</#if>
   		<#if cp_index!=0>
   		<tr bgcolor="#AAE1DB" bordercolordark="#ffffff" bordercolorlight="#B9DBEA">
    	<td align="center" bgcolor="#f6f6f6"><a	href="javascript:;">${cp.pkgName}</a></td>
    	<td align="center" bgcolor="#f6f6f6"><#list cp.tch as st><a href="/main/teacher/teacher${st.tchId?c}.html"target="_blank">${st.tchName}&nbsp;</a></#list></td>
    	<td align="center" bgcolor="#f6f6f6">${cp.pkgTotalTime}</td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="OldPrice">${cp.pkgOPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"> <span class="GoodPrice">${cp.pkgRPrice?c}</span> </td>
    	<td align="center" bgcolor="#f6f6f6"><a href="/main/audition?pkgId=${cp.pkgId?c}" target="_blank" class="audition"><img src="images/st.gif"></a></td>
    	<td align="center" bgcolor="#f6f6f6"><div class="bmbg1" onclick="CourseSelect(${cp.pkgId?c},this,0);" myclassid="${cp.pkgId?c}" Price="${cp.pkgRPrice?c}"></div></td>
   		 </tr>
   		</#if>
   </#list>
  </#list>
  </#if>

      </tbody>
</table>