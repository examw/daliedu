////////////////////////////////////////////////////////////
//开发人：薄海
//功能：用户课程界面
////////////////////////////////////////////////////////////

//协议提示
function showAgreement() {
    alert("对不起，需要签订协议才能开始听课，现在无法签订协议，请与客服联系！");  
}
function showAgreement2() {
    alert("需要签订协议才能听课。");
}

//下载提示
function shownodown() {
    alert("对不起，您的帐号禁止下载！");
}

function shownextshow(sday) {
    alert("对不起，下载服务在" + sday + "天后提供！");
}

function shownextshow() {
    alert("对不起，您的款还没到，暂时不提供下载服务！");
}

function showoverdown() {
    alert("对不起，您今天的下载次数已满！");
}

function shownodownlesson() {
    alert("对不起，本类课件不提供下载！");
}

function shownodowntext() {
    alert("对不起，本类课件讲义不提供下载！");
}

function shownodowntime() {
    alert('现在时间为你的禁止下载时间！');
}

function shownodownip() {
    alert('你的IP地址禁止下载！');
}

function shownocreate() {
    alert('课件正在生成中！');
}

function shownopay() {
    alert('对不起，由于还未收到银行到款通知，您暂时不能下载此课程，请耐心等待，款到后我们将立即为您开通课程下载功能。\n\n您可以返回已开通课程里进行在线学习，谢谢。');
}

function shownoxy() {
    alert('对不起，您暂时不能下载此课程，请签署保过协议后再进行课程下载，谢谢。');
}

function showNoPay() {
    alert("对不起，您支付的学费尚未到帐，暂时不能签署和打印协议，请等待.....");
}

function showXY() {
    alert('对不起，现在无法签订协议，请与客服联系！');
}

function showNoPrint() {
    alert('对不起，现在无法打印，请与客服联系！');
}


function showNoCK() {
    alert('对不起，没有找到此协议，请与客服联系！');
}
//用户开课时间的判断
function showNoOpen(mag) {
    alert(mag);
    return false;
}
////////////////////////////////////////////////////////////
//开发人：薄海
//功能：未支付课程界面
////////////////////////////////////////////////////////////

//全选
function selectAllCbx() {
    var discountIds = $("#hfDiscountIds").attr("value");//获取套餐ID存储介质
    var lessonIds = $("#hfLessonIds").attr("value"); //获取课程ID存储介质
    
    
    var allCbx = $("#cbxAll").attr("checked"); //全选的选中状态
    var checkArray = $(":checkbox"); //获取页面所有CheckBox
    if (allCbx == "checked") {
        checkArray.attr("checked", allCbx);
        checkArray.each(function () {
            if ($(this).attr("id") == "cbxDiscount") {
                discountIds += $(this).val() + ",";
            }

            if ($(this).attr("id") == "cbxLesson") {
                lessonIds += $(this).val() + ",";
            }

        });
        //alert(discountIds);
        //alert(lessonIds);
    } else {
        checkArray.removeAttr("checked");
        $("#hfDiscountIds").attr("value",""); //获取套餐ID存储介质
        $("#hfLessonIds").attr("value", ""); //获取课程ID存储介质
        //alert(discountIds);
        //alert(lessonIds);
    }
}

//判断是否全选
function isAllSelect() {
    var checkArray = $(":checkbox"); //获取页面所有CheckBox

    var isSel = true;
    checkArray.each(function () {
        if ($(this).attr("id") != "cbxAll") {
            if ($(this).attr("checked") != "checked") {
                //$("#cbxAll").removeAttr("checked");
                isSel = false;
            }
        }
    });
    return isSel;
}

//判断CheckBox中的一个被选中
function isCheckOne() {
    var checkArray = $(":checkbox"); //获取页面所有CheckBox

    var isSel = false;
    checkArray.each(function () {
        if ($(this).attr("id") != "cbxAll") {
            if ($(this).attr("checked")== "checked") {
                //$("#cbxAll").removeAttr("checked");
                isSel = true;
            }
        }
    });
    return isSel;
}

//单个checkBox判断
function SingleCbx() {
    if (!isAllSelect()) {
        $("#cbxAll").removeAttr("checked");
    } else {
        $("#cbxAll").attr("checked", "checked");
    }
}

