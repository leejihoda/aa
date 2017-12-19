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
                <li class="active"> 도메인 확인</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box row-content">
                        <div class="box-header with-border">
                            <h3 class="box-title">도메인 확인</h3>
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
                                <div class="col-lg-1 right-sort">
                                    <button type="button" class="btn btn-info pull-right" onclick="clickSumbit()">집계</button>
                                </div>
                            </div>
                            <div class="row row-content">
                                <div class="col-md-12">
                                    <label style="cursor:hand;"><input type="checkbox" id="checkall" class="minimal" /> 전체선택</label>
                                    <p>체크박스를 해제 후 등록 하시면 오류로 집계됩니다.</p>
                                </div>
                            </div>
                            <div class="row-content" id="iframdList"></div>
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
    /* 전체 선택 */
    $('#checkall').on('ifChecked ifUnchecked',function(event){
        if(event.type === 'ifChecked'){
            $('input[name=chk]').iCheck("check");
        }else{
            $('input[name=chk]').iCheck("uncheck");
        }
    });
    /* 체크 상태 확인 */
    $(document).on('ifChanged','input[name=chk]', function(event){
        if($('input[name=chk]').filter(':checked').length === $('input[name=chk]').length) {
            $('#checkall').prop('checked', 'checked');
        } else {
            $('#checkall').prop('checked', '');
        }
        $('#checkall').iCheck('update');
    });

    /* 셀렉트 변경 */
    $('#viewSize').change(function() {
        $('#frameDiv > div').removeClass($('#frameDiv > div').attr('class')).addClass($('#viewSize').val()+' row-content');
    });

    $(document).ready(function () {
        if($(window).width() < 800){
            $('#viewSize').val('col-xs-12');
        }
        getList();
    });

    /* 리스트 불러오기 */
    function getList(){
        var sendUrl = '/fixedwork/domain/list';
        sendAjaxJson('GET', sendUrl, '', iframeInsert);
    }
    /* 리스트 출력 */
    function iframeInsert(res){
        var divId = 'iframdList';
        var html = '';
        html += '<div class="row add-line-top" id="frameDiv">';
        $(res.context).each(function (index, value) {
            html += '<div class="'+$('#viewSize').val()+' row-content">';
            html += '<label style="cursor:hand;"><input type="checkbox" name="chk" class="minimal" value="'+value.DOMAIN_NO+'"> '+value.DOMAIN_NM+'</label>&nbsp;&nbsp;<a href="'+value.URL+'" target="_blank">'+value.URL+'</a>';
            html += '<iframe src="'+value.URL+'" width="100%" height="400" frameborder="0"></iframe>';
            html += '</div>';
        });
        html += '</div>';
        $('#'+divId).html(html);
        styleCheckRadio();
        $('#checkall').iCheck("check");
    }

    /* 집계 */
    function clickSumbit(){
        alertModal('confirm','집계 하시겠습니까?', 'save');
    }

    /* 통계 등록 */
    function save(){
        var checkList = getCheckBoxList('chk');
        var nonCheckList = getNoneCheckBoxList('chk');
        var sendUrl = '/fixedwork/domain/staticInsert';
        var data = new Object();
        data.success_list = checkList;
        data.fail_list = nonCheckList;
        sendAjaxJson('POST', sendUrl, JSON.stringify(data), function(res){
            $(location).attr('href','/fixedwork/domain/domainStaticDay/page/');
        });
    }
</script>
</html>