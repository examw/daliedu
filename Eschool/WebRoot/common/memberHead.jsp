<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<script type="text/javascript">
	function loginOut()
	{
		//登出
		$.ajax({
    		async:true,
    		type:"POST",
    		dataType:'json',
    		url:"../user/loginOut",
    		success:function(data)
    		{
    			if(data)
    			{

    				window.location="/"; //回首页

    			}else
    			{
    				alert("退出失败");
    			}
    		},
    		error:function()
    		{
    			alert("系统异常");
    		}
    		
    	});
	}
</script>
    <div class="center_nav nav_main center">
        <ul class="nav_chn">
            <li id="logo"><a href="#"><img height="36" src="../images/wxzx.gif"
            width="155"></a></li>

            <li class="nhover"><a href=
            "../member/center">我的首页</a></li>


            <li><a href="/">报名中心</a></li>


            <li><a href="../member/myQuestion">学习答疑</a></li>


            <li><a href="/">网校首页</a></li>

        </ul>
        <div class="nav_right">
            <div class="login">
                欢迎您 &nbsp;<span >${student.stuUsername }&nbsp;&nbsp;</span>| <a href="../memberCenter/info.jsp">设置</a> | <a href=
                "javascript:;" onclick="loginOut();">退出</a>
            </div>

            <!-- <div class="search">
                <span>搜索:</span>
                <h2><input name="Keyword" type="text"> <img src=
                "../images/search.gif"></h2>
            </div> -->
        </div>
    </div>