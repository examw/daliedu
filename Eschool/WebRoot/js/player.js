var standbyTimeId;
/*var ajaxUrl = "../ashx/player.ashx";*/
/*player.isHdv = (location.href.toLowerCase().indexOf("hdvplayer") > -1) ? true : false;*/
/*player.isMp4 = !player.isHdv;*/

//监听播放器事件
function getPlayFile() {
    return location.hash.indexOf("standbyserver") > 0 ? standbyFileUrl : fileUrl;
}
function onError() {
    if (/\.mp3$/.test(getPlayFile()) == false) {
        playReady(true);
        if (getHash("reload") == "true")        //播放错误，在重试无效后写入日志
            $.get(ajaxUrl, { 'cmd': 'addPlayErrorLog', 'rid': getRelateID(), 'fileurl': getPlayFile() }, function (data) { });
    }
}
/*function onComplete() {
    $.get(ajaxUrl, { 'cmd': 'addHistory', 'rid': getRelateID() }, function (data) {
        if ($("#exerciseState").attr("has")) {
            if (confirm("是否确认已做完作业？确认后将跳到下一讲播放。作业成绩会计入学分！")) {
                playNextRelate();
            } else {
                if (player.isHdv) {
                    showExercise();
                    $("#exerciseFrame").contents().find("#hfAutoJump").val("true");
                } else {
                    $($(".tab_bt .tab_ul li").get(3)).click();
                    loadExercise('rightmain');
                    $("#rightmain").contents().find("#hfAutoJump").val("true");
                }
            }
        } else
            playNextRelate();
    });
}
function playNextRelate() {
    var url = getNextRelate().url;
    if (url)
        window.open(url, "_self");
}*/
//添加用户学习历史记录
/*function addListenHistory() {
    if (comefrom == 1 && getRelateID()>0&&location.href.toLowerCase().indexOf("demoplayer.aspx")<0)
        $.get(ajaxUrl, { 'cmd': 'addListenHistory', 'rid': getRelateID() }, function (data) { });
}
$(function () {
    addListenHistory();
    addDefaultComment();
    relateScrollSync();
    //loadComment();
    loadNews();
    getLearnCount();
    if (powerControl()) {
        getMessageCount();
        firstGuide();
    }
    if (!hasTeacher) {
        $(".dd_2,.banzhuren,.tab_bt .tab_ul li:last").css({ color: "gray" }).unbind("click");
        $("#chat").remove();
        $("#classDirectory").css("height", "410");
    }

    //ie下大屏的分享框被播放器挡住
    if (player.isHdv && $.browser.msie) {
        $(".jiathis_txt,.jtico_jiathis").live("click", function () {
            var pos = $("#ckepop").offset();
            $("#back").show().css({ "height": $("#ckepop").height(), "width": $("#ckepop").width(), "top": pos.top, "left": pos.left });
            $("body").click(function () {
                docClick();
            });
        });
        $(".jt_sharetitle img").live("click", closeWindow);
    }
});
*/
function docClick() {
    closeWindow();
    docClick = function () { };
}
//将讲义中过大的图片调整为合适的尺寸
function resizeNoteImg() {
    $("#rightmain").load(function () {
        if (player.isHdv)
            $("#rightmain").width($("#hdvplayer").width());
        var maxWidth = $("#rightmain").width() - 23,
            imgs = $("#rightmain").contents().find("img"),
            tables = $("#rightmain").contents().find("table");
        for (var i = 0; i < imgs.length; i++) {
            var img = $(imgs[i]),
                width = img.width(),
                height = img.height(),
                offsetLeft = img.offset().left;
            if (width + offsetLeft > maxWidth) {
                var p = img.position();
                if ($("#img" + i).length == 0) {
                    var div = $("<div id='img" + i + "' style='width:100px;text-align:center;height:25px;line-height:25px;position:absolute;background:white;padding:5px 10px;cursor:pointer;' >点击查看原图</div>").css({
                        top: p.top + 40,
                        left: p.left + maxWidth / 2 - 50
                    }).click(function () {
                        zoomOut($(imgs[this.id.replace("img", "")]));
                    });
                    try {
                        div.appendTo($("#rightmain").contents().find("body"));
                    } catch (e) {

                    }
                }
                var toHeight = maxWidth * height / width;
                img.css({
                    width: maxWidth - offsetLeft,
                    //height: toHeight,
                    cursor: "pointer"
                }).attr({
                    "oWidth": width,
                    "oHeight": height,
                    "rWidth": maxWidth,
                    "rHeight": toHeight,
                    "title": "点击放大"
                }).click(function () {
                    zoomOut($(this));
                });
            }
        }
        for (var i = 0; i < tables.length; i++) {
            var table = $(tables[i]),
                twidth = table.width(),
                toffsetLeft = table.offset().left;
            if (twidth+toffsetLeft > maxWidth) {
                table.css("width", maxWidth - toffsetLeft);
            }

        }
    });
    function zoomOut(img) {
        showPicMsg(img.attr("src"), null, { width: img.attr("oWidth"), height: img.attr("oHeight") }, true);
    }
}
//权限控制
function powerControl() {

    if (parseInt(getUserID()) == 0 || comefrom != 1) {
        $("#chat").remove();
        $("#classDirectory").css("height", "410");
        if (comefrom == 2)
            setButtonEnabled(playerid, '1,2,3,4,5,6', false);
        $("#hlkSaveAndExit").get(0).onclick = function () { showDenyInfo(); return false; };
        $(".banzhuren").unbind("click");
        if (player.isHdv)
            $(".banzhuren").click(function () { showDenyInfo(); return false; });
        loadNote = function () { showDenyInfo(); return false; };
        return false;
    }
    return true;
}
//改变静态页面链接地址
(function changeLink() {
  /* $("#rightmain").attr("src", $("#rightmain").attr("src") + "?time=" + (new Date().getTime()));*/
    resizeNoteImg();
    $("#rightmain").load(function () {
        play();
        var eles = $("#rightmain").contents().find(".cNote");
        var parts = $("#partList,.partList").find("a[partid]");
      /*  for (var i = 0; i < eles.length; i++) {
            $(eles[i]).find("a").attr("href", questionUrl.substring(0, questionUrl.length - 1) + $(parts[i]).attr("chapterid"));
        }*/
    });
})();

