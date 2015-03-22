<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>优异网校一级建造师网校：一级建造师培训|一级建造师培训班|一级建造师考前培训</title>
<meta name="keywords" content="一级建造师网校" />
<meta name="description" content="中国最专业的一级建造师网校为您提供专业考试辅导，名师授视频授课，报名条件，报名时间，成绩查询，考试资讯，历年试题，辅导资料等信息" />
<link href="/youeclass/css/style_jianzhu.css" rel="stylesheet" type="text/css" />
<link href="/youeclass/css/zixunstyle.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="/youeclass/js/style.js"></script>
<script src="/youeclass/js/jquery-jzgc.js" type="text/javascript"></script>
<script language="javascript">
  function switchmodTag(modtags,modcontents,modks,mstars,mends,css01,css02,bcss) {
    for(is=mstars; is <=mends; is++) {
      if (is==modks) {
        document.getElementById(modtags+is).className=(css01);document.getElementById(modcontents+is).className=(bcss);}
      else {
		document.getElementById(modtags+is).className=(css02);document.getElementById(modcontents+is).className="shownones";}
    }
  }
</script>
<SCRIPT type=text/javascript>
var $ = function (id) {
	return "string" == typeof id ? document.getElementById(id) : id;
};
var Extend = function(destination, source) {
	for (var property in source) {
		destination[property] = source[property];
	}
	return destination;
}
var CurrentStyle = function(element){
	return element.currentStyle || document.defaultView.getComputedStyle(element, null);
}
var Bind = function(object, fun) {
	var args = Array.prototype.slice.call(arguments).slice(2);
	return function() {
		return fun.apply(object, args.concat(Array.prototype.slice.call(arguments)));
	}
}
var Tween = {
	Quart: {
		easeOut: function(t,b,c,d){
			return -c * ((t=t/d-1)*t*t*t - 1) + b;
		}
	},
	Back: {
		easeOut: function(t,b,c,d,s){
			if (s == undefined) s = 1.70158;
			return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
		}
	},
	Bounce: {
		easeOut: function(t,b,c,d){
			if ((t/=d) < (1/2.75)) {
				return c*(7.5625*t*t) + b;
			} else if (t < (2/2.75)) {
				return c*(7.5625*(t-=(1.5/2.75))*t + .75) + b;
			} else if (t < (2.5/2.75)) {
				return c*(7.5625*(t-=(2.25/2.75))*t + .9375) + b;
			} else {
				return c*(7.5625*(t-=(2.625/2.75))*t + .984375) + b;
			}
		}
	}
}

//容器对象,滑动对象,切换数量
var SlideTrans = function(container, slider, count, options) {
	this._slider = $(slider);
	this._container = $(container);//容器对象
	this._timer = null;//定时器
	this._count = Math.abs(count);//切换数量
	this._target = 0;//目标值
	this._t = this._b = this._c = 0;//tween参数
	
	this.Index = 0;//当前索引
	
	this.SetOptions(options);
	
	this.Auto = !!this.options.Auto;
	this.Duration = Math.abs(this.options.Duration);
	this.Time = Math.abs(this.options.Time);
	this.Pause = Math.abs(this.options.Pause);
	this.Tween = this.options.Tween;
	this.onStart = this.options.onStart;
	this.onFinish = this.options.onFinish;
	
	var bVertical = !!this.options.Vertical;
	this._css = bVertical ? "top" : "left";//方向
	
	//样式设置
	var p = CurrentStyle(this._container).position;
	p == "relative" || p == "absolute" || (this._container.style.position = "relative");
	this._container.style.overflow = "hidden";
	this._slider.style.position = "absolute";
	
	this.Change = this.options.Change ? this.options.Change :
		this._slider[bVertical ? "offsetHeight" : "offsetWidth"] / this._count;
};
SlideTrans.prototype = {
  //设置默认属性
  SetOptions: function(options) {
	this.options = {//默认值
		Vertical:	true,//是否垂直方向（方向不能改）
		Auto:		true,//是否自动
		Change:		0,//改变量
		Duration:	50,//滑动持续时间
		Time:		5,//滑动延时
		Pause:		2000,//停顿时间(Auto为true时有效)
		onStart:	function(){},//开始转换时执行
		onFinish:	function(){},//完成转换时执行
		Tween:		Tween.Quart.easeOut//tween算子
	};
	Extend(this.options, options || {});
  },
  //开始切换
  Run: function(index) {
	//修正index
	index == undefined && (index = this.Index);
	index < 0 && (index = this._count - 1) || index >= this._count && (index = 0);
	//设置参数
	this._target = -Math.abs(this.Change) * (this.Index = index);
	this._t = 0;
	this._b = parseInt(CurrentStyle(this._slider)[this.options.Vertical ? "top" : "left"]);
	this._c = this._target - this._b;
	
	this.onStart();
	this.Move();
  },
  //移动
  Move: function() {
	clearTimeout(this._timer);
	//未到达目标继续移动否则进行下一次滑动
	if (this._c && this._t < this.Duration) {
		this.MoveTo(Math.round(this.Tween(this._t++, this._b, this._c, this.Duration)));
		this._timer = setTimeout(Bind(this, this.Move), this.Time);
	}else{
		this.MoveTo(this._target);
		this.Auto && (this._timer = setTimeout(Bind(this, this.Next), this.Pause));
	}
  },
  //移动到
  MoveTo: function(i) {
	this._slider.style[this._css] = i + "px";
  },
  //下一个
  Next: function() {
	this.Run(++this.Index);
  },
  //上一个
  Previous: function() {
	this.Run(--this.Index);
  },
  //停止
  Stop: function() {
	clearTimeout(this._timer); this.MoveTo(this._target);
  }
};
</SCRIPT>
<style type="text/css" >
	.d_width{float:left;width:79px;overflow:hidden;}
	 .a_left{float:left}
