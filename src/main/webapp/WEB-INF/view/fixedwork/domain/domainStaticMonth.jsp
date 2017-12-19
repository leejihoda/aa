<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin For Lillian</title>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <jsp:include page="/WEB-INF/view/common/include.jsp"/>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <jsp:include page="/WEB-INF/view/common/header.jsp"/>
    <jsp:include page="/WEB-INF/view/common/menu.jsp"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>도메인 관리<small></small></h1>
            <ol class="breadcrumb">
                <li><a href="/index/page/"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="/fixedwork/domain/domainList/page/">도메인 관리</a></li>
                <li class="active"> 도메인 월별 통계</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box row-content">
                        <div class="box-header with-border">
                            <h3 class="box-title">도메인 월별 통계</h3>
                        </div>
                        <div class="box-body">
                            <div class="row row-content">
                                <div class="col-lg-2">
                                    <select class="form-control" id="viewSize">
                                        <option value="col-xs-4" selected>3개씩 보기</option>
                                        <option value="col-xs-6">2개씩 보기</option>
                                        <option value="col-xs-12">1개씩 보기</option>
                                    </select>
                                </div>
                            </div>
                            <div class="row row-content">
                                <div class="form-group col-md-2">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input class="form-control pull-right datepicker" style="background-color:#FFFFFF" id="selectMonth" readonly >
                                    </div>
                                </div>
                                <div class="col-md-1 right-sort">
                                    <button type="button" class="btn btn-info pull-right" onclick="getList()">조회</button>
                                </div>
                            </div>
                            <div class="row-content" id="divList"></div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
</div>
</body>
<script>
    $(document).ready(function () {
        //달력 기본 값
        $('#selectMonth').val(nowDate('YM','-'));
        //달력 기본 셋팅
        $('.datepicker').datepicker({
            format: 'yyyy-mm'
            , viewMode: 'months'
            , minViewMode: 'months'
            , language: 'kr'
            , autoclose: true
        });

        if($(window).width() < 800){
            $('#viewSize').val('col-xs-12');
        }
        getList();
    });

    /* 셀렉트 변경 */
    $('#viewSize').change(function() {
        $('#frameDiv > div').removeClass($('#frameDiv > div').attr('class')).addClass($('#viewSize').val()+' row-content');
    });

    $('#selectMonth').on('change',function(){
        getList();
    });

    /* 리스트 불러오기 */
    function getList(){
        var sendUrl = '/fixedwork/domain/staticMonth/'+$('#selectMonth').val();
        sendAjaxJson('GET', sendUrl, '', iframeInsert);
    }
    /* 리스트 출력 */
    function iframeInsert(res){
        var defaultMonth = $('#selectMonth').val().split('-');
        var  defaultmonthList = getMonthAllDayList(defaultMonth[0]*1,(defaultMonth[1]*1-1));
        var columns = [
            {headertext: '날짜', datafield: 'DATE', datafunc: setClickText, clickfunc: 'getStaticDetail',datafunckey: 'DOMAIN_NO,DATE_ORG'}
            , {headertext: '오전', datafield: 'AM_CNT'}
            , {headertext: '오후', datafield: 'PM_CNT'}
        ];

        var divId = 'divList';
        var html = '';
        html += '<div class="row add-line-top" id="frameDiv">';
        for(var k=0;k<res.context.length;k++){
            var value = res.context[k];
            var monthList = new Array();
            monthList = defaultmonthList;
            for(var i=0;i<monthList.length;i++){
                monthList[i].AM_CNT = '-';
                monthList[i].PM_CNT = '-';
                for(var j=0;j<value.LIST.length;j++){
                    if(monthList[i].DATE.indexOf(value.LIST[j].DATE) > -1){
                        var AM_TEXT = '성공';
                        var PM_TEXT = '성공';
                        if(value.LIST[j].AM_CNT > 0){
                            AM_TEXT = '실패'
                        }
                        if(value.LIST[j].PM_CNT > 0){
                            PM_TEXT = '실패'
                        }
                        if(value.LIST[j].AM_TOTAL === 0){
                            AM_TEXT = '-';
                        }
                        if(value.LIST[j].PM_TOTAL === 0){
                            PM_TEXT = '-';
                        }
                        monthList[i].AM_CNT = AM_TEXT;
                        monthList[i].PM_CNT = PM_TEXT;
                        monthList[i].DATE_ORG = value.LIST[j].DATE;
                        monthList[i].DOMAIN_NO = value.DOMAIN_NO;
                    }
                }
            }
            html += '<div class="'+$('#viewSize').val()+' row-content">';
            html += '   <b>'+value.DOMAIN_NM+'</b>';
            html += '   <div style="width:100%; height:500px; overflow:auto">';
            html += newTableHTML(columns, monthList, tableAttr, noneData);
            html += '   </div>';
            html += '</div>';
        }

        html += '</div>';
        $('#'+divId).html(html);
    }

    function getStaticDetail(domain_no,date){
        var sendUrl = '/fixedwork/domain/staticDay/detail/'+domain_no+'/'+date;
        sendAjaxJson('GET', sendUrl, '', statisticsPop);
    }

    /* 통계 팝업 */
    function statisticsPop(res){
        console.log(res);
        var modalTitle = res.context[0].DOMAIN_NM;
        var columns = [
            {headertext: '순번', datatype: 'count'}
            , {headertext: '성공여부', datafield: 'STATUS'}
            , {headertext: '집계시간', datafield: 'REG_DT'}
        ];

        var html = '';
        html += '<div class="modal-dialog">';
        html += '   <div class="modal-content">';
        html += '       <div class="modal-header">';
        html += '           <button type="button" class="close" data-dismiss="modal" aria-label="Close">';
        html += '               <span aria-hidden="true">&times;</span></button>';
        html += '           <h4 class="modal-title">'+modalTitle+'</h4>';
        html += '       </div>';
        html += '       <div class="modal-body">';
        html += newTableHTML(columns, res.context, tableAttr, noneData);
        html += '       </div>';
        html += '       <div class="modal-footer">';
        html += '           <button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>';
        html += '       </div>';
        html += '   </div>';
        html += '</div>';

        $('#confirmDiv').html(html);
        $('#confirmDiv').modal();
    }



</script>
</html>
