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
    <title>用户信息</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>电影后台管理系统</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/app.css">
    <!-- 页面自定义JavaScript -->
    <script type="text/javascript" src="../jquery-3.4.1.js"></script>
    <script type="text/javascript">
        function s1() {

            // 获取密码
            var passwordValue1 = $("#paw").val();
            // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
            var passwordReg1 = /^\w{5,15}$/;
            // 验证用户信息
            if (!passwordReg1.test(passwordValue1)) {
                // 提示用户
                $(".errorMsg1").text("密码不合法！");
                $("#password1").val("");
                return false;
            }

            //获取确认密码
            var repwdValue1 = $("#password2").val();
            // 验证确认密码和密码一致
            if (passwordValue1 != repwdValue1) {
                // 提示用户

                $(".errorMsg1").text("确认密码和密码不一致！");
                $("#password1").val("");
                $("#password2").val("");
                return false;
            }
            $("#f1").submit();
        }
    </script>
    <script type="text/javascript">

        $(function () {
            var choose = function (id) {
                return document.getElementById(id);
            }
            //自定柳部分
            window.confirm = function (message, yesCallBack, noCallBack) {

                var message = message || "确定?";

                choose("dialog-message").innerHTML = message;
                // 显示遮罩和对话框
                choose("dialog-hide").className = "wrap-dialog";
                // 确定按钮

                choose("dialog").onclick = function (e) {
                    if (e.target.className == "dialog-btn") {
                        choose("dialog-hide").className = "wrap-dialog dialog-hide";
                        yesCallBack();
                    } else if (e.target.className == "dialog-btn dialog-ml50") {
                        choose("dialog-hide").className = "wrap-dialog dialog-hide";
                        noCallBack();
                    }
                };
                // 取消按钮
                choose("closeBtn").onclick = function () {
                    choose("dialog-hide").style.display = "none";
                }
            }
        })

        function submitHand() {
            function submitBtn() {
                s1();
            }

            function closeBtn() {
                window.history.go(0);
            }

            confirm("确定要修改密码吗？", submitBtn, closeBtn);
        }
    </script>
</head>
<body id="page-top">
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
                        <h6 class="m-0 font-weight-bold text-primary">修改密码</h6>

                    </div>
                    <div class="card-body">
                        <!-- 操作提示 -->
                        <div style="float: right" class="col-lg-3 mb-1 alert alert-success alert-dismissible fade show">
                            <button type="button" class="close" data-dismiss="alert">&times;</button>
                            <span class="errorMsg1">
                                    <%=request.getAttribute("mgs3") == null ? "" : request.getAttribute("mgs3")%></span>
                            </span>
                        </div>
                        <form id="f1"
                              action="${pageContext.request.contextPath}/uppaw" method="post">
                            <input type="hidden" name="id" value="${sessionScope.user.id}"/>
                            <label><span>原始密码：</span>
                                <input type="password" id="paw1" name="paw1"
                                       class="form-control bg-light border-1 small"/>
                            </label><br/>
                            <label><span>新密码：</span>
                                <input type="password" id="paw" name="paw"
                                       class="form-control bg-light border-1 small"/>
                            </label><br/>
                            <label><span>确认新密码：</span>
                                <input type="password" id="password2"
                                       class="form-control bg-light border-1 small"/>
                            </label>
                            <br>
                            <button type="button" class="btn btn-success btn-icon-split" id="btn" onclick="s1()">
                                <span class="icon text-white-50">
                                    <i class="fas fa-check"></i>
                                </span>
                            </button>
                        </form>
                    </div>
                </div>
            </div>
            <div class="tpl-alert"></div>
            <!-- /.容器流体 -->
        </div>
        <!-- 主要内容结束 -->
        <!-- 底部 -->
        <footer class="sticky-footer bg-white">
            <jsp:include page="../footer.jsp"/>
        </footer>
        <!-- 底部结束 -->
    </div>
    <!-- 内容包装结束 -->
</div>
<!-- 页结束符 -->
<%--<div class="wrap-dialog dialog-hide" id="dialog-hide">--%>
<%--    <div class="dialog" id="dialog">--%>
<%--        <a class="closeBtn" id="closeBtn">X</a>--%>
<%--        <div class="dialog-header">--%>
<%--            <span class="dialog-title">提示</span>--%>
<%--        </div>--%>
<%--        <div class="dialog-body">--%>
<%--            <span class="dialog-message" id="dialog-message">确定要修改密码吗？</span>--%>
<%--        </div>--%>
<%--        <div class="dialog-footer">--%>
<%--            <input type="button" class="dialog-btn" id="dialog-confirm" value="确定">--%>
<%--            <input type="button" class="dialog-btn dialog-ml50" id="dialog-cancel" value="取消">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

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
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/exit">注销</a>
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
</body>
</html>
