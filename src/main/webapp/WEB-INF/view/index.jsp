<%--
  Created by IntelliJ IDEA.
  User: Taylor
  Date: 2020/7/22
  Time: 19:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>管理人员</title>
    <jsp:include page="../back/style.jsp"/>
    <style>
        .example-modal .modal {
            position: relative;
            top: auto;
            bottom: auto;
            right: auto;
            left: auto;
            display: block;
            z-index: 1;
        }

        .example-modal .modal {
            background: transparent !important;
        }
    </style>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../back/head.jsp"/>
    <jsp:include page="../back/left.jsp"/>
    <div class="content-wrapper">

        <div class="content">

<%--            <button class="btn btn-primary btn-lg" onclick="jsOpenModal()">--%>
<%--                js打开模态框1--%>
<%--            </button>--%>
            <div class="box">
                <c:if test="${baseResult != null}">
                    <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                        ${baseResult.message}
                    </div>
                </c:if>
                <div class="box-header">
                    <h3 class="box-title">员工信息</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <table id="example1" class="table table-bordered table-striped" style="width:100%">
                        <thead>
                        <tr>
                            <th>员工姓名</th>
                            <th>部门</th>
                            <th>性别</th>
                            <th>入职时间</th>
                            <th>工资构成</th>
                            <th>职位状态</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${employees}" var="employee">
                                <tr>
                                    <td>${employee.username}</td>
                                    <td>${employee.department}</td>
                                    <td>${employee.sex}</td>
                                    <td ><fmt:formatDate value='${employee.createtime}' type='date' pattern='yyyy-MM-dd'/></td>
                                    <td>${employee.wagestruct}</td>
                                    <td ${employee.isdelete==1 ? "style=\"color:red;\"" : ""}>${employee.isdelete==1 ? "离职" : "在职"}</td>
                                    <td>
                                        <a href="/editemployee/${employee.id}">
                                            <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-fw fa-edit"></i>编辑</button>
                                        </a>
                                        <a href="/changeemployee/${employee.id}/${employee.isdelete}">
                                            <button type="button" class="btn btn-${employee.isdelete==1 ? "success" : "danger"} btn-sm"><i class="fa fa-fw fa-trash"></i>${employee.isdelete==1 ? "复职" : "离职"}</button>
                                        </a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <th>员工姓名</th>
                            <th>部门</th>
                            <th>性别</th>
                            <th>入职时间</th>
                            <th>工资构成</th>
                            <th>职位状态</th>
                            <th>操作</th>
                        </tr>
                        </tfoot>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="../back/copyright.jsp"/>

</div>
</body>
<jsp:include page="../back/js.jsp"/>
<script type="text/javascript">
    $(function () {
        $('#example1').DataTable({
            "paging": true,
            "lengthChange": true,
            "searching": true,
            "ordering": true,
            "info": true,
            "autoWidth": true,
            "scrollX": true,
            "order" : [[2, 'desc']],
            "language": {
                "lengthMenu": " _MENU_ 条记录/每页",
                "zeroRecords": "对不起，暂时没有记录",
                "info": "第 _PAGE_页，共_PAGES_页",
                "infoEmpty": "暂无信息",
                "infoFiltered": "(从_MAX_条数据中筛选)",
                "search": "搜索",
                "paginate": {
                    "previous":"上一页",
                    "next" : "下一页"
                }
            }
        });
        // $('#myModal').on('show.bs.modal',
        //     function () {
        //         // alert('aaaa在调用 show 方法后触发。');
        //     });
        // $('#myModal').on('hide.bs.modal',
        //     function () {
        //         // alert('当调用 hide 实例方法时触发。');
        //     })
        // $('#myModal').on('shown.bs.modal',
        //     function () {
        //         // alert('当模态框对用户可见时触发（将等待 CSS 过渡效果完成）。。');
        //     });
        // $('#myModal').on('hidden.bs.modal',
        //     function () {
        //         // alert('当模态框完全对用户隐藏时触发。');
        //     })
    });
</script>
</html>
