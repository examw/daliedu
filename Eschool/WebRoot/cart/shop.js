 var Shopping = 0; //购物车数量
    var AllShop = 0; //购物车价格总数
    var OldAllShop = 0; //购物车价格总数
    var listmyclid = "";
    var checklist = "";
    var Issong = 1;
    var Goodpice = 0;
    var youke = 0;
    var loginSate = 0;
    var listMyCID = "9735,9735";
    var logup=1;
    var Submitclick=false;
    $(document).ready(function() {    
        setCookie("WangXiao=MyClassID",listMyCID, 30);
        GetAllECart();
          
        $("#wBox_overlay").css("height", $(document).height());
        $(".wBox_close").live("click", function() {
            $("#wBox").parents("div").css("display", "none");
        });
        $(".checkall").live("click", function() {
            if ($(this).attr("checked") == "checked") {
                $(".checkshop,.checkall").attr("checked", true);
                checklist = listmyclid;
                GetAllPice();
            }
            else {
                $(".checkshop,.checkall").removeAttr("checked");
                checklist = "";
                $("#yuanjia").html("￥0");
                $("#allnum").html("0");
                $("#TotalCoursePriceSave").html("￥0");
            }
        });
        $(".checkshop").live("click", function() {
            var PiceOne = $(this).attr("old");
            var p = $("#yuanjia").html().replace("￥", "");
            if ($(this).attr("checked") == "checked") {
                $(this).attr("checked", true);
                checklist = checklist + $(this).val() + ",";
                $("#yuanjia").html("￥" + (parseInt(p) + parseInt(PiceOne)));
            }else {
                if ($(".checkall").attr("checked") == "checked")
                    checklist = listmyclid.replace($(this).val() + ",", "");
                else
                    checklist = checklist.replace($(this).val() + ",", "");
                $(this).removeAttr("checked");
                $(".checkall").removeAttr("checked");
                $("#yuanjia").html("￥" + (parseInt(p) - parseInt(PiceOne)));
            }
            GetAllPice();
        });
        $(".boxlink,.btn-go").live("click", function() {
            if(Submitclick==false){
                if (checklist != "") {
                    var zsname = $("#zsname").val();
                    var lxphone = $("#lxphone").val();
                    if (youke == 1 || loginSate == 0) {
                        LoginDisplay(0);
                    }else if (zsname == ""||lxphone == "") {
                        $(".name-list").css("display", "block");
                        $("html,body").animate({ scrollTop: $(window).height() }, 1000);
                        $(".msg").css("display", "block");
                        $("#lxphone,#zsname").css("border","1px solid #FF0000");
                        //闪动效果
                        $(".name-list").fadeOut(500).fadeIn(500);
                    }else {
                        $("#log_tn").val(zsname);
                        $("#log_tel").val(lxphone);
                        $(".msg").css("display", "none")
                        if (zzjsMobile(lxphone) == 1){
                            GenerationOrder(zsname, lxphone);
                        }
                    }
                }
                else
                    notice("请选择要购买的课程", 2,180);
            }
        });
        $("#float-bar").live("click", function() {
            if(checklist!=""){
                var list=checklist.substring(0, checklist.length - 1);
                DelShop(list,1);
            }else
                notice("请选择要移除的课程", 2.180);
        });
    });
    function Shoping() {
        $(".total2").html(Goodpice);
        $("#allnum,#num").html(Shopping);
        $("#TotalCoursePriceSave").html("￥" + AllShop);
        $("#yuanjia").html("￥" + OldAllShop);
    }
    function GetAllPice() {
        if (checklist.length > 0) {
            $.ajax({
                type: "POST",
                async: true,
                dataType: "json",
                url: "/search/UserCenter/play/Shop/ShopListAjax.ashx",
                data: "str=pice&myid=" + checklist.substring(0, checklist.length - 1),
                success: function(json) {
                    if (json.allpice != null)
                        $("#TotalCoursePriceSave").html("￥" + json.allpice);
                    if (json.picecount != null)
                        $("#allnum").html(json.picecount);
                    if (json.AllOldpice != null)
                        $("#yuanjia").html("￥"+json.AllOldpice);
                    if (json.Sevenday != null) {
                        if (json.Sevenday == 1)
                            $("#Sevenday").css("display","block");
                        else
                            $("#Sevenday").css("display", "none");
                    }
                }
            });
        }else{
            $(".total2").html(Goodpice);
            $("#allnum").html(0);
            $("#TotalCoursePriceSave").html("￥0.00");
            $("#yuanjia").html("￥0.00");
        }
    }
    function openwin(url) {
        var a = document.createElement("a");
        a.setAttribute("href", url);
        a.setAttribute("target", "_blank");
        a.setAttribute("id", "openwin");
        document.body.appendChild(a);
        a.click();
    }
    function GenerationOrder(truename, tel) {
        Submitclick=true;
        var Content="";
        if(Issong==0)
            Content="要教材";
        if(checklist!=""){    
            $.ajax({
                type: "POST",
                async: true,
                dataType: "json",
                beforeSend: function() { loading("正在订单提交"); },
                complete: function() { dialoading.close(); },
                url: "/search/UserCenter/play/Shop/ShopListAjax.ashx",
                data: "str=Order&truename=" + escape(truename) + "&Content="+escape(Content)+"&tel=" + tel + "&myid=" + escape(checklist.substring(0, checklist.length - 1)),
                success: function(json) {
                    if (json.orderid == "0"){
                        Submitclick=false;
                        notice(json.msg, 2,200);
                        window.setTimeout(function() { window.location.reload(); }, 2000);
                    }else if (json.orderid == "1") {
                        Submitclick=false;
                        LoginDisplay(0);
                    }
                    else {
                        var shopcar="";
                        var checkbox = document.getElementsByName("m");
                        for (var i = 0; i < checkbox.length; i++) {
                            if (!checkbox[i].checked) {
                                shopcar += checkbox[i].value + ",";
                            }
                        }
                        if(shopcar=="")
                            setCookie("WangXiao=MyClassID", "", 30);
                        else
                            setCookie("WangXiao=MyClassID", shopcar.substring(0,shopcar.length-1), 30);                        
                        
                        location.replace("/search/UserCenter/play/Shop/Pay.aspx?OrdersID="+json.orderid);
                    }
                }
            });
        }else
            notice("请选择要购买的课程", 2,180);
    }

    function DelShop(id,index) {
        var content="",width=0;
        if(index==0){
            var ClassCname= $("#tr"+id).find("td").eq(1).find("a").html();
            content="您确定将&nbsp;&nbsp;<span style=\"color: #008800;\">"+ClassCname+"</span>&nbsp;&nbsp;从购课车移除吗？";
            width=300;
        }else{
            content="您确定从购课车移除选定的多个课程吗？";
            width=310;
        }
        art.dialog({
            title: "温馨提示",
            content: "<span style=\"font-size:14px;\">"+content+"</span>",
            zIndex: 18008,
            icon: "question",
            width: width,
            lock: true,
            resize: false,
            fixed: true,
            button: [{ name: "确定", callback: function() { 
                $.ajax({
                    type: "POST",
                    async: true,
                    dataType: "json",
                    url: "/search/UserCenter/play/Orders/SetCourseAjax.ashx",
                    data: "str=DelShop&myid=" + escape(id),
                    success: function(json) {
                        if (json.S == 1) {
                            var str_id=id.toString().replace(/[,]/ig,",#tr");
                            $("#tr"+str_id).remove();
                            
                            var dellist="";
                            var len=$(".ca_tab1").length;
                            for (var j = 0; j < len; j++) {
                                if ($(".ca_tab1").eq(j).find("table tr").length==0) {
                                    if(dellist=="")
                                        dellist="#"+$(".ca_tab1").eq(j).attr("id");
                                    else
                                        dellist= dellist+",#"+$(".ca_tab1").eq(j).attr("id");
                                }
                            }
                            if(dellist!="")
                                $(dellist).remove();
                            if($(".ca_tab1").length==0){
                                $(".kclist").html("<span class=\"empty-img\"></span><div class=\"empty-txt\"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br />马上去<a href=\"http://wx.233.com\" target=\"_blank\">选课</a> 或 <a target=\"_blank\" href=\"/search/UserCenter/free.asp?guest=1\">免费体验</a></div>");
                                $(".conall").css("display", "none");
                            }
                            
                            checklist = "";
                            var checkbox = document.getElementsByName("m");
                            for (var i = 0; i < checkbox.length; i++) {
                                if (checkbox[i].checked) {
                                    checklist += checkbox[i].value + ",";
                                }
                            }
                            Goodpice=0;
                            Shopping=0;
                            var priclen=$(".tc1").length;
                            for (var l = 0; l < priclen; l++) {
                                if($(".tc1").eq(l).parent().attr("bgcolor")=="#f5f5f5"){
                                    Goodpice = Goodpice + parseInt($(".tc1").eq(l).html().toString().replace("￥",""))*1;
                                    Shopping+=1;
                                }
                            }
                            
                            $(".total2").html(Goodpice);
                            $("#num").html(Shopping);

                            if(json.List!=null){                                
                                listMyCID=json.List;
                                listmyclid=json.List+",";
                                setCookie("WangXiao=MyClassID",listMyCID, 30);
                            }
                            GetAllPice();
                        }else{
                            notice("移除失败", 2,100);
                        }
                    }
                });
            }}, { name: "取消"}]
        });
    }
    function GetAllECart() {
        var _html = "<ul class=\"s-chk\"><li class=\"b0\"><input class=\"checkall\" checked=\"checked\" name=\"\" type=\"checkbox\" value=\"\" /></li><li class=\"b4\">全选&nbsp;&nbsp;&nbsp;<a href=\"javascript:;\" id=\"float-bar\">批量删除</a></li><li class=\"b1\">课程名称</li><li class=\"b3\">网校名称</li><li class=\"b3\">原价</li><li class=\"b2\">现价</li><li class=\"b3\">操作</li></ul>";
        listmyclid = "";
        checklist = "";
        Goodpice = 0;
        var pricecount = 0, length = 0;
        var price = 0;
        var oldpic = 0;
        $(".kclist").html("<div id=\"Shadow\"><img src=\"http://img.233.com/wx/artDialog/skins/icons/loading.blue.gif\"/></div>");
        $.ajax({
            type: "GET",
            url: "/search/UserCenter/play/Orders/SetCourseAjax.ashx",
            data: { str: "GetShop", zhekou: 1 },
            dataType: "json",
            cache: false,
            success: function(result) {
                if (result.S == 0) {
                    _html = "<span class=\"empty-img\"></span><div class=\"empty-txt\"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br />马上去<a href=\"http://wx.233.com\" target=\"_blank\">选课</a> 或 <a target=\"_blank\" href=\"/search/UserCenter/free.asp?guest=1\">免费体验</a></div>";
                    $(".conall").css("display", "none");
                }
                if (result.S == 1) {
                    if(result.List.length==0&&result.BuyList.length==0){
                        _html = "<span class=\"empty-img\"></span><div class=\"empty-txt\"><strong>您的购课车是空的，赶快行动吧！您可以：</strong><br />马上去<a href=\"http://wx.233.com\" target=\"_blank\">选课</a> 或 <a target=\"_blank\" href=\"/search/UserCenter/free.asp?guest=1\">免费体验</a></div>";
                        $(".conall").css("display", "none");
                    }else{
                        var ClassID = "", table = "";
                        if (result.List.length > 0) {
                            length = result.List.length;
                            if (length > 50)
                                length = 50;
                                
                            _html +="<div class=\"ca_tab1\" id=\"shop_"+i+"\"><table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"#eaeaea\">";
                            for (var i = 0; i < length; i++) {
                                _html+="<tr id='tr" + result.List[i].MyClassID + "' class='shopp'><td id='couse_price_s_" + result.List[i].MyClassID + "' bgcolor=\"#f5f5f5\" class=\"b0\" align=\"center\"><input name=\"m\" class='checkshop check" + result.List[i].ClassID + "' checked='checked' old='" + result.List[i].OldPrice + "' type=\"checkbox\" value=\"" + result.List[i].MyClassID + "\" /></td><td align=\"left\" bgcolor=\"#f5f5f5\" class=\"b1\"><a class=\"noday7\" href=\"javascript:;\">" + unescape(result.List[i].MyClassName) + "</a><br />名师：" + unescape(result.List[i].Teacher) + "&nbsp;&nbsp;&nbsp;&nbsp;课时：" + result.List[i].CourseNum + "讲&nbsp;&nbsp;&nbsp;&nbsp;科目：" + unescape(result.List[i].ClassName) + "</td><td align=\"center\" bgcolor=\"#f5f5f5\" class=\"b3\">" + unescape(result.List[i].SchoolName) + "</td><td align=\"center\" bgcolor=\"#f5f5f5\" class=\"b3\"><strong>￥" + result.List[i].OldPrice + "</strong></td><td align=\"center\" bgcolor=\"#f5f5f5\" class=\"b2\"><span class=\"tc1\">￥" + result.List[i].GoodPrice + "</span><br /><em class=\"s-change\">省" + result.List[i].DiffPrice + ".00元</em></td><td align=\"center\" bgcolor=\"#f5f5f5\" class=\"b3\"><a class=\"del\" href=\"javascript:;\" onclick=\"DelShop(" + result.List[i].MyClassID + ",0)\">删除</a></td></tr>";                        
                                    
                                ClassID = result.List[i].ClassID

                                Goodpice = Goodpice + parseInt(result.List[i].GoodPrice);
                                pricecount = pricecount + 1;
                                oldpic = oldpic + parseInt(result.List[i].OldPrice);
                                listmyclid = listmyclid + result.List[i].MyClassID + ",";
                            }
                            _html += "</table></div>";
                            $("#jdnum").css("width", length * 2 + "%");
                        }
                        if (result.BuyList.length > 0) {
                            length = result.BuyList.length;
                            _html += "<div class=\"ca_tab1\"><h1><span class=\"blue\">已购买课程</span></h1><table border=\"0\" cellspacing=\"1\" cellpadding=\"0\" bgcolor=\"#eaeaea\">";
                            for (var i = 0; i < length; i++) {
                                _html += "<tr class='shopp'><td bgcolor=\"#FFEBCC\" class=\"b0\" align=\"center\"></td><td align=\"left\" bgcolor=\"#FFEBCC\" class=\"b1\"><a class=\"noday7\" href=\"javascript:;\">" + unescape(result.BuyList[i].MyClassName) + "</a><br />名师：" + unescape(result.BuyList[i].Teacher) + "&nbsp;&nbsp;&nbsp;&nbsp;课时：" + result.BuyList[i].CourseNum + "讲&nbsp;&nbsp;&nbsp;&nbsp;科目：" + unescape(result.BuyList[i].ClassName) + "</td><td align=\"center\" bgcolor=\"#FFEBCC\" class=\"b3\">" + unescape(result.BuyList[i].SchoolName) + "</td><td align=\"center\" bgcolor=\"#FFEBCC\" class=\"b3\"><strong>￥" + result.BuyList[i].OldPrice + "</strong></td><td align=\"center\" bgcolor=\"#FFEBCC\" class=\"b2\"><span class=\"tc1\">￥" + result.BuyList[i].GoodPrice + "</span><br /><em class=\"s-change\">省" + result.BuyList[i].DiffPrice + ".00元</em></td><td align=\"center\" bgcolor=\"#FFEBCC\" class=\"b3\"><a title='马上学习' href=\"/search/UserCenter/play/?mid=" + result.BuyList[i].MyClassID + "\" target=\"_blank\" style=\"background: url(http://img.233.com/wx/img/job/shop/order.png) no-repeat scroll 0 -269px transparent;color: #FFFFFF; float: left; height: 21px; line-height: 21px; margin-left: 9px; margin-top: 4px; text-align: center; width: 57px;\">马上学习</a></td></tr>";
                            }
                            _html += "</table></div>";
                        }
                        if (result.allpice != null)
                            price = result.allpice;
                        if (result.Issong != null)
                            Issong = result.Issong;
                        if (result.youke != null)
                            youke = result.youke;
                        if (result.ClassEName != null) {
                            var ClassEName = result.ClassEName;
                            $(".jxxk").attr("href", "http://wx.233.com/" + ClassEName + "/");
                        }
                        if(listmyclid!="")
                            listMyCID=listmyclid.substring(0,listmyclid.length-1);
                        else
                            listMyCID="";
                        setCookie("WangXiao=MyClassID", listMyCID, 30);
                    }
                }

                checklist = listmyclid;
                $(".kclist").html(_html);
                Shopping = pricecount; AllShop = price; OldAllShop = oldpic;
                Shoping();
                GetAllPice();
                
                $(".status-bar span").eq(2).html(length+"/50")
                
                if (length == 50)
                    notice("购课车已满，请移除不需要的课程", 2,280);
            }
        });
    }
    function LoginDisplay(index) {
        $("#wBox").parents("div").css("display", "block");
        logup=index;
    }
    function AddFavorite(n) {
        var sURL = "http://wx.233.com/search/UserCenter/play/Shop/", sTitle = "233网校-购课车-购课清单";
        try {
            window.external.addFavorite(sURL, sTitle);
        }
        catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            }
            catch (e) {
                $.dialog({ title: '加入收藏失败', icon: 'warning', content: "加入收藏失败，请使用Ctrl+D进行添加", zIndex: 18008 });
            }
        }
    }
    function notice(content, t,width) {//提示框
        dianotice = art.dialog({ id: "face-sad", width: width, title: "温馨提示", icon: "face-sad", content: "<div class=\"aui-boxt\" style=\"font-size:14px;\"><div>" + content + "</div></div>", zIndex: 18008, lock: true, time: t, resize: false, fixed: true });
    }
    function succeed(content, t,width) {
        artdialog = art.dialog({ id: "artdialog", width: width, title: "温馨提示", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"font-size:14px;\"><div>" + content + "</div></div>", zIndex: 18008, lock: true, time: t, resize: false, fixed: true });
    }
    function loading(content) {//jiazai
        dialoading = art.dialog({ id: "loading123", content: content, icon: "loading",lock: true, cancel: false, title: false, fixed: true });
    }
    function update(obj,num, wait,value) {
        if(num == (wait/1000)) {
            $(obj).html(value);
        } else {
            printnr = (wait / 1000) - num;
            $(obj).html(value+"(" + printnr + ")");
        }
    }
    function zzjsMobile(obj) {
        var a = 0;
        if (obj.length != 11)
            notice("这个手机号不存在！", 2,180);
        else if (obj.substring(0, 2) != "13" && obj.substring(0, 2) != "14" && obj.substring(0, 2) != "15" && obj.substring(0, 2) != "18")
            notice("这个手机号不存在！", 2,180);
        else if (isNaN(obj))
            notice("手机号码请输入数字！", 2,190);
        else
            a = 1;
        return a;
    }


    function echo(obj, html) {
        if (html.indexOf('0') != -1)
            setstyle(obj, 'block', 'line1px_4', '&nbsp;恭喜您，可以使用！');
        else if (html.indexOf('1') != -1)
            setstyle(obj, 'block', 'line1px_3', '&nbsp;很遗憾，已被使用！');
        else
            setstyle(obj, 'block', 'line1px_2', '&nbsp;程序加载中......');
    }
    function setstyle(obj, show, css, msg) {
        $("#" + obj).html(msg);
        $("#" + obj).attr("class", css);
    }
    function CheckMail(obj, id) {
        var objval = $("#" + obj).val();
        if (!checkIsEmailNumber(objval) && objval != '') {
            $("#" + id).html("&nbsp;Emial格式错误！| 例：233@233.com");
            $("#" + id).attr("class", "line1px_3");
        }
        else if (objval == '') {
            $("#" + id).html("&nbsp;邮件为空！| 例：233@233.com");
            $("#" + id).attr("class", "line1px_3");
        }
    }

    function CheckNull(obj, msg, id, vmsg) {
        if ($("#" + obj).val() == '') {
            $("#" + id).html(msg);
            $("#" + id).attr("class", "line1px_3");
        }
        else {
            $("#" + id).html(vmsg);
            $("#" + id).attr("class", "line1px_4");
        }
    }
    function checkIsEmailNumber(strWord) {
        var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
        if (reg.test(strWord))
            return true;
        else
            return false;
    }

    function CheckSafe(str) {
        var bads = "'&<>?%,;:()`~!#$^*{}[]|+-=\"";
        for (var i = 0; i < bads.length; i++) {
            if (str.indexOf(bads.substring(i, i + 1)) != -1) {
                return false;
                break;
            }
        }
        return true;
    }

    function fopen(obj)
    { $("#" + obj).show(); }
    function fclose(obj)
    { $("#" + obj).hide(); }
    function ChangeColor(id, st) {
        if (st == 0)
        { $("#" + id).attr("class", "line1px_2"); }
        else
        { $("#" + id).attr("class", "line1px"); }
    }

    function CheckLength(obj, msg, id, sNum, mNum, cstyle) {
        if (obj.length >= sNum && obj.length < mNum) {
            $("#" + id).html(msg);
            $("#" + id).attr("class", cstyle);
        }
    }

    function createxmlhttp() {
        var xmlhttp = false;
        try {
            xmlhttp = new ActiveXObject("Msxml2.XMLHTTP");
        }
        catch (e) {
            try {
                xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
            }
            catch (e) {
                xmlhttp = false;
            }
        }
        if (!xmlhttp && typeof XMLHttpRequest != 'undefined') {
            xmlhttp = new XMLHttpRequest();
            if (xmlhttp.overrideMimeType) {//设置MiME类别
                xmlhttp.overrideMimeType('text/xml');
            }
        }
        return xmlhttp;
    }

    function getdata(url, obj1, obj2) {
        var xmlhttp = createxmlhttp();
        if (!xmlhttp) {
            alert("你的浏览器不支持XMLHTTP！！");
            return;
        }
        xmlhttp.onreadystatechange = requestdata;
        xmlhttp.open("GET", url, true);
        xmlhttp.send(null);
        function requestdata() {
            fopen(obj1);
            echo(obj1, "loading");
            if (xmlhttp.readyState == 4) {
                if (xmlhttp.status == 200) {
                    if (obj1 != obj2) { fclose(obj1); };
                    echo(obj2, xmlhttp.responseText);
                }
            }
        }
    }

    function CheckUserName(obj, id) {
        var objvalue;
        objvalue = $("#" + obj).val();
        if (!CheckSafe(objvalue)) {
            $("#" + id).html('&nbsp;用户名不能包含 \'&<>?%,;:()`~!#$^*{}[]|+-=\"');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }

        if (objvalue != '') {
            if (objvalue.length >= 4 && objvalue.length <= 16)
            { getdata('/search/baoming/CheckPage.asp?reg=' + objvalue, 'reg_nc_msg', 'reg_nc_msg'); }
            else
            { CheckLength(objvalue, '&nbsp;用户名格式错误请在4－16位之间！', id, 2, 16, 'line1px_3') }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，用户名不能为空！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    function CheckTrueName(obj, id) {
        var objvalue;
        objvalue = $("#" + obj).val();

        if (!CheckSafe(objvalue)) {
            $("#" + id).html('&nbsp;真实姓名不能包含 \'&<>?%,;:()`~!#$^*{}[]|+-=\"');
            $("#" + id).attr("class", "line1px_3");
            return false;
        }
        if (objvalue != '') {
            if (objvalue.length >= 2 && objvalue.length <= 16) {
                $("#" + id).html('&nbsp;真实姓名格式正确！');
                $("#" + id).attr("class", "line1px_4");
            }
            else {
                CheckLength(objvalue, '&nbsp;真实姓名字数不符合,字数在2－12位之间！', id, 2, 12, 'line1px_3')
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，真实姓名不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    	 function CheckQICQ(){
    		 	var qq=$("#reg_qq").val();
    		 	var reg=/^\d{5,10}$/; 
    		 	if(qq!=""&&!reg.test(qq)){
    		 		$("#reg_qq_msg").html('请输入正确格式的QQ号码');
    		 		$("#reg_qq_msg").attr("class","line1px_3");
    		 		ckqq=false;
    		 		return false;
    		 	}else if(qq==""){
    		 		$("#reg_qq_msg").html('请输入您的QQ号码');
    		 		$("#reg_qq_msg").attr("class","line1px");
    		 		ckqq=true;
    		 		return true;
    		 	}else{
    		 		$("#reg_qq_msg").html('QQ号码输入正确');
    		 		$("#reg_qq_msg").attr("class","line1px_4");
    		 		ckqq=true;
    		 		return true;
    		 	}
    }
    function isPosInteger(number) {
        var regex = /^\d+$/;
        if (regex.test(number))
            return true;
        else
            return false;
    }
    function CheckTelNum(obj, id) {
        var objval = $("#" + obj).val();
        if (objval == '') {
            $("#" + id).html('&nbsp;此项为必填项，手机号码不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
        else {
            if (checkTel(objval))
            { setstyle(id, 'block', 'line1px_4', '&nbsp;手机号码格式正确！'); }
            else
            { setstyle(id, 'block', 'line1px_3', '&nbsp;手机号码格式不正确！'); }
        }

    }
    function checkTel(TelNum) {
        var mobile = TelNum;
        var reg0 = /^13\d{9}$/;
        var reg1 = /^15\d{9}$/;
        var reg2 = /^18\d{9}$/;
        var reg3 = /^14\d{9}$/;
        var my = false;
        if (reg0.test(mobile)) my = true;
        if (reg1.test(mobile)) my = true;
        if (reg2.test(mobile)) my = true;
        if (reg3.test(mobile)) my = true;
        if (!my) {
            return false;
        } else {
            return true;
        }
    }
    function CheckPassWord(obj, id) {
        var objval = $("#" + obj).val();
        if (objval != '') {
            if (objval.length >= 6 && objval.length < 16) {
                $("#" + id).html('&nbsp;格式正确可以使用！');
                $("#" + id).attr("class", "line1px_4");
            }
            else {
                CheckLength(objval, '&nbsp;密码格式错误请在6-16位之间！', id, 6, 16, 'line1px_3');
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，密码不能为空！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    function PasswordEquals(obj1, obj2, id) {
        var objval1 = $("#" + obj1).val();
        var objval2 = $("#" + obj2).val();
        if (objval1 != '') {
            if (objval2.length >= 6 && objval2.length < 16) {
                if (objval1 != objval2) {
                    $("#" + id).html('&nbsp;重复密码与原密码不一致！');
                    $("#" + id).attr("class", "line1px_3");
                }
                else {
                    $("#" + id).html('&nbsp;格式正确可以使用！');
                    $("#" + id).attr("class", "line1px_4");
                }
            }
            else {
                CheckLength(objval1, '&nbsp;密码格式错误请在6-16位之间！', id, 6, 16, 'line1px_3');
            }
        }
        else {
            $("#" + id).html('&nbsp;此项为必填项，重复密码不能为空哦！');
            $("#" + id).attr("class", "line1px_3");
        }
    }
    //-----------------------------------------------------------------------------------------------
    function CheckAllForms(obj) {
        var A = new Array(3);
        var B = new Array(3);
        for (var i = 0; i < A.length; i++)
            A[i] = true;
        B[0] = "setstyle('reg_nc_msg','block','line1px_3','&nbsp;用户名格式错误！')";
        B[1] = "setstyle('reg_pwd_msg','block','line1px_3','&nbsp;密码格式错误！');";
        B[2] = "setstyle('reg_tname_msg','block','line1px_3','&nbsp;真实姓名填写错误！')";
        B[3] = "setstyle('telNum_info','block','line1px_3','&nbsp;联系电话格式错误！')";

        var sUser = $("#reg_nc").val();
        var sPass = $("#reg_pwd").val();
        var name = $("#reg_tname").val();
        var tel = $("#telNum").val();

        if (sUser == '' || !CheckSafe(sUser))
        { A[0] = false; }
        else {
            if (sUser.length >= 2 && sUser.length < 16)
                A[0] = true;
            else
                A[0] = false;
        }

        if (sPass == '' || !CheckSafe(sPass))
        { A[1] = false; }
        else {
            if (sPass.length >= 6 && sPass.length < 16)
                A[1] = true;
            else
                A[1] = false;
        }
        if (name.length < 2)
            A[2] = false;
        if (!checkTel(tel))
            A[3] = false;
        var flag = true;
        for (var i = 0; i < A.length; i++)
        { if (!A[i]) flag = false; }
        if (!flag) {
            for (var j = 0; j < A.length; j++)
            { if (!A[j]) eval(B[j]); }
            $('#reg_err_msg').html('请正确填写带 * 项的注册信息')
            $('#reg_err_msg').css("display", "block");
            $('#reg_err_msg').attr("class", "line1px_3");
            return false;
        }
        else {
            userRegister(obj);
            return true;
        }
    }
    function userRegister(obj) {
        var logState, logMsg;
        var TpLogName = $("#reg_nc").val();
        var freewx = $("#freetype").val();
        var truename=$("#reg_tname").val();
        var telp=$("#telNum").val();
        var options = { reg_un: inCode($("#reg_nc").val()), reg_pwd: inCode($("#reg_pwd").val()), reg_tel: inCode(telp), reg_tun: inCode(truename), reg_mail: inCode($("#reg_mail").val()), GMT: new Date().getTime() };
        $('#btzc').html("<img src='http://img.233.com/wx/img/bm/loading.gif' />");
        var url = "/search/bm/register.asp?=";
        $.ajax({
            type: "GET",
            contentType: "text/html;gb2312",
            url: url,
            data: options,
            dataType: 'html',
            success: function(result) {
                var json = eval("(" + result + ")");
                logState = json.LogState;
                logMsg = json.MsgStr;

                if ((logState == 1) || (logState == 2)) {
                    $('#wBox').remove();
                    $('#wBox_overlay').remove();
                    setCookie("wxUserName", TpLogName, 30);
                    if (freewx == "free") {
                        mianfieshiting();
                    } else {
                        if (logup==1 || $(".ca_tab1").html() == null) {
                            art.dialog({ id: "artdialog", title: "登录成功", icon: "loading", content: "<div class=\"aui-boxt\" style=\"width:240px;font-size:16px;\"><div>注册成功,正在加载购课车数据...</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
                            window.setTimeout(function() {window.location.reload();}, 2000);
                        } else {
                            art.dialog({ id: "artdialog", title: "注册成功", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div><span id=\"timer\">(3)</span> 秒后自动生成订单</div></div>", zIndex: 18008, lock: true, time: 3, resize: false, fixed: true });
                            var wait = 3 * 1000;
                            for(i = 1; i <= 3; i++) {
                                window.setTimeout("update('#timer'," + i + "," + wait + ",'')", i * 1000);
                            } 
                            window.setTimeout(function() { GenerationOrder(truename, telp); }, 3500);
                        }
                    }
                }
                else {
                    $("#reg_err_msg").attr("class", "line1px_3").html("注册失败，" + logMsg);
                    $('#btzc').html("<span class=\"zcbn\" onclick=\"CheckAllForms(this);\">注册报名</span>");
                }
            },
            error: function() {
                $('#btzc').html("<span class=\"zcbn\" onclick=\"CheckAllForms(this);\">注册报名</span>");
            }
        });
    }
    function showTelinput(obj) {
        var log_un = $("#log_un").val();
        var t_tun, t_tel;
        var options = { log_user: inCode(log_un), GMT: new Date().getTime() };
        var url = "/search/bm/showtelinput.asp?=";
        $.ajax({
            type: "GET",
            contentType: "text/html;gb2312",
            url: url,
            data: options,
            dataType: 'html',
            success: function(result) {
                var json = eval("(" + result + ")")
                if (json) {
                    t_tun =unescape(json.TrueName);
                    t_tel = json.MobilePhone;
                    if (t_tun == "null") {
                        t_tun="";
                    }
                    if (t_tel == "null") {
                        t_tel="";
                    }                    
                    $("#tr_tn").css("display", "block");
                    $("#log_tn").val(t_tun);
                    $("#tr_tel").css("display", "block");
                    $("#log_tel").val(t_tel);
                    $("#log_un_Tip").css("display", "block");
                    $("#log_tip_o").html("您可以修改账号的手机号码和真实姓名");
                }
            },
            error: function() {
                $("#tr_tn").css("display", "block");
                $("#tr_tel").css("display", "block");
                $("#log_un_Tip").css("display", "block");
                $("#log_tn").attr("disabled", false);
                $("#log_tel").attr("disabled", false);
            }
        });
    }
    function CheckLogForms(obj) {
        var log_un = $("#log_un").val();
        var log_pwd = $("#log_pwd").val();
        var log_tun = $("#log_tn").val();
        var log_tel = $("#log_tel").val();
        if ((log_un.length < 2) || (log_un.length > 32)) {
            $("#log_un_Tip").css("display", "block");
            $("#log_tip_o").html("请正确填写用户名");
            return false;
        }
        else if (!CheckSafe(log_un)) {
            $("#log_un_Tip").css("display", "block");
            $("#log_tip_o").html("用户名不能含以下字符:'&<>?%,;:()`~!#$^*{}[]|+-=\"");
            return false;
        }

        if (log_pwd.length < 4 || log_pwd.length > 64) {
            $("#log_un_Tip").css("display", "block");
            $("#log_tip_o").html("密码长度不正确");
            return false;
        }

        if (!$("#log_tn").attr("disabled")) {
            if (log_tun.length < 2 || log_tun.length > 16) {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("请认真填写真实姓名");
                return false;
            }
            else if (!CheckSafe(log_tun)) {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("真实姓名不能含以下字符:'&<>?%,;:()`~!#$^*{}[]|+-=\"");
                return false;
            }
        }
        if (!$("#log_tel").attr("disabled")) {
            if (!checkTel(log_tel)) {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("请填写正确的手机号码");
                return false;
            }
        }
        userLogin(obj);
    }
    function userLogin(obj) {
        var logState, logMsg;
        var TpLogName;
        TpLogName = $("#log_un").val();
        var freewx = $("#freetype").val();
        var reg_tun = $("#log_tn").val();
        var log_tel = $("#log_tel").val();
        var options = { reg_un: inCode($("#log_un").val()), reg_pwd: inCode($("#log_pwd").val()), reg_tun: inCode(reg_tun), reg_tel: inCode(log_tel), GMT: new Date().getTime() };
        $('#btdl').html("<img src='http://img.233.com/wx/img/bm/loading.gif' />");
        var url = "/search/member/checkUserLogin.asp?=";
        $.ajax({
            type: "GET",
            contentType: "text/html;gb2312",
            url: url,
            data: options,
            dataType: 'html',
            success: function(result) {
                var json = eval("(" + result + ")");
                logState = json.LogState;
                logMsg = json.MsgStr;
                if ((logState == 1) || (logState == 2)) {
                    setCookie("wxUserName", TpLogName, 30);
                    $('#wBox').remove();
                    $('#wBox_overlay').remove();
                    if (freewx == "free") {
                        mianfieshiting();
                    } else {
                        if (logup==1 || $(".ca_tab1").html() == null) {
                            art.dialog({ id: "artdialog", title: "登录成功", icon: "loading", content: "<div class=\"aui-boxt\" style=\"width:240px;font-size:16px;\"><div>登录成功,正在加载购课车数据...</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
                            window.setTimeout(function() {window.location.reload();}, 2000);
                        } else {
                            art.dialog({ id: "artdialog", title: "登录成功", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div><span id=\"timer\">(3)</span> 秒后自动生成订单</div></div>", zIndex: 18008, lock: true, time: 3, resize: false, fixed: true });
                            var wait = 3 * 1000;
                            for(i = 1; i <= 3; i++) {
                                window.setTimeout("update('#timer'," + i + "," + wait + ",'')", i * 1000);
                            } 
                            window.setTimeout(function() { GenerationOrder(reg_tun, log_tel); }, 3500);
                        }
                    }
                }
                else {
                    $("#log_un_Tip").css("display", "block");
                    $("#log_tip_o").html(logMsg);
                    $('#btdl').html("<span class=\"zcbn\"><a target=_self href=\"javascript:CheckLogForms(this);\">登 录</a></span>");
                }
            },
            error: function() {
                $("#log_un_Tip").css("display", "block");
                $("#log_tip_o").html("登录失败,请查检您的用户名与密码");
                $('#btdl').html("<span class=\"zcbn\"><a target=_self href=\"javascript:CheckLogForms(this);\">登 录</a></span>");
            }
        });
    }

    function mianfieshiting() {
        var cid = "";
        var cidObj = $("input[name='MyClassID']");
        for (var i = 0; i < cidObj.length; i++) {
            if (cid == "") cid = cidObj.eq(i).val();
            else cid = cid + "," + cidObj.eq(i).val();
        }
        if (cid != "") {
            $.post("/search/bm/baoming_end.asp", { "MyClassID": cid }, function() {
                location.href = "/search/usercenter/free.asp";
            });
        } else {
            art.dialog({ id: "artdialog", title: "", icon: "succeed", content: "<div class=\"aui-boxt\" style=\"width:150px;\"><div>请选择您要体验的课程</div></div>", zIndex: 18008, lock: true, time: 2, resize: false, fixed: true });
        }
    }

    function inCode(str) {
        return encodeURIComponent(encodeURIComponent(str));
    }
    function deCode(str) {
        return decodeURIComponent(decodeURIComponent(str));
    }
    function getCookie(name) {
        var cookieValue = "";
        var search = name + "=";
        if (document.cookie.length > 0) {
            offset = document.cookie.indexOf(search);
            if (offset != -1) {
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                if (end == -1) end = document.cookie.length;
                cookieValue = unescape(document.cookie.substring(offset, end))
            }
        }
        return cookieValue;
    }
    function getSubCookie(name, subname) {
        var allcookie = getCookie(name);
        var cookieValue = "";
        var search = subname + "=";
        if (allcookie.length > 0) {
            offset = allcookie.indexOf(search);
            if (offset != -1) {
                offset += search.length;
                end = allcookie.indexOf("&", offset);
                if (end == -1) end = allcookie.length;
                cookieValue = allcookie.substring(offset, end);
            }
        }
        return cookieValue;
    }
    function setCookie(cookieName, cookieValue, DayValue) {
        var expire = "";
        var day_value = 1;
        if (DayValue != null) {
            day_value = DayValue;
        }
        expire = new Date((new Date()).getTime() + day_value * 86400000);
        expire = "; expires=" + expire.toGMTString();
        document.cookie = cookieName + "=" + escape(cookieValue) + ";path=/" + expire;
    }
    function delCookie(cookieName) {
        var expire = "";
        expire = new Date((new Date()).getTime() - 1);
        expire = "; expires=" + expire.toGMTString();
        document.cookie = cookieName + "=" + escape("") + ";path=/" + expire;
        //path=/
    }
    function divHide(obj) {
        $("#" + obj).hide();
    }
    function divShow(obj) {
        $("#" + obj).show();
    }

    //Date.prototype.isLeapYear 判断闰年
    //Date.prototype.Format 日期格式化
    //Date.prototype.DateAdd 日期计算
    //Date.prototype.DateDiff 比较日期差
    //Date.prototype.toString 日期转字符串
    //Date.prototype.toArray 日期分割为数组
    //Date.prototype.DatePart 取日期的部分信息
    //Date.prototype.MaxDayOfDate 取日期所在月的最大天数
    //Date.prototype.WeekNumOfYear 判断日期所在年的第几周
    //StringToDate 字符串转日期型
    //IsValidDate 验证日期有效性
    //CheckDateTime 完整日期时间检查
    //daysBetween 日期天数差
    //---------------------------------------------------   
    // 判断闰年   
    //---------------------------------------------------   
    Date.prototype.isLeapYear = function() {
        return (0 == this.getYear() % 4 && ((this.getYear() % 100 != 0) || (this.getYear() % 400 == 0)));
    }
    //---------------------------------------------------   
    // 日期格式化   
    // 格式 YYYY/yyyy/YY/yy 表示年份   
    // MM/M 月份   
    // W/w 星期   
    // dd/DD/d/D 日期   
    // hh/HH/h/H 时间   
    // mm/m 分钟   
    // ss/SS/s/S 秒   
    //---------------------------------------------------   
    Date.prototype.Format = function(formatStr) {
        var str = formatStr;
        var Week = ['日', '一', '二', '三', '四', '五', '六'];

        str = str.replace(/yyyy|YYYY/, this.getFullYear());
        str = str.replace(/yy|YY/, (this.getYear() % 100) > 9 ? (this.getYear() % 100).toString() : '0' + (this.getYear() % 100));

        str = str.replace(/MM/, parseInt(this.getMonth().toString()) * 1 + 1);
        str = str.replace(/M/g, parseInt(this.getMonth().toString()) * 1 + 1);

        str = str.replace(/w|W/g, Week[this.getDay()]);

        str = str.replace(/dd|DD/, this.getDate() > 9 ? this.getDate().toString() : '0' + this.getDate());
        str = str.replace(/d|D/g, this.getDate());

        str = str.replace(/hh|HH/, this.getHours() > 9 ? this.getHours().toString() : '0' + this.getHours());
        str = str.replace(/h|H/g, this.getHours());
        str = str.replace(/mm/, this.getMinutes() > 9 ? this.getMinutes().toString() : '0' + this.getMinutes());
        str = str.replace(/m/g, this.getMinutes());

        str = str.replace(/ss|SS/, this.getSeconds() > 9 ? this.getSeconds().toString() : '0' + this.getSeconds());
        str = str.replace(/s|S/g, this.getSeconds());

        return str;
    }

    //+---------------------------------------------------   
    //| 字符串转成日期类型    
    //| 格式 MM/dd/YYYY MM-dd-YYYY YYYY/MM/dd YYYY-MM-dd   
    //+---------------------------------------------------
    function StringToDate(DateStr) {

        var converted = Date.parse(DateStr);
        var myDate = new Date(converted);
        if (isNaN(myDate)) {
            //var delimCahar = DateStr.indexOf('/')!=-1?'/':'-';   
            var arys = DateStr.split('/');
            myDate = new Date(arys[0], arys[1], arys[2]);
        }
        return myDate;
    }