</style>
</head>
<body>
<div id="cbox">
        <div class="topnav">
    			<div class="topnavleft">
        	<a href="/" class="index">优异网校首页</a> | 
            <a href="/jzgc/">建筑工程</a> | <a href="/jzgc/">一级建造师</a> |<a href="/jzgc/">二级建造师</a> |<a href="/jzgc/">监理工程师</a> |<a href="/jzgc/">安全工程师</a> |<a href="/jzgc/">造价工程师</a> |
            <a href="/zyss/">专业硕士</a> | 

        </div>
        <script  type="text/javascript">
			var top_now=new Date();
			function processRequest()
			{
			   var strHTML="正在加载数据……";
			   if (xmlhttp.readyState != 4) { // 判断对象状态
			   document.getElementById('top_loginarea').innerHTML="正在加载数据……"; 
			  }
			  else 
			  {
				if (xmlhttp.status == 200) { // 信息已经成功返回，开始处理信息
				   strHTML = xmlhttp.responseText;
				   document.getElementById('top_loginarea').innerHTML=strHTML;
				 }
					 else 
					 { //页面不正常
				   document.getElementById('top_loginarea').innerHTML="您所请求的页面有异常，请稍候再试。";
				 }
			  }
			}
		</script>
        <div class="topnavright" id="top_loginarea">
			<script type="text/javascript"> 
			var xmlhttp=null;
			try{
			  if(window.XMLHttpRequest)
			  {
				 xmlhttp=new XMLHttpRequest(); 
			  }
			}
			catch(e)
			{
				xmlhttp=null;
			}
			if(!xmlhttp&&window.ActiveXObject)
			{
				try
				{
					xmlhttp=new ActiveXObject("Msxml2.XMLHTTP");
				}
				catch(e)
				{
					try
					{
						xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
					}catch(e)
					{
						xmlhttp=null;
					}
				}		
			}
			if(!xmlhttp)
			{
				alert("null");
			}
			xmlhttp.onreadystatechange = processRequest;
			xmlhttp.open("get","/logininfo.php?curtt=" + top_now.getTime() + "&ttt="+top_now.getSeconds(),true);
			xmlhttp.send(null);
			</script>
				<!--判断之后，如果是未登录状态，则显示-->
			<div id="top_loginarea" class="topnavright">
    <a class="login" href="#">学员登录</a>
    <a href="#">注册</a>
            </div>
			<!--判断之后，如果是已经登录状态，则显示-->
	      <div id="top_loginarea" class="topnavright">
			<span style="color:#666">欢迎您，johnsir</span>
            <a href="/member/index.php" style="color:red;"><b>会员中心</b></a>
          </div>
        </div>
    </div>
    <div class="logos">
    	<div class="logo"><a target="_blank"  href="/"><img src="/youeclass/images/logo.png" alt="优异网校" /></a></div>
        <div class="pindao"><a target="_blank"  href="/jianzhu/">${exam.examName}</a></div>
        <div class="fenlei">
        	<dl>
            	<dt><a href="/course/" target="_blank"><img src="/youeclass/images/fl1.png" alt="建筑网络辅导课程" /></a></dt>
                <dd><a  href="/course/" target="_blank">网络课程</a></dd>
            </dl>
            <dl>
            	<dt><a target="_blank"  href="/mk"><img src="/youeclass/images/fl2.png" alt="建筑在线模考" /></a></dt>
                <dd><a target="_blank"  href="/mk">在线模考</a></dd>
            </dl>
            <dl>
            	<dt><a   href="/bbs/forum.php?gid=219" target="_blank"><img src="/youeclass/images/fl3.png" alt="建筑论坛交流" /></a></dt>
                <dd><a  href="/bbs/forum.php?gid=219" target="_blank">招生简章</a></dd>
            </dl>
            <dl>
            	<dt><a><img src="/youeclass/images/fl5.png" /></a></dt>
                <dd><a>历年真题</a></dd>
            </dl>
            <dl>
            	<dt><a target="_blank"  href="/vnews"><img src="/youeclass/images/fl4.png" /></a></dt>
                <dd><a target="_blank" href="/vnews">考试资讯</a></dd>
            </dl>
        </div>
    </div>   
	  <div class="nav">    
    	<div class="navleft"><img src="/youeclass/images/zx0.png" /></div>
    	<div class="navcenter">        	
            <div class="zixun"><img src="/youeclass/images/bk.png" /></div>  
            <div class="zixuncon">
            <#list examList as exam>
			     <a target="_blank"  href='/yiji/'  rel='dropmenu1'>${exam.examName}</a> 
			</#list>
            </div>
            <div class="zixun2"><img src="/youeclass/images/zx2.png" /></div>
            <div class="zixun"><img src="/youeclass/images/ws.png" /></div>  
            <div class="zixuncon">
				  <a target="_blank" href='/jianzhu/shiwu-hetong/' >考试时间</a> 
				 <a target="_blank"  href='/jianzhu/shiwu-shigong/' >报名时间</a> 
				 <a target="_blank"  href='/jianzhu/shiwu-biaoge/' >准考证打印</a> <br />
				 <a target="_blank"  href='/jianzhu/shiwu-gongyi/' >成绩查询</a> 
				 <a target="_blank"  href='/jianzhu/shiwu-guifan/' >证书领取</a> 
				 <a target="_blank"  href='/jianzhu/shiwu-zhengce/' >注册公告</a> 
            </div>
            <div class="zixun2"><img src="/youeclass/images/zx2.png" /></div>
            <div class="zixun"><img src="/youeclass/images/zx4.png" /></div>  
            <div class="zixuncon">
				 <a target="_blank"  href='/zhangjie/' >辅导资料</a> 
				 <a target="_blank"  href='/zhenti/' >历年真题</a> <br />
				 <a target="_blank"  href='/moniti/' >模拟试题</a> 
				 <a target="_blank"  href='/yuce/' >预测考题</a>
            </div>
            <div class="zixun2"><img src="/youeclass/images/zx2.png" /></div>
            <div class="zixun"><img src="/youeclass/images/zx5.png" /></div>  
            <div class="zixuncon">
                <a  href="/course/" target="_blank">课程</a>
                <!-- <a href="/course/courselist.php?id=24" target="_blank">试听</a> --><br />
				<a target="_blank"  href="/vnews"> 资讯  </a>
                <!-- <a target="_blank"  href="/bbs/forum.php?gid=219" target="_blank">论坛</a> -->
            </div>  
            <div class="zixun2"><img src="/youeclass/images/zx2.png" /></div>          
        </div>
        <div class="navright"><img src="/youeclass/images/zx6.png" /></div>    
    </div>
	
    <div class="navx">
		<h1 style=" float:left;font-size:15px; ">热门课程:</h1>
   			 <a href="#" target="_blank">
						&nbsp;&nbsp;2014一建四科全程VIP保过5000元/4科
					</a>
