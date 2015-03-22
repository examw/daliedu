<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>页面配置信息 权限分配</title>
    <link href="${pageContext.request.contextPath}/cms/css/ligerui-all.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath}/cms/css/all.css" rel="stylesheet" type="text/css" />
    <script src="${pageContext.request.contextPath}/cms/js/jquery-1.5.2.min.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.min.js" type="text/javascript"></script>  
    <link href="${pageContext.request.contextPath}/cms/css/common.css" rel="stylesheet" type="text/css" />  
    <script src="${pageContext.request.contextPath}/cms/js/common.js" type="text/javascript"></script>    
    <script src="${pageContext.request.contextPath}/cms/js/LG.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.validate.min.js" type="text/javascript"></script> 
    <script src="${pageContext.request.contextPath}/cms/js/jquery.metadata.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/messages_cn.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/jquery.form.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/json2.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/validator.js" type="text/javascript"></script>
    <script src="${pageContext.request.contextPath}/cms/js/ligerui.expand.js" type="text/javascript"></script> 
    <style type="text/css"> 
    </style>
</head>
<body style="padding-bottom:0px;">
    <div id="tabcontainer" style="margin:2px;">
        <div title="角色" tabid="roletab" style=" height:1px; line-height:1px;"> </div>
        <div title="用户"  tabid="usertab" style=" height:1px; line-height:1px;">  </div> 
    </div>
    <div id="maingrid" style="margin:2px auto;"></div>

    <script type="text/javascript"> 
        var view = getQueryStringByName("View");

       <%--  var config = <%= SystemService.GetPageConfig(System.Web.HttpContext.Current.Request["View"]) %>;

        var userlist = <%= SystemService.GetUserListJSON() %>;

        var rolelist = <%= SystemService.GetRoleListJSON() %>;

        var fieldPrivilege = <%= SystemService.GetFieldPrivilege(System.Web.HttpContext.Current.Request["View"]) %>;
 --%>

        var tab = $("#tabcontainer").ligerTab(); 
        var isSelectedRule = true;

        tab.bind('afterSelectTabItem', function (tabid)
        {
            isSelectedRule = tabid == "roletab";
            var data = getData(isSelectedRule);
            grid.set('data',data); 
            grid.changeHeaderText('userrole_master', isSelectedRule ? "角色" : "用户");
             
        });
         //权限 保存按钮
        var toolbarOptions = {
            items: [
            { text: '保存', click: f_save, img: "../lib/icons/silkicons/page_save.png" }
        ]
        };

        var columns = getColumns();

        var grid = $("#maingrid").ligerGrid({ 
              columns: columns,  pageSize: 20, toolbar: toolbarOptions,
              data:getData(true), sortName: 'ConfigID', 
              width: '98%', height: '100%',heightDiff:-5, checkbox: false
         });

         function getData(isSelectedRule)
         {
            var rows = [];
            if(isSelectedRule)
            { 
                $(rolelist).each(function(i,role){
                    var o ={}; 
                    o.userrole_master = role.RoleName; 
                    o.userrole_masterkey = role.RoleID; 
                    $(columns).each(function(){
                        if(this.name == "userrole_master") return; 
                        o[this.name] = roleIsForbid(role.RoleID,this.name) ? false : true;
                    });

                    rows.push(o);
                });
            }
            else
            {
                $(userlist).each(function(i,user){
                    var o ={}; 
                    o.userrole_master = user.Title;  
                    o.userrole_masterkey = user.UserID;
                    $(columns).each(function(){ 
                        if(this.name == "userrole_master") return;
                        o[this.name] = userIsForbid(user.UserID,this.name) ? false : true;
                    }); 

                    rows.push(o);
                });
            }
            return {Rows:rows};
         }

         function getColumns()
         {
            var columns = [{display:"角色",name:"userrole_master",width:180,type:"text",align:"left"}];
            if(config.Grid && config.Grid.columns)
            {
                $(config.Grid.columns).each(function(){
                    var o = {};
                    o.display = this.display;
                    o.name = this.name; 
                    o.render = checkboxRender;
                    columns.push(o);
                });
            }
            if(config.Form && config.Form.fields)
            {
                $(config.Form.fields).each(function(){ 
                    if(exist(this.name)) return;
                    if(this.type == "hidden") return;
                    var o = {};
                    o.display = this.display;
                    o.name = this.name;
                    o.render = checkboxRender;
                    columns.push(o);
                });
            }
            return columns;

            function exist(name)
            {
                for(var i =0,l=columns.length;i<l;i++)
                {
                    if(columns[i].name == name) return true;
                }
                return false;
            }
         }

         function f_save()
         {
            LG.ajax({
                type:'AjaxSystem',
                method:'SaveFieldPrivilege',
                loading:'正在保存中...',
                data : { DataJSON : JSON2.stringify(getFieldPrivilege()),view:view },
                success: function(){
                    LG.showSuccess('保存成功',function(){
                        parent.LG.closeCurrentTab();
                    });
                },
                error:function(message){
                    LG.showError(message);
                }
            });

            //获取字段权限
            function getFieldPrivilege()
            {
                var data = [];
                var rows = grid.getData();
                $(rows).each(function(i,row){
                    var masterkey = row.userrole_masterkey;  
                    for(var i in row)
                    {
                        if(i == "userrole_master") continue;
                        if(/^(\_)/.test(i)) continue;
                        var v = row[i];
                        if(v == false)
                        {
                            var o = {}; 
                            o.PrivilegeMaster = isSelectedRule ? "CF_Role" : "CF_User";
                            o.PrivilegeMasterKey = masterkey;
                            o.PrivilegeAccess = view + "." + i;
                            o.PrivilegeAccessKey = 0;
                            o.PrivilegeOperation = "Forbid";
                            data.push(o);
                        }
                    } 
                }); 
                return data; 
            }
         }




         //判断用户 是否禁止
         function userIsForbid(userid,field)
         {
            if(!fieldPrivilege) return false;
            var privilage = findFieldPrivilege(function(o){
                var access = view + "." + field; 
                return o.PrivilegeMaster.toLowerCase() == "cf_user" && o.PrivilegeMasterKey == userid && o.PrivilegeAccess.toLowerCase() == access.toLowerCase() && o.PrivilegeOperation.toLowerCase() == "forbid";
            });
            return privilage ? true : false;
         }  
         //判断角色 是否禁止
         function roleIsForbid(roleid,field)
         {
            if(!fieldPrivilege) return false; 
            var privilage = findFieldPrivilege(function(o){
                var access = view + "." + field;   
                return o.PrivilegeMaster.toLowerCase() == "cf_role" && o.PrivilegeMasterKey == roleid && o.PrivilegeAccess.toLowerCase() == access.toLowerCase() && o.PrivilegeOperation.toLowerCase() == "forbid";
            });
            return privilage ? true : false;
         }

         function findFieldPrivilege(where)
         {
            for(var i =0,l=fieldPrivilege.length;i<l;i++)
            {
                var o = fieldPrivilege[i];
                if(where(o)) return o;
            }
            return null;
         }


        //是否类型的模拟复选框的渲染函数
        function checkboxRender(rowdata, rowindex, value, column)
        {
            var iconHtml = '<div class="chk-icon';
            if (value) iconHtml += " chk-icon-selected";
            iconHtml += '"';
            iconHtml += ' rowid = "' + rowdata['__id'] + '"';
            iconHtml += ' gridid = "' + this.id + '"';
            iconHtml += ' columnname = "' + column.name + '"';
            iconHtml += '></div>';
            return iconHtml;
        }
        //表字段配置信息 是否类型的模拟复选框的点击事件
        $("div.chk-icon").live('click', function ()
        {
            var grid = $.ligerui.get($(this).attr("gridid"));
            var rowdata = grid.getRow($(this).attr("rowid"));
            var columnname = $(this).attr("columnname");
            var checked = rowdata[columnname]; 

            grid.updateCell(columnname, !checked, rowdata);
        });
    </script>
</body>
</html>

