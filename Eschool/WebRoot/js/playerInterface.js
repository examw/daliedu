var playervars = new Object();
var flex = new Object();

/* 存储讲义监听函数 */
var kanjiangyi = [];
/* 存储作业监听函数 */
var zuozuoye = [];
/* 存储提问题监听函数 */
var questions = [];
/* 存储学习点监听函数 */
var studypoint = [];
/* 存储下载监听函数 */
var download = [];
/* 存储直播答疑监听函数 */
var zhibodayi = [];
/* 存储题库监听函数 */
var tikutiku = [];
/* 存储写评价监听函数 */
var xiepingjia = [];
/* 存储初始化完成监听函数 */
var playercomplete = [];

/**
* 播放器读取相关参数（调用该方法不论先后顺序）
* 
* @param oid
*            是播放器对象id，类型为String。用来区别不同的播放器和参数
* @author Wei Chou
*/
function getPlayerVars(oid) {
    flex[oid] = document.getElementById(oid);
    if (playervars[oid]["boo"]) {	//boo标志基本参数是否已就绪
        flex[oid].setPlayerVars(playervars[oid]["obj"]);
        playervars[oid]["boo"] = false;
    }
}

/**
* 播放器回调函数，给播放器设置相关参数（调用该方法不论先后顺序）
* 
* @param oid
*            是播放器对象id，类型为String。这里是用来区分同一页面里有多个播放器的情况，而要设置的参数可能各不相同
* @param obj
*            类型是Object
* @author Wei Chou
*/
function setPlayerVars(oid, obj) {
    if (!playervars[oid]) playervars[oid] = new Object();

    playervars[oid]["obj"] = obj;
    if (flex[oid]) {
        flex[oid].setPlayerVars(playervars[oid]["obj"]);
    } else {
        playervars[oid]["boo"] = true;
    }
}

/**
* 看讲义与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @param sec
*            当前播放进度，单位为秒
* @author Wei Chou
*/
function playerKanJiangYi(oid, sec) {
    for (var i = 0; i < kanjiangyi.length; i++) {
        if (kanjiangyi[i])
            kanjiangyi[i](oid, sec);
    }
}
/**
* 看讲义事件监听器
* 
* @param func
*            js回调函数。应该有两个参数(oid, sec)
* @author Wei Chou
*/
function onJiangYi(func) {
    kanjiangyi.push(func);
}

////////////////////////////////////////
/**
* 做作业与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @param relateID
*            当前讲的id
* @author Wei Chou
*/
function playerZuoZuoYe(oid, relateID) {
    for (var i = 0; i < zuozuoye.length; i++) {
        if (zuozuoye[i])
            zuozuoye[i](oid, relateID);
    }
}
/**
* 做作业事件监听器
* 
* @param func
*            js回调函数。应该有两个参数(oid, relateID)
* @author Wei Chou
*/
function onZuoYe(func) {
    zuozuoye.push(func);
}

/**
* 提问题事件
*/
function playerQuestions(oid) {
    for (var i = 0; i < questions.length; i++) {
        if (questions[i])
            questions[i](oid);
    }
}
/**
* 提问题事件监听器
* @param func
* @return
*/
function onQuestions(func) {
    questions.push(func);
}
////////////////////////////////////////
/**
* 学习点与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @param obj
*            学习点数据e.g:{RelateID:1234567,PartNum:123,MarkTime:123.456,Title:"本节讲什么"}
* @author Wei Chou
*/
function playerStudyPoint(oid, obj) {
    for (var i = 0; i < studypoint.length; i++) {
        if (studypoint[i])
            studypoint[i](oid, obj);
    }
}
/**
* 学习点事件监听器
* 
* @param func
*            js回调函数。应该有两个参数(oid, obj)
* @author Wei Chou
*/
function onStudyPoint(func) {
    studypoint.push(func);
}

/**
* 下载与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @param type
*            要下载的类型"vedio"/"document"
* @author Wei Chou
*/
function playerDownLoad(oid, type) {
    for (var i = 0; i < download.length; i++) {
        if (download[i])
            download[i](oid, type);
    }
}
/**
* 下载事件监听器
* 
* @param func
*            js回调函数。应该有两个参数(oid, type)
* @author Wei Chou
*/
function onDownLoad(func) {
    download.push(func);
}

/**
* 直播答疑与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @author Wei Chou
*/
function playerZhiBoDaYi(oid) {
    for (var i = 0; i < zhibodayi.length; i++) {
        if (zhibodayi[i])
            zhibodayi[i](oid);
    }
}
/**
* 直播答疑事件监听器
* 
* @param func
*            js回调函数。应该有一个参数(oid)
* @author Wei Chou
*/
function onZhiBoDaYi(func) {
    zhibodayi.push(func);
}

/**
* 题库与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @author Wei Chou
*/
function playerTiKu(oid) {
    for (var i = 0; i < tikutiku.length; i++) {
        if (tikutiku[i])
            tikutiku[i](oid);
    }
}
/**
* 题库事件监听器
* 
* @param func
*            js回调函数。应该有一个参数(oid)
* @author Wei Chou
*/
function onTiKu(func) {
    tikutiku.push(func);
}

