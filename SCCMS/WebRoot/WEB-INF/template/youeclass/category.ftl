<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>${exam.title}</title>
<meta name="keywords" content="${exam.keywords}" />
<meta name="description" content="${exam.description}" />
<link href="/youeclass/css/style_jianzhu.css" rel="stylesheet" type="text/css" />
<script  type="text/javascript" src="/youeclass/js/style.js"></script>
<link href="/youeclass/css/zixunstyle.css" rel="stylesheet" type="text/css" />
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
            <a href="/jzgc/">建筑工程</a> | 
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
            <div class="zixun"><img src="/youeclass/images/ks.png" /></div>  
            <div class="zixuncon">
            	<#list examList as ec>
			     <a target="_blank"  href='/${exam.examEname}/${ec.examEname}'  rel='dropmenu1'>${ec.examName}</a> 
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
						&nbsp;&nbsp;2014一建VIP保过5000元/4科
					</a>
<a href="#" target="_blank">
						&nbsp;&nbsp;2014二建VIP保过4000元/3科
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
					<a href="/jianzhu/zhuanti/erjian/" target="_blank">
							2014年二建招生辅导方案
						</a>
<a href="/jianzhu/zhuanti/ejbm/" target="_blank">
							2014年二建报名时间汇总
						</a>

				</li>
            	<li>
<a style="color:#999999; " class="d_width" href="/yiji/" target="_blank"><center>一级建造师</center></a>
						 <a class="hui a_left"> | </a>
<a style="color:#999999; " class="d_width" href="/erji/" target="_blank"><center>二级建造师</center></a>
						 <a class="hui a_left"> | </a>
<a style="color:#999999; " class="d_width" href="/wuye/" target="_blank"><center>物业管理师</center></a>
						 <a class="hui a_left"> | </a>
<a style="color:#999999; " class="d_width" href="/yiji/zixun/20130531/20281.html" target="_blank"><center>专业对照表</center></a>
						 <a class="hui a_left">
                             </a>
<br />
						
<a style="color:#333333;" class="d_width" href="/vnews/jianzhu/" target="_blank"><center>2013备考视频</center></a>
						 <a class="hui a_left"> | </a>
<a style="color:#333333;" class="d_width" href="/mk/" target="_blank"><center>2013模考试题</center></a>
						 <a class="hui a_left"> | </a>
<a style="color:#333333;" class="d_width" href="/zthuizong/jianzhu/" target="_blank"><center>2013备考专题</center></a>
						 <a class="hui a_left"> | </a>
<a style="color:#333333;" class="d_width" href="/course/courselist.php?id=24" target="_blank"><center>课程中心</center></a>
						 <a class="hui a_left">
                             </a>

                </li>            	
            </ul>
            <ul class="toutiao2">
            	<li class="toutiao">
					<a href="/jianzhu/zhuanti/yijian/" target="_blank">2014年一建招生辅导方案</a>
<a href="/jianzhu/zhuanti/jlzsjz/" target="_blank">2014年监理师招生辅导方案</a>

				</li>
            	<li>
					<a class="hui" href="/yiji/ziliao/20120309/1765.html" target="_blank">2014年一建招生简章(保过班)</a>
						<a class="hui"> | </a>
<a class="hui" href="/zxgcs/zixun/20121013/13954.html" target="_blank">2014年咨询工程师协议保过班</a>
						<a class="hui"></a>
<br />
					
				<a class="hui" href="/yiji/ziliao/20120612/9300.html" target="_blank">全国一级建造师历年真题汇总</a>
						<a class="hui"> | </a>
<a class="hui" href="/yiji//zixun/20121030/14785.html" target="_blank">深入了解建筑考试通过率详情</a>
						<a class="hui"></a>

         
                </li>
                <li style="clear:both;">
					<a href="/erji/ziliao/20120726/10875.html" target="_blank">
							<img src="/youeclass/images/st.png" />二建押题名师2014备考访谈</a>
						<a class="hui"> | </a>
<a href="/wuye/zixun/20120719/10622.html" target="_blank">
							<img src="/youeclass/images/st.png" />物业管理师押题名师备考访谈</a>
						<a class="hui"></a>
<br />
                  	<a href="/zxgcs/zixun/20130411/19696.html" target="_blank">
							<img src="/youeclass/images/st.png" />2014年咨询工程师报名时间</a>
						<a class="hui"> | </a>