//讲位置同步
function relateScrollSync() {
    var list = $("#relateList .relatetitle");
    if (list && list.length > 0) {
        for (var i = 0; i < list.length; i++) {
            if (list[i].id == "relate" + getRelateID()) {
                $("#relateList").parent().animate({ scrollTop: $(list[i]).position().top - 110 }, 1000);
                //if (player.isMp4)
                $(list[i]).addClass("hover");
                return;
            }
        }
    }
}
//加载日记
function loadNote(node, lid, rnum, clnum) {
    if (getUserID() != 0) {
        PopNote(node, lid, rnum, clnum);
        $('#notelayer').toggle();
    }
}
//加载练习题
function loadExercise(node, pid) {
    var frame = $("#" + node);
    if (frame.attr("src") != "exercise.aspx?rid=" + getRelateID())
        frame.attr("src", "exercise.aspx?rid=" + getRelateID());
    //    var partid = pid ? pid : currentPartId;
    //    if (partid) {
    //        if (frame.attr("src") != "exercise.aspx?pid=" + partid)
    //            frame.attr("src", "exercise.aspx?pid=" + partid);
    //    }
}
/*//加载评论
function loadComment(pageindex) {
    var list = $("#commentlist");
    $.ajax({
        url: "comment.aspx",
        data: { "rid": getRelateID(), "p": pageindex ? pageindex : 1, "type": getCommentType() },
        cache: false,
        beforeSend: function () {
            list.html("<div id='commentmessage' class='message'>评论加载中...</div>")
        },
        error: function () {
            $("#commentmessage").html("对不起，评论加载失败，请稍后刷新！");
        },
        success: function (data) {
            $(".centent_left").height("");
            list.html(data);
            syncHeight();
        }
    });
}
//加载新闻
function loadNews() {
    if (comefrom == 2 || location.href.toLowerCase().indexOf("demoplayer.aspx")>0) {
        $("#news").load("news.aspx", {lid:$("#lessonTop").val()});
    }
}*/
function syncHeight() {
    var lheight = $(".centent_left").height(),
        rheight = $(".centent_right").height();
    if (lheight < rheight)
        $(".centent_left").height(rheight);
}
function getCommentType() {
    return $("#commentType").val();
}
//添加游客访问记录评论
function addDefaultComment() {
    if(getUserID()==0&&comefrom!=3) {
        $.get(ajaxUrl,{cmd:"addDefaultComment",rid:getRelateID(),type:getCommentType()},function () {});
    }
}
/*//保存评论，或评论回复
function addComment() {
    if (parseInt(getUserID()) != 0) {
        var commentid = $("#comment_content").data("commentid");
        if (commEditor.getSource() == "") {
            $("#addcomment").prepend("<div id='commentmessage' class='message'>内容不能为空</div>");
            setTimeout("$('#commentmessage').remove()", 2000);
            return;
        }
        $.ajax({
            url: ajaxUrl,
            cache: false,
            data: {
                "cmd": commentid ? "addReply" : "addComment",
                "rid": getRelateID(),
                "cid": commentid,
                "type": getCommentType(),
                "content": commEditor.getSource()
            },
            beforeSend: function () {
                $("#addcomment").prepend("<div id='commentmessage' class='message'>提交中...</div>");
            },
            error: function () {
                alert("服务器繁忙，请稍后再试！");
            },
            success: function (data) {
                var msg = " ";
                if (data) {
                    commEditor.setSource("");
                    msg = "您的评论提交成功，谢谢！";
                } else
                    msg = "服务器繁忙，请稍后再试！";
                $("#commentmessage").html(msg);
                if (data) loadComment();
                setTimeout("$('#commentmessage').remove()", 3000);
            }
        });
    } else
        showDenyInfo(true);
}*/
function hasExercise() {
    $("#exerciseState").attr("has", true);
}
//添加评论
/*function addReply(commentid) {
    $("#comment_content").data("commentid", commentid).focus();
    $("body,html").animate({ scrollTop: $("#submitComment").offset().top }, 1000);
    //点击回复后如果输入框失去焦点并且没有输入任何有效内容，3秒后无效
    $(commEditor.win).blur(function () {
        $(this).blur(null);
        if ($.trim(commEditor.getSource()) == "")
            setTimeout("$('#comment_content').removeData('commentid')", 3000);
    });
}*/
//添加答疑

