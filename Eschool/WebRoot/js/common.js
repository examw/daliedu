//执行ajax请求
function exeAjaxCmd(cmd,data,callback){
	$.ajax({
		url:"/functions/ajax.asp?cmd="+cmd,
		data:data,
		beforeSend:Pop.pre,
		error: function(){
			Pop.pre("对不起，加载失败");
		},
		success:function(data){
			Pop.close();
			if(callback)
				callback(data);
		}
	});
}
//弹窗
var Pop = {
	init:function(){
		var pop_back = $("<div class='pop_back' id='pop_back'></div>").appendTo($("body"));
		if(Pop.ifmBack||($.browser.msie&&$.browser.version==6)) 
			pop_back = pop_back.add($("<iframe class='pop_back' id='pop_back_ifm'></iframe>").appendTo($("body")));
		pop_back.click(Pop.close);
		$("<div class='pop_box' id='pop_box'>"+
			"<span class='btncls' id='btncls'><img src='../images/fd_02.gif' onclick='Pop.close()' /></span>"+
			"<div class='title' id='pop_title'></div>"+
			"<div id='pop_content'></div></div>").appendTo($("body"));
		return Pop;
	},
	pre:function(pre){
		Pop.show("努力加载中，请稍后","<div class='pop_pre' id='pop_pre'>"+(typeof pre == "string"?pre:"<img src='../images/loading.gif' />")+"</div>",400);
		return Pop;
	},
	show:function(title,content,width,height){
		$("#pop_back").show().css({height:Math.max.apply( Math, [$("body").height(),$("html").height(),getWinHeight()])});
		Pop.title(title).content(content);
		$("#pop_box").show().css({
			"width":width,
			"height":height,
			"margin-left":-width/2,
			"margin-top":-$("#pop_box").height()/2,
			"top":getWinHeight()/2+Math.max($("body").scrollTop(),$("html").scrollTop())-20
		});
		return Pop;
	},
	title:function(title){ $("#pop_title").html(title);return Pop;},
	content:function(content){ $("#pop_content").html(content);return Pop;},
	close:function(backStay){
		$("#pop_box").hide();
		if(backStay!=true)
			$("#pop_back,#pop_back_ifm").hide();
		return Pop;
	},
	ifmBack:true		//ifame遮罩
};
//登录窗体
var LoginBox = {
	show:function(success,error,loginToNet){
		exeAjaxCmd("showLoginBox",{"from":location.href},function(data){
			Pop.show("您需要登录才可以继续",data,477);
			LoginBox.code();
			if(success) LoginBox.success = success;
			if(error) LoginBox.error = error;
			if(loginToNet!==undefined) LoginBox.loginToNet = loginToNet;
		});
	},
	close:Pop.close,
	code:function(){
		var m = Math.random()+"";
		$("#rndcode").text(m.substring(m.length-4));
	},
	login:function(){
		var error = function(input){
			input.css("border-color","red");
			input.focus();
			return false;
		};
		if($("#txtname").val()==""){
			return error($("#txtname"));
		}else if($("#txtpass").val()==""){
			return error($("#txtpass"));
		}else if($("#txtrnd").val()==""){
			return error($("#txtrnd"));
		}
		else{
			login($("#txtname").val(),$("#txtpass").val(),LoginBox.success,function(){
				$("#red").html("登录失败，请检查您的用户名和密码！");
				if(typeof LoginBox.error == "function")
					LoginBox.error();
				LoginBox.code();
			},LoginBox.loginToNet);
		}
	},
	success:function(uid){location.href=location.href;},
	error:function(){},
	loginToNet:false	//是否登录到.net系统
};
//登录方法name:用户名,pass:密码,success:登录成功调用函数，error:登录失败,toNet:是否登录到.net系统
function login(name,pass,success,error,toNet){
	$.get("/login.asp",{"username":name,"pwd":pass},function(info){
			if(info=="error"){
				if(typeof error=="function")
					error();
			}
			else if(info=="success"){
				exeAjaxCmd("getUserId",{time:new Date().getTime()},function(uid){
					if(toNet){
						$.get("/v_2012/usercenter/login.aspx?param1=vCheck",{code:getCookie("UserState"),url:location.href},function(){
							if(typeof success == "function")
								success(uid);
						});
					}else{
						if(typeof success=="function")
							success();
					}
				});
			}
		}
	);	
}
/*=======初始化环境=====*/
(function init(){
	if(!document.getElementById("commoncss"))
		loadCss("../css/common.css",null,"commoncss");
	try{
		jQuery();
		Pop.init();
	}
	catch(ex){
		loadJS("/js/jquery.js",Pop.init);
	}
})();
/*=========辅助函数===========*/
//获取网页可视高度
function getWinHeight(){
	return window.innerHeight?window.innerHeight:document.documentElement.offsetHeight-5;
}
//获取cookie
function getCookie(sMainName, sSubName){
    var re = new RegExp((sSubName ? sMainName + "=(.*?&)*?" + sSubName + "=(.*?)(&|;)" : sMainName + "=(.*?);"), "i");
    return re.test(unescape(document.cookie)) ? (sSubName ? RegExp["$2"] : RegExp["$1"]) : "";
}
function loadJS(url, callback, charset) {
    var script = document.createElement('script');
    script.onload = script.onreadystatechange = function () {
        if (script && script.readyState && /^(?!(?:loaded|complete)$)/.test(script.readyState)) return;
        script.onload = script.onreadystatechange = null;
        script.src = '';
        script.parentNode.removeChild(script);
        script = null;
        if (callback) callback();
    };
    script.charset = charset || document.charset || document.characterSet;
    script.src = url;
    try { document.getElementsByTagName("head")[0].appendChild(script); } catch (e) { }
}
function loadCss(url,callback,id) { 
     var html_doc = document.getElementsByTagName('head')[0]; 
     var css = document.createElement('link'); 
     css.setAttribute('rel', 'stylesheet'); 
     css.setAttribute('type', 'text/css'); 
     css.setAttribute('href', url);
	 css.id = id;
     html_doc.appendChild(css); 
     css.onload=css.onreadystatechange = function () { 
        if (css && css.readyState && /^(?!(?:loaded|complete)$)/.test(css.readyState)) return;
		css.onload=css.onreadystatechange=null;
		css = null;
		if(callback) callback();
     } 
     return false; 
 } 