var examwplay ={
	opacity : 0 ,
	playID  : "" ,
	width   : 862 ,
	height  : 525 ,
	Lightstuta : 1,
    Installurl : "http://wx.233.com/player/Installplayer.swf" ,
    playerurl  : "http://wx.233.com/player/wxplayer3.5.3.swf?v=3.5.7" ,
    params     : {allowFullScreen:"true", wmode:"opaque"} ,
	loadflash  : function(playObjID,swfconfig,swfwidth,swfheight){
		examwplay.playID = playObjID;
		if(typeof(swfwidth)=="number"){
			examwplay.width = swfwidth;
		} else {
			swfwidth = examwplay.width;
			}
		if(typeof(swfheight)=="number"){
			examwplay.height = swfheight;
		}else{	
		    swfheight = examwplay.height;
		}		
		swfobject.embedSWF(examwplay.playerurl,playObjID,swfwidth,swfheight,"10",examwplay.Installurl,swfconfig,examwplay.params);
    },
	changesize : function(sizeTF){
		var sh = 445,sw=720;
		if (sizeTF == 2){
			$("#"+this.playID).attr("height",examwplay.height);
			$("#"+this.playID).attr("width",examwplay.width);
		}else{
			$("#"+this.playID).attr("height",sh);
			$("#"+this.playID).attr("width",sw);			
		}
	},
	Switchlights : function(){
		if($("#Coverbox").length>0){
			if(examwplay.Lightstuta == 1){
			    examwplay.opacity = examwplay.opacity + 0.05;
				if(examwplay.opacity<1.05){
		          $("#zgbox").css("opacity",examwplay.opacity);
		          $("#zgbox").css("filter","alpha(opacity="+(examwplay.opacity*100)+")");
		          setTimeout("examwplay.Switchlights()",50);					
				}else{
					examwplay.Lightstuta = 0;
					examwplay.opacity = 1;
				}
			}else{
			    examwplay.opacity = examwplay.opacity - 0.05;
				if(examwplay.opacity>0){
		          $("#zgbox").css("opacity",examwplay.opacity);
		          $("#zgbox").css("filter","alpha(opacity="+(examwplay.opacity*100)+")");
		          setTimeout("examwplay.Switchlights()",50);	
				}else{
				   $("#Coverbox").remove();
				   examwplay.Lightstuta = 1;
				   examwplay.opacity = 0;
				   $(".container").css("z-index",0);
				}
			}
		}
	},
	changevideo:function(vid,pltime,FlashplayID){
		if(typeof(FlashplayID)!="string"){
			FlashplayID = examwplay.playID;
		}		
		if(typeof(document.getElementById(FlashplayID).vod)=="function") {
		document.getElementById(FlashplayID).vod(vid,pltime);
		}else{
			setTimeout(function(){ examwplay.changevideo(vid,pltime,FlashplayID) },1000);
		}
	},
	playPause:function(playFlag,FlashplayID){
		if(typeof(FlashplayID)!="string"){
			FlashplayID = examwplay.playID;
		}
		if(typeof(document.getElementById(FlashplayID).playPause)=="function"){
			document.getElementById(FlashplayID).playPause(playFlag);
		}else{
		setTimeout(function(){ examwplay.playPause(playFlag,FlashplayID) },1000); }
	}
}

function scale(dxbz){
    examwplay.changesize(dxbz);
}

function turnOffLight(){
	if(examwplay.Lightstuta == 1){
       var Coverlayer = '<div id="Coverbox" style="width: 100%; height: 100%; position: fixed; z-index: 10000; top: 0px; left: 0px; overflow: hidden;"><div id="zgbox" style="height: 100%; background: none repeat scroll 0% 0% rgb(0, 0, 0); opacity: 0; filter:alpha(opacity=0);"></div></div>';
	   if($("#Coverbox").length>0) $("#Coverbox").remove();
	   $(".container").css("z-index",10001);
       $("body").append(Coverlayer);		
	}else{
		
	}
	examwplay.Switchlights();
}

function updateIndex(index){
   selfurl = window.location.toString();
   selfurl = selfurl.split("?")[0];
   window.location = selfurl + "?mid="+myClassID+"&did="+nextdid;
}

function writePlayInfo(url,time,index){
   	if(url=="") url = window.location;
	var Days = 30;
	var exp = new Date(); 
	exp.setTime(exp.getTime() + Days*24*60*60*1000);
	document.cookie = "ExamdaVideourl="+ escape(url) + ";expires=" + exp.toGMTString();	
	document.cookie = "ExamdaVideotime="+ escape(time) + ";expires=" + exp.toGMTString();
	document.cookie = "ExamdaVideoindex="+ escape(index) + ";expires=" + exp.toGMTString();
}

function openUrl(openurl){
   if(typeof(openurl)=="string") {
     window.location = openurl; }
}

function openUrl(openurl){
   if(typeof(openurl)=="string") {
     window.location = openurl; }
}

function updateTotalTime(vt){ //参为VT为Flash返回的总时长
   //这里为自己的代码
}

var ischrome=function(){
	  var tmpua = navigator.userAgent;
	  var tmpchrome = /chrome/i.test(tmpua) && /webkit/i.test(tmpua);
	  if(tmpchrome==true && navigator.mimeTypes[0].suffixes=="swf"){
		 return true; 
	  }else{
		return false;
	  }
}();