//获取我的消息数量
function getMessageCount() {
    $("#messageCount").load(ajaxUrl, { "cmd": "getMessageCount" }, function (data) {
        if (parseInt(data) > 0)
            $("#shanshan").attr("class", "floating_righta");
    });
}
//获取已学过的学员数量
function getLearnCount() {
    $("#learnCount").load(ajaxUrl, { "cmd": "getLearnCount", "rid": getRelateID() });
}
//显示讲义
function showNote() {
    showWindow("noteWindow");
    $(parent.rightmain.document.body).scrollTop($(parent.rightmain.document.getElementById("part_" + currentPartId)).offset().top);
}
//显示试题
function showExercise() {
    showWindow("exerciseWindow");
    if ($("#exerciseFrame").attr("src") != "hdvExercise.aspx?rid=" + $("#ddlRelate").val())
        $("#exerciseFrame").attr("src", "hdvExercise.aspx?rid=" + $("#ddlRelate").val()).load(syncExercise);
    else
        syncExercise();
}
function syncExercise() {
    var content = $("#exerciseFrame").contents();
    var firstQues = content.find("[partid=" + currentPartId + "]:first");
    if (firstQues.length > 0) {
        var scrolltop = firstQues.offset().top;
        content.find(".zy_one_nr").scrollTop(scrolltop);
    }
};
//改变标记时间-保存并退出时调用
function changeMarkTime(nowarning) {
    if (nowarning || confirm("确定退出，将保存播放记录并返回用户中心")) {
        var position = player.getPosition();
        if (position + 60 * 1 > player.getDuration())
            position = player.getDuration() - 60;
        $.get(ajaxUrl, { "cmd": "saveMark", "rid": getRelateID(), "time": position, "content": $("#relateTitle").html() }, function () {
            if (!nowarning)
                window.open(location.href+"&exit=true", "_self");
        });
    }
}
//播放器就绪
function playReady(isImmediate) {
    var errorWait = 1000 * 60 * 3;
    if (getHash("standbyserver") == "true")
        clearTimeout(standbyTimeId); //standbyTimeId = setTimeout("alert('抱歉，该文件暂时无法播放，请联系技术人员为您解决')", isImmediate ? 10 : errorWait);
    else if (getHash("standbyserver") === undefined)
        standbyTimeId = setTimeout("useStandbyServer()", isImmediate ? 10 : errorWait);
    //url定位播放
    var marktime = getHash("p");
    if (!isImmediate) {
        if (marktime) {
            player.seek(marktime);
        }
    }
}
//播放器播放
function playing() {
    clearTimeout(standbyTimeId);
    playing = function () { };
}
//使用备用服务器
function useStandbyServer() {
    if ($("#isFirst").val() != "true") {
        if (getHash("reload") == "true") {
            if (true) {
                setHash("standbyserver", "true");
                playerSetup();
                clearTimeout(standbyTimeId);
                var links = $("#relateList a");
                for (var i = 0; i < links.length; i++) {
                    var href = $(links[i]).attr("href");
                    if (href.indexOf("javascript:") < 0) {
                        if (href.indexOf("#")) href += "&standbyserver=true";
                        else href += "#standbyserver=true";
                    }
                    $(links[i]).attr("href", href);
                }
            } else {
                clearTimeout(standbyTimeId);
            }
        } else {
            setHash("reload", "true");
            playerSetup();
        }
    }
}