<a href="#" target="_blank">
						&nbsp;&nbsp;2014一建单科全程VIP保过4000元/3科
					</a>
    </div>
	<script type="text/javascript">
function tag(obj){
return document.getElementById(obj);
}
window.onload=function(){
setTimeout("slideUp();",5000);
}
function slideUp(){
if(tag("testnew").offsetHeight>0){
if(tag("testnew").offsetHeight>10){
tag("testnew").style.height=tag("testnew").offsetHeight-10+"px"
setTimeout("slideUp();",5);
}else{
tag("testnew").style.display="none";
tag("testimg").src="/youeclass/images/32-14010G45U1157.jpg";
tag("testnew").style.display="block";
slideDown();
}
}
}
function slideDown(){
if(tag("testnew").offsetHeight<80){
if(tag("testnew").offsetHeight<70){
tag("testnew").style.height=tag("testnew").offsetHeight+10+"px";
setTimeout("slideDown();",8);
}else{
tag("testnew").style.height="90px";
tag("testimg").src="/youeclass/images/32-14010G45934635.jpg";
}
}
}
</script>
<div class="daohang">
    <div class="kccon2">
        <ul>
            <li>
                <div class="kcb1"><a href="#" target="_blank">建筑工程</a></div>
                <div class="kcb2">
                    <div style="float:left;">
                        <a href="/main/exam1011.html">一级建造师</a>
						<a href="/main/exam1012.html">二级建造师</a>
						<a href="/main/exam1013.html">监理工程师</a>
						<a href="/main/exam1033.html">安全工程师</a>
						<a href="/main/exam1015.html">造价工程师</a>
						<a href="">咨询工程师</a>
						<a href="/main/exam1002.html">全国造价员</a>
                    </div>
                </div>
            </li>

			            <li>
                <div class="kcb1"><a href="#" target="_blank">专业硕士</a></div>
                <div class="kcb2">
                    <div style="float:left;">
                        <a href="/main/exam1011.html">MBA</a>
						<a href="/main/exam1012.html">MPA</a>
						<a href="/main/exam1013.html">GCT</a>
                    </div>
                </div>
            </li>
        </ul>
    </div>
</div>
<div align="center" id="testnew" style="overflow:hidden; float:left; margin-top:-3px; margin-bottom:5px;"><a href="/jianzhu/zhuanti/ejzb/" style="cursor:pointer" onclick="/jianzhu/zhuanti/ejzb/" target="_blank"><img src="/youeclass/images/32-14010G45U1157.jpg" name="testimg" border="0" alt="优异网校二级建造师" id="testimg"></a></div>

    <div class="mains1">
    	<div class="ms1_left">
        	<div id=idContainer2 class=container>
                        <table id=idSlider2 border=0 cellSpacing=0 cellPadding=0>
                            <tbody>
                              <tr>
							  	<td class=td_f> <a href="/jianzhu/zhuanti/erjian/" target="_blank"><img src='/youeclass/images/30-13112G1503c95.jpg' border='0' width='120' height='120' alt='2014年二级建造师协议保过班'></a></td>
<td class=td_f> <a href="/jianzhu/zhuanti/yijian/" target="_blank"><img src='/youeclass/images/29-131203142Z0O9.jpg' border='0' width='120' height='120' alt='2014年一级建造师VIP保过方案 2670元/4科'></a></td>
<td class=td_f> <a href="/jianzhu/zhuanti/zxgcs/" target="_blank"><img src='/youeclass/images/32-13121111295L54.jpg' border='0' width='120' height='120' alt='2014年咨询工程师招生简章'></a></td>
<td class=td_f> <a href="/course/courselist.php?id=35" target="_blank"><img src='/youeclass/images/30-131203145321D4.jpg' border='0' width='120' height='120' alt='2014年物业管理师高清辅导招生简章'></a></td>
<td class=td_f> <a href="/course/courselist.php?id=62&kid=95" target="_blank"><img src='/youeclass/images/30-131203150TN96.jpg' border='0' width='120' height='120' alt='2014年质量工程师协议保过班专题'></a></td>
                               </tr>
                            </tbody>
                        </table>
                        <UL id=idNum class=num></UL>
                    </DIV>
                        
                        <SCRIPT>
                            var forEach = function(array, callback, thisObject){
                                if(array.forEach){
                                    array.forEach(callback, thisObject);
                                }else{
                                    for (var i = 0, len = array.length; i < len; i++) { callback.call(thisObject, array[i], i, array); }
                                }
                            }
                            
                            var st = new SlideTrans("idContainer2", "idSlider2", 5, { Vertical: false });
                            
                            var nums = [];
                            //插入数字
                            for(var i = 0, n = st._count - 1; i <= n;){
                                (nums[i] = $("idNum").appendChild(document.createElement("li"))).innerHTML = ++i;
                            }
                            
                            forEach(nums, function(o, i){
                                o.onmouseover = function(){ o.className = "on"; st.Auto = false; st.Run(i); }
                                o.onmouseout = function(){ o.className = ""; st.Auto = true; st.Run(); }
                            })
                            
                            //设置按钮样式
                            st.onStart = function(){
                                forEach(nums, function(o, i){ o.className = st.Index == i ? "on" : ""; })
                            }
                            st.Run();
                        </SCRIPT>
        </div>
        <div class="ms1_center">
        	<ul class="toutiaos">
            	<li class="toutiao">
					<a href="/jianzhu/zhuanti/erjian/" target="_blank">2014年二建招生辅导方案</a>
					
<a href="/jianzhu/zhuanti/ejbm/" target="_blank">2014年二建报名时间汇总</a>

				</li>
            	<li>
					<a style="color:#999999; " class="d_width" href="/yiji/" target="_blank"><center>一级建造师</center></a> |
					<a class="hui a_left"> |</a><a style="color:#999999; " class="d_width" href="/erji/" target="_blank"><center>二级建造师</center></a>
					<a class="hui a_left"> |</a><a style="color:#999999; " class="d_width" href="/wuye/" target="_blank"><center>物业管理师</center></a>
					<a class="hui a_left"> |</a><a style="color:#999999; " class="d_width" href="/yiji/zixun/20130531/20281.html" target="_blank"><center>专业对照表</center></a>
					<a class="hui a_left"></a>
