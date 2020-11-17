<%--
  Created by IntelliJ IDEA.
  User: Taylor
  Date: 2020/7/24
  Time: 12:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="../../static/dist/img/user2-160x160.jpg" class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>超级管理员</p>
                <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
            </div>
        </div>
        <!-- search form -->
<%--        <form action="#" method="get" class="sidebar-form">--%>
<%--            <div class="input-group">--%>
<%--                <input type="text" name="q" class="form-control" placeholder="Search...">--%>
<%--                <span class="input-group-btn">--%>
<%--                <button type="submit" name="search" id="search-btn" class="btn btn-flat"><i class="fa fa-search"></i>--%>
<%--                </button>--%>
<%--              </span>--%>
<%--            </div>--%>
<%--        </form>--%>
        <!-- /.search form -->
        <!-- sidebar menu: : style can be found in sidebar.less -->
<%--        <ul class="sidebar-menu" data-widget="tree">--%>
<%--            <li class="header">MAIN NAVIGATION</li>--%>
<%--            <li class="active treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-dashboard"></i> <span>员工管理</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--              <i class="fa fa-angle-left pull-right"></i>--%>
<%--            </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>
<%--                    <li class="active"><a href="index.html"><i class="fa fa-circle-o"></i>员工列表</a></li>--%>
<%--                    <li><a href="index2.html"><i class="fa fa-circle-o"></i>添加员工</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--            <li class="treeview">--%>
<%--                <a href="#">--%>
<%--                    <i class="fa fa-files-o"></i>--%>
<%--                    <span>工资构成</span>--%>
<%--                    <span class="pull-right-container">--%>
<%--              <span class="label label-primary pull-right">4</span>--%>
<%--            </span>--%>
<%--                </a>--%>
<%--                <ul class="treeview-menu">--%>
<%--                    <li><a href="pages/layout/top-nav.html"><i class="fa fa-circle-o"></i>计时</a></li>--%>
<%--                    <li><a href="pages/layout/boxed.html"><i class="fa fa-circle-o"></i>计件</a></li>--%>
<%--                    <li><a href="pages/layout/fixed.html"><i class="fa fa-circle-o"></i>周结</a></li>--%>
<%--                    <li><a href="pages/layout/collapsed-sidebar.html"><i class="fa fa-circle-o"></i>月结</a></li>--%>
<%--                </ul>--%>
<%--            </li>--%>
<%--        </ul>--%>
        <ul class="sidebar-menu" data-widget="tree">
            <li class="header">MAIN NAVIGATION</li>
            <li class="active treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>员工管理</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li class="active"><a href="/index"><i class="fa fa-circle-o"></i>员工列表</a></li>
                    <li><a href="/edit"><i class="fa fa-circle-o"></i>添加员工</a></li>
                </ul>
            </li>
            <li class="treeview">
                <a href="#">
                    <i class="fa fa-dashboard"></i> <span>工资构成</span>
                    <span class="pull-right-container">
              <i class="fa fa-angle-left pull-right"></i>
            </span>
                </a>
                <ul class="treeview-menu">
                    <li><a href="/getEmployeeByType/1"><i class="fa fa-circle-o"></i>计时</a></li>
                    <li><a href="/getEmployeeByType/2"><i class="fa fa-circle-o"></i>计件</a></li>
                    <li><a href="/getEmployeeByType/3"><i class="fa fa-circle-o"></i>周结</a></li>
                    <li><a href="/getEmployeeByType/4"><i class="fa fa-circle-o"></i>月结</a></li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