<a href="/zhiliang/hxrd/2012/0413/2381.html" target="_blank">
							<img src="/youeclass/images/st.png" />2014质量工程师招生简章</a>
						<a class="hui"></a>

                </li>            	
            </ul>
        </div>
        <div class="ms1_right">
        	<div class="title1"><a href="/course/courselist.php?id=35" id="kc0" onmouseover="hgkc(0)">热门课程</a><a target="_blank" href="/bbs/forum.php?mod=forumdisplay&fid=227&filter=typeid&typeid=64" id="kc1" onmouseover="hgkc(1)">教务公告</a></div>
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
        </div>
    </div>
    <div class="mains2">
    	<div class="ms2_left">
        	<div class="ms2_left_title">课程体验</div>
            <div class="ms2_left_con">
            	<dl>
				
				 <dt><a href="/shiting/shiting.php?id=2430" target="_blank"><img src='/youeclass/images/18-1303121F145134.jpg' border='0' width='120' height='67' alt='2014年二建机电实务高清试听 李国刚'></a></dt>

                    <dd>
                    	<ul>
						   <li><a href="/shiting/shiting.php?id=2872" target="_blank">2014监理工程师高清</a></li>
<li><a href="/shiting/shiting.php?id=13913" target="_blank">2014年二建施工管理高清</a></li>
<li><a href="/shiting/shiting.php?id=15686" target="_blank">2014年一建工程经济高清</a></li>

                        </ul>
                    </dd>
                </dl>
                <ul class="tubiao">
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
                 <li><a href="#" title="#" target="_blank">2014年二级建造师全程班</a></li><li><a href="/bbs/thread-116339-1-1.html" title="" target="_blank">2014年监理工程师全程班</a></li><li><a href="#" title="" target="_blank">2014年一级建造师全程VIP班</a></li><li><a href="#" title="" target="_blank">2014年安全工程师全程名师班</a></li>
                 </ul>
             </div>

        </div>
    </div>   
	<div class="kb_title"><img src="/youeclass/images/bkzx.png" />
    	<li><a >成绩查询</a><a>|</a> <a >准考证打印时间</a><a>|</a><a >报名时间</a><a>|</a><a >考试时间</a></li>
    </div>
    <div class="bkzx">
    	<div class="bkzx1">
        	<div class="bkzx1_title">
                <a class="fudongq" id="mods1" onmouseover="switchmodTag('mods','bmenus','1','1','2','fudongq','fudongx','ms2_left_con2');this.blur();" >报名时间</a>               
                <a class="fudongx" id="mods2" onmouseover="switchmodTag('mods','bmenus','2','1','2','fudongq','fudongx','ms2_left_con2');this.blur();" >准考证打印</a>
            </div>
            <div class="ms2_left_con2" style="border:none;" id="bmenus1">            	
                <ul class="mianshi">
                   <li class="contitle"><a href="/zhaobiao/zixun/20140116/32389.html" title="兵团2014年招标师报考条件" target="_blank">兵团2014年招标师报考条件</a></li>
<li class="contitle"><a href="/zhaobiao/zixun/20140116/32388.html" title="云南2014年招标师报考条件" target="_blank">云南2014年招标师报考条件</a></li>
<li class="contitle"><a href="/zhaobiao/zixun/20140116/32387.html" title="贵州2014年招标师报考条件" target="_blank">贵州2014年招标师报考条件</a></li>

                </ul>
                <dl class="mspic">
                	<dt><a href="/teacher/teacherDetails.php?tid=181" target="_blank">
							<img src='/youeclass/images/18-1210220914550-L.jpg' border='0' width='73' height='74' alt='一级建造师-李国刚'></a>

						</dt>
                    <dd>
                    	<ul>
                          <li class="contitle"><a href="/zhaobiao/zixun/20140116/32386.html" title="河南2014年招标师报考条件" target="_blank">河南2014年招标师报考条件</a></li>
<li class="contitle"><a href="/zhaobiao/zixun/20140116/32385.html" title="新疆2014年招标师报考条件" target="_blank">新疆2014年招标师报考条件</a></li>
<li class="contitle"><a href="/zhaobiao/zixun/20140116/32384.html" title="宁夏2014年招标师报考条件" target="_blank">宁夏2014年招标师报考条件</a></li>

                        </ul>
                    </dd>
                </dl>
            </div>
            <div class="ms2_left_con2 shownones" style="border:none;" id="bmenus2">            	
                <ul class="mianshi">
                	 <li class="contitle"><a href="/erji/zixun/20140114/32301.html" title="2013年云南二级建造师考试合格标准" target="_blank">2013年云南二级建造师考试合格标准</a></li>
