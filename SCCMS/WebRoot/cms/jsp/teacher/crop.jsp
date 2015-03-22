<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.changh.sccms.until.*" %>
<%@page import="java.io.*" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String fileWebroot = pageContext.getServletContext().getRealPath("/");

String imageSource = request.getParameter("imageSource");//图片源
String imageW = request.getParameter("imageW");//图片宽
String imageH = request.getParameter("imageH");//图片高
String imageX = request.getParameter("imageX");//图片X位置
String imageY = request.getParameter("imageY");//图片Y位置

String imageRotate = request.getParameter("imageRotate");
String viewPortW = request.getParameter("viewPortW");
String viewPortH = request.getParameter("viewPortH");

String selectorX =  request.getParameter("selectorX");//选中区位置X
String selectorY = request.getParameter("selectorY");//选中区位置Y
String selectorW = request.getParameter("selectorW");//选中区位置宽
String selectorH = request.getParameter("selectorH");//选中区位置高

/* System.out.println("imageSource = " + imageSource);
System.out.println("imageW = " + imageW);
System.out.println("imageH = " + imageH);
System.out.println("imageX = " + imageX);
System.out.println("imageY = " + imageY);
System.out.println("imageRotate = " + imageRotate);//图片的翻转角度
System.out.println("selectorX = " + selectorX);
System.out.println("selectorY = " + selectorY);
System.out.println("selectorW = " + selectorW);
System.out.println("selectorH= " + selectorH);
System.out.println("viewPortW = " + viewPortW);
System.out.println("viewPortH = " + viewPortH);
System.out.println("fileWebroot = " + fileWebroot); */

String suffix = imageSource.substring(imageSource.lastIndexOf(".")+1);
String cutImg = TimeFormat.format(new Date())+"_."+suffix;
//System.out.println( "suffix = " +suffix );

int cutX = 0,cutY=0;
//cutX = Math.abs(Integer.parseInt(imageX)-Integer.parseInt(selectorX));
//cutY =  Math.abs(Integer.parseInt(imageY)-Integer.parseInt(selectorY));

//根据位置确定裁切的区域
int x1=0,x2=0,y1=0,y2=0,w1=0,w2=0,h1=0,h2=0,targetW=Integer.parseInt(selectorW),targetH=Integer.parseInt(selectorH);
x1 = new Double(selectorX).intValue();
x2 = new Double(imageX).intValue();
y1 = new Double(selectorY).intValue();
y2 = new Double(imageY).intValue();
w1 = new Double(selectorW).intValue();
w2 = new Double(imageW).intValue();
h1 = new Double(selectorH).intValue();
h2 = new Double(imageH).intValue();
if(x1+w1<=x2||x1>=x2+w2)
{
	//表示在外面
	cutX=-1;
}else if(x1<x2)
{
	cutX=Math.abs(x2-x2);
	if(x1+w1<w2+x2) targetW=w1+x1-x2;
	else targetW = w1;
}else
{
	cutX = Math.abs(x1-x2);
	if(x1+w1<w2+x2) targetW=w1;
	else targetW = w2+x2-x1;
}
if(y1+h1<=y2||y1>=y2+h2)
{
	//表示在外面
	cutY=-1;
}else if(y1<y2)
{
	cutY=Math.abs(y2-y2);
	if(y1+h1<h2+y2) targetH=h1+y1-y2;
	else targetH = h2;
}else
{
	cutY = Math.abs(y1-y2);
	if(y1+h1<h2+y2) targetH=h1;
	else targetH = h2+y2-y1;
}
//System.out.println( cutX );
//System.out.println( cutY );
//System.out.println( targetW );
//System.out.println( targetH );

String separator = new Character(File.separatorChar).toString();
String sourceFileName = fileWebroot+"upload"+separator+"temp"+separator+imageSource.split("/")[3];
//System.out.println(sourceFileName);
ImageUtils img = ImageUtils.load(sourceFileName);//加载源图
img.zoomTo(new Double(imageW).intValue(),new Double(imageH).intValue());//缩放源图
//img.cutTo(cutX,cutY,Integer.parseInt(selectorW),Integer.parseInt(selectorH));//裁剪图片
img.cutTo(cutX,cutY,targetW,targetH);//裁剪图片
fileWebroot = fileWebroot+"upload"+separator+"teacherface";
new File(fileWebroot).mkdirs();
img.save(fileWebroot +separator+ cutImg, suffix);//保存裁剪后的图片
File cutImgfile = new File(fileWebroot +separator+ cutImg);
//System.out.println( cutImg );
//System.out.println( cutImgfile.toString() );
if(cutImgfile.exists()){
	out.print(cutImg);
}
%>