//提交所有选中课程进行结算
//直接跳转到支付页面
function Submit() {

    if (!isCheckOne()) {
        alert("请选择课程");
        return;
    }

    var cbxArray = $(":checkbox");
    var discountIds = $("#hfDiscountIds").attr("value"); //获取套餐ID存储介质
    var lessonIds = $("#hfLessonIds").attr("value"); //获取课程ID存储介质

    //初始化为空
    discountIds = "";
    lessonIds = "";

    //获取页面所有checkbox，并循环，如果不是全选cbx，则判断是课程cbx还是套餐cbx，并且讲value值存入相应的 ID字符串
    cbxArray.each(function () {
        if ($(this).attr("id") != "chxAll") {
            //课程ID
            if ($(this).attr("id") == "cbxLesson" && $(this).attr("checked") == "checked") {
                lessonIds = lessonIds + $(this).val()+",";
            }
            //套餐ID
            if ($(this).attr("id") == "cbxDiscount" && $(this).attr("checked") == "checked") {
                discountIds = discountIds + $(this).val() + ",";
            }
        }
    });
    //去除字符串后面的“，”
    discountIds = discountIds.substring(0, discountIds.length - 1);
    lessonIds = lessonIds.substring(0, lessonIds.length - 1);
    //让ID字符串不要为空
    if (discountIds == "") {
        discountIds = "0,0";
    } else {
    discountIds = "0," + discountIds + ",0";
    }
    if (lessonIds == "") {
        lessonIds = "0,0";
    } else {
        lessonIds = "0,"+lessonIds+",0";
    }
    alert(lessonIds);
    //赋值给隐藏空间（暂时没有实际作用）
    $("#hfDiscountIds").attr("value", discountIds);
    $("#hfLessonIds").attr("value", lessonIds);
    //跳转
    window.open("http://www.edu24ol.com/ClassresultList.asp?DiscountIds=" + discountIds + "&ids="+lessonIds);
}




//查找条件文本框；
function selectText() {
    //$("#txtOrderCode").focus();
    var tempval = document.getElementById("txtOrderCode");
    //alert(tempval);
    tempval.focus();
    tempval.select();

}


//显示详细
function showDiv(did) {
    //alert(did);
    var lessonDiv = $("#" + did);
    //alert(lessonDiv.css("display"));
    var img = $("#img_" + did); //图标
    
    if (lessonDiv.css("display") == "none") {
        lessonDiv.show(); //显示详细
        img.attr("alt", "缩起");
        //alert(img.attr("alt"));
        img.attr("src", "../images/pic_010.gif");
        
    } else {
        lessonDiv.hide(); //隐藏详细
        img.attr("alt", "展开");
        //alert(img.attr("alt"));
        img.attr("src", "../images/pic_011.gif");
    }

}
//显示详细(展开指定，隐藏其他)
//参数：did 需要显示或隐藏的DIV id；DivName 所有需要展开的DIV的Name；imgName 所有展开（收起）img元素的Name
//页面图片ID命名规范：img_name;相互切换的图片物理名称：pic_011.gif(+) pic_010.gif(-)；
function showDivById(did, divName, imgName) {
    var lessonDiv = $("#" + did);  
    if (arguments.length==3) {
       
        var img = $("#img_" + did); //图标    

        var divList = $("div[name='" + divName + "']");
        var imgList = $("img[name='" + imgName + "']");
    
        divList.each(function () {
            if ($(this).attr("id") != did) {
                $(this).hide(); //隐藏详细
                    //img.attr("src", "../images/pic_011.gif"); 
                   // img.attr("alt", "展开");
                }
        });
        imgList.each(function () {
                $(this).attr("src", "../images/pic_011.gif");
                $(this).attr("alt", "展开");
        });

        if (lessonDiv.css("display") == "none") {
            lessonDiv.show(); //显示详细
            img.attr("alt", "缩起");
            img.attr("src", "../images/pic_010.gif");

        } else {
            lessonDiv.hide(); //隐藏详细
            img.attr("alt", "展开");
            img.attr("src", "../images/pic_011.gif");
        }        
    }else if (arguments.length==2) {
       
        var divList2 = $("div[name='" + divName + "']");
        divList2.each(function () {
            if ($(this).attr("id") != did.toString()) {
                $(this).hide(); //隐藏详细
            }
        });

        if (lessonDiv.css("display") == "none") {
            lessonDiv.show(); //显示详细
        } else {
            lessonDiv.hide(); //隐藏详细 
        }    
    }

}


