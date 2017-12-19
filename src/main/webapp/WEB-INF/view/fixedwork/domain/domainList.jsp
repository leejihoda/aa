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
                            <h3 class="box-title">도메인 설정</h3>
                        </div>
                        <div class="box-body">
                            <div class="row row-content">
                                <div class="col-md-2">
                                    <p class="data-txt"><strong><span id="total_cnt"></span></strong></p>
                                </div>
                                <div class="col-md-1 right-sort">
                                    <button type="button" class="btn btn-info pull-right" onclick="goDomainForm()">등록</button>
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
        getList();
    });

    /* 리스트 불러오기 */
    function getList(){
        var sendUrl = '/fixedwork/domain/list';
        sendAjaxJson('GET', sendUrl, '', tableInsert);
    }

    /* 리스트 출력 */
    function tableInsert(res){
        var divId = 'tableList';
        var columns = [
            {headertext: '순번', datatype: 'count'}
            , {headertext: '도메인 명', datafield: 'DOMAIN_NM', datafunc: setClickText, clickfunc: 'goDomainForm',datafunckey: 'DOMAIN_NO'}
            , {headertext: 'URL', datafield: 'URL'}
            , {headertext: '사용여부', datafield: 'USE_YN'}
            , {headertext: '등록일', datafield: 'REG_DT'}
        ];

        newTableHTML(columns, res.context, tableAttr, noneData, divId);
        $('#total_cnt').html(' 총 : '+res.total_cnt+'건');
    }

    /* 등록/수정 페이지 이동 */
    function goDomainForm(data){
        if(data !== undefined){
            $(location).attr('href','/fixedwork/domain/domainForm/page/?type=update&domain_no='+data);
        }else{
            $(location).attr('href','/fixedwork/domain/domainForm/page/?type=new');
        }
    }
</script>
</html>
