LG.changepassword = function ()
{
    $(document).bind('keydown.changepassword', function (e)
    {
        if (e.keyCode == 13)
        {
            doChangePassword();
        }
    });

    if (!window.changePasswordWin)
    {
        var changePasswordPanle = $("<form></form>");
        changePasswordPanle.ligerForm({
            fields: [
                { display: '旧密码', name: 'OldPassword', type: 'password', validate: { maxlength: 50, required: true, messages: { required: '请输入密码'}} },
                { display: '新密码', name: 'NewPassword', type: 'password', validate: { maxlength: 50, required: true, messages: { required: '请输入密码'}} },
                { display: '确认密码', name: 'NewPassword2', type: 'password', validate: { maxlength: 50, required: true, equalTo: '#NewPassword', messages: { required: '请输入密码', equalTo: '两次密码输入不一致'}} }
            ]
        });

        //验证
        jQuery.metadata.setType("attr", "validate");
        LG.validate(changePasswordPanle);

        window.changePasswordWin = $.ligerDialog.open({
            width: 400,
            height: 190, top: 200,
            isResize: true,
            title: '用户修改密码',
            target: changePasswordPanle,
            buttons: [
            { text: '确定', onclick: function ()
            {
                doChangePassword();
            }
            },
            { text: '取消', onclick: function ()
            {
                window.changePasswordWin.hide();
                $(document).unbind('keydown.changepassword');
            }
            }
            ]
        });
    }
    else
    {
        window.changePasswordWin.show();
    }

    function doChangePassword()
    {
        var OldPassword = $("#OldPassword").val();
        var LoginPassword = $("#NewPassword").val();
        if (changePasswordPanle.valid())
        {
        	 $.ajax({
                 type: 'post', cache: false, dataType: 'json',
                 url: '/SCCMS/user/changeAdminPassword',
                 data:{"oldPwd":OldPassword,"newPwd":LoginPassword},
                 success: function (data)
                 {
                     if (!data)
                     {
                         LG.showError('原密码有误!');
                         $("#OldPassword").focus();
                         return;
                     } else
                     {
                    	 LG.showSuccess('密码修改成功');
                    	 window.changePasswordWin.close();
                    	 $(document).unbind('keydown.changepassword');
                     }
                 },
                 error: function ()
                 {
                     LG.showError('发送系统错误,请与系统管理员联系!');
                 }
            });
        }
    }

};