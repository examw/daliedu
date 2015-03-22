<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
 <%@taglib uri="/struts-tags" prefix="s"%>  
 <ul>
            	<s:if test="#session.student.stuUsername!=null">
            	<li style="color: #666;"><span class="wn">hi,<s:property value="#session.student.stuUsername"/>&nbsp;&nbsp;<em title="安全退出，保护您的帐号安全"
                        id="tuichu">退出</em></span></li>
                <li>|</li>
                <li><a class="cblue3" target="_blank" href="../memberCenter/member.jsp"><span class="wn"><strong>
                     	   会员中心</strong></span></a></li>
                 </s:if>
                 <s:else>   	   
                <li><a href="/user/register.jsp" target=
                "_blank"><span class="wn">免费注册</span></a></li>

                <li>|</li>

                <li><a href="javascript:;" id="loginbtn" onclick="ShowLogin()"
                style="color: #c00;"><span class="wn">用户登录</span></a></li>
				</s:else> 
                <li class="out" id="Myrecords" onmouseout=
                "this.className='out'" onmouseover="this.className='on'">
                    <a href="javascript:void(0)"><span class=
                    "bfjl">播放记录</span></a>

                    <div class="lnavp" id="Playrecords">
                        <ul class="navlist"></ul>
                    </div>
                </li>

                <li class="out" id="Myrecords1" onmouseout=
                "this.className='out'" onmouseover="this.className='on'">
                    <a href="javascript:void(0)"><span class=
                    "gwc">购课车</span></a>

                    <div class="lnavp" id="Playrecords">
                        <ul class="navlist" id="myshop"></ul>
                    </div>
                </li>

                <li class="out" id="Myrecords2" onmouseout=
                "this.className='out'" onmouseover="this.className='on'">
                    <a href="javascript:void(0)"><span class=
                    "sc">收藏夹</span></a>

                    <div class="lnavp" id="Playrecords">
                        <ul class="navlist" id="Collection"></ul>
                    </div>
                </li>
            </ul>