//知识点改变事件
function onPartChange() {
    var eles = $("#partList a,.partList a,#classDirectory #relateList .relatetitle").removeClass("hover");
    eles.filter("[partid = " + currentPartId + "]").addClass("hover");
    play();
    if (!$("#exerciseState").attr("jumpall") && $("#exerciseState").attr("has") && player.isHdv && currentPartId != 0) {
        showExercise();
    }
}
//打开计算器
function openCalculater() {
    tb_show("计算器", "/common/count.htm?TB_iframe=true&width=400&height=215&iframeBack=true", "");
    //window.open("http://www.edu24ol.com/webtools/counter/count.htm", "_blank", "width=400,height=215,top=260,left=360");
}
//首次使用向导
function firstGuide() {
    if ($("#isFirst").val() == "true") {
        player.play();
        setMenubarShow(playerid, true);
        setButtonEnabled(playerid, '0,1,2,3,4,5,6', false);
        startTip();
    }
}
var tipArray = [
    ["../images/ht-1.png", 150, 280, 180, 90, 180, 190],
    ["../images/ht-2.png", 30, 280, 80, 265, 10, 350],
    ["../images/ht-3.png", 400, 0, 80, 265, 10, 350],
    ["../images/ht-4.png", 80, 280, 80, 265, 10, 350],
    ["../images/ht-5.png", 130, 280, 80, 265, 10, 350]
];
function startTip() {
    $("<div id='tipback' style='position:absolute;left:0;top:0;width:100%;background:#333;opacity:0.3;filter:alpha(opacity=30);z-index:100;'></div>").
            css({ height: Math.max($("html").height(), $("body").height()) }).appendTo($("body"));
    $("<div id='tipbox' style='position:absolute;z-index:101;width:auto;height:auto;'></div>").appendTo($("body"));
    showTip();
}
function showTip(curIndex) {
    if (!curIndex) curIndex = 0
    if (tipArray && curIndex < tipArray.length) {
        var poff = $("#player").offset();
        $("#tipbox").html("<div ><img src='" + tipArray[curIndex][0] + "' /><a href='javascript:;showTip(" + (curIndex + 1) + ")'></a><a href='javascript:;exitTip()'></a></div>").
            css({ top: tipArray[curIndex][1] + poff.top, left: tipArray[curIndex][2] + poff.left });
        var links = $("#tipbox a");
        links.eq(0).css({ width: 100, height: 40, top: tipArray[curIndex][3], left: tipArray[curIndex][4] });
        if(curIndex==0)
            links.eq(1).css({ width: 100, height: 25, top: tipArray[curIndex][5], left: tipArray[curIndex][6] });
        else
            links.eq(1).css({ width: 20, height: 20, top: tipArray[curIndex][5], left: tipArray[curIndex][6] });
    } else
        exitTip();
}
function exitTip() {
    $("#tipback,#tipbox").remove();
    setMenubarShow(playerid, false);
    $.ajax({
        url: ajaxUrl,
        cache: false,
        data: "cmd=showedTip",
        success: function (data) { location.href = location.href; }
    });
}
/****************辅助方法***************/
//大屏播放器获取用户id
function getUserID() {
    return $("#userid").val();
}
//获取讲的id
function getRelateID() {
    return $("#relateid").val();
}
//获取下一讲
function getNextRelate() {
    var list = $(".relatetitle");
    if (list && list.length > 0) {
        for (var i = 0; i < list.length; i++) {
            if (list[i].id == "relate" + getRelateID()) {
                if (i == list.length - 1) return { title: "已经是最后一讲了", url: "" }
                return { title: $(list[i + 1]).html(), url: $(list[i + 1]).attr("href") };
            }
        }
    }
}
//获取上一讲
function getPrevRelate() {
    var list = $(".relatetitle");
    if (list && list.length > 0) {
        for (var i = 0; i < list.length; i++) {
            if (list[i].id == "relate" + getRelateID()) {
                if (i == 0) return { title: "已经是第一讲了", url: "" }
                return { title: $(list[i - 1]).html(), url: $(list[i - 1]).attr("href") };
            }
        }
    }
}
//显示窗体
function showWindow(id) {
    $("#back").show().css("height", $("body").height());
    $("#" + id).css({
        width: $("#hdvplayer").width(),
        height: $("#hdvplayer").height(),
        left: $("#hdvplayer").position().left,
        top: $("#hdvplayer").position().top
    }).show();
    $("#rightmain,#exerciseFrame").css({
        width: $("#hdvplayer").width(), height: $("#hdvplayer").height() - 40
    });
}
//关闭窗体
function closeWindow() {
    $("#back,#noteWindow,#exerciseWindow").hide();
}
//显示拒绝操作信息
function showDenyInfo(showLogin) {
    if (showLogin) {
        var array = [
                            [{ /* href: '/user_center/login.asp?from=' + location.href, target: '_blank',*/title: '点击登录',href:"javascript:void(0);" }, { width: 95, height: 35, left: 80, top: 84 },
                                { click: function () {
                                    LoginBox.show(function (uid) {
                                        $("#userid").val(uid);
                                    },null,true);
                                }
                            }],
                            [{ href: '/classregist.asp?from=' + location.href, target: '_blank', title: '点击注册' }, { width: 110, height: 30, left: 75, top: 125}]
                        ];
        showPicMsg("../images/ts_02.png", array, { width: 255, height: 184 });
    } else if (comefrom > 1 || getUserID() == 0) {
        var array = [[{ href: $("#hlkApplyLesson").attr("href"), target: '_blank', title: '点击报名' }, { width: 50, height: 30, left: 65, top: 60}]];
        showPicMsg("../images/ts_01.png", array, { width: 368, height: 104 });
    }
}
//显示提示消息
function showPicMsg(pic, array, attr, clsBtn) {
    $("#back").show().css("height", $("body").height()).click(closeMsg);
    if (attr.height && attr.height > getWinHeight()) {
        var height = attr.height;
        attr.height = getWinHeight() - 40;
        attr.width = attr.height * attr.width / height;
    }
    var img = $("<img src='" + pic + "' />").css({ width: attr.width, height: attr.height });
    var ele = $("<div id='picmsg' title='点击关闭' style='position:absolute;z-index:100;left:50%;top:50%;'></div>").css({
        width: attr.width,
        height: attr.height,
        marginLeft: -(attr.width / 2),
        marginTop: -(attr.height / 2),
        top: Math.max($("body").scrollTop(), $("html").scrollTop()) + getWinHeight() / 2
    }).append(img).appendTo($("body")).click(closeMsg);
    if (clsBtn) {
        ele.append($("<img src='../images/confirm_02.gif' title='关闭' />").css({
            "position": "absolute",
            "right": -12,
            "top": -12,
            "width": 18
        }).click(closeMsg));
    }
    if (array) {
        for (var i = 0; i < array.length; i++) {
            var argu = array[i];
            var a = $("<a href='javascript:;' class='absa' style='position:absolute;background:#333;opacity:0.0;filter:alpha(opacity=0);' ></a>").appendTo(ele);
            a.attr(argu[0]).css(argu[1]).bind(argu[2]);
        }
    }
    function closeMsg() {
        $("#back").hide();
        $("#picmsg").remove();
    }
}
//获取网页可视高度
function getWinHeight() {
    return window.innerHeight ? window.innerHeight : document.documentElement.offsetHeight - 5;
}
//设置hash
function setHash(param, value) {
    var hash = window.location.hash.toLowerCase();
    var oldvalue = "";
    var hashs = hash.replace("#", "").split("&");
    for (var i = 0; i < hashs.length; i++) {
        var itemparam = hashs[i].split("=")[0];
        if (itemparam == param)
            oldvalue = hashs[i].split("=")[1];
    }
    if (oldvalue)
        hash = hash.replace("=" + oldvalue, "=" + value);
    else
        hash += (hash ? "&" : "") + param + "=" + value;
    window.location.hash = hash;
}
//获取hash
function getHash(param) {
    var hash = window.location.hash.toLowerCase();
    var hashs = hash.replace("#", "").split("&");
    for (var i = 0; i < hashs.length; i++) {
        var itemparam = hashs[i].split("=")[0];
        if (itemparam == param)
            return hashs[i].split("=")[1];
    }
    return undefined;
}
//加载js文件
function loadJS(url, callback, charset) {
    var script = document.createElement('script');
    script.onload = script.onreadystatechange = function () {
        if (script && script.readyState && /^(?!(?:loaded|complete)$)/.test(script.readyState)) return;
        script.onload = script.onreadystatechange = null;
        script.src = '';
        script.parentNode.removeChild(script);
        script = null;
        if (callback) callback();
    };
    script.charset = charset || document.charset || document.characterSet;
    script.src = url;
    try { document.getElementsByTagName("head")[0].appendChild(script); } catch (e) { }
}

