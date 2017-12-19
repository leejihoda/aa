<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><%-- Left Slider --%>
<aside class="main-sidebar">
    <section class="sidebar">
        <ul class="sidebar-menu">
            <li class="header"><b>고정 업무</b></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-files-o"></i> <span>도메인 관리</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/fixedwork/domain/domainList/page/"><i class="fa fa-circle-o"></i> 도메인 설정</a></li>
                    <li><a href="/fixedwork/domain/domainView/page/"><i class="fa fa-circle-o"></i> 도메인 확인</a></li>
                    <%--<li><a href="/fixedwork/domain/domainStaticDay/page/"><i class="fa fa-circle-o"></i> 도메인 일별 통계</a></li>--%>
                    <li>
                        <a href="#">
                            <i class="fa fa-circle-o"></i> 도메인 통계<span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="/fixedwork/domain/domainStaticDay/page/"><i class="fa fa-circle-o"></i> 일별 통계</a></li>
                            <li><a href="/fixedwork/domain/domainStaticMonth/page/"><i class="fa fa-circle-o"></i> 월별 통계</a></li>
                            <%--<li><a href="/fixedwork/domain/domainStaticYear/page/"><i class="fa fa-circle-o"></i> 년별 통계</a></li>--%>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>

        <%--<ul class="sidebar-menu">--%>
            <%--<li class="header"><b>STOVE 업무</b></li>--%>
            <%--<li class="treeview">--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-folder"></i> <span>ADMIN</span>--%>
                    <%--<span class="pull-right-container">--%>
                        <%--<i class="fa fa-angle-left pull-right"></i>--%>
                    <%--</span>--%>
                <%--</a>--%>
                <%--<ul class="treeview-menu">--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<i class="fa fa-circle-o"></i> 일정--%>
                            <%--<span class="pull-right-container">--%>
                                <%--<i class="fa fa-angle-left pull-right"></i>--%>
                            <%--</span>--%>
                        <%--</a>--%>
                        <%--<ul class="treeview-menu">--%>
                            <%--<li><a href="/worklist/workInput/page/"><i class="fa fa-circle-o"></i> 일정 입력</a></li>--%>
                            <%--<li><a href="/worklist/worklist/page/"><i class="fa fa-circle-o"></i> 일정 관리</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
            <%--<li class="treeview">--%>
                <%--<a href="#">--%>
                    <%--<i class="fa fa-folder"></i> <span>PARTNERS</span>--%>
                    <%--<span class="pull-right-container">--%>
                        <%--<i class="fa fa-angle-left pull-right"></i>--%>
                    <%--</span>--%>
                <%--</a>--%>
                <%--<ul class="treeview-menu">--%>
                    <%--<li>--%>
                        <%--<a href="#">--%>
                            <%--<i class="fa fa-circle-o"></i> Level One--%>
                            <%--<span class="pull-right-container">--%>
                                <%--<i class="fa fa-angle-left pull-right"></i>--%>
                            <%--</span>--%>
                        <%--</a>--%>
                        <%--<ul class="treeview-menu">--%>
                            <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>--%>
                            <%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>--%>
                        <%--</ul>--%>
                    <%--</li>--%>
                <%--</ul>--%>
            <%--</li>--%>
        <%--</ul>--%>
    </section>
</aside>
<script>
    $(document).ready(function () {
        //All left-menu active class remove
        $('aside[class~=main-sidebar]  li').removeClass('active');

        //isPage active class add
        var path = location.pathname;
        path = path.replace('Form','List');
        $('aside[class~=main-sidebar]  li a').each(function() {
            if($(this).attr('href') === path){
                //depth 1
                $(this).parent().addClass('active');
                //depth 2
                if( $(this).parent().parent().attr("class") === 'treeview-menu'){
                    $(this).parent().parent().parent().addClass('active');
                }
                //depth 3
                if( $(this).parent().parent().parent().parent().attr("class") === 'treeview-menu'){
                    $(this).parent().parent().parent().parent().parent().addClass('active');
                }
                //depth 4
                if( $(this).parent().parent().parent().parent().parent().parent().attr("class") === 'treeview-menu'){
                    $(this).parent().parent().parent().parent().parent().parent().parent().addClass('active');
                }
            }
        });


    });
</script>