/**
* 写评价与页面交互接口（由flex调用）
* 
* @param oid
*            是播放器对象id，类型为String
* @author Wei Chou
*/
function playerXiePingJia(oid) {
    for (var i = 0; i < xiepingjia.length; i++) {
        if (xiepingjia[i])
            xiepingjia[i](oid);
    }
}
/**
* 写评价事件监听器
* 
* @param func
*            js回调函数。应该有一个参数(oid)
* @author Wei Chou
*/
function onXiePingJia(func) {
    xiepingjia.push(func);
}

/**
* player准备就绪
* @param oid
* @return
*/
function playerInitComplete(oid) {
    getPlayerSets(oid);
    for (var i = 0; i < playercomplete.length; i++) {
        if (playercomplete[i])
            playercomplete[i](oid);
    }
}
/**
* player初始化完成事件监听器
* @param func
*/
function onInitComplete(func) {
    playercomplete.push(func);
}

/**
* 设置哪些按钮启用或不启用
* @param oid 播放器对象id，类型为String
* @param str 字符串，按钮的名字
* @param boo 启用或不启用
*/
function setButtonEnabled(oid, str, boo) {
    if (!playervars[oid]) playervars[oid] = {};
    if (!playervars[oid]['buttonEnabled']) playervars[oid]['buttonEnabled'] = {};
    playervars[oid]['buttonEnabled']['string'] = str;
    playervars[oid]['buttonEnabled']['enable'] = boo;
    if (flex[oid]) {
        flex[oid].setButtonEnabled(playervars[oid]['buttonEnabled']['string'],
				playervars[oid]['buttonEnabled']['enable']);
    } else {
        playervars[oid]['buttonEnabled']['boo'] = true; //参数就绪
    }
}

/**
* 显示或隐藏菜单条
* @param oid
* @param show true/false
*/
function setMenubarShow(oid, show) {
    if (!playervars[oid]) playervars[oid] = {};
    if (!playervars[oid]['menubarShow']) playervars[oid]['menubarShow'] = {};
    playervars[oid]['menubarShow']['show'] = show;
    if (flex[oid]) {
        flex[oid].setMenubarShow(playervars[oid]['menubarShow']['show']);
    } else {
        playervars[oid]['menubarShow']['boo'] = true; //参数就绪
    }
}

/**
* 由于执行顺序的原因，该方法的执行不能放在getPlayerVars()里，
* 而应该放在playerInitComplete()方法里
* @param oid
*/
function getPlayerSets(oid) {
    if (!flex[oid]) return;
    if (playervars[oid]['buttonEnabled'] && playervars[oid]['buttonEnabled']['boo']) {
        flex[oid].setButtonEnabled(playervars[oid]['buttonEnabled']['string'],
				playervars[oid]['buttonEnabled']['enable']);
        playervars[oid]['buttonEnabled']['boo'] = false;
    }
    if (playervars[oid]['menubarShow'] && playervars[oid]['menubarShow']['boo']) {
        flex[oid].setMenubarShow(playervars[oid]['menubarShow']['show']);
        playervars[oid]['menubarShow']['boo'] = false;
    }
}




/**大屏播放器相关**/
//设置播放器标识，传递参数
(function(){
   /* var nextRel = getNextRelate();
    var prevRel = getPrevRelate();*/
    setPlayerVars(playerid, {
       /* userID: getUserID(),
        relateID: getRelateID(),
        prevRelate: prevRel ? prevRel.title : "",
        nextRelate: nextRel ? nextRel.title : "",
        prevRelateURL: prevRel ? prevRel.url : "",
        nextRelateURL: nextRel ? nextRel.url : "",
        webserviceURL: appUrl+"/player/HdvInterface.asmx?wsdl",
        questionLinkURL: questionUrl.substring(0, questionUrl.indexOf("add.aspx")) + "question_show.aspx",
        zhiBoDaYiURL:"http://ask.edu24ol.com/ask.asp",
        tiKuURL:"http://"+location.host+"/exam/",
        xiePingJiaURL:$("#hlkEvaluate").attr("href"),
        mp3DownloadLink:$("#hlkMediaDown").attr("href"),
        pdfDownloadLink:$("#hlkNoteDown").attr("href"),*/
        partsData:partArray
    });
})();

//知识点改变事件
onStudyPoint(function (oid, obj) {
    currentPartId = obj.id;
    onPartChange();
});
//初始化完成
onInitComplete(function (oid) {
    
});

//看讲义
onJiangYi(function (oid, sec) {
    showNote();
});
//提问题
onQuestions(function (oid) {
    
});
//做作业
onZuoYe(function (oid, relateID) {
    showExercise();
});
//下载
onDownLoad(function (oid, type) {
//    if (type == "document") {
//        $("#hlkNoteDown").click();
//    } else {
//        $("#hlkMediaDown").click();
//    }
});
//直播答疑
onZhiBoDaYi(function (oid) {
    //window.open("http://ask.edu24ol.com/ask.asp");
});
//题库
onTiKu(function (oid) {
    //window.open("http://www.edu24ol.com/exam/");
});
//写评价
onXiePingJia(function (oid) {
//    if (getUserID() != 0) {
//        $("#hlkEvaluate").click();
//    }
});