<li class="contitle"><a href="/erji/zixun/20140114/32300.html" title="2013云南二级建造师成绩查询入口开通" target="_blank">2013云南二级建造师成绩查询入口开通</a></li>
<li class="contitle"><a href="/zaojia/zixun/20140109/32016.html" title="兵团2013年造价工程师成绩查询入口开通" target="_blank">兵团2013年造价工程师成绩查询入口开通</a></li>

                </ul>
                <dl class="mspic">
                	<dt><a href="/teacher/teacherDetails.php?tid=199" target="_blank">
							<img src='/youeclass/images/18-121022091A3639.jpg' border='0' width='73' height='74' alt='一级建造师-杨强'></a>

						</dt>
                    <dd>
                    	<ul>
                        	 <li class="contitle"><a href="/zaojia/zixun/20140109/32015.html" title="新疆2013年造价工程师成绩查询入口开通" target="_blank">新疆2013年造价工程师成绩查询入口开</a></li>
<li class="contitle"><a href="/zaojia/zixun/20140109/32014.html" title="青海2013年造价工程师成绩查询入口开通" target="_blank">青海2013年造价工程师成绩查询入口开</a></li>
<li class="contitle"><a href="/zaojia/zixun/20140109/32013.html" title="黑龙江2013年造价工程师成绩查询入口开通" target="_blank">黑龙江2013年造价工程师成绩查询入口</a></li>

                        </ul>
                    </dd>
                </dl>
            </div>
        </div>
        <div class="bkzx1">
        	<div class="bkzx1_title">
                <a class="fudongq" id="mods3" onmouseover="switchmodTag('mods','bmenus','3','3','4','fudongq','fudongx','ms2_left_con2');this.blur();" >考试时间</a>
                <a class="fudongx" id="mods4" onmouseover="switchmodTag('mods','bmenus','4','3','4','fudongq','fudongx','ms2_left_con2');this.blur();" >成绩查询</a>
			</div>
            <div class="ms2_left_con2" style="border:none;" id="bmenus3">            	
                <ul class="mianshi">
                	 <li class="contitle"><a href="/erji/zixun/20140114/32303.html" title="名师公开课：2014年二建建设工程施工管理" target="_blank">名师公开课：2014年二建建设工程施工管</a></li>
<li class="contitle"><a href="/erji/zixun/20131230/31161.html" title="2014年二级建造师考试免费直播大课堂" target="_blank">2014年二级建造师考试免费直播大课堂</a></li>
<li class="contitle"><a href="/yiji/ziliao/20131025/25769.html" title="2014年一级建造师考试备考视频(高清版)" target="_blank">2014年一级建造师考试备考视频(高清版)</a></li>
<li class="contitle"><a href="/erji/zixun/20131025/25768.html" title="2014年二级建造师考试备考视频(高清版)" target="_blank">2014年二级建造师考试备考视频(高清版)</a></li>
<li class="contitle"><a href="/zhaobiao/zixun/20130605/20338.html" title="视频:全国招标师考试报考条件" target="_blank">视频:全国招标师考试报考条件</a></li>
<li class="contitle"><a href="/erji/zixun/20130506/19932.html" title="2013年二建施工管理考前必看课程 杨强" target="_blank">2013年二建施工管理考前必看课程 杨强</a></li>
<li class="contitle"><a href="/erji/zixun/20130506/19931.html" title="2013年二建施工管理考前备考访谈 杨强" target="_blank">2013年二建施工管理考前备考访谈 杨强</a></li>

                </ul>                
            </div>
            <div class="ms2_left_con2 shownones" style="border:none;" id="bmenus4">            	
                <ul class="mianshi">
                	 <li class="contitle"><a href="/yiji/zixun/20140116/32390.html" title="分享：2014年一级建造师考试QQ交流群" target="_blank">分享：2014年一级建造师考试QQ交流</a></li>