<br />
						
					<a style="color:#333333;" class="d_width" href="/vnews/jianzhu/" target="_blank"><center>2013备考视频</center></a><a class="hui a_left"> |</a>
					<a style="color:#333333;" class="d_width" href="/mk/" target="_blank"><center>2013模考试题</center></a>
					<a class="hui a_left"> |</a><a style="color:#333333;" class="d_width" href="/zthuizong/jianzhu/" target="_blank"><center>2013备考专</center></a>
					<a class="hui a_left"> |</a><a style="color:#333333;" class="d_width" href="/course/courselist.php?id=24" target="_blank"><center>课程中心</center></a>
					<a class="hui a_left"> </a>
                </li>            	
            </ul>
            <ul class="toutiao2">
            	<li class="toutiao">
					<a href="/jianzhu/zhuanti/yijian/" target="_blank">2014年一建招生辅导方案</a>
					<a href="/jianzhu/zhuanti/jlzsjz/" target="_blank">2014年监理师招生辅导方案</a>
				</li>
            	<li>
					<a class="hui" href="/yiji/ziliao/20120309/1765.html" target="_blank">2014年一建招生简章(保过班)</a><a class="hui"> |</a>
					<a class="hui" href="/zxgcs/zixun/20121013/13954.html" target="_blank">2014年咨询工程师协议保过班</a><a class="hui"></a>
                        <br />		
				    <a class="hui" href="/yiji/ziliao/20120612/9300.html" target="_blank">全国一级建造师历年真题汇总</a><a class="hui"> |</a>
				    <a class="hui" href="/yiji//zixun/20121030/14785.html" target="_blank">深入了解建筑考试通过率详情</a><a class="hui"></a>
                </li>
                <li style="clear:both;">
					<a href="/erji/ziliao/20120726/10875.html" target="_blank"><img src="/youeclass/images/st.png" />二建押题名师2014备考访谈</a><a class="hui"> |</a>
<a href="/wuye/zixun/20120719/10622.html" target="_blank">
							<img src="/youeclass/images/st.png" />物业管理师押题名师备考访谈
						</a>
						<a class="hui">
                            
                            </a>
<br />
                  	<a href="/zxgcs/zixun/20130411/19696.html" target="_blank">
							<img src="/youeclass/images/st.png" />2014年咨询工程师报名时间
						</a>
						<a class="hui">
                            |
                            </a>
<a href="/zhiliang/hxrd/2012/0413/2381.html" target="_blank">
							<img src="/youeclass/images/st.png" />2014质量工程师招生简章
						</a>
						<a class="hui">
                            
                            </a>
                </li>            	
            </ul>
        </div>
        <div class="ms1_right">
        	<div class="title1"><a href="/course/courselist.php?id=35" id="kc0" onmouseover="hgkc(0)">热门课程</a><a target="_blank" href="/bbs/forum.php?mod=forumdisplay&fid=227&filter=typeid&typeid=64" id="kc1" onmouseover="hgkc(1)">教务公告</a><a target="_blank" href="/bbs/forum.php?mod=forumdisplay&fid=227&filter=typeid&typeid=64" id="kc2" onmouseover="hgkc(2)">报考指南</a></div>
            <div class="title1_con" id="kchg0">
            	<ul>
					<li><a href="/course/courselist.php?id=62&kid=95" title="2014质量师(中级)VIP保过班 1370元/全科" target="_blank">2014质量师(中级)VIP保过班 1370元/全科</a></li>
<li><a href="/course/courselist.php?id=100&kid=92" title="2014年造价工程师VIP保过班 2570元/全科" target="_blank">2014年造价工程师VIP保过班 2570元/全科</a></li>
<li><a href="/course/courselist.php?id=63&kid=94" title="2014年咨询工程师VIP保过班 2170元/全科" target="_blank">2014年咨询工程师VIP保过班 2170元/全科</a></li>
<li><a href="/course/courselist.php?id=55&kid=93" title="2014年招标师VIP保过班 1570元/全科" target="_blank">2014年招标师VIP保过班 1570元/全科</a></li>
<li><a href="/course/courselist.php?id=54&kid=91" title="2014年监理工程师VIP保过班 2670元/全科" target="_blank">2014年监理工程师VIP保过班 2670元/全科</a></li>
<li><a href="/course/courselist.php?id=35&kid=88" title="2014年物业管理师VIP保过班 1670元/全科" target="_blank">2014年物业管理师VIP保过班 1670元/全科</a></li>
<li><a href="/course/courselist.php?id=23&kid=86" title="2014年二级建造师VIP保过班 1970元/全科" target="_blank">2014年二级建造师VIP保过班 1970元/全科</a></li>
<li><a href="/course/courselist.php?id=24" title="2014年一级建造师VIP保过班 2670元/全科" target="_blank">2014年一级建造师VIP保过班 2670元/全科</a></li>
                </ul>
            </div>
            <div class="title1_con" id="kchg1" style="display:none;">
            	<ul>
            	<li><a href="/bbs/thread-116344-1-1.html" title="优异网校分享：2014一建考试QQ群:341248464" target="_blank">优异网校分享：2014一建考试QQ群:341</a></li><li><a href="/bbs/thread-116343-1-1.html" title="[视频]二建顶级名师团队 教材新编考点深度解析" target="_blank">[视频]二建顶级名师团队 教材新编考</a></li><li><a href="/bbs/thread-116275-1-1.html" title="2014年注册安全工程师考试时间安排" target="_blank">2014年注册安全工程师考试时间安排</a></li><li><a href="/bbs/thread-116274-1-1.html" title="注册安全工程师考试指南(最新版)" target="_blank">注册安全工程师考试指南(最新版)</a></li><li><a href="/bbs/thread-116273-1-1.html" title="2013年注册安全工程师案例分析答案解析(优异完整版)" target="_blank">2013年注册安全工程师案例分析答案解</a></li><li><a href="/bbs/thread-116272-1-1.html" title="2013年注册安全工程师案例分析真题(优异完整版)" target="_blank">2013年注册安全工程师案例分析真题</a></li><li><a href="/bbs/thread-116271-1-1.html" title="2013年注册安全工程师生产技术答案解析(优异完整版)" target="_blank">2013年注册安全工程师生产技术答案解</a></li><li><a href="/bbs/thread-116270-1-1.html" title="2013年注册安全工程师生产技术真题(优异完整版)" target="_blank">2013年注册安全工程师生产技术真题</a></li>
                </ul>
            </div>

            <div class="title1_con" id="kchg2" style="display:none;">
            	<ul>
            	  <li><a href="/bbs/thread-116344-1-1.html" title="工程类和工程经济咧" target="_blank">工程类和工程经济咧</a></li>
            	  <li><a href="/bbs/thread-116343-1-1.html" title="[视频]二建顶级名师团队 教材新编考点深度解析" target="_blank">[视频]二建顶级名师团队 教材新编考</a></li>
            	  <li><a href="/bbs/thread-116275-1-1.html" title="2014年注册安全工程师考试时间安排" target="_blank">2014年注册安全工程师考试时间安排</a></li>
            	  <li><a href="/bbs/thread-116274-1-1.html" title="注册安全工程师考试指南(最新版)" target="_blank">注册安全工程师考试指南(最新版)</a></li>
            	  <li><a href="/bbs/thread-116273-1-1.html" title="2013年注册安全工程师案例分析答案解析(优异完整版)" target="_blank">2013年注册安全工程师案例分析答案解</a></li>
            	  <li><a href="/bbs/thread-116272-1-1.html" title="2013年注册安全工程师案例分析真题(优异完整版)" target="_blank">2013年注册安全工程师案例分析真题</a></li>
            	  <li><a href="/bbs/thread-116271-1-1.html" title="2013年注册安全工程师生产技术答案解析(优异完整版)" target="_blank">2013年注册安全工程师生产技术答案解</a></li>
            	  <li><a href="/bbs/thread-116270-1-1.html" title="2013年注册安全工程师生产技术真题(优异完整版)" target="_blank">2013年注册安全工程师生产技术真题</a></li>
                </ul>
            </div>
        </div>
    </div>
    <div class="mains2">
    	<div class="ms2_left">
        	<div class="ms2_left_title">在线试听</div>
            <div class="ms2_left_con">
