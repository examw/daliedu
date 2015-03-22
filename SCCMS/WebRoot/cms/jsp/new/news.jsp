<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>addClassDetail</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/sliver/all.css" rel="stylesheet" type="text/css" /> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerRadio.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerResizable.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script>
   	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script>
    <script type="text/javascript">
    	/*  var id =parent.getNodeId(); */
    	function submit(){
    			$("#form1").submit();
    		}
    	//资讯下拉框
	     $(function ()
	          {
	             $("#newclass").ligerComboBox({
	              width : 180, 
	              selectBoxWidth: 180,
	              selectBoxHeight: 200, 
	              valueField: 'id', 
	              valueFieldID:'newclass.id',
	              treeLeafOnly: false,
	              initValue:'${news.newclass.id}',
	              tree: { url: '${pageContext.request.contextPath}/new/tree.action',checkbox: false}        
	          });
	           
	             if('${news.isTop}'=='1'){
	            	 $("#is").checked = true;
	             }else{
	            	 $("#no").checked = true; 
	             };
	             $("#examId").val(parent.examId);
	             $("#provinceId").val(parent.provinceId);
	             
	     }); 
        $(function ()
        {
            $.metadata.setType("attr", "validate");
            var v = $("form").validate({
                debug: true,
                errorPlacement: function (lable, element)
                {
                    if (element.hasClass("l-textarea"))
                    {
                        element.ligerTip({ content: lable.html(), target: element[0] }); 
                    }
                    else if (element.hasClass("l-text-field"))
                    {
                        element.parent().ligerTip({ content: lable.html(), target: element[0] });
                    }
                    else
                    {
                        lable.appendTo(element.parents("td:first").next("td"));
                    }
                },
                success: function (lable)
                {
                    lable.ligerHideTip();
                    lable.remove();
                },
                submitHandler: function (form)
                {
                	var data=serializeJson($('#form1'));
                	 $.ajax({
                         url:'${pageContext.request.contextPath}/new/saveNews.action',
                         dataType:'json',
                         type:'post',
                         data:data,
                         error:function(){
                         },
                         success:function(data){
                        	    LG.showSuccess(data.message, function(data){
                         		if(!data.isError){
                         			parent.f_reload();
                         			parent.window.addNews.close();
                         		}
                         		
                         	});
                         }
                     });
                }
            });
            $("form").ligerForm();
        }); 
        
       function serializeJson(obj){//解析URL并转换为json形式
    	   var serializeObj={};
           var array=obj.serializeArray();
           $(array).each(function(){
               if(serializeObj[this.name]){
                   if($.isArray(serializeObj[this.name])){
                       serializeObj[this.name].push(this.value);
                   }else{
                       serializeObj[this.name]=[serializeObj[this.name],this.value];
                   }
               }else{
                   serializeObj[this.name]=this.value;
               }
           });
           serializeObj['newContent']=editor.getContent();
           return serializeObj;
        }
      
    </script>
    <style type="text/css">
           body{ font-size:12px;}
        .l-table-edit {}
        .l-table-edit-td{ padding:4px;}
        .l-button-submit,.l-button-test{width:80px; float:left; margin-left:10px; padding-bottom:2px;}
        .l-verify-tip{ left:230px; top:120px;}
    </style>
</head>
<body style="padding:10px">
<div>
    <form name="form1" method="post"  id="form1" action="${pageContext.request.contextPath}/new/saveNews.action">
        <table cellpadding="0" cellspacing="0" class="l-table-edit" >
        	 <tr>
                <td align="right" class="l-table-edit-td">资讯标题:</td>
                <td align="left" class="l-table-edit-td">
                <input type="text" id="newTitle" value="${news.newTitle}" name="newTitle"   />
                <input type="hidden" id="provinceId" value="${news.province.provinceId}" name="province.provinceId" />
                <input type="hidden" id="examId" value="${news.exam.examId}" name="exam.examId" />
                <input type="hidden"  value="${news.newId}" name="newId" />
                </td>
           	 	<td></td>
                <td align="right" class="l-table-edit-td">资讯副标题:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="subTitle" value="${news.subTitle}" name="subTitle" /></td>
                <td></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">资讯类别:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="newclass"  validate="{required:true}"  name="className" /></td>
                <td></td>
                <td align="right" class="l-table-edit-td">是否置顶:</td>
                <td align="left" class="l-table-edit-td">
        
                <input type="radio" name="isTop" value=1  ${news.isTop==1?'checked':''} /> 是   <input type="radio" name="isTop" value=0  ${news.isTop==0?'checked':''}/> 否
                </td>
                <td></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">关键字:</td>
                <td align="left" class="l-table-edit-td"><input name="keywords" type="text" id="keywords" ltype="text" value="${news.keywords}" validate="{required:true}" /></td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">排序:</td>
                <td align="left" class="l-table-edit-td"><input type="text" id="orderId" value="${news.orderId}"  name="orderId"/></td>
                <td></td>
            </tr>
            <tr>
                <td align="right" class="l-table-edit-td">资讯内容:</td>
                <td align="left" class="l-table-edit-td" colspan="4">
                 <script type="text/plain" id="editor" name="myeditor">${news.newContent}</script>
                 </td>
                <td></td>
            </tr>
        </table>
	<br/>

</form>
</div>
<script type="text/javascript">
var editor=UE.getEditor('editor');
</script>
</body>
</html>