<li class="contitle"><a href="/zhaobiao/zixun/20140116/32355.html" title="提醒：2013年招标师考试合格标准已公布" target="_blank">提醒：2013年招标师考试合格标准已</a></li>
<li class="contitle"><a href="/yiji/zixun/20140116/32353.html" title="2014年一级建造师教材改版：新《民事诉讼法》修改对建造师考试的影响" target="_blank">2014年一级建造师教材改版：新《民事诉讼法</a></li>
<li class="contitle"><a href="/jianli/zixun/20140116/32320.html" title="监理工程师学习中的八条禁忌" target="_blank">监理工程师学习中的八条禁</a></li>
<li class="contitle"><a href="/jianli/zixun/20140116/32319.html" title="2014年注册监理工程师考试难度详细解析" target="_blank">2014年注册监理工程师考试难</a></li>
<li class="contitle"><a href="/jianli/zixun/20140116/32318.html" title="一名优秀的监理工程师具有的基本素质" target="_blank">一名优秀的监理工程师具有</a></li>
<li class="contitle"><a href="/jianli/zixun/20140116/32317.html" title="2014年监理工程师考试备考必看复习指导" target="_blank">2014年监理工程师考试备考必</a></li>

                </ul>                
            </div>
        </div>
        <div class="mszd" style="padding-top:20px;">
        	<div class="mszd_title"><a href="#" id="kcb0">热点关注</a></div>
            <div class="mszd_con">
			<dl>
                <dt><a href="/yiji/zixun/20130912/23018.html"><img src='/youeclass/images/18-130916103502240.jpg' border='0' width='73' height='74' alt='2014年一级建造师报考指南'></a></dt>
                    <dd>
						<strong><a style="color:#000000;" href="/yiji/zixun/20130912/23018.html">2014年一级建造师报考指南</a></strong><br />
 						<p style=" text-indent:2em;">2014年全国一级建造师报考指南 ...<a href="/yiji/zixun/20130912/23018.html">[查看全文]</a></p>
					</dd>

                </dl>
                <dl style="margin-bottom:0px; border-bottom:none;">
					 <dt><a href="/erji/ziliao/20120324/2066.html"><img src='/youeclass/images/18-130603113424V3.jpg' border='0' width='73' height='74' alt='2014年二级建造师报考指南'></a></dt>
                    <dd>
						<strong><a style="color:#000000;" href="#">2014年二级建造师报考指南</a></strong><br />
 						<p style=" text-indent:2em;">2014年二级建造师报考指南...<a href="#">[查看全文]</a></p>
					</dd>

                </dl>
             </div>
        </div>
    </div>
	<div class="ad"><a href='#' target='_blank'><img src='/youeclass/images/29-1312031356055H.jpg' border='0' width='960' height='90' alt='2013年造价工程师成绩查询汇总'></a></div>

	<div class="kb_title"><img src="/youeclass/images/bkfd.png" />
        <li><a href="/jianli/">辅导资料</a><a href="/anquan/">模拟试题|</a><a href="/fdcgj/">历年真题|</a></li>
    </div>
    <div class="fudao">
    	<div class="fd_left">        	
            <div class="bkzx1">
                <div class="bkzx1_title">
                    <a class="fudongq" id="mods5" onmouseover="switchmodTag('mods','bmenus','5','5','6','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank"; href="/yiji/">一级建造师</a>
                    <a class="fudongx" id="mods6" onmouseover="switchmodTag('mods','bmenus','6','5','6','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/erji/">二级建造师</a></div>
                <div class="ms2_left_con2" style="border:none;" id="bmenus5">            	
                    <ul class="mianshi">
                       <li class="contitle"><a href="/yiji/ziliao/20140110/32178.html" title="2014年一级建造师考试《工程经济》精选讲义29" target="_blank">2014年一级建造师考试《工程经济》精选讲义</a></li>
<li class="contitle"><a href="/yiji/ziliao/20140110/32177.html" title="2014年一级建造师考试《工程经济》精选讲义28" target="_blank">2014年一级建造师考试《工程经济》精选讲义</a></li>
<li class="contitle"><a href="/yiji/ziliao/20140110/32176.html" title="2014年一级建造师考试《工程经济》精选讲义27" target="_blank">2014年一级建造师考试《工程经济》精选讲义</a></li>

                    </ul>
                    <dl class="mspic">
                        <dt><a href="#" target="_blank">
							<img src='/youeclass/images/18-12102209211LH.jpg' border='0' width='73' height='74' alt='一级建造师-张鹏程'></a>

						</dt>
                        <dd>
                            <ul>
                             <li class="contitle"><a href="/yiji/ziliao/20140110/32175.html" title="2014年一级建造师考试《工程经济》精选讲义26" target="_blank">2014年一级建造师考试《工程经济》</a></li>
