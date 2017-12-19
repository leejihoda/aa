<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/WEB-INF/view/common/include.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin For Lillian</title>
    <meta http-equiv="Content-type" content="text/html;charset=UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
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
                <li class="active"> 도메인 설정</li>
            </ol>
        </section>
        <section class="content">
            <div class="row">
                <div class="col-xs-12">
                    <div class="box row-content">
                        <div class="box-header">
                            <h3 class="box-title">도메인 설정</h3>
                        </div>
                        <div class="box-body">
                            <div class="row row-content">
                                <div class="col-sm-11">
                                    <p class="data-txt"><strong><span id="total_cnt"></span></strong></p>
                                </div>
                                <div class="col-sm-1 text-xs-right">
                                    <button type="button" class="btn btn-block btn-info" onclick="goDomainForm()">등록</button>
                                </div>
                                <%--<div class="box-tools">--%>
                                    <%--<div class="input-group input-group-sm" style="width: 300px;">--%>
                                        <%--<input type="text" name="table_search" class="form-control pull-right" placeholder="검색">--%>
                                        <%--<div class="input-group-btn">--%>
                                            <%--<button type="submit" class="btn btn-default"><i class="fa fa-search"></i></button>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</div>--%>
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

    function getList(){
        var sendUrl = '/fixedwork/domain/list';
        sendAjaxJson('GET', sendUrl, '', tableInsert);
    }

    function tableInsert(res){
        var divId = 'tableList';
        var columns = [
            {headertext: '순번', datatype: 'count'}
            , {headertext: '도메인 명', datafield: 'TITLE', datatype: 'onclick', typefunction: 'goDomainForm', functionkey: 'DOMAIN_NO'}
            , {headertext: 'URL', datafield: 'URL', datatype: 'string'}
            , {headertext: '사용여부', datafield: 'USE_YN', datatype: 'on/off'}
            , {headertext: '등록일', datafield: 'REG_DT', datatype: 'string'}
        ];
        var addAttr = {
            tableAttr: 'class="table table-bordered table-hover table-striped" style="text-align: center;"'
        };
        newTableHTML(columns, res.context, addAttr, '', divId);
        $('#total_cnt').html(' 총 : '+res.TOTAL_CNT+'건');
    }

    function goDomainForm(data){
        if(data != undefined){
            location.href='/fixedwork/domain/domainForm/page/?type=update&domain_no='+data;
        }else{

            location.href='/fixedwork/domain/domainForm/page/?type=new';
        }
    }
</script>
</html>
