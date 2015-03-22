// JavaScript Document
function hgkc(x){
  for(i=0; i<2; i++){
 	 document.getElementById("kchg"+i).style.display="none";
     document.getElementById("kchg"+x).style.display="block";	
							 
     document.getElementById("kc"+i).style.color="#000000";
     document.getElementById("kc"+x).style.color="#3b5085";	 
							 
     document.getElementById("kc"+i).style.background="none";
	 document.getElementById("kc"+x).style.background="url(http://img1.5haoxue.net/blue/images/hga.png)";							 
	 }
 }
 function hgkca(x){
  for(i=0; i<3; i++){
 	 document.getElementById("kchga"+i).style.display="none";
     document.getElementById("kchga"+x).style.display="block";	
							 
     document.getElementById("kca"+i).style.color="#000000";
     document.getElementById("kca"+x).style.color="#3b5085";	 
							 
     document.getElementById("kca"+i).style.background="none";
	 document.getElementById("kca"+x).style.background="url(http://img1.5haoxue.net/blue/images/hga.png)";							 
	 }
 }
  function hgkcb(x){
  for(i=0; i<2; i++){
 	 document.getElementById("kchgb"+i).style.display="none";
     document.getElementById("kchgb"+x).style.display="block";	
							 
     document.getElementById("kcb"+i).style.fontWeight="100";
     document.getElementById("kcb"+x).style.fontWeight="bold";	 
							 
     document.getElementById("kcb"+i).style.background="#999999";
	 document.getElementById("kcb"+x).style.background="#54a5ea";						 
	 }
 }
  function hgkcc(x){
  for(i=0; i<2; i++){
 	 document.getElementById("kchgc"+i).style.display="none";
     document.getElementById("kchgc"+x).style.display="block";	
							 
     document.getElementById("kcc"+i).style.fontWeight="100";
     document.getElementById("kcc"+x).style.fontWeight="bold";	 
							 
     document.getElementById("kcc"+i).style.background="#999999";
	 document.getElementById("kcc"+x).style.background="#54a5ea";						 
	 }
 }
  function hgkcd(x,q){
  for(i=0; i<q; i++){
 	 document.getElementById("kchgd"+i).style.display="none";
     document.getElementById("kchgd"+x).style.display="block";	
							 
     document.getElementById("kcd"+i).style.fontWeight="100";
     document.getElementById("kcd"+x).style.fontWeight="bold";	 
							 
     document.getElementById("kcd"+i).style.color="#1d3572";
     document.getElementById("kcd"+x).style.color="#ffffff";
	 
     document.getElementById("kcd"+i).style.background="none";
	 document.getElementById("kcd"+x).style.background="url(http://img1.5haoxue.net/blue/images/kba.png)";						 
	 }
 }
  function hgslsa(x,q){
	for(i=0; i<q; i++){
	  	if(i==x) {
     		document.getElementById("slkb"+x).style.display="block";
     		document.getElementById("sijs"+x).style.color="#ffffff";
	 		document.getElementById("sijs"+x).style.fontWeight="bold";		
	 		document.getElementById("sijs"+x).style.background="url(http://img1.5haoxue.net/green/images/hdbg2.gif) no-repeat";			 
	  	}
	  	else {
 	 		document.getElementById("slkb"+i).style.display="none";
     		document.getElementById("sijs"+i).style.color="#000000";
	 		document.getElementById("sijs"+i).style.fontWeight="100";	
     		document.getElementById("sijs"+i).style.background="none";
	  	}				 
	}
 }
