<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin For Lillian | 404 Page not found</title>
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
            <h1>404 Error Page</h1>
            <ol class="breadcrumb">
                <li><a href="/index/page/"><i class="fa fa-dashboard"></i> Home</a></li>
                <li>Error</li>
                <li class="active"> 404 error</li>
            </ol>
        </section>
        <section class="content">
            <div class="error-page">
                <h2 class="headline text-yellow"> 404</h2>
                <br>
                <div class="error-content">
                    <h3><i class="fa fa-warning text-yellow"></i> Oops! Page not found.</h3>
                    <p>
                        We could not find the page you were looking for.
                        Meanwhile, you may <a href="/index/page/">return to dashboard</a> or try using the search form.
                    </p>
                </div>
            </div>
        </section>
    </div>
    <jsp:include page="/WEB-INF/view/common/footer.jsp"/>
</div>
</body>
</html>
