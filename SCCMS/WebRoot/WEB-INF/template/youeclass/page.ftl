<#-- 总页数，当前页 -->
<#macro pagination pageView>  
	<div class="pages">
		<label>共${pageView.totalpage}页，约${pageView.totalrecord}条数据</label>
		<#if pageView.currentpage != 1>
			<a href="javascript:pageinationView(1)" title="首页" class="nav"><span>首页</span></a>
			<a href="javascript:pageinationView(${pageView.currentpage - 1})" title="上一页" class="nav"><span>上一页</span></a>
		<#else>
			<span>首页</span>
			<span>上一页</span>
		</#if>
		<#list pageView.pageindex.startindex..pageView.pageindex.endindex as index>
	        <#if pageView.currentpage == index>
	        	<a href="#" class="current">${index}</a>
	        <#else>
	            <a href="javascript:pageinationView(${index})" title="第${index}页" >${index}</a>  
	        </#if>  
	    </#list>  
	    
		<#if pageView.currentpage != pageView.totalpage>
			<a href="javascript:pageinationView(${pageView.currentpage + 1})" title="下一页" class="nav"><span>下一页</span></a>
			<a href="javascript:pageinationView(${pageView.totalpage})" title="未页" class="nav"><span>未页</span></a>
		<#else>
			<span>下一页</span>
			<span>未页</span>
		</#if>
	</div>
	<script type="text/javascript">
		function pageinationView(pageNum) {
			document.getElementById("pageNum").value=pageNum;
			document.getElementById("pageinationForm").submit();
		}
	</script>
</#macro> 		