/*
* jwplayer课堂播放控制
* 运行条件:需引用jwplayer.js
* 一个全局变量player,如 var player = jwplayer("continer");
*/
var currentPartId; 	//当前播放的片段序号


//双击讲义播放
function mdDbClick(partid, toSecond) {
    seekPlay(toSecond,partid);
}
function mdPause() {
    toPause();
}
//手动播放
function seekPlay(tosecond,lectId) {
	
    if (showState()) {
        player.seek(tosecond/1000);
        currentPartId=lectId;
        onPartChange();
        play();
    }
}
//笔记时间点跳转
function mdNote(sValue) {
    var playTime = getFormatTime(sValue);
    player.seek(playTime);
}
function openCalculate() {
    toPause();
    window.open('/webtools/counter/count.htm', '_blank', 'width=400,height=236,top=260,left=260').onbeforeunload = function () {
        toPlay();
    };
}
function toPause() {
    if (player.getState().toLowerCase() == "playing") 
    	player.play();
}
function toPlay() {
    if (player.getState().toLowerCase() == "paused") 
    	player.play();
}
//讲义同步
function play() {
    $("#rightmain").contents().find(".conU").each(function () {
        if (this.id == ("part_" + currentPartId)) {
            this.style.borderColor = getColor();
            $(this).find("img[id^='doing_']").attr("src", "../images/doing.gif");
            var scrolltop = $(this).offset().top;
            parent.rightmain.document.body.scrollTop = scrolltop;
            parent.rightmain.document.documentElement.scrollTop = scrolltop;
        } else {
            this.style.borderColor = "white";
            $(this).find("img[id^='doing_']").attr("src", "../images/wait.gif");

        }
    });
}
//显示视频播放器状态
function showState() {
    //var engLessons = new Array(587, 588, 589, 590, 591, 592, 593, 594, 595, 596, 597, 598, 599, 622, 624, 625, 626, 628, 645, 796, 819, 820, 1019, 1020, 1089, 1170, 1172, 1173, 1174, 1791, 1792, 1793, 1794, 1805, 1806, 1807, 1808, 1816, 1832, 1833, 1834, 1835, 1836, 1837, 1838, 1839, 1840, 1841, 1847, 1849, 1897, 1898, 1899, 2046, 2047, 2048, 2049, 2050, 2051, 2052, 2085, 2086, 2109, 2110, 2111, 2184, 2258, 2259, 2260, 2263, 2264, 2265, 2266, 2267, 2268, 2285, 2286, 2300, 2303);
    var state = player.getState().toLowerCase();
    switch (state) {
        case "buffering":
            return false;
        case "idle":
            return false;
    }
    return true;
}
/*讲义颜色*/
function getColor() {
    return "#EFF2F9";
}
function getFormatTime(sValue) {
    var t = new Array();
    t = sValue.split(":");
    var s = parseInt(t[0] * 360) + parseInt(t[1] * 60) + parseInt(t[2]);
    if (s > player.getDuration()) {
        s = player.getDuration();
    }
    return s;
}

