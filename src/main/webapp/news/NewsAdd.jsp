<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/22
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加新闻</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
<%--    <link rel="stylesheet" href="../assets/css/frame.css">--%>
    <!-- 页面自定义JavaScript -->
    <script type="text/javascript">
        function s1() {
            var ISDN = $("#ISDN").val();
            var title = $("#title").val();
            var date = $("#datetimepicker3").val();
            var description = $("#description").val();
            var author = $("#author").val();
            if (ISDN == "") {
                $(".errorMsg1").text("新闻ID不可为空");
                return false;
            }
            if (title == "") {
                $(".errorMsg1").text("新闻标题不可为空");
                return false;
            }
            if (author == "") {
                $(".errorMsg1").text("新闻作者不可为空");
                return false;
            }
            if (date == "") {
                $(".errorMsg1").text("发表时间不可为空");
                return false;
            }
            if (description == "") {
                $(".errorMsg1").text("新闻内容不可为空");
                return false;
            }
            $("#f1").submit()
        }
    </script>

</head>
<body id="page-top">
<%--<div class="wrap-dialog dialog-hide" id="dialog-hide">--%>
<%--    <div class="dialog" id="dialog">--%>
<%--        <a class="closeBtn" id="closeBtn">X</a>--%>
<%--        <div class="dialog-header">--%>
<%--            <span class="dialog-title">提示</span>--%>
<%--        </div>--%>
<%--        <div class="dialog-body">--%>
<%--            <span class="dialog-message" id="dialog-message">确定要上传新闻吗？</span>--%>
<%--        </div>--%>
<%--        <div class="dialog-footer">--%>
<%--            <input type="button" class="dialog-btn" id="dialog-confirm" value="确定">--%>
<%--            <input type="button" class="dialog-btn dialog-ml50" id="dialog-cancel" value="取消">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<!-- 页面包装器 -->
<div id="wrapper">
    <!-- 侧边栏 -->
    <jsp:include page="../sidebar.jsp"/>
    <!-- 边栏结束 -->
    <!-- 内容包装器 -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- 主要内容 -->
        <div id="content">
            <!-- 顶部 -->
            <jsp:include page="../top.jsp"/>
            <!-- 顶部结束 -->
            <!-- 容器流体开始 -->
            <div class="container-fluid">
                <!-- 卡片体 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">添加新闻</h6>
                    </div>
                    <div class="card-body">
                        <form method="post" action="${pageContext.request.contextPath}/addnew" id="f1"
                              class="smart-green">
                            <!-- 操作提示 -->
                            <div style="float: right" class="col-lg-3 mb-1 alert alert-success alert-dismissible fade show">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <span class="errorMsg1">
                            <%=request.getAttribute("addnew") == null ? "" : request.getAttribute("addnew")%>
                                </span>
                            </div>
                            <label><span>新闻编号:</span>
                                <input id="ISDN" type="text" name="ISDN" class="form-control bg-light border-1 small"/>
                            </label><br/>
                            <label><span>新闻标题:</span>
                                <input id="title" type="text" name="title"
                                       class="form-control bg-light border-1 small"/>
                            </label><br/>
                            <label><span>新闻作者:</span>
                                <input id="author" type="text" name="author"
                                       class="form-control bg-light border-1 small"/>
                            </label><br/>
                            <label><span>发表时间:</span>
                                <input style="width: 220px" type="date" name="date" id="datetimepicker3"
                                       class="form-control bg-light border-1 small"/>
                            </label><br/>
                            <label><span>新闻内容 :</span>
                                <textarea id="description" name="description"
                                          class="form-control bg-light border-1 small"></textarea>
                            </label>
                            <br>
                            <button type="button" class="btn btn-success btn-icon-split"
                                    onclick="s1()">
                                <span class="icon text-white-50">
                                    <i class="fas fa-check"></i>
                                </span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <!-- /.容器流体 -->
        </div>
        <!-- 主要内容结束 -->
        <!-- 底部 -->
        <footer class="sticky-footer bg-white">
            <jsp:include page="../footer.jsp"/>
        </footer>
        <!-- 底部结束 -->
    </div>
</div>
<!-- 内容包装结束 -->
</div>
<!-- 页结束符 -->
<!-- 滚动到顶部按钮-->
<a class="scroll-to-top rounded" href="#page-top">
    <i class="fas fa-angle-up"></i>
</a>
<!-- 注销提示-->
<div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">是否注销？</h5>
                <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">×</span>
                </button>
            </div>
            <div class="modal-body">注销即退出系统</div>
            <div class="modal-footer">
                <button class="btn btn-secondary" type="button" data-dismiss="modal">取消</button>
                <a class="btn btn-primary" href="login.jsp">注销</a>
            </div>
        </div>
    </div>
</div>
<!-- Bootstrap 核心 JavaScript-->
<script src="../vendor/jquery/jquery.min.js"></script>
<script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 核心插件 JavaScript-->
<script src="../vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- 所有页面的自定义脚本-->
<script src="../js/sb-admin-2.min.js"></script>
<!-- 页面级插件 -->
<!-- 页面级自定义脚本 -->
<script src="../js/jquery.js" type="text/javascript"></script>
</body>
</html>
