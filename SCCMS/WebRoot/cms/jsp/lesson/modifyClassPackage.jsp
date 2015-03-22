<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>modifyClassPackage</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" /> 
    <link href="${pageContext.request.contextPath}/cms/css/style.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.3.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/base.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerForm.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDateEditor.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerComboBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerCheckBox.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerButton.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerDialog2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerRadio.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerSpinner.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerTextBox.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerTip.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
  	<script src="${pageContext.request.contextPath}/cms/js/ligerTree.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/ligerGrid.js" type="text/javascript"></script>
 	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor_config.js"></script>
   	<script type="text/javascript" charset="utf-8" src="${pageContext.request.contextPath}/cms/ueditor/editor.min.js"></script>
    <script type="text/javascript">
        var eee;
        var gradeTime;
        var dealId ="${classPackage.dealId}";
        var dealName="";
        var dealContent="";
        var dealLastDate="";
        var pexamId =${session.pexamId};
        var ptypeId =${session.ptypeId};
        var id="";
        $(document).ready(function(){   
	        $("#form1").change(function(){  
	               parent.modifyClassPackageMark = true ; 
	        });            
	   	}); 
         function f_onCheckAllRow(checked)
        {
            for (var rowid in this.records)
            {
                if(checked)
                    addCheckedGrade(this.records[rowid]['gradeId']);
                else
                    removeCheckedGrade(this.records[rowid]['gradeId']);
            }
        }
        /*
                      该例子实现 表单分页多选
       	 即利用onCheckRow将选中的行记忆下来，并利用isChecked将记忆下来的行初始化选中
        */
        var checkedGrade = "${classPackage.pkgIncludeCid}";
        checkedGrade = checkedGrade.split(",");
        function findCheckedGrade(gradeId)
        {
            for(var i =0;i<checkedGrade.length;i++)
            {
                if(checkedGrade[i] == gradeId) return i;
            }
            return -1;
        }
        
        function addCheckedGrade(gradeId)
        {
            if(findCheckedGrade(gradeId) == -1)
                checkedGrade.push(gradeId);
        }
        
        function removeCheckedGrade(gradeId)
        {
            var i = findCheckedGrade(gradeId);
            if(i==-1) return;
            checkedGrade.splice(i,1);
        }
        
        function f_isChecked(rowdata)
        {
            if (findCheckedGrade(rowdata.gradeId) == -1)
                return false;
            return true;
        }
        
        function f_onCheckRow(checked, data)
        {
            if (checked) addCheckedGrade(data.gradeId);
            else removeCheckedGrade(data.gradeId);
        }
        
        function f_getChecked()
        {  
            alert(checkedGrade.join(','));
        }

 		function f_open2(){
	       	if(!window.loginWin){
	       		window.loginWin=$.ligerDialog.open({ 
	          	  	url: '${pageContext.request.contextPath}/package/loadDeal?dealId='+dealId,
	          	    title:'协议', 
	          	    icon: 'images/Program Files Folder.png',
	          	    height: 450,width: 700, 
	          	    buttons: [ { text: '确定', 
	          	    	onclick: function (item, dialog) { 	
									dealName=dialog.frame.dealName;
									dealContent =dialog.frame.UE.getEditor('editor').getContent();
									id =dialog.frame.id;
									dealLastDate = dialog.frame.dealLastDate;
	          	    				dialog.hidden(); 
	          	    			} }
	          	     	] 
	          	    });	
	       	}else {	
				window.loginWin.show();	
			}
     }
 		
         //明细
       
      	 function f_showExamCategory()
        {		
            g = $("#maingrid").ligerGrid({
            	height:'100%',
               	columns: [
               	{ display: '主键', name: 'examId', minWidth: 60, width:120 },
                { display: '考试类别', name: 'examName', width: 150, minWidth: 120 ,width:216},
                { display: '添加时间', name: 'examAddTime', minWidth: 120 ,width:220 ,type:'date'}
                ],   
				url:'${pageContext.request.contextPath}/exam/examChildren?examPid='+pexamId,
				rownumbers:true,
				isScroll: false, 
				frozen:false,
				usePager:false, 
                showTitle: false,width:'99%',
                /* height:'100%', */
                detail: { onShowDetail: f_showGrade ,height:'100'},
                onError: function (a, b)
                { 
                }
            });
           
        }
        function f_showGrade(row, detailPanel,callback)
        {
            var grid = document.createElement('div'); 
            $(detailPanel).append(grid);
            $(grid).css('margin',10).ligerGrid({
                columns: [
                { display: '班级名', name: 'name', align: 'left', width: 160, minWidth: 60 },
              	{ display: '课时', name: 'gradeTime', minWidth: 80 ,width: 80}, 
                { display: '原价', name: 'gradeOPrice', minWidth: 80 ,width: 80},
                { display: '实价', name: 'gradeRPrice', minWidth: 80 ,width: 80},
                { display: '到期时间', name: 'gradeDueTime',width: 120,type:'date' }
                ],
                checkbox:true,   
                isScroll: false,
                showToggleColBtn: false, 
                width: '90%',
                url: '${pageContext.request.contextPath}/exam/gradeList?id='+row.examId,
                showTitle: false, 
               	usePager:false, 
                onAfterShowData: callback,
                frozen:false,
               	isChecked: f_isChecked,
               	onCheckRow: f_onCheckRow,
                onCheckAllRow: f_onCheckAllRow 
            });  
         	
        } 
        $(function ()
        {
            $.metadata.setType("attr", "validate");
            f_showExamCategory();
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
                submitHandler: function ()
                {
                    $("form .l-text,.l-textarea").ligerHideTip(); 
                    
                  	 $.post(
            				"${pageContext.request.contextPath}/package/classPackageModify",
            				{"classPackage.pkgName":$("#pkgName").val(),
            				"classPackage.pkgOPrice":$("#pkgOPrice").val(),
            				"classPackage.pkgRPrice":$("#pkgRPrice").val(),
            				"classPackage.pkgSPrice":$("#pkgSPrice").val(),
            				"classPackage.pkgRMatureDate":$("#pkgRMatureDate").val(),
            				"classPackage.pkgLMatureDate":$("#pkgLMatureDate").val(),
            				"classPackage.pkgPresent":$("#pkgPresent").val(),
            				"classPackage.pkgDescription":UE.getEditor('editor').getContent(),
            				"classPackage.pkgAddTime":$("#pkgAddTime").val(),
            				"classPackage.pkgId":$("#pkgId").val(),
            				pkgIncludeCid:checkedGrade.join(','),
            				dealId:$("#dealId").val(),
            				ptypeId:ptypeId,
            				id:id,
            				dealName:dealName,
            				dealContent:dealContent,
            				dealLastDate:dealLastDate
            				},
            				function(data)
            				{
            					if(data)
            					{
            						$.ligerDialog.success('操作成功!', function ()
                					{
                						parent.modifyClassPackageMark = false ; 
                    					parent.fresh("classPackage");
                    					parent.closeTab("modifyClassPackage");
                    					parent.tab.selectTabItem("classPackage");
                					}); 
            					}else{
            						$.ligerDialog.error( '该套餐暂时不能修改');
            					}
            				},
            				"json"
            		); 
                }
            }); 
            $("form").ligerForm();
             $(".l-button-test").click(function ()
            {
            	parent.modifyClassPackageMark = false ;
                parent.tab.selectTabItem("classPackage");
                parent.closeTab("modifyClassPackage");
            }); 
        });  
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

	<table cellpadding="0" cellspacing="0" class="l-table-edit"  >
		<tr>
           <td align="right" class="l-table-edit-td">&nbsp;&nbsp;&nbsp;&nbsp;班级:</td>
           <td align="left" class="l-table-edit-td" colspan="4"><div id="maingrid"></div></td>
           <td align="left"></td>
          </tr>  
	</table> 
    <form name="form1" method="post"  id="form1">
    <table cellpadding="0" cellspacing="0" class="l-table-edit"  >
    	
            <tr>
                <td align="right" class="l-table-edit-td">套餐名字:</td>
                <td align="left" class="l-table-edit-td"><input name="classPackage.pkgName" value="${classPackage.pkgName}" type="text" id="pkgName" ltype="text" validate="{required:true,minlength:3,maxlength:20}" />
                	<input type="hidden" name="classPackage.pkgId" value="${classPackage.pkgId}" id=pkgId>
                	<input type="hidden" name="classPackage.pkgAddTime" value="${classPackage.pkgAddTime}" id=pkgAddTime>
                </td>
                <td align="left"></td>
          	</tr> 
             <tr>
                <td align="right" class="l-table-edit-td">协议:</td>
                <td align="left" class="l-table-edit-td">
                <input type="hidden" value="${classPackage.dealId}" id="dealId" name="classPackage.dealId">
                 <input type="button" value="修改协议" onclick="f_open2();" id="addDeal" class="l-button l-button-submit" name="deal"/>
                </td>
                <td align="left"></td>
                <td align="right" class="l-table-edit-td">原价:</td>
                <td align="left" class="l-table-edit-td"><input name="classPackage.pkgOPrice" value="${classPackage.pkgOPrice}"   type="text" id="pkgOPrice" number="true"  ltype="text" validate="{required:true,minlength:3,maxlength:10}" /></td>
                <td align="left"></td>
             </tr>
             <tr> 
                <td align="right" class="l-table-edit-td">优惠价:</td>
                <td align="left" class="l-table-edit-td"><input name="classPackage.pkgRPrice"  value="${classPackage.pkgRPrice}"  type="text" id="pkgRPrice" number="true" ltype="text" validate="{required:true,minlength:3,maxlength:10}" /></td>
                <td align="left"></td>
           <!--  </tr>
             <tr> -->
                <td align="right" class="l-table-edit-td">老学员价:</td>
                <td align="left" class="l-table-edit-td"><input name="classPackage.pkgSPrice" value="${classPackage.pkgSPrice}" type="text" id="pkgSPrice"  number="true" ltype="text" validate="{required:true,minlength:3,maxlength:10}" /></td>
                <td align="left"></td>
           	</tr>
             <tr>
                <td align="right" class="l-table-edit-td">招生期限:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="classPackage.pkgRMatureDate" type="text" id="pkgRMatureDate"  value="${classPackage.pkgRMatureDate}" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
          <!--  </tr>
            <tr>  -->
                <td align="right" class="l-table-edit-td">学习期限:</td>
                <td align="left" class="l-table-edit-td">
                    <input name="classPackage.pkgLMatureDate" value="${classPackage.pkgLMatureDate}" type="text" id="pkgLMatureDate" ltype="date" validate="{required:true}" />
                </td><td align="left"></td>
            </tr>
            
            <tr>
                <td align="right" class="l-table-edit-td">礼品:</td>
                <td align="left" class="l-table-edit-td" colspan="4"> 
                <textarea name="classPackage.pkgPresent"  rows="2" class="l-textarea" id="pkgPresent" style="width:653px" >${classPackage.pkgPresent}</textarea>
                </td><td align="left"></td>
            </tr>
           <tr>
                <td align="right" class="l-table-edit-td">套餐描述:</td>
                <td align="left" class="l-table-edit-td" colspan="4"> 
                <textarea name="classPackage.pkgDescription" cols="100" rows="4" class="pkgDescription" id="editor" style="width:653px"  >${classPackage.pkgDescription}</textarea>
                </td><td align="left"></td>
            </tr> 
		
	</table>
		<BR>
		<input type="submit" value="提交" id="Button1" class="l-button l-button-submit" />  
	 	<input type="button" value="取消" class="l-button l-button-test"  name="cancel"/> 
    </form>   
     <br>  
  <br>   
   <br>   
    <br>   
</body>
<script type="text/javascript">
	UE.getEditor('editor');
</script>
</html>