/*原播放器中的ajax.js  合并了主要是对课堂笔记得一些个操作*/
var xmlHttp = false, root = "/";
var listUrl = root + "newclassroom1/notelist.asp";
var noteUrl = root + "newclassroom1/note.asp";
var printUrl = root + "newclassroom1/print.asp";

function getId(nodeId) {
    var node = document.getElementById(nodeId);
    if (!node) {
        alert("ID不存在！");
        return false;
    }
    return node;
}
function PopNote(node, lid, rid, clm, page) {
    $.ajax({
        url: listUrl,
        data: { lid: lid, clm: clm, rid: rid, page: page },
        cache: false,
        beforeSend: function () { loadNoteMsg(node, "正在加载笔记..."); },
        success: function (data) { $("#" + node).html(data); },
        error: function () { loadNoteMsg(node, "对不起,加载失败!") }
    })
}
function loadNoteMsg(id, msg) {
    $("#" + id).html("<div style='width:100px;margin:20px auto;'>" + msg + "</div>");
}
function PopNoteAdd(node, lid, rid, clm) {
    var mTime = player.getPosition();
    mTime = StoTime(mTime);
    $.ajax({
        url: noteUrl,
        data: { lid: lid, clm: clm, rid: rid, ct: mTime },
        beforeSend: function () { loadNoteMsg(node, "正在加载笔记..."); },
        success: function (data) { $("#" + node).html(data); },
        error: function () { loadNoteMsg(node, "对不起,加载失败!") }
    });
}
function PopNoteSave(node) {
    var lid = getId("lid").value;
    var clm = getId("clm").value;
    var rid = getId("rid").value;
    var act = getId("act").value;
    var nid = getId("nid").value;
    var note_time = getId("note_time").value;
    var note_title = escape(getId("note_title").value);
    var note_content = escape(getId("note_content").value);

    if (note_title.length == 0) {
        alert("笔记标题不能为空！");
        return false;
    }
    if (note_content.length == 0) {
        alert("笔记内容不能为空！");
        return false;
    }
    $.ajax({
        url: noteUrl + "?note_content=" + note_content + "&note_title=" + note_title,
        data: { lid: lid, clm: clm, rid: rid, note_time: note_time, act: act, nid: nid },
        beforeSend: function () { loadNoteMsg(node, "正在加载笔记..."); },
        success: function (data) {
            $("#" + node).html(data);
            alert("操作成功！");
            PopNote(node, lid, rid, clm, 1);
        }
    });
}

