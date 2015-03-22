<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<div class="kccon">
    <ul><#list list as exam>
    	<#if exam_index==0>
    	<li>
    		<div class="kcb1"><a href="javascript:;" target="_blank">${exam.examName}</a></div>
        	<div class="kcb2"><div style="float:left;"><#list exam.getChildren() as c><#if (c_index+1<7)><a href="/main/exam${c.examId?c}.html" >${c.examName}</a>&nbsp;&nbsp;&nbsp;&nbsp;</#if></#list></div>
        	<#if (exam.getChildren()?size>6)>
         		<div  onmousemove="onMous('id${exam_index+1}')" onmouseout="onOver('id${exam_index+1}')" style="position:relative;z-index:2;float:right;">
	            	<a href="#" style="color:#f63;" title="更多;&gt;">更多&gt;&gt;</a> 
	            	<div class="gcglsw" id="id${exam_index+1}" >
	           			<div class="gcglsw3" >
	           				<#list exam.getChildren() as c><#if (c_index+1>=7)><a href="javascript:return%20false;" href="/main/exam${c.examId?c}.html"> ${c.examName}</a></#if></#list>
	           			</div>
		  			</div>
		  		</div>
		  	</div>
		  	</#if>  	
		</li>
		</#if>
		</#list>
     </ul>
</div>
