function $(nodeId)
{
	var node = document.getElementById(nodeId);
	if (!node)
	{
		alert("ID²»´æÔÚ£¡");
		return false;
	}
	return node;
}
function nodeShow(node)
{
	$(node).style.display="block";
}
function nodeHidden(node)
{
	$(node).style.display="none";
}

function TPShow(node)
{
	//$(node).style.backgroundColor=parent.getColor();
	$(node).style.borderColor=parent.getColor();
	nodeShow(node);
}


function examChangePic(node,nodeImage,nodeNote)
{
	if ($(node).style.display=="none" || $(node).style.display=="")
	{
		$(nodeImage).src="../images/btn_hidden.gif";
		nodeShow(node);
		nodeShow(nodeNote);
	}
	else
	{
		$(nodeImage).src="../images/btn_out.gif";
		nodeHidden(node);
		nodeHidden(nodeNote);
	}
	//alert($(nodeImage).src);
}

function T(n){	
	try
	{
		//parent.mdPause();
		//alert(parent.currentPart);
		document.getElementById("ArticleCnt").style.fontSize=n+"px";
		//parent.rightmain.document.location.href="#part"+lessonArray[parent.currentPart][0].toString();
		//parent.mdDbClick("part"+lessonArray[parent.currentPart][0].toString(),lessonArray[parent.currentPart][3]);
		//parent.mdPlay();
		parent.mdSeekPlay();
		//return false;
	}
	catch(e)
	{//return false;
	}	
}

function webPrint()
{
	parent.mdPause();
	top.rightmain.focus();
	top.rightmain.window.print();
	//parent.mdPlay();
}

function pointer(partHref)
{
	//alert(partHref);
	var anchorPointer = "anchor"+partHref.toString();
	$(anchorPointer).click();
}
function onKeyDown(){
	if ( (event.altKey) || ((event.keyCode == 8) && 
	(event.srcElement.type != "text" &&
	event.srcElement.type != "textarea" &&
	event.srcElement.type != "password")) || 
	((event.ctrlKey) && ((event.keyCode == 78) || (event.keyCode == 82))) || ((event.altKey) && (event.keyCode == 115)) ||
	(event.keyCode == 116)) {
 		event.keyCode = 0;
 		event.returnValue = false;
 	}
}
