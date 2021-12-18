<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/22
  Time: 20:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>新闻详情</title>
    <!-- 网站Logo-->
    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 页面自定义样式 -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- 页面自定义JavaScript -->
    <script type="text/javascript">
        $(function () {
            $("#btn1").click(function () {
                var tISDN = $("#tISDN").val();
                if (tISDN == "") {
                    $(".errorMsg").text("新闻编号不可为空");
                    return false;
                }
                return true;
            })
        })
    </script>
    <script type="text/javascript">
        function editFile(id) {
            //获取id为 id(此id为传递过来的id值)的 tr标签的子节点
            var a = $("#tr" + id).children();
            //a[1]表示第二个单元格
            //$("#tr"+id).children().siblings().eq(1).text()表示选中'id'为id的tr的第二个单元格，将其变为可编辑状态
            a[1].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input1" + id + "' value='" + $("#tr" + id).children().siblings().eq(1).text() + "'/></td>";
            a[2].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input2" + id + "' value='" + $("#tr" + id).children().siblings().eq(2).text() + "'/></td>";
            a[3].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='date' id='input3" + id + "' value='" + $("#tr" + id).children().siblings().eq(3).text() + "'/></td>";
            a[4].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input4" + id + "' value='" + $("#tr" + id).children().siblings().eq(4).text() + "'/></td>";
            //点击修改后将编辑改为保存和取消
            a[5].innerHTML = "" +
                "<td><div class='am-btn-toolbar'> <div class='am-btn-group am-btn-group-xs'>" +
                "<button class='btn btn-success btn-icon-split' type='button' onclick='save(" + id + ")'> " +
                "<span class=\"icon text-white-50\"><i class=\"fas fa-check\"></i></span>" +
                "</button>" + '&nbsp;' +
                "<button class='btn btn-secondary btn-icon-split' type='button' onclick='back()'> " +
                "<span class='icon text-white-50'><i class=\"fas fa-arrow-left\"></i></span></button> </div> </div></td>";
        }

        //编辑保存操作
        function save(id) {//未定义是可能就是id重复了

            var title = $("#input1" + id).val();
            var author = $("#input2" + id).val();
            var date = $("#input3" + id).val();
            var description = $("#input4" + id).val();

            if (title == "") {
                $(".errorMsg").text("新闻ID不可为空");
                return false;
            }
            if (author == "") {
                $(".errorMsg").text("新闻作者不可为空");
                return false;
            }
            if (date == "") {
                $(".errorMsg").text("发表时间不可为空");
                return false;
            }
            if (description == "") {
                $(".errorMsg").text("新闻内容不可为空");
                return false;
            }
            window.location.href = "${pageContext.request.contextPath}/upNew?ISDN=" + id + "&title=" + title + "&author=" + author + "&date1=" + date + "&description=" + description;
        }

        function back() {
            window.location.href = "${pageContext.request.contextPath}/allnews";
        }

        function del(id) {
            window.location.href = "${pageContext.request.contextPath}/delnew?ISDN=" + id;
        }

    </script>
    <script type="text/javascript">
        $(function () {
            var choose = function (id) {
                return document.getElementById(id);
            }
            //自定义部分
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
                <!--添加按钮 -->
                <div style="float: right" class="btn btn-primary btn-icon-split">
                    <button class="icon text-white-50"
                            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                        <i class="fas fa-plus   "></i>
                        <span class="text"><a href="${pageContext.request.contextPath}/news/NewsAdd.jsp" style="color: gray;text-decoration: none" >添加新闻</a> </span>
                    </button>
                </div>
                <!-- 操作提示 -->
                <div style="float: right" class="col-lg-2 mb-1 alert alert-success alert-dismissible fade show">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <strong>
                        <%=request.getAttribute("newsc") == null ? "" : request.getAttribute("newsc")%>
                    </strong>
                </div>
                <!-- 页标题 -->
                <h1 class="h3 mb-2 text-gray-800">新闻详情管理</h1>
                <p class="mb-3">对新闻详情进行增删查改操作.</p>

                <!-- 数据表格 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>新闻编号</th>
                                    <th>新闻标题</th>
                                    <th>新闻作者</th>
                                    <th>新闻日期</th>
                                    <th>新闻内容</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${allnews}" var="news">
                                    <tr id="tr${news.ISDN}">
                                        <td>${news.ISDN}</td>
                                        <td>${news.title}</td>
                                        <td>${news.author}</td>
                                        <td><fmt:formatDate value="${news.date}" pattern="yyyy-MM-dd"/></td>
                                        <td>${news.description}</td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <button class="btn btn-info btn-icon-split"
                                                            type="button" onclick="editFile(${news.ISDN})">
                                                                <span class="icon text-white-50">
                                                                    <i class="fas fa-pen"></i>
                                                                </span>
                                                    </button>
                                                    <button class="btn btn-danger btn-icon-split"
                                                            type="button" onclick="del(${news.ISDN})">
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
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/exit">注销</a>
            </div>
        </div>
    </div>
</div>
<div id="fade" class="black_overlay"></div>
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
