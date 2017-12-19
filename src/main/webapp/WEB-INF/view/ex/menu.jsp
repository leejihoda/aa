<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %><%-- Left Slider --%>
<aside class="main-sidebar">
    <%-- sidebar: style can be found in sidebar.less --%>
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
                    <li><a href="/fixedwork/domain/domainStatic/page/"><i class="fa fa-circle-o"></i> 통계</a></li>
                </ul>
            </li>
        </ul>
        <ul class="sidebar-menu">
            <li class="header"><b>STOVE 업무</b></li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>ADMIN</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="#">
                            <i class="fa fa-circle-o"></i> Level One
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-folder"></i> <span>PARTNERS</span>
                    <span class="pull-right-container">
                        <i class="fa fa-angle-left pull-right"></i>
                    </span>
                </a>
                <ul class="treeview-menu">
                    <li>
                        <a href="#">
                            <i class="fa fa-circle-o"></i> Level One
                            <span class="pull-right-container">
                                <i class="fa fa-angle-left pull-right"></i>
                            </span>
                        </a>
                        <ul class="treeview-menu">
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                            <li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
        </ul>
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

<%-- Left Example--%>
<%-- User Info --%>
<%--<div class="user-panel">--%>
<%--<div class="pull-left image">--%>
<%--<img src="/resources/common/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">--%>
<%--</div>--%>
<%--<div class="pull-left info">--%>
<%--<p>Alexander Pierce</p>--%>
<%--<a href="#"><i class="fa fa-circle text-success"></i> Online</a>--%>
<%--</div>--%>
<%--</div>--%>


<%-- Search form --%>
<%--<form action="#" method="get" class="sidebar-form">--%>
<%--<div class="input-group">--%>
<%--<input type="text" name="q" class="form-control" placeholder="Search...">--%>
<%--<span class="input-group-btn">--%>
<%--<button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--%>
<%--</button>--%>
<%--</span>--%>
<%--</div>--%>
<%--</form>--%>
<%-- /.search form --%>
<%-- sidebar menu: : style can be found in sidebar.less --%>


<%-- One Depth --%>
<%--<li><a href="documentation/index.html"><i class="fa fa-book"></i> <span>Documentation</span></a></li>--%>


<%-- Label One Depth --%>
<%--<li class="header">LABELS</li>--%>
<%--<li><a href="#"><i class="fa fa-circle-o text-red"></i> <span>Important</span></a></li>--%>
<%--<li><a href="#"><i class="fa fa-circle-o text-yellow"></i> <span>Warning</span></a></li>--%>
<%--<li><a href="#"><i class="fa fa-circle-o text-aqua"></i> <span>Information</span></a></li>--%>


<%-- Two Depth--%>
<%--<li class="treeview">--%>
<%--<a href="#">--%>
<%--<i class="fa fa-folder"></i> <span>Examples</span>--%>
<%--<span class="pull-right-container">--%>
<%--<i class="fa fa-angle-left pull-right"></i>--%>
<%--</span>--%>
<%--</a>--%>
<%--<ul class="treeview-menu">--%>
<%--<li><a href="pages/examples/invoice.html"><i class="fa fa-circle-o"></i> Invoice</a></li>--%>
<%--<li><a href="pages/examples/profile.html"><i class="fa fa-circle-o"></i> Profile</a></li>--%>
<%--<li><a href="pages/examples/login.html"><i class="fa fa-circle-o"></i> Login</a></li>--%>
<%--<li><a href="pages/examples/register.html"><i class="fa fa-circle-o"></i> Register</a></li>--%>
<%--<li><a href="pages/examples/lockscreen.html"><i class="fa fa-circle-o"></i> Lockscreen</a></li>--%>
<%--<li><a href="pages/examples/404.html"><i class="fa fa-circle-o"></i> 404 Error</a></li>--%>
<%--<li><a href="pages/examples/500.html"><i class="fa fa-circle-o"></i> 500 Error</a></li>--%>
<%--<li><a href="pages/examples/blank.html"><i class="fa fa-circle-o"></i> Blank Page</a></li>--%>
<%--<li><a href="pages/examples/pace.html"><i class="fa fa-circle-o"></i> Pace Page</a></li>--%>
<%--</ul>--%>
<%--</li>--%>