<li class="contitle"><a href="/yiji/ziliao/20140110/32174.html" title="2014年一级建造师考试《工程经济》精选讲义25" target="_blank">2014年一级建造师考试《工程经济》</a></li>
<li class="contitle"><a href="/yiji/ziliao/20140110/32173.html" title="2014年一级建造师考试《工程经济》精选讲义24" target="_blank">2014年一级建造师考试《工程经济》</a></li>

                            </ul>
                        </dd>
                    </dl>
                </div>
                <div class="ms2_left_con2 shownones" style="border:none;" id="bmenus6">            	
                    <ul class="mianshi">
                        <li class="contitle"><a href="/erji/ziliao/20131230/31203.html" title="二级建造师法规历年真题详解：合同法原则及合同分类" target="_blank">二级建造师法规历年真题详解：合同</a></li>
<li class="contitle"><a href="/erji/ziliao/20131230/31201.html" title="二级建造师法规历年真题详解：建设工程法律责任" target="_blank">二级建造师法规历年真题详解：建设</a></li>
<li class="contitle"><a href="/erji/ziliao/20131230/31199.html" title="二级建造师法规历年真题详解：税法" target="_blank">二级建造师法规历年真题详解：税法</a></li>

                    </ul>
                    <dl class="mspic">
                        <dt><a href="#" target="_blank">
							<img src='/youeclass/images/18-1210220922350-L.jpg' border='0' width='73' height='74' alt='一级建造师-李鹏飞'></a>

						</dt>
                        <dd>
                            <ul>
                               <li class="contitle"><a href="/erji/ziliao/20131230/31197.html" title="二级建造师法规历年真题详解：档案法" target="_blank">二级建造师法规历年真题详解：档案</a></li>
<li class="contitle"><a href="/erji/ziliao/20131230/31195.html" title="二级建造师法规历年真题详解：劳动合同法" target="_blank">二级建造师法规历年真题详解：劳动</a></li>
<li class="contitle"><a href="/erji/ziliao/20131230/31193.html" title="二级建造师法规历年真题详解：劳动法" target="_blank">二级建造师法规历年真题详解：劳动</a></li>

                            </ul>
                        </dd>
                    </dl>
                </div>
            </div>   
            <div class="bkzx1">
                <div class="bkzx1_title">
                    <a class="fudongq" id="mods7" onmouseover="switchmodTag('mods','bmenus','7','7','8','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/zaojia/">造价工程师</a>
                    <a class="fudongx" id="mods8" onmouseover="switchmodTag('mods','bmenus','8','7','8','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/wuye/">物业管理师</a></div>
                <div class="ms2_left_con2" style="border:none;" id="bmenus7">            	
                    <ul class="mianshi">
                        <li class="contitle"><a href="/zaojia/ziliao/20140103/31571.html" title="2014年造价工程师考试《造价管理》精选辅导12" target="_blank">2014年造价工程师考试《造价管理》精选辅导</a></li>
<li class="contitle"><a href="/zaojia/ziliao/20140103/31570.html" title="2014年造价工程师考试《造价管理》精选辅导11" target="_blank">2014年造价工程师考试《造价管理》精选辅导</a></li>
<li class="contitle"><a href="/zaojia/ziliao/20131226/31004.html" title="2014年造价工程师考试《安装工程》精选考点19" target="_blank">2014年造价工程师考试《安装工程》精选考点</a></li>
<li class="contitle"><a href="/zaojia/ziliao/20131226/30999.html" title="2014年造价工程师考试《安装工程》精选考点18" target="_blank">2014年造价工程师考试《安装工程》精选考点</a></li>
<li class="contitle"><a href="/zaojia/ziliao/20131226/30998.html" title="2014年造价工程师考试《安装工程》精选考点17" target="_blank">2014年造价工程师考试《安装工程》精选考点</a></li>
<li class="contitle"><a href="/zaojia/ziliao/20131226/30997.html" title="2014年造价工程师考试《安装工程》精选考点16" target="_blank">2014年造价工程师考试《安装工程》精选考点</a></li>
<li class="contitle"><a href="/zaojia/ziliao/20131225/30931.html" title="2014年造价工程师考试《土建工程》精选辅导40" target="_blank">2014年造价工程师考试《土建工程》精选辅导</a></li>

                    </ul>
                </div>
                <div class="ms2_left_con2 shownones" style="border:none;" id="bmenus8">            	
                    <ul class="mianshi">
                       <li class="contitle"><a href="/wuye/ziliao/20140113/32238.html" title="2014物业管理师《制度与政策》知识点:工商处理有关规定" target="_blank">2014物业管理师《制度与政策》知识点:工商处</a></li>
