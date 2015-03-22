//��¼
 	function ShowLogin(){
		$("#wxlogbox").load("/common/login.jsp");
		var loginbox = art.dialog({ id: "loginbox", content: $("#wxlogbox")[0], lock: true, padding: 10, opacity: 0.5,top:'20%', fixed: true, title: "登录" });
		return false;
    }
   
    //ע��
   function showRegbox(){
		$("#wxregistbox").load("/common/regist.jsp");
		var wxregistbox = art.dialog({ id: "wxregistbox", content: $("#wxregistbox")[0], lock: true, padding: 5,top:'20%', width:'800px',opacity: 0.5, fixed: true, title: "注册" });
		return false;
   }
   //�˳�
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
    				notice("退出失败",2,100);
    			}
    		},
    		error:function()
    		{
    			notice("系统异常",2,100);
    		}
    		
    	});
    }
   $(function(){
	   $.ajax({
		   type:"POST",
		   url:"/user/checkStu",
		   dataType:'json',
		   success:function(data){
			   if(data.ok){
				   $("#loginbox").html('<div class="lgjg"><a href="/member/center" ><strong>'+data.name+'</strong></a>,您好! &nbsp;  <a href="/member/center" >个人中心</a> <a href="javascript:;" onclick="loginOut();">退出</a></div>');
			   }
		   }
	   });
   });