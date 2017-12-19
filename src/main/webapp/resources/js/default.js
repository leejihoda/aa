/**
 *  TableList Add Data
 * @param colums        col별 thead 데이터
 * @param data          select 데이터
 * @param noDataString  데이터가 없을시 문구
 * @param divId         추가될 div
 * @param classAdd      table에 추가될 공통 class 및 css (table, thead, tbody, tfoot, tr)
 */
function newTableHTML(columns, data, tableAddAttr, noneData, divId){
    //column 디폴트값
    var defaultColumns = {
        headertext : 'thead'            // thead에 들어갈 값 (*)
        , datafield : 'string'          // thead와 매칭 될 data 컬럼 값 (*)
        , ishidden : false             // 해당 컬럼을 숨길 꺼면 true
        , datatype : 'string'           // 데이터 타입(string, count : 순번)
        , datanone : ''                 // 데이터가 없을 경우 string
        , datafunc : null              // 데이터를 가공할 function
        , clickfunc : null             // 이벤트가 발생할 function
        , datafunckey : null           // 데이터 key
        , addAttr : ''                  // td add attr
    };
    //classAdd 디폴트값
    var defaultTableAttr = {
        tableAttr: ''          // table add attr
        , theadAttr: ''        // thead add attr
        , tbodyAttr: ''        // tbody add attr
        , tfootAttr: ''        // tfoot add attr
        , trAttr: ''           // tr add attr
    };
    //noneData 디폴트값
    var defaultNoneData = {
        string: ''              // 데이터가 없을 때 string
        , addAttr: ''           // add attr
    };

    //columns 값 재셋팅
    var setColumns = new Array();
    if(columns.length > 0){
        $(columns).each(function (key, value) {
            setColumns.push($.extend({}, defaultColumns, this));
        });
    }else{
        setColumns = new Array();
    }

    //classAdd 값 재셋팅
    var setAttr = new Object();
    if(tableAddAttr) {
        setAttr = $.extend({}, defaultTableAttr, tableAddAttr);
    }else{
        setAttr = defaultTableAttr;
    }

    //noneData 값 재셋팅
    var setNonData = new Object();
    if(noneData) {
        setNonData = $.extend({}, defaultNoneData, noneData);
    }else{
        setNonData = defaultNoneData;
    }

    //테이블 html 생성성
    var result = '';
    result += '<table '+setAttr.tableAttr+'>';
    result += '<thead '+setAttr.theadAttr+'>';
    result += '<tr '+setAttr.trAttr+'>';
    //thead 생성
    $(setColumns).each(function (key, value) {
        if (!this.ishidden) {
            if(this.addAttr !== ''){
                result += '<th '+this.addAttr+'>';
            }else{
                result += '<th style="text-align:center;">';
            }
            result += this.headertext;
            result += '</th>';
        }
    });
    result += '</tr>';
    result += '</thead>';

    //tbody 생성
    result += '<tbody '+setAttr.tbodyAttr+'>';
    if(data && data.length > 0) {
        $(data).each(function (index, value) {
            result += '<tr '+setAttr.trAttr+'>';
            $(setColumns).each(function () {
                result += '<td>';
                if (this.datatype === 'count') {
                    result += index+1;
                }else if (value.hasOwnProperty(this.datafield)) {
                    if (!this.ishidden) {
                        var content = value[this.datafield];
                        //content가 없을 경우
                        if(content.length === 0){
                            content = this.datanone;
                        }
                        //function이 있을 경우(가공)
                        if (this.datafunc  !== null) {
                            if (this.clickfunc  !== null) {
                                if(this.datafunckey !== null){
                                    content = this.datafunc(value,content,this.clickfunc,this.datafunckey);
                                }else{
                                    content = this.datafunc(value,content,this.clickfunc);
                                }
                            }else{
                                if(this.datafunckey !== null){
                                    content = this.datafunc(value,content,this.datafunckey);
                                }else{
                                    content = this.datafunc(value,content);
                                }
                            }
                        }
                        result += content;
                    }
                }
                result += '</td>';
            });
            result += "</tr>";
        });
    }else{
        result += '<tr '+setAttr.trAttr+'>';
        result += '<td colspan="'+setColumns.length+'" '+setNonData.addAttr+'>';
        result += setNonData.string;
        result += '</td>';
        result += '</tr>';
    }
    result += '</tbody>';
    result += '</table>';

    if(divId !== undefined && divId !== null && divId !== ""){
        $('#'+divId).html(result);
    }else{
        return result;
    }
}

var ajax_yn = true;
/**
 * AJAX 호출1
 * @param Method
 * @param Url
 * @param Data
 * @param callback
 */
function sendAjaxJson(Method, Url, Data, callback){
    if(ajax_yn){
        ajax_yn = false;
        $.ajax({
            type: Method
            , url: Url
            , data: Data
            , contentType: "application/json"
            , success: function (res) {
                ajax_yn = true;
                if(res.result === 200){
                    callback(res);
                }else{
                    alertModal('alert',res.return_message);
                }
            }
        });
    }
}

/**
 * AJAX 호출2
 * @param Method
 * @param Url
 * @param Data
 * @param callback
 */
function sendAjaxJsonNosync(Method, Url, Data, callback){
    $.ajax({
        type: Method
        , url: Url
        , data: Data
        , contentType: "application/json"
        , success: function (res) {
            callback(res);
        }
    });
}

/**
 * 현재 날짜
 * @param data
 * @param formet
 * @returns {string}
 */
function nowDate(data,formet){
    var nowDate = new Date();
    var returnDate = '';
    if(data.indexOf('Y') > -1){
        returnDate += nowDate.getFullYear() + formet;
    }
    if(data.indexOf('M') > -1){
        returnDate += addzero(eval( nowDate.getMonth()+1 )) + formet;
    }
    if(data.indexOf('D') > -1){
        returnDate += addzero(nowDate.getDate()) + formet;
    }
    if(formet.length > 0){
        returnDate = returnDate.substr(0,returnDate.length-1);
    }
    return returnDate;
}

/**
 * 현재 시간
 * @param data
 * @param formet
 * @returns {string}
 */
function nowTime(data,formet){
    var nowDate = new Date();
    var returnTime = '';
    if(data.indexOf('H') > -1){
        returnTime += nowDate.getHours() + formet;
    }
    if(data.indexOf('M') > -1){
        returnTime += addzero(nowDate.getMinutes()) + formet;
    }
    if(data.indexOf('S') > -1){
        returnTime += addzero(nowDate.getSeconds()) + formet;
    }
    if(formet.length > 0){
        returnTime = returnTime.substr(0,returnTime.length-1);
    }
    return returnTime;
}

function addzero(n) {
    return n < 10 ? '0' + n : n;
}

/**
 * 해당 월의 모든 날짜 LIST
 */
function getMonthAllDayList(currentYear , currentMonth){
    var dateString = new Array('(일)', '(월)', '(화)', '(수)', '(목)', '(금)', '(토)');
    var startDayOfMay = new Date(currentYear, currentMonth, 1);
    var startDay = startDayOfMay.getDay();
    var endDayOfMay = new Date(currentYear, currentMonth+1, 0);
    var endDate = endDayOfMay.getDate();

    var returnList = new Array();

    for(var i=0; i<endDate; i++){
        if(startDay === 7){
            startDay = 0;
        }
        var obj = new Object();
        obj.DATE = currentYear+'-'+addzero(currentMonth+1)+'-'+addzero(i+1)+dateString[startDay];
        returnList.push(obj);
        startDay++;
    }
    return returnList;
}