<li class="contitle"><a href="/wuye/ziliao/20140113/32237.html" title="2014物业管理师《制度与政策》知识点:物业管理合同要素" target="_blank">2014物业管理师《制度与政策》知识点:物业管</a></li>
<li class="contitle"><a href="/wuye/ziliao/20140113/32236.html" title="2014物业管理师《制度与政策》知识点:物业管理公司业务" target="_blank">2014物业管理师《制度与政策》知识点:物业管</a></li>
<li class="contitle"><a href="/wuye/ziliao/20140113/32235.html" title="2014物业管理师《制度与政策》知识点:物业管理招标书" target="_blank">2014物业管理师《制度与政策》知识点:物业管</a></li>
<li class="contitle"><a href="/wuye/ziliao/20140113/32234.html" title="2014物业管理师《制度与政策》知识点:物业管理答辩程序" target="_blank">2014物业管理师《制度与政策》知识点:物业管</a></li>
<li class="contitle"><a href="/wuye/ziliao/20140113/32233.html" title="2014物业管理师《制度与政策》知识点:消防安全中心" target="_blank">2014物业管理师《制度与政策》知识点:消防安</a></li>
<li class="contitle"><a href="/wuye/ziliao/20140113/32232.html" title="2014物业管理师《制度与政策》知识点:更衣室管理" target="_blank">2014物业管理师《制度与政策》知识点:更衣室</a></li>

                    </ul>
                </div>
            </div>  
            <div class="bkzx1">
                <div class="bkzx1_title">
                    <a class="fudongq" id="mods11" onmouseover="switchmodTag('mods','bmenus','11','11','12','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/zhaobiao/">招标师</a>
					<a class="fudongx" id="mods12" onmouseover="switchmodTag('mods','bmenus','12','11','12','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/zhiliang/">质量资格师</a>
					
                   </div>
                <div class="ms2_left_con2" style="border:none;" id="bmenus11">            	
                    <ul class="mianshi">
                       <li class="contitle"><a href="/zhaobiao/ziliao/20131231/31438.html" title="2014年招标师《招标采购专业实务》复习重点(11)" target="_blank">2014年招标师《招标采购专业实务》复</a></li>
<li class="contitle"><a href="/zhaobiao/ziliao/20131231/31437.html" title="2014年招标师《招标采购专业实务》复习重点(10)" target="_blank">2014年招标师《招标采购专业实务》复</a></li>
<li class="contitle"><a href="/zhaobiao/ziliao/20131231/31436.html" title="2014年招标师《招标采购专业实务》复习重点(9)" target="_blank">2014年招标师《招标采购专业实务》复</a></li>

                    </ul>
                    <dl class="mspic">
                        <dt><a href="#" target="_blank">
							<img src='/youeclass/images/18-1210220924340-L.jpg' border='0' width='73' height='74' alt='一级建造师-李金贝'></a>

						</dt>
                        <dd>
                            <ul>
                              <li class="contitle"><a href="/zhaobiao/ziliao/20131231/31435.html" title="2014年招标师《招标采购专业实务》复习重点(8)" target="_blank">2014年招标师《招标采购专业实务》复</a></li>
<li class="contitle"><a href="/zhaobiao/ziliao/20131231/31434.html" title="2014年招标师《招标采购专业实务》复习重点(7)" target="_blank">2014年招标师《招标采购专业实务》复</a></li>
<li class="contitle"><a href="/zhaobiao/ziliao/20131231/31433.html" title="2014年招标师《招标采购专业实务》复习重点(6)" target="_blank">2014年招标师《招标采购专业实务》复</a></li>

                            </ul>
                        </dd>
                    </dl>
                </div>
                 <div class="ms2_left_con2 shownones" style="border:none;" id="bmenus12">            	
                    <ul class="mianshi">
                           <li class="contitle"><a href="/zhiliang/ziliao/20140110/32150.html" title="2014初级质量工程师《专业相关知识》备考资料8" target="_blank">2014初级质量工程师《专业相关知识》</a></li>
