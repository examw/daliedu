<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<table align="center" width="390" height="220" cellspacing="0" cellpadding="5" border="0">
                <tbody>
                    <tr height="20">
                        <td align="right" valign="middle" height="44" class="ft14">
                            &nbsp;
                        </td>
                        <td align="left" valign="middle" id="loginmsg">
                            <p>
                                已有中华考试网账号，可直接登录</p>
                        </td>
                    </tr>
                    <tr height="20">
                        <td align="right" width="137" valign="middle" class="ft14">
                            <div align="right">
                                <font color="red">*</font>用户名:</div>
                        </td>
                        <td align="left" width="343" valign="middle" height="48">
                            <div onmousedown="this.className='box2_puthover'" onmouseup="this.className='box2_puthover'"
                                onmouseout="this.className='box2_putlink'" onmouseover="this.className='box2_puthover'"
                                class="box2_putlink" id="reg_nc">
                                <input type="text" class="box2_input" size="20" id="username" name="username">
                            </div>
                        </td>
                    </tr>
                    <tr height="20">
                        <td align="right" valign="middle" class="ft14">
                            <div align="right">
                                <font color="red">*</font>密码:</div>
                        </td>
                        <td align="left" valign="middle" height="29">
                            <div onmousedown="this.className='box2_puthover'" onmouseup="this.className='box2_puthover'"
                                onmouseout="this.className='box2_putlink'" onmouseover="this.className='box2_puthover'"
                                class="box2_putlink" id="reg_pwd">
                                <input type="password" class="box2_input" size="20" id="password" name="password">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" class="ft14">
                        </td>
                        <td align="center" class="ft14">
                            <span class="zcbn"><a onclick="CheckLogForms();" href="javascript:;">登 录</a></span>
                        </td>
                    </tr>
                </tbody>
            </table>