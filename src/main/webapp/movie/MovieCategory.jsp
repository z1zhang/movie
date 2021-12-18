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
    <title>分类管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>电影后台管理系统</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 页面自定义样式 -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <script type="text/javascript">
        function editFile(id) {
            //获取id为 id(此id为传递过来的id值)的 tr标签的子节点
            var a = $("#tr" + id).children();
            //a[1]表示第二个单元格
            //$("#tr"+id).children().siblings().eq(1).text()表示选中'id'为id的tr的第二个单元格，将其变为可编辑状态
            a[1].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input" + id + "' value='" + $("#tr" + id).children().siblings().eq(1).text() + "'/></td>";
            //点击修改后将编辑改为保存和取消
            a[2].innerHTML = "" +
                "<td><div class='am-btn-toolbar'> <div class='am-btn-group am-btn-group-xs'>" +
                "<button class='btn btn-success btn-icon-split' type='button' onclick='save(" + id + ")'> " +
                "<span class=\"icon text-white-50\"><i class=\"fas fa-check\"></i></span>" +
                "</button>" + '&nbsp;' +
                "<button class='btn btn-secondary btn-icon-split' type='button' onclick='back()'> " +
                "<span class='icon text-white-50'><i class=\"fas fa-arrow-left\"></i></span></button> </div> </div></td>";
        }

        //编辑保存操作
        function save(id) {//未定义是可能就是id重复了
            var content = $("#input" + id).val();
            if (content == "") {
                $(".errorMsg").text("修改值不能为空");
                return false;
            }

            window.location.href = "${pageContext.request.contextPath}/uptype?id=" + id + "&type=" + content;
        }

        function back() {
            window.location.href = "${pageContext.request.contextPath}/alltypes";
        }

        function del(id) {
            window.location.href = "${pageContext.request.contextPath}/deltype?id=" + id;
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

        function submitHand(id) {
            function submitBtn() {
                // btn();
                del(id);
            }

            function closeBtn() {
                window.history.go(0);
            }

            confirm("确定要删除吗？", submitBtn, closeBtn);
        }

    </script>
    <style>
        .black_overlay {
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index: 1001;
            -moz-opacity: 0.8;
            opacity: .80;
            filter: alpha(opacity=88);
        }

        .white_content {
            display: none;
            position: absolute;
            top: 30%;
            left: 20%;
            width: 40%;
            height: 40%;
            padding: 1px;
            border: 3px solid black;
            background-color: white;
            z-index: 1002;
            overflow: auto;
        }
    </style>
    <style>
        .smart-green {
            /*margin-left: auto;*/
            margin-right: auto;
            max-width: 500px;
            /*background: #F8F8F8;*/
            padding: 30px 30px 20px 30px;
            font: 17px Arial, Helvetica, sans-serif;
            color: #666;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
        }

        .smart-green h1 > span {
            display: block;
            font-size: 11px;
            color: #FFF;
        }

        .smart-green label {
            display: block;
            margin: 0px 0px 5px;
        }

        .smart-green label > span {
            float: left;
            margin-top: 10px;
            color: #5E5E5E;
        }

        .smart-green input[type="text"] {
            color: #555;
            height: 40px;
            line-height: 16px;
            width: 100%;
            padding: 0px 0px 0px 10px;
            margin-top: 2px;
            border: 1px solid #E5E5E5;
            background: #FBFBFB;
            outline: 0;
            -webkit-box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
            box-shadow: inset 1px 1px 2px rgba(238, 238, 238, 0.2);
            font: normal 14px/14px Arial, Helvetica, sans-serif;
        }

        .smart-green .button {
            background-color: #9DC45F;
            border-radius: 5px;
            -webkit-border-radius: 5px;
            -moz-border-border-radius: 5px;
            border: none;
            padding: 10px 25px 10px 25px;
            color: #FFF;
            text-shadow: 1px 1px 1px #949494;
        }

        .smart-green .button:hover {
            background-color: #80A24A;
        }

        .error-msg {
            color: red;
            margin-top: 10px;
        }

    </style>
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
                <!-- 页标题 -->
                <h1 class="h3 mb-2 text-gray-800">电影分类管理
                    <div style="float: right" class="btn btn-primary btn-icon-split">
                        <a style="float: right" href="javascript:void(0)"
                           onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                                <span type="button" class="icon text-white-50">
                                    <span class="text">添加</span>
                                </span>
                        </a>
                    </div>
                </h1>
                <p class="mb-3">对电影分类进行增删查改的操作.</p>
                <!--右边内容start-->
                <!-- 操作提示 -->
                <div class="col-lg-2 mb-1 alert alert-success alert-dismissible fade show">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>
                        <%=request.getAttribute("addtype") == null ? "" : request.getAttribute("addtype")%>
                    </strong>
                </div>
                <!-- 数据表示例 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>编号</th>
                                    <th>类别</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${alltypes}" var="t">
                                    <tr id="tr${t.id}">
                                        <td>${t.id}</td>
                                        <td>${t.type}</td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button class="btn btn-info btn-icon-split"
                                                            type="button" onclick="editFile(${t.id})">
                                                                <span class="icon text-white-50">
                                                                    <i class="fas fa-pen"></i>
                                                                </span>
                                                    </button>
                                                    <button class="btn btn-danger btn-icon-split"
                                                            type="button" onclick="del(${t.id})">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-trash"></i>
                                                        </span>
                                                    </button>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>
                        </div>
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
<!-- 添加 -->
<div id="light" class="white_content">
    <form action="${pageContext.request.contextPath}/addtype" method="post" id="f1" class="smart-green">
        <label><span>类别编号:</span>
            <input class="form-control bg-light border-1 small" value="" id="title" type="text" name="id"/>
        </label>
        <label><span>电影类别:</span>
            <input class="form-control bg-light border-1 small" id="name" type="text" name="type"/>
        </label>
        <br>
        <label>
            <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <button class="btn btn-success btn-icon-split" type="submit" class="button">
                <span class="icon text-white-50">
                       <i class="fas fa-check"></i>
                    </span>
            </button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger btn-icon-split" type="button" class="button"
                    onclick="document.getElementById('light').style.display='none';document.getElementById('fade').style.display='none'">
                <span class="icon text-white-50">
                       <i class="fas fa-times"></i>
                    </span>
            </button>
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
<script src="../vendor/datatables/jquery.dataTables.min.js"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.min.js"></script>
<!-- 页面级自定义脚本 -->
<script src="../js/demo/datatables-demo.js"></script>
</body>
</html>