function PopNoteModify(node, nid) {
    $.ajax({
        url: noteUrl,
        data: { nid: nid, act: "edit" },
        beforeSend: function () { loadNoteMsg(node, "正在加载笔记..."); },
        success: function (data) { $("#" + node).html(data); }
    });
}

function PopNoteDelete(node, lid, rid, clm, nid) {
    if (!confirm("确定要删除吗？"))
        return false;

    $.ajax({
        url: listUrl,
        data: { nid: nid, act: "dele" },
        beforeSend: function () { loadNoteMsg(node, "正在加载笔记..."); },
        success: function (data) {
            $("#" + node).html(data);
            PopNote(node, lid, rid, clm, 1);
        }
    });
}

function StoTime(nValue) {
    var CurrT = parseInt(nValue);
    var s = CurrT % 60;
    var m = parseInt(CurrT / 60);
    var h = 0;
    if (m >= 60) {
        h = parseInt(m / 60);
        m %= 60;
    }

    var reTime = ttTime(h) + ":" + ttTime(m) + ":" + ttTime(s);

    return reTime;

}

function ttTime(nValue) {
    if (nValue.toString().length <= 1) {
        reValue = "0" + nValue; ;
    }
    else {
        reValue = parseInt(nValue);
    }
    return reValue;
}
//打印
function openwinprint(lid, clm, rid) {
    var sUrl = printUrl + "?lid=" + lid + "&clm=" + clm + "&rid=" + rid;
    window.open(sUrl, "newwindow", "height=800, width=583, toolbar= no, menubar=no, scrollbars=no, resizable=no, location=no, status=no")
}