<!--            	<dl>				
				 <dt><a href="/shiting/shiting.php?id=2430" target="_blank"><img src='/youeclass/images/18-1303121F145134.jpg' border='0' width='120' height='67' alt='2014年二建机电实务高清试听 李国刚'></a></dt>
                    <dd>
                    	<ul>
						   <li><a href="/shiting/shiting.php?id=2872" target="_blank">2014监理工程师高清</a></li>
<li><a href="/shiting/shiting.php?id=13913" target="_blank">2014年二建施工管理高清</a></li>
<li><a href="/shiting/shiting.php?id=15686" target="_blank">2014年一建工程经济高清</a></li>
                        </ul>
                    </dd>
                </dl>-->
                <ul class="tubiao" style="padding-top:9px;">
               		<li><a href="/shiting/shiting.php?id=2430" target="_blank">2014年二建机电实务高清试听 董美英</a></li>
               		<li><a href="/shiting/shiting.php?id=16188" target="_blank">2014年二建市政实务高清试听 张新天</a></li>
               		<li><a href="/shiting/shiting.php?id=15801" target="_blank">2013年监理工程师合同高清试听 万晓</a></li>
               		<li><a href="/shiting/shiting.php?id=15683" target="_blank">2013造价工程师案例高清试听 王玲</a></li>
					<li><a href="/shiting/shiting.php?id=2430" target="_blank">2014年二建机电实务高清试听 董美英</a></li>
               		<li><a href="/shiting/shiting.php?id=16188" target="_blank">2014年二建市政实务高清试听 张新天</a></li>
               		<li><a href="/shiting/shiting.php?id=15801" target="_blank">2013年监理工程师合同高清试听 万晓</a></li>
               		<li><a href="/shiting/shiting.php?id=15683" target="_blank">2013造价工程师案例高清试听 王玲</a></li>
                </ul>
            </div>
        </div>
        <div class="ms2_center">
        	<div class="ms2_center_title"><a href="#" id="kca0" onmouseover="hgkca(0)">最新资讯</a><a href="#" id="kca1" onmouseover="hgkca(1)">备考资料</a><a href="#" id="kca2" onmouseover="hgkca(2)">招生简章</a></div>
            <div class="ms2_center_con" id="kchga0">
                <ul>
				
					<li class="toutiao3" style="background:none;"><a href="/jianzhuhoutai/plus/view.php?aid=32356" title="2013年招标师考试合格标准已公布_优异网校" target="_blank">2013年招标师考试合格标准已公布_优异网校</a></li>

					
                	<li class="contitle"><a href="/zhaobiao/zixun/20140116/32355.html" title="优异网校提醒：2013年招标师考试合格标准已公布" target="_blank">优异网校提醒：2013年招标师考试合格标准已</a><span>2014-01-16</span></li>
<li class="contitle"><a href="/jianli/zixun/20140113/32206.html" title="内蒙古2014年监理工程师报名时间官方预计" target="_blank">内蒙古2014年监理工程师报名时间官方预计</a><span>2014-01-13</span></li>
<li class="contitle"><a href="/jianli/zixun/20140113/32205.html" title="重庆2014年监理工程师报名时间官方预计" target="_blank">重庆2014年监理工程师报名时间官方预计</a><span>2014-01-13</span></li>
<li class="contitle"><a href="/jianli/zixun/20140113/32204.html" title="北京2014年监理工程师报名时间官方预计" target="_blank">北京2014年监理工程师报名时间官方预计</a><span>2014-01-13</span></li>
<li class="contitle"><a href="/anquan/ziliao/20140110/32140.html" title="2014年注册安全工程师考试每日精选试题77" target="_blank">2014年注册安全工程师考试每日精选试题77</a><span>2014-01-10</span></li>
<li class="contitle"><a href="/anquan/ziliao/20140110/32139.html" title="2014年注册安全工程师考试每日精选试题76" target="_blank">2014年注册安全工程师考试每日精选试题76</a><span>2014-01-10</span></li>
<li class="contitle"><a href="/anquan/ziliao/20140110/32138.html" title="2014年注册安全工程师考试每日精选试题75" target="_blank">2014年注册安全工程师考试每日精选试题75</a><span>2014-01-10</span></li>

                </ul>
            </div>
            <div class="ms2_center_con" id="kchga1" style="display:none;">
                <ul>
                	<li class="toutiao3" style="background:none;"><a href="/yiji/ziliao/20131110/27078.html" title="2014年一级建造师《工程法规》复习考点汇总" target="_blank">2014年一级建造师《工程法规》复习考点汇总</a> </li>

					
                	<li class="contitle"><a href="/jianli/ziliao/20140107/31734.html" title="2014年监理工程师《理论与法规》复习指导汇总" target="_blank">2014年监理工程师《理论与法规》复习指导汇</a> <span>2014-01-07</span></li>
