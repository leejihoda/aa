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
<body>
<div class="wrapper">
    <jsp:include page="/WEB-INF/view/common/header.jsp"/>
    <jsp:include page="/WEB-INF/view/common/menu.jsp"/>
    <div class="content-wrapper">
        <section class="content-header">
            <h1>도메인 관리<small></small></h1>
            <ol class="breadcrumb">
                <li><a href="/index/page/"><i class="fa fa-dashboard"></i> Home</a></li>
                <li><a href="/fixedwork/domain/domainList/page/">도메인 관리</a></li>
                <li class="active"> 도메인 일별 통계</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box row-content">
                        <div class="box-header with-border">
                            <h3 class="box-title">도메인 일별 통계</h3>
                        </div>
                        <div class="box-body">
                            <div class="row row-content">
                                <div class="form-group col-md-2">
                                    <div class="input-group date">
                                        <div class="input-group-addon">
                                            <i class="fa fa-calendar"></i>
                                        </div>
                                        <input type="text" class="form-control pull-right datepicker" style="background-color:#FFFFFF" id="selectDay" readonly >
                                    </div>
                                </div>
                                <div class="col-md-1 right-sort">
                                    <button type="button" class="btn btn-info pull-right" onclick="getList()">조회</button>
                                </div>
                            </div>
                            <div class="row row-content">
                                <div id="tableList"></div>
                            </div>
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
        $('#selectDay').val(nowDate('YMD','-'));
        //달력 기본 셋팅
        $('.datepicker').datepicker({
            format: 'yyyy-mm-dd'
            , language: 'kr'
            , autoclose: true
        });
        getList();
    });

    $('#selectDay').on('change',function(){
        getList();
    });

    /* 리스트 불러오기 */
    function getList(){
        var sendUrl = '/fixedwork/domain/staticDay/'+$('#selectDay').val();
        sendAjaxJson('GET', sendUrl, '', tableInsert);
    }

    /* 리스트 출력 */
    function tableInsert(res){
        var divId = 'tableList';
        var columns = [
            {headertext: '순번', datatype: 'count'}
            , {headertext: '도메인 명', datafield: 'DOMAIN_NM', datafunc: setClickText, clickfunc: 'getStaticDetail',datafunckey: 'DOMAIN_NO'}
            , {headertext: '오전(AM) 성공', datafield: 'AM_SUCCESS_CNT', datafunc: setCntColor,datafunckey: 'AM_SUCCESS_CNT'}
            , {headertext: '오전(AM) 실패', datafield: 'AM_FAIL_CNT', datafunc: setCntColor,datafunckey: 'AM_FAIL_CNT'}
            , {headertext: '오후(PM) 성공', datafield: 'PM_SUCCESS_CNT', datafunc: setCntColor,datafunckey: 'PM_SUCCESS_CNT'}
            , {headertext: '오후(PM) 실패', datafield: 'PM_FAIL_CNT', datafunc: setCntColor,datafunckey: 'PM_FAIL_CNT'}
        ];
        newTableHTML(columns, res.context, tableAttr, noneData, divId);
    }

    function getStaticDetail(domain_no){
        var sendUrl = '/fixedwork/domain/staticDay/detail/'+domain_no+'/'+$('#selectDay').val();
        sendAjaxJson('GET', sendUrl, '', statisticsPop);
    }

    /* 통계 팝업 */
    function statisticsPop(res){
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