//浮动插件
jQuery.fn.float = function (settings) {
    if (typeof settings == "object") {
        settings = jQuery.extend({
            //延迟
            delay: 1000,
            //位置偏移
            offset: {
                left: 0,
                right: 0,
                top: 0,
                bottom: 0
            },
            style: null, //样式
            width: 100,  //宽度
            height: 200, //高度
            position: "rm" //位置
        }, settings || {});
        var winW = $(window).width();
        var winH = $(window).height();

        //根据参数获取位置数值
        function getPosition($applyTo, position) {
            var _pos = null;
            switch (position) {
                case "rm":
                    $applyTo.data("offset", "right");
                    $applyTo.data("offsetPostion", settings.offset.right);
                    _pos = { right: settings.offset.right, top: winH / 2 - $applyTo.innerHeight() / 2 };
                    break;
                case "lm":
                    $applyTo.data("offset", "left");
                    $applyTo.data("offsetPostion", settings.offset.left);
                    _pos = { left: settings.offset.left, top: winH / 2 - $applyTo.innerHeight() / 2 };
                    break;
                case "rb":
                    _pos = { right: settings.offset.right, top: winH - $applyTo.innerHeight() };
                    break;
                case "lb":
                    _pos = { left: settings.offset.left, top: winH - $applyTo.innerHeight() };
                    break;
                case "l":
                    _pos = { left: settings.offset.left, top: settings.offset.top };
                    break;
                case "r":
                    _pos = { right: settings.offset.right, top: settings.offset.top };
                    break;
                case "t":
                    $applyTo.data("offset", "top");
                    $applyTo.data("offsetPostion", settings.offset.top);
                    _pos = { left: settings.offset.left, top: settings.offset.top };
                    break;
                case "b":
                    $applyTo.data("offset", "bottom");
                    $applyTo.data("offsetPostion", settings.offset.bottom);
                    _pos = { left: settings.offset.left, top: winH - $applyTo.innerHeight() };
                    break;
            }
            return _pos;
        }
        //设置容器位置
        function setPosition($applyTo, position, isUseAnimate) {
            var scrollTop = $(window).scrollTop();
            var scrollLeft = $(window).scrollLeft();
            var _pos = getPosition($applyTo, position);
            _pos.top += scrollTop;
            isUseAnimate && $applyTo.stop().animate(_pos, settings.delay) || $applyTo.css(_pos);
        }
        return this.each(function () {
            var $this = $(this);
            $this.css("position", "absolute");
            settings.style && $this.css(settings.style);
            setPosition($this, settings.position);
            $(this).data("isAllowScroll", true);
            $(window).scroll(function () {
                $this.data("isAllowScroll") && setPosition($this, settings.position, true);
            });
        })
    } else {
        var speed = arguments.length > 1 && arguments[1] || "fast";
        this.each(function () {
            if (settings == "clearOffset") {
                var _c = {};
                if ($(this).data("offset")) {
                    _c[$(this).data("offset")] = 0;
                    $(this).data("isAllowScroll", false);
                    $(this).stop().animate(_c, speed);
                }
            } else if (settings == "addOffset") {
                var _c = {};
                if ($(this).data("offset") && $(this).data("offsetPostion")) {
                    _c[$(this).data("offset")] = $(this).data("offsetPostion");
                    $(this).stop().animate(_c, speed);
                    $(this).data("isAllowScroll", true);
                }

            } else if (settings == "setScrollDisable") {
                $(this).data("isAllowScroll", false);
            } else if (settings == "setScrollUsable") {
                $(this).data("isAllowScroll", true);
            }
        })
    }
}


$(function () {
    try {
        $(".float_box").float({
            delay: 500, //延迟
            position: "t" //位置
        });
    }
    catch (err) {
    }

});