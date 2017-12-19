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
                <li class="active"> 도메인 설정</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box row-content">
                        <div class="box-header with-border">
                            <h3 class="box-title"><sapn id="form_title"></sapn></h3>
                        </div>
                        <div class="box-body">
                            <div class="row row-content">
                                <div class="tab-pane" id="settings">
                                    <form class="form-horizontal">
                                        <div class="form-group">
                                            <label for="DOMAIN_NM" class="col-md-2 control-label text-xs-center">도메인 명</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" id="DOMAIN_NM" placeholder="20자이내로 입력하세요." maxlength="20">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="URL" class="col-md-2 control-label text-xs-center">URL</label>
                                            <div class="col-md-10">
                                                <input type="text" class="form-control" id="URL" placeholder="http(s)를 포함하여 입력하세요." maxlength="200">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-md-2 control-label text-xs-center">사용여부</label>
                                            <div class="col-md-10">
                                                <label style="cursor:hand;"><input type="radio" name="USE_YN" class="minimal" value="Y"> ON </label>
                                                &nbsp;&nbsp;
                                                <label style="cursor:hand;"><input type="radio" name="USE_YN" class="minimal" value="N"> OFF </label>
                                            </div>
                                        </div>
                                        <div class="form-group text-xs-center">
                                            <div class="col-md-12">
                                                <button type="button" class="btn btn-danger" id="btn_submit" disabled><sapn id="form_sumbmit"></sapn></button>
                                                <button type="button" class="btn btn-default" id="btn_list">목록</button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
    <input type="hidden" id="type" value="${type}" />
    <input type="hidden" id="domain_no" value="${domain_no}" />
</div>
</body>
<script>
    var type;
    $(document).ready(function () {
        init();
        btnStatus('btn_submit');
    });

    /* 등록/수정 */
    $('#btn_submit').on('click',function () {
        alertModal('confirm',$('#form_sumbmit').text()+'하시겠습니까?', 'save');
    });
    /* Modal View */
    $('#btn_list').on('click',function () {
        alertModal('confirm','목록으로 돌아가시겠습니까?', 'goList');
    });
    /* 목록 이동 */
    function goList() {
        $(location).attr('href','/fixedwork/domain/domainList/page/');
    }

    /* 텍스트 변경 */
    function init(){
        type = $('#type').val();
        if(type === 'new'){
            $('#form_title').html('도메인 등록');
            $('#form_sumbmit').html('등록');
            $('input:radio[name=USE_YN]:input[value=Y]').attr("checked",true);
            styleCheckRadio();
        }else if(type === 'update'){
            $('#form_title').html('도메인 수정');
            $('#form_sumbmit').html('수정');
            getDetail();
        }
    }

    /* 상세 정보 */
    function getDetail(){
        var sendUrl = '/fixedwork/domain/detail/'+$('#domain_no').val();
        sendAjaxJson('GET', sendUrl, '', detailData);
    }
    function detailData(res) {
        var data = res.context;
        $('#DOMAIN_NM').val(data.DOMAIN_NM);
        $('#URL').val(data.URL);
        $('input:radio[name=USE_YN]:input[value='+data.USE_YN+']').attr("checked",true);
        styleCheckRadio();
    }

    /* 등록/수정 */
    function save(){
        if(validation()){
            var sendUrl;
            var method;
            var data = {
                domain_nm : $('#DOMAIN_NM').val()
                , url : $('#URL').val()
                , use_yn : $('input:radio[name=USE_YN]:checked').val()
            };
            if(type === 'new'){
                sendUrl = '/fixedwork/domain/insert';
                method = 'POST';
            }else if(type === 'update'){
                data.domain_no = $('#domain_no').val();
                sendUrl = '/fixedwork/domain/update';
                method = 'PUT';
            }
            sendAjaxJson(method, sendUrl, JSON.stringify(data), goList);
        }
    }

    /* 유효성 체크 */
    function validation(){
        /* 타이틀 체크 */
        if($('#DOMAIN_NM').val().length < 1 || $('#DOMAIN_NM').val().length > 20){
            alertModal('alert','도메인 명을 20자 이내로 입력해 주세요.');
            return false;
        }
        /* URL 체크 */
        var urlcheck=/^((http(s?))\:\/\/)([0-9a-zA-Z\-]+\.)+[a-zA-Z]{2,6}(\:[0-9]+)?(\/\S*)?$/;
        if( !urlcheck.test( $('#URL').val()  ) ){
            alertModal('alert','http(s)를 포함하여 URL형식으로 입력해 주세요.');
            return false;
        }
        return true;
    }

</script>
</html>
