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
    <title>修改电影信息</title>
    <!-- 网站Logo-->
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <link rel="shortcut icon" href="../img/favicon.png" type="image/x-icon"/>
    <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
          rel="stylesheet">
    <!-- 此模板的自定义样式 -->
    <link href="../css/sb-admin-2.min.css" rel="stylesheet">
    <!-- 此页面的自定义样式 -->
    <link href="../vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <!-- 页面自定义JavaScript -->
    <script type="text/javascript">
        function s1() {
            var ISDN = $("#ISDN").val();
            var name = $("#name").val();
            var director = $("#director").val();
            var actor = $("#actor").val();
            var type = $("#type").val();
            var country = $("#country").val();
            var language = $("#language").val();
            var score = $("#score").val();

            var description = $("#description").val();
            if (ISDN == "") {
                $(".errorMsg").text("编号不可为空");
                return false;
            }
            if (name == "") {
                $(".errorMsg").text("电影名称不可为空");
                return false;
            }
            if (director == "") {
                $(".errorMsg").text("导演不可为空");
                return false;
            }
            if (actor == "") {
                $(".errorMsg").text("主演不可为空");
                return false;
            }
            if (type == "") {
                $(".errorMsg").text("类型不可为空");
                return false;
            }
            if (country == "") {
                $(".errorMsg").text("制片国家不可为空");
                return false;
            }
            if (language == "") {
                $(".errorMsg").text("语言不可为空");
                return false;
            }
            if (score == "") {
                $(".errorMsg").text("评分不可为空");
                return false;
            }

            if (description == "") {
                $(".errorMsg").text("描述不可为空");
                return false;
            }
            $("#f1").submit();
        }
    </script>
    <script type="text/javascript">
        function editFile(id) {
            //获取id为 id(此id为传递过来的id值)的 tr标签的子节点
            var a = $("#tr" + id).children();
            //a[1]表示第二个单元格
            //$("#tr"+id).children().siblings().eq(1).text()表示选中'id'为id的tr的第二个单元格，将其变为可编辑状态
            a[1].innerHTML = "<td ><input class='form-control bg-light border-1 small'  type='text' id='input1" + id + "' value='" + $("#tr" + id).children().siblings().eq(1).text() + "'/></td>";
            a[2].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input2" + id + "' value='" + $("#tr" + id).children().siblings().eq(2).text() + "'/></td>";
            a[3].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input3" + id + "' value='" + $("#tr" + id).children().siblings().eq(3).text() + "'/></td>";
            a[4].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input4" + id + "' value='" + $("#tr" + id).children().siblings().eq(4).text() + "'/></td>";
            a[5].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input5" + id + "' value='" + $("#tr" + id).children().siblings().eq(5).text() + "'/></td>";
            a[6].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input6" + id + "' value='" + $("#tr" + id).children().siblings().eq(6).text() + "'/></td>";
            a[7].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input7" + id + "' value='" + $("#tr" + id).children().siblings().eq(7).text() + "'/></td>";
            a[8].innerHTML = "<td ><input class='form-control bg-light border-1 small' type='text' id='input8" + id + "' value='" + $("#tr" + id).children().siblings().eq(8).text() + "'/></td>";
            //点击修改后将编辑改为保存和取消
            a[9].innerHTML = "" +
                "<td><div class='am-btn-toolbar'> <div class='am-btn-group am-btn-group-xs'>" +
                "<button class='btn btn-success btn-icon-split' type='button' onclick='save(" + id + ")'> " +
                "<span class=\"icon text-white-50\"><i class=\"fas fa-check\"></i></span>" +
                "</button>" + '&nbsp;' +
                "<button class='btn btn-secondary btn-icon-split' type='button' onclick='back()'> " +
                "<span class='icon text-white-50'><i class=\"fas fa-arrow-left\"></i></span></button></div></div></td>";
        }

        //编辑保存操作
        function save(id) {//未定义是可能就是id重复了
            var name = $("#input1" + id).val();
            var director = $("#input2" + id).val();
            var actor = $("#input3" + id).val();
            var type = $("#input4" + id).val();
            var country = $("#input5" + id).val();
            var language = $("#input6" + id).val();
            var score = $("#input7" + id).val();
            var description = $("#input8" + id).val();

            if (name == "") {
                $(".errorMsg").text("电影名称不能为空");
                return false;
            }
            if (director == "") {
                $(".errorMsg").text("导演不能为空");
                return false;
            }
            if (actor == "") {
                $(".errorMsg").text("主演不能为空");
                return false;
            }
            if (type == "") {
                $(".errorMsg").text("类型不能为空");
                return false;
            }
            if (country == "") {
                $(".errorMsg").text("国家不能为空");
                return false;
            }
            if (language == "") {
                $(".errorMsg").text("语言不能为空");
                return false;
            }
            if (score == "") {
                $(".errorMsg").text("评分不能为空");
                return false;
            }
            if (description == "") {
                $(".errorMsg").text("描述不能为空");
                return false;
            }
            window.location.href = "${pageContext.request.contextPath}/upfilm?ISDN=" + id + "&name=" + name + "&director=" + director + "&actor=" + actor + "&type=" + type + "&country=" + country + "&language=" + language + "&score=" + score + "&description=" + description;
        }

        function back() {
            window.location.href = "${pageContext.request.contextPath}/modfilm";
        }

        function del(id) {
            window.location.href = "${pageContext.request.contextPath}/delfilm?ISDN=" + id;
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
            top: 9%;
            left: 25%;
            width: 45%;
            height: 75%;
            padding: 20px;
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
            font: 15px Arial, Helvetica, sans-serif;
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

        .smart-green input[type="text"],
        .smart-green textarea, .smart-green select {
            color: #555;
            height: 30px;
            line-height: 15px;
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

        .smart-green textarea {
            height: 100px;
            padding-top: 10px;
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
                <!--添加按钮 -->
                <div style="float: right" class="btn btn-primary btn-icon-split">
                    <button class="icon text-white-50"
                            onclick="document.getElementById('light').style.display='block';document.getElementById('fade').style.display='block'">
                        <i class="fas fa-plus   "></i>
                        <span class="text">添加电影</span>
                    </button>
                </div>
                <!-- 操作提示 -->
                <div style="float: right" class="col-lg-2 mb-1 alert alert-success alert-dismissible fade show">
                    <button type="button" class="close" data-dismiss="alert">&times;</button>
                    <span>
                        <%=request.getAttribute("films1") == null ? "" : request.getAttribute("films1")%>
                    </span>
                </div>
                <!-- 页标题 -->
                <h1 class="h3 mb-2 text-gray-800">电影信息管理</h1>
                <p class="mb-3">对电影的具体信息进行增删查改的操作.</p>
                <!-- 数据表格 -->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>影名</th>
                                    <th>导演</th>
                                    <th>主演</th>
                                    <th>类型</th>
                                    <th>地区</th>
                                    <th>语言</th>
                                    <th>评分</th>
                                    <th>简介</th>
                                    <th>操作</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:forEach items="${films}" var="f">
                                    <tr id="tr${f.ISDN}">
                                        <td>${f.ISDN}</td>
                                        <td>${f.name}</td>
                                        <td>${f.director}</td>
                                        <td>${f.actor}</td>
                                        <td>${f.type}</td>
                                        <td>${f.country}</td>
                                        <td>${f.language}</td>
                                        <td>${f.score}</td>
                                        <td>${f.description}</td>
                                        <td>
                                            <div class="am-btn-toolbar">
                                                <div class="am-btn-group am-btn-group-xs">
                                                    <!-- 编辑 -->
                                                    <button class="btn btn-info btn-icon-split" title="编辑"
                                                            type="button" onclick="editFile(${f.ISDN})" data->
                                                                <span class="icon text-white-50">
                                                                    <i class="fas fa-pen"></i>
                                                                </span>
                                                    </button>
                                                    <!-- 删除 -->
                                                    <button class="btn btn-danger btn-icon-split" title="删除"
                                                            type="button" onclick="del(${f.ISDN})">
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

<%--<!-- 修改确认 -->--%>
<%--<div class="wrap-dialog dialog-hide" id="dialog-hide">--%>
<%--    <div class="dialog" id="dialog">--%>
<%--        <a class="closeBtn" id="closeBtn">X</a>--%>
<%--        <div class="dialog-header">--%>
<%--            <span class="dialog-title">提示</span>--%>
<%--        </div>--%>
<%--        <div class="dialog-body">--%>
<%--            <span class="dialog-message" id="dialog-message">确定要修改吗？</span>--%>
<%--        </div>--%>
<%--        <div class="dialog-footer">--%>
<%--            <input type="button" class="dialog-btn" id="dialog-confirm" value="确定">--%>
<%--            <input type="button" class="dialog-btn dialog-ml50" id="dialog-cancel" value="取消">--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>

<!--添加面板-->

<div id="light" class="white_content">
    <form method="post" action="${pageContext.request.contextPath}/addfilm" class="smart-green" id="f1"
          enctype="multipart/form-data">
        <label><span>电影编号:</span>
            <input class="form-control bg-light border-1 small" id="title" type="text" name="ISDN"/>
        </label>
        <label><span>电影名称:</span>
            <input class="form-control bg-light border-1 small" id="name" type="text" name="name"/>
        </label>
        <label><span>电影编导:</span>
            <input class="form-control bg-light border-1 small" id="director" type="text" name="director"/>
        </label>
        <label><span>电影主演:</span>
            <input class="form-control bg-light border-1 small" id="actor" type="text" name="actor"/>
        </label><br>
        <label><span>电影类型:</span>
            <select style="font-size: 16px;" name="type">
                <c:forEach items="${alltypes}" var="types">
                    <option value="${types.type}">${types.type}</option>
                </c:forEach>
            </select>
        </label>
        <label><span>电影国家:</span>
            <input class="form-control bg-light border-1 small" id="country" type="text" name="country"/>
        </label>
        <label><span>电影语言:</span>
            <input class="form-control bg-light border-1 small" id="language" type="text" name="language"/>
        </label>
        <label><span>电影评分:</span>
            <input class="form-control bg-light border-1 small" id="score" type="text" name="score"/>
        </label>
        <label><span>上传照片:</span><br>
            <input class="d-none d-sm-inline-block btn btn-sm plusbtn-primary shadow-sm" type="file" name="file"
                   accept="image/*"/>
            <i class="fas fa-upload fa-sm text-white-50"></i>
        </label>
        <label><span>上传视频:</span><br>
            <%--                <input id="href" type="text" name="href"  />--%>
            <input class="d-none d-sm-inline-block btn btn-sm plusbtn-primary shadow-sm" type="file" name="file1"
                   accept="video/*"/>
        </label>
        <label><span>电影描述 :</span>
            <textarea class="form-control bg-light border-1 small" id="description" name="description"></textarea>
        </label>
        <br>
        <label>
            <span>&nbsp;&nbsp;&nbsp;&nbsp;</span>
            <button class="btn btn-success btn-icon-split" type="button" id="btn" onclick="s1()">
                <span class="icon text-white-50">
                       <i class="fas fa-check"></i>
                    </span>
            </button>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger btn-icon-split" type="button" class="button" value="关闭"
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
<script src="../vendor/datatables/jquery.dataTables.min.js" charset="UTF-8"></script>
<script src="../vendor/datatables/dataTables.bootstrap4.min.js" charset="UTF-8"></script>
<!-- 页面级自定义脚本 -->
<script src="../js/demo/datatables-demo.js" charset="UTF-8"></script>
</body>
</html>
