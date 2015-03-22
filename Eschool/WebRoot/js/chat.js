var chat_en = false;
var chat_cur_tid = 0;
var inter_msg = null;
var getClassmate = false;
function start_chat() {
    if (chat_en)
        return;
    chat_start_getTeacher();
    chat_getClassmate();
    chat_en = true;
}

function chat_start_getTeacher(){
    chat_getTeacher();
    setInterval(chat_getTeacher, 10000);
}

function chat_start_getMsg() {
    $("#msgList").html("加载聊天记录中...");
    chat_getMsg();
    inter_msg=setInterval(chat_getMsg, 10000);
}


function chat_getTeacher() {
    $.ajax({
        type: "get",
        datatype: "text",
        cache: false,
        url: "../ashx/chat.ashx?rid=" + relateID,
        data: "met=teacherlist",
        success: function (r) {
            if (r.length > 2) {
                $("#teacherList").html("");
                var json = jQuery.parseJSON(r);
                for (var i = 0; i < json.length; i++) {
                    $("#teacherList").html($("#teacherList").html() + "<li class=\"yh_ls\" onclick=\"chat_select_teacher(" + json[i].userid + ",'" + json[i].name + "')\"><dl><dt></dt><dd><strong>" + json[i].name + "</strong>(" + (!json[i].online ? "离线" : "<b>在线</b>") + ")</dd></dl></li>");
                }
            }
            else {
                $("#teacherList").html("");
            }
        },
        error: function (r) {
            //alert(r);
        }
    })

}

function chat_select_teacher(id, n) {
    chat_cur_tid = id;
    $("#c_t_name").html("与<span>" + n + "</span>聊天");
    $(".chat_layera").hide();
    chat_start_getMsg();
}




function chat_getMsg() {
    if (chat_cur_tid == 0)
        return;
    $.ajax({
        type: "get",
        datatype: "json",
        cache: false,
        url: "../ashx/chat.ashx?rid=" + relateID + "&tid=" + chat_cur_tid,
        data: "met=msglist",
        success: function (j) {
            if (j.length > 5) {
                $("#msgList").html("");
                var json = jQuery.parseJSON(j);
                for (var i = 0; i < json.length; i++) {
                    var n = (json[i].userid != 0 ? "我" : $("#c_t_name span").html())
                    innerMsg(json[i].id, n, json[i].content, json[i].time);
                }
                var e = document.getElementById("msgList")
                e.scrollTop = e.scrollHeight;
            }
            else if (j != "") {

                alert(j);
                clearInterval(inter_msg);
            }
            else
                $("#msgList").html("");
        },
        error: function (r) {
            //alert(r);
        }
    })

}

function innerMsg(id, n, c, t) {
    $("#msgList").append("<div class=\"i\"><div class=\"c1\">" + n + " " + t + "</div><div class=\"c2\">" + c + "</div></div>")
}

function chat_send() {
    if (chat_cur_tid == 0) {
        alert('请选择聊天对象');
        return;
    }
    var v = $.trim($("#txtMsg").val());
    if (v.length == 0 || v.lenght > 500) {
        alert("聊天内容只能是1-500个字符之间");
        return;
    }

    $.ajax({
        type: "get",
        datatype: "text",
        cache: false,
        url: "../ashx/chat.ashx?rid=" + relateID + "&tid=" + chat_cur_tid + "&c=" + escape($("#txtMsg").val()),
        data: "met=sendmsg",
        success: function (r) {
            if (!isNaN(r)) {
                innerMsg(r, "我", $("#txtMsg").val(), '刚才');
                var e = document.getElementById("msgList")
                e.scrollTop = e.scrollHeight;
                $("#txtMsg").val("")
            }
            else
                alert(r);
        },
        error: function (r) {
            alert("发送失败");
        }
    })

}

function chat_getClassmate() {
    if (getClassmate)
        return;
    $("#classmateList").html("加载中...");
    $.ajax({
        type: "get",
        datatype: "text",
        cache: false,
        url: "../ashx/chat.ashx?rid=" + relateID,
        data: "met=getclassmate",
        success: function (r) {
   
            if (r.length > 2) {
                $("#classmateList").html("");
                var json = jQuery.parseJSON(r);
                for (var i = 0; i < json.length; i++) {
                    $("#classmateList").html($("#classmateList").html() + "<li class=\"yh_yh\"><dl><dt><img src=\"" + json[i].face + "\"/></dt><dd>" + json[i].name + "</dd></dl></li>");
                }
            }
            else
                $("#teacherList").html("");
            getClassmate = true;
        },
        error: function (r) {
            alert(r);
        }
    })

}