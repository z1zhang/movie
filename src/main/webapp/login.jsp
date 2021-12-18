<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/15
  Time: 16:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>登录系统</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon"/>
    <!-- 此模板的自定义字体-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">

    <!-- 此模板的自定义样式-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
    <script type="text/javascript">
        $(function () {
            $("#codeImg").click(function () {
                var url = "code.jpg?t=" + Math.random();
                $(this).prop("src", url);
            });
        });

        function s1() {
            // 获取用户名
            var usernameValue = $("#username").val();
            // 验证用户名是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
            var usernameReg = /^\w{5,15}$/;
            // 验证用户信息
            if (!usernameReg.test(usernameValue)) {
                // 提示用户
                $(".errorMsg").text("用户名不合法！");

                $("#username").val("");
                // 获取密码
                var passwordValue = $("#password").val();
                return false;
            }
            // 验证密码是否合法,规则如下：必须由字母，数字，下划线组成，并且长度为5到15位。
            var passwordReg = /^\w{5,15}$/;
            // 验证用户信息
            if (!passwordReg.test(passwordValue)) {
                // 提示用户
                $(".errorMsg").text("密码不合法！");
                $("#password").val("");
                return false;
            }
            // 获取验证码信息
            var codeValue = $("#code").val();
            // 验证验证码不为空！
            if (codeValue == "") {
                $(".errorMsg").text("验证码不能为空！");
                return false;
            }
            // var action = "Login/"+usernameValue+"/"+passwordValue;
            // $("#f1").attr("action",action);
            $("#f1").submit();
        }

        function s2() {
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
<body class="bg-gradient-primary">
<div class="container">
    <!-- 外排 -->
    <div class="row justify-content-center align-content-center">
        <div class="col-xl-5 col-lg-12 col-md-9"><!--盒子宽距 -->
            <div class="card o-hidden border-0 shadow-lg my-5">
                <div class="card-body p-0">
                    <!-- 卡片正文中的嵌套行 -->
                    <div class="row">
                        <%--                        <div class="col-lg-6 d-none d-lg-block bg-login-image"><img src="img/login_bg.jpg"></div>--%>
                        <div class="col-lg-12"><!-- 输入框宽距-->
                            <div class="p-5">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">欢迎！</h1>
                                </div>
                                <form method="post" action="Login" id="f1">
                                    <div class="form-group">
                                        <input type="text" class="form-control form-control-user" id="username"
                                               name="username" aria-describedby="Help" placeholder="用户名">
                                    </div>
                                    <div class="form-group">
                                        <input type="password" class="form-control form-control-user"
                                               id="password" name="password" placeholder="密码">
                                    </div>
                                    <div class="form-group row">
                                        <div class="col-sm-6 mb-3 mb-sm-0">
                                            <input type="text" class="form-control form-control-user" id="code"
                                                   name="code" placeholder="验证码">
                                        </div>
                                        <div class="col-sm-6">
                                            <img alt="" src="code.jpg" class="form-control" id="codeImg">
                                        </div>

                                    </div>
                                    <label>
                                        <span class="errorMsg"
                                              style="font-size: 8px;color: red"><%=request.getAttribute("mgs") == null ? "" : request.getAttribute("mgs")%></span>
                                    </label>
                                    <div class="form-group">
                                        <div class="custom-control custom-checkbox small">
                                            <input type="checkbox" class="custom-control-input" id="customCheck">
                                            <label class="custom-control-label" for="customCheck">记住我</label>
                                        </div>
                                    </div>
                                    <button type="button" id="btn" onclick="s1()"
                                            class=" btn btn-primary btn-user btn-block">登录
                                    </button>
                                </form>
                                <hr>
                                <div class="text-center">
                                    <a class="small" href="forgotPassword.jsp">忘记密码？</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
