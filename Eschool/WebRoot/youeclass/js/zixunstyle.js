// JavaScript Document
 function hgsiks(x){
	for(i=0; i<4; i++){
	document.getElementById("liuks"+i).style.display="none";
	document.getElementById("liuks"+x).style.display="block";
	
	document.getElementById("hgliys"+i).style.borderTop="1px solid #e6e6e6";
	document.getElementById("hgliys"+i).style.borderBottom="1px solid #e6e6e6";
	document.getElementById("hgliys"+i).style.background="#f6f6f6";
	document.getElementById("hgliys"+x).style.borderTop="1px solid #0085ff";
	document.getElementById("hgliys"+x).style.borderBottom="1px solid #ffffff";	
	document.getElementById("hgliys"+x).style.background="#ffffff";
	
	}
}