<li class="contitle"><a href="/zaojia/ziliao/20140103/31571.html" title="2014年造价工程师考试《造价管理》精选辅导12" target="_blank">2014年造价工程师考试《造价管理》精选辅导</a> <span>2014-01-03</span></li>
<li class="contitle"><a href="/zaojia/ziliao/20140103/31570.html" title="2014年造价工程师考试《造价管理》精选辅导11" target="_blank">2014年造价工程师考试《造价管理》精选辅导</a> <span>2014-01-03</span></li>
<li class="contitle"><a href="/anquan/ziliao/20140102/31453.html" title="2014年注册安全工程师考试《管理知识》精选考点26" target="_blank">2014年注册安全工程师考试《管理知识》精选</a> <span>2014-01-02</span></li>
<li class="contitle"><a href="/anquan/ziliao/20140102/31452.html" title="2014年注册安全工程师考试《管理知识》精选考点25" target="_blank">2014年注册安全工程师考试《管理知识》精选</a> <span>2014-01-02</span></li>
<li class="contitle"><a href="/anquan/ziliao/20131231/31362.html" title="2014年注册安全工程师考试《管理知识》精选考点24" target="_blank">2014年注册安全工程师考试《管理知识》精选</a> <span>2013-12-31</span></li>
<li class="contitle"><a href="/jianli/ziliao/20131231/31356.html" title="2014监理师《合同管理》之施工索赔汇总" target="_blank">2014监理师《合同管理》之施工索赔汇总</a> <span>2013-12-31</span></li>

                </ul>
            </div>
            <div class="ms2_center_con" id="kchga2" style="display:none;">
                <ul>
                	<li class="toutiao3" style="background:none;"><a href="/zhaobiao/zixun/20140116/32355.html" title="优异网校提醒：2013年招标师考试合格标准已公布" target="_blank">优异网校提醒：2013年招标师考试合格标准已</a></li>

					
                	<li class="contitle"><a href="/zhaobiao/zixun/20140116/32355.html" title="优异网校提醒：2013年招标师考试合格标准已公布" target="_blank">优异网校提醒：2013年招标师考试合格标准已</a> <span>2014-01-16</span></li>
<li class="contitle"><a href="/fdcgj/zixun/20140106/31702.html" title="房地产估价师考试注册常见问题解答" target="_blank">房地产估价师考试注册常见问题解答</a> <span>2014-01-06</span></li>
<li class="contitle"><a href="/fdcgj/zixun/20140106/31701.html" title="2014房地产估价师报名时间预计于2014年5月开始" target="_blank">2014房地产估价师报名时间预计于2014年5月开</a> <span>2014-01-06</span></li>
<li class="contitle"><a href="/fdcgj/zixun/20140106/31700.html" title="2014年吉林房地产估价师准考证打印时间" target="_blank">2014年吉林房地产估价师准考证打印时间</a> <span>2014-01-06</span></li>
<li class="contitle"><a href="/jianli/zixun/20140106/31678.html" title="江苏2013监理工程师考试合格证书发放通知" target="_blank">江苏2013监理工程师考试合格证书发放通知</a> <span>2014-01-06</span></li>
<li class="contitle"><a href="/fdcgj/zixun/20140103/31573.html" title="2014房地产估价师考试题型及答题技巧" target="_blank">2014房地产估价师考试题型及答题技巧</a> <span>2014-01-03</span></li>
<li class="contitle"><a href="/jianli/zixun/20140103/31569.html" title="2014年监理工程师考试复习策略" target="_blank">2014年监理工程师考试复习策略</a> <span>2014-01-03</span></li>

                </ul>
            </div>
        </div>
        <div class="ms2_right">
        	<div class="title1"><a href="#">主讲名师</a></div>
            <div class="mingshi">
            	<dt><a href="/teacher/teacherDetails.php?tid=167" target="_blank"><img src='/youeclass/images/18-120R01A63E17.jpg' border='0' width='73' height='80' alt='陈印'><br />陈印</a></dt>
<dt><a href="/teacher/teacherDetails.php?tid=181" target="_blank"><img src='/youeclass/images/18-1205311525560-L.jpg' border='0' width='73' height='80' alt='梅世强'><br />梅世强</a></dt>
<dt><a href="/teacher/teacherDetails.php?tid=207" target="_blank"><img src='/youeclass/images/18-1205311546230-L.jpg' border='0' width='73' height='80' alt='刘平玉'><br />刘平玉</a></dt>
<dt><a href="/teacher/teacherDetails.php?tid=173" target="_blank"><img src='/youeclass/images/18-120531152P70-L.jpg' border='0' width='73' height='80' alt='张世星'><br />张世星</a></dt>
<dt><a href="/teacher/teacherDetails.php?tid=168" target="_blank"><img src='/youeclass/images/18-1205311529560-L.jpg' border='0' width='73' height='80' alt='李佳升'><br />李佳升</a></dt>
<dt><a href="/teacher/teacherDetails.php?tid=237" target="_blank"><img src='/youeclass/images/18-120P61K953542.jpg' border='0' width='73' height='80' alt='王璞'><br />王璞</a></dt>
            </div>
        </div>
    </div>
   
		<div class="ad"><a href='/jianzhu/zhuanti/yiji/cjcx/' target='_blank'><img src='/youeclass/images/29-13120312523OZ.jpg' border='0' width='960' height='90' alt='2013年一级建造师成绩查询汇总'></a></div>
	
	<div class="kb_title"><img src="/youeclass/images/kczx.png" /></div>
    <div class="kb_kong"></div>
     <div class="tuijian">
        <div class="tj_pic">
  <h1>优异网校顶级名师 高清课程试听</h1>
            <div class="center_pic">
            	<script type="text/javascript">
