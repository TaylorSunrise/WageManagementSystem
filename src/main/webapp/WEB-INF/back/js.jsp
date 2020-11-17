<%--
  Created by IntelliJ IDEA.
  User: Taylor
  Date: 2020/7/22
  Time: 19:18
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--查看信息模态框--%>
<div class="modal fade" id="model" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <%--                        <div class="modal-header">--%>
            <%--                            <h4 class="modal-title" id="myModalLabel">--%>
            <%--                                模态框（Modal）标题--%>
            <%--                            </h4>--%>
            <%--                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">--%>
            <%--                                &times;--%>
            <%--                            </button>--%>
            <%--                        </div>--%>
            <div class="modal-body" >
                <b id="model-message"></b>
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    &times;
                </button>
            </div>
            <%--                        <div class="modal-footer">--%>
            <%--                            <button type="button" class="btn btn-default" data-dismiss="modal">关闭--%>
            <%--                            </button>--%>
            <%--                            <button type="button" class="btn btn-primary">--%>
            <%--                                提交更改--%>
            <%--                            </button>--%>
            <%--                        </div>--%>
        </div><!-- /.modal-content -->
    </div><!-- /.modal -->
</div>

<!-- jQuery 3 -->
<script src="${pageContext.request.contextPath }/static/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath }/static/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- DataTables -->
<script src="${pageContext.request.contextPath }/static/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
<script src="${pageContext.request.contextPath }/static/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
<!-- SlimScroll -->
<script src="${pageContext.request.contextPath }/static/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
<!-- FastClick -->
<script src="${pageContext.request.contextPath }/static/bower_components/fastclick/lib/fastclick.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath }/static/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="${pageContext.request.contextPath }/static/dist/js/demo.js"></script>
<!-- page script -->
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
<script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
<![endif]-->