//树形控件 使用的展缩
function showUiById(uid, ulName,treeImg) {

    var ui = $("#ul" + uid);
    var img = $("#timg_" + uid);

    var divList = $("ul[name='" + ulName + "']");
    var imgList = $("img[name='"+treeImg+"']");
    divList.each(function () {
        if ($(this).attr("id") != "ul" + uid) {
            $(this).hide(); //隐藏详细
        }
    });

    imgList.each(function () {
        $(this).attr("src", "../images/pic_011.gif");
        $(this).attr("alt", "展开");
    });
    
    if (ui.css("display") == "none") {
        ui.show(); //显示详细
        img.attr("alt", "缩起");
        img.attr("src", "../images/pic_010.gif");

    } else {
        ui.hide(); //隐藏详细
        img.attr("alt", "展开");
        img.attr("src", "../images/pic_011.gif");
    }
}
//A连接的缩放显示，a链接的ID ：a+数字；
function stra(id, str1, str2) {
    
    var obj = $("#a" + id);
    if (obj.html()==str1) {
        obj.html(str2);
    } else {
        obj.html(str1);
    }

    var aList = $("a[name='aDis']");
    aList.each(function () {
        if ($(this).attr("id") != obj.attr("id")) {
            var id = $(this).attr("id");
            var o = $("#" + id);
            o.html(str1);
        }
    });

}




//更新 用户 配送信息
function updateUserInfo() {
    

    var userid = $("#hfUserId").val();
    var ordercode = $("#hfOrderCode").val();
    //alert(ordercode);

    var n = $("#txtName").val();
    var d = $("#txtAddress").val();
    var post = $("#txtPost").val();
    var tel = $("#txtTel").val();
    //非空验证
    if (n == "") {
        alert("收货人不能为空");
        return;
    }
    if (d == "") {
        alert("地址不能为空。");
        return;
    }

    if (isTelephone(tel) || isMobile(tel)) {
        
    } else {
        alert("电话输入错误");
        return;
    }
    
    
    
    if (!isPost(post)) {
        alert("邮编错误");
        return;
    }

    var code = n + "," + d + "," + post + "," + tel;
    //alert(code);
    var page = $("#hfUrl").val();
    var url = page+"?userid=" + userid + "&ordercode=" + ordercode + "&code=" + code;
    //alert(url);
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        success: function (msg) {
            if (msg == "no") {
                //.............错误
                alert("错误!订单的用户信息不存在，订单号：" + ordercode+",请联系客服人员。");
            } else {
                //.......成功
                //alert("个人信息修改成功！");
                //top.tb_remove();
                top.window.location.href = "bookOrder.aspx";
            }
        }
    });
}

//===============作业题分页处理=====================
//参数：pageIndex 当前页码
function showPaperDiv(pageIndex) {
    var divs = $("div[name='paperDiv']");
    divs.each(function () {

        // alert($(this).attr("id") + "&&" + "div_" + pageIndex);

        if ($(this).attr("id") == "div_" + pageIndex) {
            $(this).show();
            $(this).css("height", "100%");
            $(".pcdt_content").attr("style", "height:auto");
        } else {
            $(this).hide();
            $(".pcdt_content").attr("style", "height:auto");
        }
    });
}

//翻页，参数i==0 上一页。==1下一页
function page(i) {
    //i=0上一页 ，i=1下一页
    var pageCount =parseInt($("#hfPageCount").val()); //总页数
    var pageIndex =parseInt($("#hfPageIndex").val()); //当前页
    
    
    
    if (i == 1 && pageIndex<pageCount) {
        pageIndex++;
        $("#hfPageIndex").val(pageIndex);
        showPaperDiv(pageIndex);
        $("#i_pageIndex").html(pageIndex);
    } else if(i==0 && pageIndex>1){
        pageIndex--;
        $("#hfPageIndex").val(pageIndex);
        showPaperDiv(pageIndex);
        $("#i_pageIndex").html(pageIndex);
    } else {
        return;
    }

    if (pageIndex == pageCount) {
        $("#imgSubmit").show();
    } else {
        $("#imgSubmit").hide();
    }
    
    $("#aUp").attr("style", "display:inline-block");
    $("#aDw").attr("style", "display:inline-block");
    if (pageIndex==1) {
        $("#aUp").attr("style","display:none");
    }
    if ((pageIndex==pageCount)) {
        $("#aDw").attr("style", "display:none");
    } 
}
//==============================================

//=============显示答案  处理==============
function showAnswer(id) {
    if (confirm('显示答案后将无法获取学分，是否显示？')) {
            var url = $("#hfUpUserAnswerUrl").val()+"&rqid="+id;
            //alert(url);
            $.ajax({
                    type:"get",
                    url:url,
                    cache:false,
                    success:function(msg) {
                
                    }
                });
    
            var sh_Div = $("#sh_" + id);
            sh_Div.hide();
            var an_Div = $("#an_" + id);
            an_Div.show();        
    }

}
//====================================