var Speed_1 = 5; //速度(毫秒)
var Space_1 = 20; //每次移动(px)
var PageWidth_1 = 107 * 6; //翻页宽度
var interval_1 = 2000; //翻页间隔时间
var fill_1 = 0; //整体移位
var MoveLock_1 = false;
var MoveTimeObj_1;
var MoveWay_1="right";
var Comp_1 = 0;
var AutoPlayObj_1=null;
function GetObj(objName){if(document.getElementById){return eval('document.getElementById("'+objName+'")')}else{return eval('document.all.'+objName)}}
function AutoPlay_1(){clearInterval(AutoPlayObj_1);AutoPlayObj_1=setInterval('ISL_GoDown_1();ISL_StopDown_1();',interval_1)}
function ISL_GoUp_1(){if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="left";MoveTimeObj_1=setInterval('ISL_ScrUp_1();',Speed_1);}
function ISL_StopUp_1(){if(MoveWay_1 == "right"){return};clearInterval(MoveTimeObj_1);if((GetObj('ISL_Cont_1').scrollLeft-fill_1)%PageWidth_1!=0){Comp_1=fill_1-(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1);CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrUp_1(){if(GetObj('ISL_Cont_1').scrollLeft<=0){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft+GetObj('List1_1').offsetWidth}
GetObj('ISL_Cont_1').scrollLeft-=Space_1}
function ISL_GoDown_1(){clearInterval(MoveTimeObj_1);if(MoveLock_1)return;clearInterval(AutoPlayObj_1);MoveLock_1=true;MoveWay_1="right";ISL_ScrDown_1();MoveTimeObj_1=setInterval('ISL_ScrDown_1()',Speed_1)}
function ISL_StopDown_1(){if(MoveWay_1 == "left"){return};clearInterval(MoveTimeObj_1);if(GetObj('ISL_Cont_1').scrollLeft%PageWidth_1-(fill_1>=0?fill_1:fill_1+1)!=0){Comp_1=PageWidth_1-GetObj('ISL_Cont_1').scrollLeft%PageWidth_1+fill_1;CompScr_1()}else{MoveLock_1=false}
AutoPlay_1()}
function ISL_ScrDown_1(){if(GetObj('ISL_Cont_1').scrollLeft>=GetObj('List1_1').scrollWidth){GetObj('ISL_Cont_1').scrollLeft=GetObj('ISL_Cont_1').scrollLeft-GetObj('List1_1').scrollWidth}
GetObj('ISL_Cont_1').scrollLeft+=Space_1}
function CompScr_1(){if(Comp_1==0){MoveLock_1=false;return}
var num,TempSpeed=Speed_1,TempSpace=Space_1;if(Math.abs(Comp_1)<PageWidth_1/2){TempSpace=Math.round(Math.abs(Comp_1/Space_1));if(TempSpace<1){TempSpace=1}}
if(Comp_1<0){if(Comp_1<-TempSpace){Comp_1+=TempSpace;num=TempSpace}else{num=-Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft-=num;setTimeout('CompScr_1()',TempSpeed)}else{if(Comp_1>TempSpace){Comp_1-=TempSpace;num=TempSpace}else{num=Comp_1;Comp_1=0}
GetObj('ISL_Cont_1').scrollLeft+=num;setTimeout('CompScr_1()',TempSpeed)}}
function picrun_ini(){
GetObj("List2_1").innerHTML=GetObj("List1_1").innerHTML;
GetObj('ISL_Cont_1').scrollLeft=fill_1>=0?fill_1:GetObj('List1_1').scrollWidth-Math.abs(fill_1);
GetObj("ISL_Cont_1").onmouseover=function(){clearInterval(AutoPlayObj_1)}
GetObj("ISL_Cont_1").onmouseout=function(){AutoPlay_1()}
AutoPlay_1();
}
</script>
<!-- picrotate_left start  -->
<div class="blk_18"> <a class="LeftBotton" onmousedown="ISL_GoUp_1()" onmouseup="ISL_StopUp_1()" onmouseout="ISL_StopUp_1()" href="javascript:void(0);" target="_self"></a>
  <div class="pcont" id="ISL_Cont_1">
    <div class="ScrCont">
      <div id="List1_1">
        <!-- piclist begin -->		
  		<a class="pl" href="/shiting/shiting.php?id=2283" target='_blank'><img src='/youeclass/images/18-13031314140O13.jpg' border='0' width='136' height='86' alt='2014年一建工程法规高清课程'></a>
<a class="pl" href="/shiting/shiting.php?id=15683" target='_blank'><img src='/youeclass/images/18-130313142321550.jpg' border='0' width='136' height='86' alt='2014年招标师项目管理与招标采购 杨榕'></a>
<a class="pl" href="/shiting/shiting.php?id=17728" target='_blank'><img src='/youeclass/images/18-130313142141108.jpg' border='0' width='136' height='86' alt='2014质量工程师(中级)综合知识 秦建国'></a>
<a class="pl" href="/shiting/shiting.php?id=16099" target='_blank'><img src='/youeclass/images/18-130313141QE50.jpg' border='0' width='136' height='86' alt='2014年一建机电实务高清课程 李国刚'></a>
<a class="pl" href="/shiting/shiting.php?id=2872" target='_blank'><img src='/youeclass/images/18-130313141510602.jpg' border='0' width='136' height='86' alt='2014物业基本制度与政策课件 杨昭辉'></a>
<a class="pl" href="/shiting/shiting.php?id=17282" target='_blank'><img src='/youeclass/images/18-13031314195B23.jpg' border='0' width='136' height='86' alt='2014年咨询工程师项目组织与管理 尹志军'></a>
<a class="pl" href="/shiting/shiting.php?id=16224" target='_blank'><img src='/youeclass/images/18-130313141F5528.jpg' border='0' width='136' height='86' alt='2014年监理案例分析高清试听 张宝魁'></a>
<a class="pl" href="/shiting/shiting.php?id=2588" target='_blank'><img src='/youeclass/images/18-130313141440550.jpg' border='0' width='136' height='86' alt='2014年二建施工管理高清课程'></a>
	
        <!-- piclist end -->
      </div>
      <div id="List2_1"></div>
    </div>
  </div>
 	 <a class="RightBotton" onmousedown="ISL_GoDown_1()" onmouseup="ISL_StopDown_1()" onmouseout="ISL_StopDown_1()" href="javascript:void(0);" target="_self"></a> </div>
<div class="c"></div>
<script type="text/javascript">
        <!--
        picrun_ini()
        //-->
        </script>
            </div>
        </div>
        <div class="mszd">
        	<div class="mszd_title"><a id="kcb0" onmouseover="hgkcb(0)">热门课程</a></div>
            <div class="mszd_con" id="kchgb0">
                <ul>
                 <li><a href="#" title="#" target="_blank">2014年二级建造师全程班</a></li>
<li><a href="/bbs/thread-116339-1-1.html" title="" target="_blank">2014年监理工程师全程班</a></li>
<li><a href="#" title="" target="_blank">2014年一级建造师全程VIP班</a></li>
<li><a href="#" title="" target="_blank">2014年安全工程师全程名师班</a></li>
                 </ul>
             </div>
        </div>
    </div>   











	<div class="kb_title"><img src="/youeclass/images/bkzx.png" />
    	<li><a >成绩查询</a><a>|</a> <a >准考证打印时间</a><a>|</a><a >报名时间</a><a>|</a><a >考试时间</a></li>
    </div>



	<div id="content">
	
    <div class="xueli" style="width:310px;margin-left:0px;"><h2><span>考试报名</span><a 
href="/jzs1/bm/" target="_blank">更多>></a></h2><!--<h3><A href="/jzs1/" target=_blank title="2013一
级建造师考试培训火爆招生">2013一级建造师考试培训火爆招生</A></h3> <p>line</p>-->
	   <ul 
class="one">
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师报名时间">广东2014年一级建造师报名时间</a><span>11-12</span></li>
	  </ul>
	 </div>
	 
	
	
    <div class="xueli" style="width:310px;margin-left:12px;"><h2><span>准考证打印</span><a href="/jzs1/bm/" target="_blank">更多>></a></h2>
	   <ul class="one">
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="北京2014年一级建造师准考证打印时间确定">北京2014年一级建造师准考证打印时间确定</a><span>11-12</span></li>
	  </ul>
	</div>	
	
	
    <div class="xueli" style="width:310px;margin-left:12px;"><h2><span>成绩查询</span><a href="/jzs1/bm/" target="_blank">更多>></a></h2>
	   <ul class="one">
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
	  </ul>
	</div>		
</div>	









	<div class="ad"><a href='#' target='_blank'><img src='/youeclass/images/29-1312031356055H.jpg' border='0' width='960' height='90' alt='2013年造价工程师成绩查询汇总'></a></div>
	<div class="kb_title"><img src="/youeclass/images/bkfd.png" />
        <li><a href="/jianli/">辅导资料</a><a href="/anquan/">模拟试题|</a><a href="/fdcgj/">历年真题|</a></li>
    </div>

	
	<div id="content">
	
      <div class="xueli" style="width:310px;margin-left:0px;"><h2><span>历年真题</span><a href="/jzs1/bm/" target="_blank">更多>></a></h2>
	   <ul class="one">
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
	  </ul>
	</div>	
	
	   <div class="xueli" style="width:310px;margin-left:12px;"><h2><span>模拟试题</span><a href="/jzs1/bm/" target="_blank">更多>></a></h2>
	   <ul class="one">
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
	  </ul>
	</div>	
	
	   <div class="xueli" style="width:310px;margin-left:12px;"><h2><span>辅导资料</span><a href="/jzs1/bm/" target="_blank">更多>></a></h2>
	   <ul class="one">
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
		<li>·<a href="/jzs1/20120312/162651331.html" target=_blank title="广东2014年一级建造师成绩查询时间确定">广东2014年一级建造师成绩查询时间确定</a><span>11-12</span></li>
	  </ul>
	</div>	
	
</div>

    	<div class="ad"><a href='#' target='_blank'><img src='/youeclass/images/29-13120313594M43.jpg' border='0' width='960' height='90' alt='2013年一级建造师成绩查询汇总'></a></div>

    <div class="kb_title"><img src="/youeclass/images/hzhb.png" /></div>	
    <div class="hzhb">
    	<ul>
		
        		<ul>
				 
              	<li><a href='#' target='_blank'>一级建造师</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>二级建造师</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>监理工程师</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>造价工程师</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>安全工程师</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>物业管理师</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>硕士类网校</a> </li>
 
            	 
              	<li><a href='#' target='_blank'>优异网校</a> </li>
 
 
            	 
			</ul>
            	 
              	
        </ul>
    </div>
    <div id="cbox">
	<div class="bottom">
    	<ul>
        	<li><a href="#" rel="nofollow" target="_blank">关于我们</a> | <a href="#" rel="nofollow"  target="_blank">招聘信息</a> | <a  href="#" rel="nofollow"  target="_blank">免责声明</a> | <a href="#"  rel="nofollow" target="_blank">合作加盟</a> | <a href="#" rel="nofollow" target="_blank">媒体关注</a> | <a href="#"  rel="nofollow" target="_blank">帮助中心</a> | <a href="#" rel="nofollow"  target="_blank">联系我们</a></li>
            <li>Copyright &copy; 2011-2012 htexam.net Inc. All Rights  Reserved.</li>
            <li><a rel="nofollow" href="#">优异网校</a>&nbsp;<a href="/jianzhu/">建筑网校</a>&nbsp; 版权所有
  京ICP备11012638号
</li>
			<li> <script src="http://s19.cnzz.com/stat.php? id=5456201&web_id=5456201" language="JavaScript"></script> &nbsp;&nbsp; <script language="javascript" type="text/javascript"  src="http://js.users.51.la/15961317.js"></script><noscript><a href="http://www.51.la/?15961317"  target="_blank"><img  alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;"  src="http://img.users.51.la/15961317.asp" style="border:none"  /></a></noscript></li>
        </ul>
    </div>
</div>
</div>
</body>
</html>