<%-- Multi Depth--%>.
<%--<li class="treeview">--%>
<%--<a href="#">--%>
<%--<i class="fa fa-share"></i> <span>Multilevel</span>--%>
<%--<span class="pull-right-container">--%>
<%--<i class="fa fa-angle-left pull-right"></i>--%>
<%--</span>--%>
<%--</a>--%>
<%--<ul class="treeview-menu">--%>
<%--<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>--%>
<%--<li>--%>
<%--<a href="#"><i class="fa fa-circle-o"></i> Level One--%>
<%--<span class="pull-right-container">--%>
<%--<i class="fa fa-angle-left pull-right"></i>--%>
<%--</span>--%>
<%--</a>--%>
<%--<ul class="treeview-menu">--%>
<%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Two</a></li>--%>
<%--<li>--%>
<%--<a href="#"><i class="fa fa-circle-o"></i> Level Two--%>
<%--<span class="pull-right-container">--%>
<%--<i class="fa fa-angle-left pull-right"></i>--%>
<%--</span>--%>
<%--</a>--%>
<%--<ul class="treeview-menu">--%>
<%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>--%>
<%--<li><a href="#"><i class="fa fa-circle-o"></i> Level Three</a></li>--%>
<%--</ul>--%>
<%--</li>--%>
<%--</ul>--%>
<%--</li>--%>
<%--<li><a href="#"><i class="fa fa-circle-o"></i> Level One</a></li>--%>
<%--</ul>--%>
<%--</li>--%>

<%-- Icon add -->
<%--<li>--%>
<%--<a href="pages/mailbox/mailbox.html">--%>
<%--<i class="fa fa-envelope"></i> <span>Mailbox</span>--%>
<%--<span class="pull-right-container">--%>
<%--<small class="label pull-right bg-yellow">12</small>--%>
<%--<small class="label pull-right bg-green">16</small>--%>
<%--<small class="label pull-right bg-red">5</small>--%>
<%--<small class="label pull-right bg-green">new</small>--%>
<%--</span>--%>
<%--</a>--%>
<%--</li>--%>