//电话验证
function isTelephone(obj) {
    var reg = /^(\d{3,4}\-)?[1-9]\d{6,7}$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}

function isMobile(obj) {
    var reg = /^[1][358]\d{9}$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}  
//邮编验证
function isPost(obj) {
    var reg = /^[0-9]{6}$/;
    if (!reg.test(obj)) {
        return false;
    } else {
        return true;
    }
}


//注册码,
//参数：classid是DivID的后缀（div_classid）;isshow传入true或false表示显示或隐藏Div
function showReg(classid, key, isshow) {
    var div = $("#div_key");
    if (!isshow) {
        div.hide();
        return;
    }
    div.show();
    var str = $("#sRegkey");//承载注册码的容器
    
//    div.appendTo($("body"));//将div元素添加到body元素中，防止无法正常显示Div
//    div.css("z-index", "1000"); //设置Div的层级关系
    
    


    var aArray = getxy(document.getElementById("a_" + classid)); //a标签在屏幕的位置数组
    var newTop = aArray[0] + aArray[3];//div_Top重新定位
    var newLeft = (aArray[1] + aArray[2]) - 260; //div_Left重新定位
    div.offset({ top: newTop, left: newLeft });  

    
    $("#img_key").attr("onclick", "showReg("+classid+",\""+key+"\",false)");  
    
    //如果key==“regkey”表示没有注册码
    if (key == "regkey"){
        $("#btnGetKey").show();
        $("#btnCopyKey").hide();

        if (str.html()!="") {
            $("#btnGetKey").hide();
        }        
        
        $("#btnGetKey").attr("onclick", "getRegKey("+classid+")");
    } else {
        $("#btnGetKey").hide();
        $("#btnCopyKey").show();
        //复制注册码
        $("#btnCopyKey").attr("onclick", "jsCopy(\"" + key + "\")");
        str.html(key);
    }
}

//获取key
function getRegKey(classid) {
    var str = $("#sRegkey");

    var url = "../../ashx/License.ashx?userid=" + $("#hfUserId").val()+"&classid="+classid;
    $.ajax({
        type: "get",
        url: url,
        cache: false,
        success: function (msg) {
            if (msg == "no") {
                //.............错误
                str.html("注册码获取错误！请联系客服（cid:"+classid+"）。");
                $("#btnGetKey").hide();
                $("#btnCopyKey").hide();
            } else {
                //.......成功
                str.html(msg);
                $("#btnGetKey").hide();
                $("#btnCopyKey").show();
                //复制注册码
                $("#btnCopyKey").attr("onclick", "jsCopy(\"" + msg + "\")");
            }
        }
    });
}


////////////////////////////复制到黏贴板//////////////////////////////////
/////////////版本1///////////
function jsCopy(key) {
    
    if (copy2Clipboard(key) != false) {
        alert("生成的注册码已经复制到粘贴板，你可以使用Ctrl+V 贴到需要的地方去了哦！非IE浏览器请手动复制。  ");
    }
}
copy2Clipboard = function (txt) {
    if (window.clipboardData) {
        window.clipboardData.clearData();
        window.clipboardData.setData("Text", txt);
    }
    else if (navigator.userAgent.indexOf("Opera") != -1) {
        window.location = txt;
    }
    else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        }
        catch (e) {
            alert("您的firefox安全限制限制您进行剪贴板操作，请打开’about:config’将signed.applets.codebase_principal_support’设置为true’之后重试，相对路径为firefox根目录/greprefs/all.js");
            return false;
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip) return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans) return;
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt; str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip) return false;
        clip.setData(trans, null, clipid.kGlobalClipboard);
    }
};


/////////////版本2///////////
function copyText(key) {
    var txt = key;  //获取文本域内容  
    if (window.clipboardData) {        //获取用于操作剪切板的对象  
        window.clipboardData.clearData();  //清空剪切板        
        window.clipboardData.setData("Text", txt);  //设置剪切板内容  
        alert("复制成功 粘贴即可发送给好友！");
    } else if (window.netscape) {
        try {
            netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
        } catch (e) {
            alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
        }
        var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
        if (!clip)
            return;
        var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
        if (!trans)
            return;
        trans.addDataFlavor('text/unicode');
        var str = new Object();
        var len = new Object();
        var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
        var copytext = txt;
        str.data = copytext;
        trans.setTransferData("text/unicode", str, copytext.length * 2);
        var clipid = Components.interfaces.nsIClipboard;
        if (!clip) { return false; }
        else {
            clip.setData(trans, null, clipid.kGlobalClipboard);
            alert("复制成功 粘贴即可发送给好友！");
        }
    }
}     
