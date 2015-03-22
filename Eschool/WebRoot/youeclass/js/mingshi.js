// JavaScript Document
function setFrom(obj){	
   var oUl = obj.getElementsByTagName('ul')[0];          
	   if(oUl.style.display == 'none'){
		   oUl.style.display = 'block';			  		    
	   }else{
		   oUl.style.display = 'none';
	   }
       /*obj.onmouseout = function(){
		  oUl.style.display = "none";   
	   }*/
	   oUl.onmouseout = function(){
		this.style.display = "none";   
	  }
   var oLis = obj.getElementsByTagName("li");           
   for(var i=0;i<oLis.length;i++){		  
	   oLis[i].onclick = function(){		 		  		 
		  obj.firstChild.innerHTML = this.innerHTML;		  
	   }
	   oLis[i].onmouseover = function(){		 		  		 
		  oUl.style.display = "block";	  
	   }
	   oLis[i].onmouseout = function(){		 		  		 
		  oUl.style.display = "none";	  
	   }
   }
}
function setTabms(m,n){
  var menu=document.getElementById("tab"+m).getElementsByTagName("li");
  var div=document.getElementById("tablist"+m).getElementsByTagName("div");
  var showdiv=[];
  for (i=0; j=div[i]; i++){
  if ((" "+div[i].className+" ").indexOf(" tablist ")!=-1){
  showdiv.push(div[i]);
  }
  }
  for(i=0;i<menu.length;i++)
  {
  menu[i].className=i==(n-1)?"now":"";
  showdiv[i].style.display=i==(n-1)?"block":"none";
  }
}
