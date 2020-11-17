<%--
  Created by IntelliJ IDEA.
  User: Taylor
  Date: 2020/7/25
  Time: 12:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>
        <c:if test="${employeeById != null}">
            编辑员工
        </c:if>
        <c:if test="${employeeById == null}">
            新增员工
        </c:if>
    </title>
    <jsp:include page="../back/style.jsp"/>
</head>
<body class="hold-transition skin-blue sidebar-mini">
<div class="wrapper">
    <jsp:include page="../back/head.jsp"/>
    <jsp:include page="../back/left.jsp"/>
    <div class="content-wrapper">
        <div class="content">
            <div class="box box-info">
                <c:if test="${baseResult != null}">
                    <div class="alert alert-${baseResult.status==200?"success":"danger"} alert-dismissible">
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.message}
                    </div>
                </c:if>
                <div class="box-header with-border">
                    <c:if test="${employeeById != null}">
                        <h3 class="box-title">编辑员工</h3>
                    </c:if>
                    <c:if test="${employeeById == null}">
                        <h3 class="box-title">新增员工</h3>
                    </c:if>
                </div>
                <!-- /.box-header -->
                <!-- form start -->
                <form class="form-horizontal" action="/${employeeById == null ? "add" : "update"}" method="post">
                    <div class="row">
                        <div class="col-sm-4 col-xs-2"></div>
                        <div class="box-body col-sm-4 col-xs-8">
                            <input type="text" style="display: none;" name="id" value="${employeeById.id}">
                            <div class="form-group">
                                <label>姓名</label>
<%--                                <input type="text" name="username" class="form-control" placeholder="姓名" value="${employeeById != null ? employeeById.username : ""}">--%>
                                <input type="text" name="username" class="form-control" placeholder="姓名" value="${employeeById.username}">
                            </div>
                            <div class="form-group">
                                <label>入职时间(不填写默认为当天)</label>
<%--                                <input type="date"  name="createtime" class="form-control" placeholder="Enter ..." value="${employeeById != null ? employeeById.createtime : ""}">--%>
                                <input type="date"  name="createtime" class="form-control" value="<fmt:formatDate value='${employeeById.createtime}' type='date' pattern='yyyy-MM-dd'/>">
                            </div>
                            <div class="form-group">
                                <label>工资计算</label>
                                <select name="wagestruct" class="form-control">
                                    <c:forEach items="${wageStructs}" var="wageStruct">
                                        <c:choose>
                                            <c:when test="${employeeById != null}">
                                                <c:if test="${wageStruct.id == employeeById.wagestruct}">
                                                    <option value="${wageStruct.id}" selected>${wageStruct.struct}</option>
                                                </c:if>
                                                <c:if test="${wageStruct.id != employeeById.wagestruct}">
                                                    <option value="${wageStruct.id}">${wageStruct.struct}</option>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${wageStruct.id == 1}">
                                                    <option value="${wageStruct.id}" selected>${wageStruct.struct}</option>
                                                </c:if>
                                                <c:if test="${wageStruct.id != 1}">
                                                    <option value="${wageStruct.id}">${wageStruct.struct}</option>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>部门</label>
                                <select name="department" class="form-control">
                                    <c:forEach items="${departments}" var="department">
                                        <c:choose>
                                            <c:when test="${employeeById != null}">
                                                <c:if test="${department.id == employeeById.department}">
                                                    <option value="${department.id}" selected>${department.department}</option>
                                                </c:if>
                                                <c:if test="${department.id != employeeById.department}">
                                                    <option value="${department.id}">${department.department}</option>
                                                </c:if>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${department.id == 1}">
                                                    <option value="${department.id}" selected>${department.department}</option>
                                                </c:if>
                                                <c:if test="${department.id != 1}">
                                                    <option value="${department.id}">${department.department}</option>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="form-group">
                                <label>性别</label>
                                <select name="sex" class="form-control">
                                    <option value="男" ${(employeeById != null && employeeById.sex eq "男") ? "selected" : ""}>男</option>
                                    <option value="女" ${(employeeById != null && employeeById.sex eq "女") ? "selected" : ""}>女</option>
                                </select>
                            </div>
                        </div>
                        <div class="col-sm-4 col-xs-2"></div>
                    </div>
                    <!-- /.box-body -->
                    <div class="row">
                        <div class="col-sm-4 col-xs-2"></div>
                        <div class="box-footer col-sm-4 col-xs-8">
                            <a href="javascript:history.back(-1);">
                                <button type="button" class="btn btn-default">返回</button>
                            </a>
                            <button type="submit" class="btn btn-info pull-right">确认</button>
                        </div>
                        <div class="col-sm-4 col-xs-2"></div>
                    </div>
                    <!-- /.box-footer -->
                </form>
            </div>
            <!-- /.box -->
        </div>
    </div>
    <jsp:include page="../back/copyright.jsp"/>

</div>
</body>
<jsp:include page="../back/js.jsp"/>
<script type="text/javascript">
    $(function () {

    });
</script>
</html>

