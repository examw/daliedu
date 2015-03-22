jQuery(function(){
//选项卡滑动切换通用
jQuery(function(){jQuery(".hoverTag .chgBtn").hover(function(){jQuery(this).parent().find(".chgBtn").removeClass("chgCutBtn");jQuery(this).addClass("chgCutBtn");var cutNum=jQuery(this).parent().find(".chgBtn").index(this);jQuery(this).parents(".hoverTag").find(".chgCon").hide();jQuery(this).parents(".hoverTag").find(".chgCon").eq(cutNum).show();})})

//选项卡点击切换通用
jQuery(function(){jQuery(".clickTag .chgBtn").click(function(){jQuery(this).parent().find(".chgBtn").removeClass("chgCutBtn");jQuery(this).addClass("chgCutBtn");var cutNum=jQuery(this).parent().find(".chgBtn").index(this);jQuery(this).parents(".clickTag").find(".chgCon").hide();jQuery(this).parents(".clickTag").find(".chgCon").eq(cutNum).show();})})

//header 去背景
$(".header_itmList ul li:last").css("background","none");
$(".nav ul li:last").css({"background":"none","padding-right":"0"});
$(".min_a2:last").css("border-right","none");
$(".mbx3_u2 li:last").css("border-bottom","none");

})
//屏蔽页面错误
jQuery(window).error(function(){
  return true;
});
jQuery("img").error(function(){
  $(this).hide();
});

//首页焦点图
function mainfun(mainObj,t){
		 function getID(id){return document.getElementById(id)}
	     function getTag(tag,obj){return (typeof obj=='object'?obj:getID(obj)).getElementsByTagName(tag); }
		 function alph(obj,n){if(document.all){obj.style.filter="alpha(opacity="+n+")";}}
		 var cut = 0;
		 var timer='';
		 var num = getTag('li',getTag('div',getID(mainObj))[0]).length;		
		 var getpic = getTag('li',getTag('div',getID(mainObj))[0]);
		 var getbtn = getTag('li',getTag('div',getID(mainObj))[1]);
		 var gettext = getTag('li',getTag('div',getID(mainObj))[2]);		 
		 for(i=0;i<num;i++){getpic[i].style.display="none";gettext[i].style.display="none";getbtn[i].onclick=(function(i){
			 return function(){ getbtn[i].className="sel";changePic(i);}})(i);}			 
			 getpic[cut].style.display="block";
			 getbtn[cut].className="sel";
			 gettext[cut].style.display="block";
		 getID(mainObj).onmouseover=function(){clearInterval(timer);}
		 getID(mainObj).onmouseout=function(){timer = setInterval(autoPlay,t);}
		function changePic(ocut){
			for(i=0;i<num;i++){cut=ocut;
			 getpic[i].style.display="none";
			 getbtn[i].className=""			
			 gettext[i].style.display="none";
			 }
			 getpic[cut].style.display="block";
			 getbtn[cut].className="sel";
			 gettext[cut].style.display="block"	
			 	     
	     }
		 function autoPlay(){
			 //alert(cut);
			 if(cut>=num-1){cut=0}else{cut++}
			 changePic(cut);
			 }
			 timer = setInterval(autoPlay,t);
		}	
		
function changeMenu(){
	function getID(id){return document.getElementById(id)}
	function getTag(tag,obj){return (typeof obj=='object'?obj:getID(obj)).getElementsByTagName(tag); }
	var sel=0;var menu = getID("menu");var getBtn = getTag("h2",menu);	var getUl = getTag("ul",menu);var num = getTag("h2",menu).length;for(i=0;i<num;i++){
		getUl[i].style.display="none";
		getBtn[i].onclick=(function(i){
			return function(){
				clickMenu(i);
				}
			})(i);
		}
		getUl[sel].style.display="block";
	function clickMenu(sel){
	for(i=0;i<num;i++){
		getUl[i].style.display="none";
		}
		getUl[sel].style.display="block";
	  }
	}