<%-- Right Sidebar --%>
<%--<aside class="control-sidebar control-sidebar-dark">--%>
    <%--&lt;%&ndash; Create the tabs &ndash;%&gt;--%>
    <%--<ul class="nav nav-tabs nav-justified control-sidebar-tabs">--%>
        <%--<li><a href="#control-sidebar-home-tab" data-toggle="tab"><i class="fa fa-home"></i></a></li>--%>
        <%--<li><a href="#control-sidebar-settings-tab" data-toggle="tab"><i class="fa fa-gears"></i></a></li>--%>
    <%--</ul>--%>
    <%--&lt;%&ndash; Tab panes &ndash;%&gt;--%>
    <%--<div class="tab-content">--%>
        <%--&lt;%&ndash; Home tab content &ndash;%&gt;--%>
        <%--<div class="tab-pane" id="control-sidebar-home-tab">--%>
            <%--<h3 class="control-sidebar-heading">Recent Activity</h3>--%>
            <%--<ul class="control-sidebar-menu">--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<i class="menu-icon fa fa-birthday-cake bg-red"></i>--%>

                        <%--<div class="menu-info">--%>
                            <%--<h4 class="control-sidebar-subheading">Langdon's Birthday</h4>--%>

                            <%--<p>Will be 23 on April 24th</p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<i class="menu-icon fa fa-user bg-yellow"></i>--%>

                        <%--<div class="menu-info">--%>
                            <%--<h4 class="control-sidebar-subheading">Frodo Updated His Profile</h4>--%>

                            <%--<p>New phone +1(800)555-1234</p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<i class="menu-icon fa fa-envelope-o bg-light-blue"></i>--%>

                        <%--<div class="menu-info">--%>
                            <%--<h4 class="control-sidebar-subheading">Nora Joined Mailing List</h4>--%>

                            <%--<p>nora@example.com</p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<i class="menu-icon fa fa-file-code-o bg-green"></i>--%>

                        <%--<div class="menu-info">--%>
                            <%--<h4 class="control-sidebar-subheading">Cron Job 254 Executed</h4>--%>

                            <%--<p>Execution time 5 seconds</p>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--&lt;%&ndash; /.control-sidebar-menu &ndash;%&gt;--%>

            <%--<h3 class="control-sidebar-heading">Tasks Progress</h3>--%>
            <%--<ul class="control-sidebar-menu">--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<h4 class="control-sidebar-subheading">--%>
                            <%--Custom Template Design--%>
                            <%--<span class="label label-danger pull-right">70%</span>--%>
                        <%--</h4>--%>

                        <%--<div class="progress progress-xxs">--%>
                            <%--<div class="progress-bar progress-bar-danger" style="width: 70%"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<h4 class="control-sidebar-subheading">--%>
                            <%--Update Resume--%>
                            <%--<span class="label label-success pull-right">95%</span>--%>
                        <%--</h4>--%>

                        <%--<div class="progress progress-xxs">--%>
                            <%--<div class="progress-bar progress-bar-success" style="width: 95%"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<h4 class="control-sidebar-subheading">--%>
                            <%--Laravel Integration--%>
                            <%--<span class="label label-warning pull-right">50%</span>--%>
                        <%--</h4>--%>

                        <%--<div class="progress progress-xxs">--%>
                            <%--<div class="progress-bar progress-bar-warning" style="width: 50%"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
                <%--<li>--%>
                    <%--<a href="javascript:void(0)">--%>
                        <%--<h4 class="control-sidebar-subheading">--%>
                            <%--Back End Framework--%>
                            <%--<span class="label label-primary pull-right">68%</span>--%>
                        <%--</h4>--%>

                        <%--<div class="progress progress-xxs">--%>
                            <%--<div class="progress-bar progress-bar-primary" style="width: 68%"></div>--%>
                        <%--</div>--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
            <%--&lt;%&ndash; /.control-sidebar-menu &ndash;%&gt;--%>

        <%--</div>--%>
        <%--&lt;%&ndash; /.tab-pane &ndash;%&gt;--%>
        <%--&lt;%&ndash; Stats tab content &ndash;%&gt;--%>
        <%--<div class="tab-pane" id="control-sidebar-stats-tab">Stats Tab Content</div>--%>
        <%--&lt;%&ndash; /.tab-pane &ndash;%&gt;--%>
        <%--&lt;%&ndash; Settings tab content &ndash;%&gt;--%>
        <%--<div class="tab-pane" id="control-sidebar-settings-tab">--%>
            <%--<form method="post">--%>
                <%--<h3 class="control-sidebar-heading">General Settings</h3>--%>

                <%--<div class="form-group">--%>
                    <%--<label class="control-sidebar-subheading">--%>
                        <%--Report panel usage--%>
                        <%--<input type="checkbox" class="pull-right" checked>--%>
                    <%--</label>--%>

                    <%--<p>--%>
                        <%--Some information about this general settings option--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--&lt;%&ndash; /.form-group &ndash;%&gt;--%>

                <%--<div class="form-group">--%>
                    <%--<label class="control-sidebar-subheading">--%>
                        <%--Allow mail redirect--%>
                        <%--<input type="checkbox" class="pull-right" checked>--%>
                    <%--</label>--%>

                    <%--<p>--%>
                        <%--Other sets of options are available--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--&lt;%&ndash; /.form-group &ndash;%&gt;--%>

                <%--<div class="form-group">--%>
                    <%--<label class="control-sidebar-subheading">--%>
                        <%--Expose author name in posts--%>
                        <%--<input type="checkbox" class="pull-right" checked>--%>
                    <%--</label>--%>

                    <%--<p>--%>
                        <%--Allow the user to show his name in blog posts--%>
                    <%--</p>--%>
                <%--</div>--%>
                <%--&lt;%&ndash; /.form-group &ndash;%&gt;--%>

                <%--<h3 class="control-sidebar-heading">Chat Settings</h3>--%>

                <%--<div class="form-group">--%>
                    <%--<label class="control-sidebar-subheading">--%>
                        <%--Show me as online--%>
                        <%--<input type="checkbox" class="pull-right" checked>--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--&lt;%&ndash; /.form-group &ndash;%&gt;--%>

                <%--<div class="form-group">--%>
                    <%--<label class="control-sidebar-subheading">--%>
                        <%--Turn off notifications--%>
                        <%--<input type="checkbox" class="pull-right">--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--&lt;%&ndash; /.form-group &ndash;%&gt;--%>

                <%--<div class="form-group">--%>
                    <%--<label class="control-sidebar-subheading">--%>
                        <%--Delete chat history--%>
                        <%--<a href="javascript:void(0)" class="text-red pull-right"><i class="fa fa-trash-o"></i></a>--%>
                    <%--</label>--%>
                <%--</div>--%>
                <%--&lt;%&ndash; /.form-group &ndash;%&gt;--%>
            <%--</form>--%>
        <%--</div>--%>
        <%--&lt;%&ndash; /.tab-pane &ndash;%&gt;--%>
    <%--</div>--%>
<%--</aside>--%>
<%--&lt;%&ndash; /.control-sidebar &ndash;%&gt;--%>
<%--&lt;%&ndash; Add the sidebar's background. This div must be placed immediately after the control sidebar &ndash;%&gt;--%>
<%--<div class="control-sidebar-bg"></div>--%>