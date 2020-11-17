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
    <title>工资展示</title>
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
                    <h3 class="box-title">员工工资</h3>
                </div>
                <!-- /.box-header -->
                <div class="box-body">
                    <a href="/downloadByType/${type}">
                        <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-fw fa-edit"></i>导出全部工资条</button>
                    </a>
                    <table id="example1" class="table table-bordered table-striped">
                        <thead>
                        <tr>
                            <c:forEach var="title" items="${titles}">
                                <td>${title}</td>
                            </c:forEach>
                        </tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${employees}" var="employee">
                            <tr>
                                <td>${employee.username}</td>
                                <td>${employee.struct}</td>
                                <td>${employee.month}</td>
                                <td>${employee.total}</td>
                                <td>${employee.salary}</td>
                                <td>
                                    <a href="/downloadBySalaryId/${employee.id}">
                                        <button type="button" class="btn btn-primary btn-sm"><i class="fa fa-fw fa-edit"></i>导出工资条</button>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                        <tfoot>
                        <tr>
                            <c:forEach var="title" items="${titles}">
                                <td>${title}</td>
                            </c:forEach>
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
            // "scrollX": true,
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
    });

    function down() {
        <%--var json = {--%>
        <%--    "type" : ${type}--%>
        <%--};--%>
        <%--if(userid != null){--%>
        <%--    json = {--%>
        <%--        "type" : ${type},--%>
        <%--        "userid" : userid--%>
        <%--    };--%>
        <%--}--%>
        <%--if (month != null){--%>
          var  json = {
                "type" : ${type},
                "userid" : 1,
                "month" : 1
            };
        // }
        $.ajax({
            url:"/downloadFailedUsingJson",
            type:"POST",
            data:JSON.stringify(json),
            async: false,
            contentType:"application/json",  //缺失会出现URL编码，无法转成json对象
            success:function(data){
            }
        });
    }
</script>
</html>
