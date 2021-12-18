<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/23
  Time: 17:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 空白页 快速构建 -->
<html>
<head>
    <title>电影后台管理系统</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon"/>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script>
        function s2(){
            // 获取用户名
            var usernameValue1 = $("#username1").val();
            // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
            var usernameReg1 = /^\w{5,15}$/;
            // 验证用户信息
            if (!usernameReg1.test(usernameValue1)) {
                // 提示用户
                $(".errorMsg1").text("用户名不合法！");
                $("#username1").val("");
                return false;
            }
            // 获取密码
            var passwordValue1 = $("#password1").val();
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
            var repwdValue1 = $("#repwd").val();
            // 验证确认密码和密码一致
            if (passwordValue1 != repwdValue1) {
                // 提示用户

                $(".errorMsg1").text("确认密码和密码不一致！");
                $("#password1").val("");
                $("#repwd").val("");
                return false;
            }
            // 获取用户名
            var emailValue = $("#email").val();
            // 验证邮件输入是否合法。
            var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;

            if (!emailReg.test(emailValue)) {
                // 提示用户
                $(".errorMsg1").text("邮件输入不合法！");
                $("#email").val("")
                return false;
            }
            $("#f2").submit();
        }
    </script>
</head>
<body id="page-top">
<!-- 页面包装器 -->
<div id="wrapper">
    <!-- 侧边栏 -->
    <jsp:include page="sidebar.jsp"/>
    <!-- 边栏结束 -->
    <!-- 内容包装器 -->
    <div id="content-wrapper" class="d-flex flex-column">
        <!-- 主要内容 -->
        <div id="content">
            <!-- 顶部 -->
            <jsp:include page="top.jsp"/>
            <!-- 顶部结束 -->
            <!-- 容器流体开始 -->
            <div class="container-fluid">
                <!-- 卡片体 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">添加管理员</h6>
                    </div>
                    <div class="card-body">
                        <form action="register" method="post" id="f2">
                            <!-- 操作提示 -->
                            <div style="float: right" class="col-lg-3 mb-1 alert alert-success alert-dismissible fade show">
                                <button type="button" class="close" data-dismiss="alert">&times;</button>
                                <span class="errorMsg1">添加成功
                                    <%=request.getAttribute("mgs1")==null?"":request.getAttribute("mgs1")%>
                                </span>
                            </div>
                            <label>
                                <span>用户名</span>
                                <input class="form-control bg-light border-1 small" type="text" id="username1" autocomplete="off" name="username"/>
                            </label><br>
                            <label>
                                <span>密码</span>
                                <input class="form-control bg-light border-1 small" type="password" id="password1" autocomplete="new-password" name="paw"/>
                            </label><br>
                            <label>
                                <span>确定密码</span>
                                <input class="form-control bg-light border-1 small" type="password" id="repwd" name="repwd"/>
                            </label><br>
                            <label>
                                <span>手机号</span>
                                <input class="form-control bg-light border-1 small" type="text" id="tele" name="tele"/>
                            </label><br>
                            <label>
                                <span>邮箱</span>
                                <input class="form-control bg-light border-1 small" type="email" id="email" name="email"/>
                            </label><br>
                            <button type="button" class="btn btn-success btn-icon-split" id="sbtn"
                                    onclick="s2()">
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
            <jsp:include page="footer.jsp"/>
        </footer>
        <!-- 底部结束 -->
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
<script src="vendor/jquery/jquery.min.js"></script>
<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- 核心插件 JavaScript-->
<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
<!-- 所有页面的自定义脚本-->
<script src="js/sb-admin-2.min.js"></script>
</body>
</html>

