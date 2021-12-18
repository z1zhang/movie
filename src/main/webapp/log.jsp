<%@ page import="java.io.File" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.BufferedReader" %><%--
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
    <title>日志</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="img/favicon.png" type="image/x-icon"/>
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
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
                <%

                    File file = new File("..\\","log.txt");
                    FileReader fr = new FileReader(file);  //字符输入流
                    BufferedReader br = new BufferedReader(fr);  //使文件可按行读取并具有缓冲功能
                    StringBuffer strB = new StringBuffer();   //strB用来存储jsp.txt文件里的内容
                    String str = br.readLine();
                    while(str!=null){
                        strB.append(str).append("<br>");   //将读取的内容放入strB
                        str = br.readLine();
                    }
                    br.close();    //关闭输入流
                %>
                <center>
                    <%=strB %>
                </center>
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
<!-- 添加 -->
<div id="light" class="white_content">
    <form action="${pageContext.request.contextPath}/addtype" method="post" id="f1" class="smart-green">
        <label><span>类别编号:</span>
            <input id="title" type="text" name="id"/>
        </label>
        <label><span>电影类别:</span>
            <input id="name" type="text" name="type"/>
        </label>
        <br>
        <label><span>&nbsp;&nbsp;&nbsp;&nbsp;</span><input type="submit" class="button" value="确定"/>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="button" class="button" value="关闭"
                   onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'"/>
        </label>
    </form>
</div>
<div id="fade" class="black_overlay"></div>
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