<li class="contitle"><a href="/zhiliang/ziliao/20140110/32148.html" title="2014初级质量工程师《专业相关知识》备考资料7" target="_blank">2014初级质量工程师《专业相关知识》</a></li>
<li class="contitle"><a href="/zhiliang/ziliao/20140110/32147.html" title="2014初级质量工程师《专业相关知识》备考资料6" target="_blank">2014初级质量工程师《专业相关知识》</a></li>

                    </ul>
                    <dl class="mspic">
                       <dt><a href="#" target="_blank">
							<img src='/youeclass/images/18-121022092G30-L.jpg' border='0' width='73' height='74' alt='一级建造师-崔东红'></a>

						</dt>
                        <dd>
                            <ul>
                               <li class="contitle"><a href="/zhiliang/ziliao/20140110/32146.html" title="2014初级质量工程师《专业相关知识》备考资料5" target="_blank">2014初级质量工程师《专业相关知识》</a></li>
<li class="contitle"><a href="/zhiliang/ziliao/20140110/32145.html" title="2014初级质量工程师《专业相关知识》备考资料4" target="_blank">2014初级质量工程师《专业相关知识》</a></li>
<li class="contitle"><a href="/zhiliang/ziliao/20140110/32144.html" title="2014初级质量工程师《专业相关知识》备考资料3" target="_blank">2014初级质量工程师《专业相关知识》</a></li>

                            </ul>
                        </dd>
                    </dl>
                </div>
            </div>   
            <div class="bkzx1">
                <div class="bkzx1_title">
                    <a class="fudongq" id="mods13" onmouseover="switchmodTag('mods','bmenus','13','13','14','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/jianli/">监理工程师</a>
					 <a class="fudongx" id="mods14" onmouseover="switchmodTag('mods','bmenus','14','13','14','fudongq','fudongx','ms2_left_con2');this.blur();" target="_blank" href="/anquan/">安全工程师</a>
                  </div>
                <div class="ms2_left_con2" style="border:none;" id="bmenus13">            	
                    <ul class="mianshi">
                    <li class="contitle"><a href="/jianli/ziliao/20140107/31734.html" title="2014年监理工程师《理论与法规》复习指导汇总" target="_blank">2014年监理工程师《理论与法规》复习指导汇</a></li>
<li class="contitle"><a href="/jianli/ziliao/20140107/31733.html" title="2014年监理工程师《理论与法规》复习指导(6)" target="_blank">2014年监理工程师《理论与法规》复习指导</a></li>
<li class="contitle"><a href="/jianli/ziliao/20140107/31732.html" title="2014年监理工程师《理论与法规》复习指导(5)" target="_blank">2014年监理工程师《理论与法规》复习指导</a></li>
<li class="contitle"><a href="/jianli/ziliao/20140107/31731.html" title="2014年监理工程师《理论与法规》复习指导(4)" target="_blank">2014年监理工程师《理论与法规》复习指导</a></li>
<li class="contitle"><a href="/jianli/ziliao/20140107/31730.html" title="2014年监理工程师《理论与法规》复习指导(3)" target="_blank">2014年监理工程师《理论与法规》复习指导</a></li>
<li class="contitle"><a href="/jianli/ziliao/20140107/31729.html" title="2014年监理工程师《理论与法规》复习指导(2)" target="_blank">2014年监理工程师《理论与法规》复习指导</a></li>
<li class="contitle"><a href="/jianli/ziliao/20140107/31728.html" title="2014年监理工程师《理论与法规》复习指导(1)" target="_blank">2014年监理工程师《理论与法规》复习指导</a></li>

                    </ul>
                </div>
				 <div class="ms2_left_con2 shownones" style="border:none;" id="bmenus14">            	
                    <ul class="mianshi">
               		   <li class="contitle"><a href="/anquan/ziliao/20140108/32005.html" title="2014年注册安全工程师考试《安全生产法》精选讲义164" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>
