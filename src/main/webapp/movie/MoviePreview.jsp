<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/22
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>网上书店</title>
    <!-- 网站Logo-->
<%--    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>--%>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
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
                <form style="float: right" action="${pageContext.request.contextPath}/sfByi" method="post"
                      class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-1 mw-100 navbar-search">
                    <div class="input-group" style="float: right">
                        <input type="text" class="form-control bg-light border-1 small" name="ISDN"
                               placeholder="请输入电影编号">
                        <div class="input-group-append">
                            <button class="btn btn-primary" type="submit">
                                <i class="fas fa-search fa-sm"></i>
                            </button>
                        </div>
                    </div>
                </form>
                <!-- 页标题 -->
                <h1 class="h3 mb-2 text-gray-800">网上书店</h1>
                <p class="mb-3"></p>
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    </div>
                    <div class="card-body">
                        <c:forEach items="${allfilms}" var="fs">
                            <div style="width:130px;height: 190px; border:0px solid black; display: inline-block; margin:6px 4px; ">
                                <a href="getDetail?ISDN=${fs.ISDN}" style="text-decoration: none">
                                    <img src="${fs.photo}" style="height: 150px;width: 110px;">
                                    <br>
                                    <span style="font-size: 11px; color:gray; font-weight: bold;text-align: left">${fs.name}</span><br>
                                    <span style="font-size: 8px;text-align: right;color: red;font-weight: bold;">${fs.score}<span
                                            style="color: gray">元</span></span>
                                </a>
                            </div>
                        </c:forEach>
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