<li class="contitle"><a href="/anquan/ziliao/20140108/32003.html" title="2014年注册安全工程师考试《安全生产法》精选讲义163" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>
<li class="contitle"><a href="/anquan/ziliao/20140108/32002.html" title="2014年注册安全工程师考试《安全生产法》精选讲义162" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>
<li class="contitle"><a href="/anquan/ziliao/20140108/32001.html" title="2014年注册安全工程师考试《安全生产法》精选讲义161" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>
<li class="contitle"><a href="/anquan/ziliao/20140108/31999.html" title="2014年注册安全工程师考试《安全生产法》精选讲义160" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>
<li class="contitle"><a href="/anquan/ziliao/20140108/31998.html" title="2014年注册安全工程师考试《安全生产法》精选讲义159" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>
<li class="contitle"><a href="/anquan/ziliao/20140108/31997.html" title="2014年注册安全工程师考试《安全生产法》精选讲义158" target="_blank">2014年注册安全工程师考试《安全生产法》精</a></li>

                    </ul>
                </div>
            </div> 
        </div>
        <div class="fd_right">
        	<div class="mszd_title" style="margin-top:16px;"><a href="#" id="kcc0" onmouseover="hgkcc(0)">最新辅导</a><!--<a href="#" id="kcc1" onmouseover="hgkcc(1)"></a>--></div>
            <ul class="paihang" id="kchgc0">
				<li><span style="margin-top:5px;"><img src="/youeclass/images/biao1.png" /></span>
					<a href="/wuye/ziliao/20140113/32238.html" title="2014物业管理师《制度与政策》知识点:工商处理有关规定" target="_blank">2014物业管理师《制度与政策》知识点</a>


				</li>
				 <li class="xiangs"><img src="/youeclass/images/xx.png" /></li>
                 <li><span style="margin-top:5px;"><img src="/youeclass/images/biao2.png" /></span>
					<a href="/wuye/ziliao/20140113/32237.html" title="2014物业管理师《制度与政策》知识点:物业管理合同要素" target="_blank">2014物业管理师《制度与政策》知识点</a>

				</li>
				 <li class="xiangs"><img src="/youeclass/images/xx.png" /></li>
				 <li><span style="margin-top:5px;"><img src="/youeclass/images/biao3.png" /></span>
					<a href="/wuye/ziliao/20140113/32236.html" title="2014物业管理师《制度与政策》知识点:物业管理公司业务" target="_blank">2014物业管理师《制度与政策》知识点</a>

				</li>
				  <li class="xiangs"><img src="/youeclass/images/xx.png" /></li>
				  
				<li><span>4</span>
					<a href="/wuye/ziliao/20140113/32235.html" title="2014物业管理师《制度与政策》知识点:物业管理招标书" target="_blank">2014物业管理师《制度与政策》知识点</a>
					</li>
<li><span>5</span>
					<a href="/wuye/ziliao/20140113/32234.html" title="2014物业管理师《制度与政策》知识点:物业管理答辩程序" target="_blank">2014物业管理师《制度与政策》知识点</a>
					</li>
<li><span>6</span>
					<a href="/wuye/ziliao/20140113/32233.html" title="2014物业管理师《制度与政策》知识点:消防安全中心" target="_blank">2014物业管理师《制度与政策》知识点</a>
					</li>
<li><span>7</span>
					<a href="/wuye/ziliao/20140113/32232.html" title="2014物业管理师《制度与政策》知识点:更衣室管理" target="_blank">2014物业管理师《制度与政策》知识点</a>
					</li>
<li><span>8</span>
					<a href="/wuye/ziliao/20140113/32231.html" title="2014物业管理师《制度与政策》知识点:职工浴室管理" target="_blank">2014物业管理师《制度与政策》知识点</a>
					</li>
<li><span>9</span>
					<a href="/wuye/ziliao/20140113/32230.html" title="2014物业管理师《制度与政策》知识点:财务管理" target="_blank">2014物业管理师《制度与政策》知识点</a>
					</li>

              
            </ul>
			<div class="ad2"><a href='#' target='_blank'><img src='/youeclass/images/18-1209240U91U11.jpg' border='0' width='237' height='60' alt='2012年二级建造师真题汇总'></a></div>
<div class="ad2"><a href='#' target='_blank'><img src='/youeclass/images/18-1209240UI6104.jpg' border='0' width='237' height='60' alt='2013年监理工程师课程隆重上线'></a></div>
	
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
            <li>Copyright &copy; 2013-2016 Youeclass.net Inc. All Rights  Reserved.</li>
            <li><a rel="nofollow" href="#">优异网校</a>&nbsp;<a href="/jianzhu/">建筑网校</a>&nbsp; 版权所有 京ICP备11012638号</li>
			<li> <script src="http://s19.cnzz.com/stat.php? id=5456201&web_id=5456201" language="JavaScript"></script> &nbsp;&nbsp; <script language="javascript" type="text/javascript"  src="http://js.users.51.la/15961317.js"></script><noscript><a href="http://www.51.la/?15961317"  target="_blank"><img  alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;"  src="http://img.users.51.la/15961317.asp" style="border:none"  /></a></noscript></li>
        </ul>
    </div>
</div>

</div>
</body>
</html>