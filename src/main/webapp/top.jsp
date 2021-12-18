<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/18
  Time: 16:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="../css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<!-- 顶栏 -->
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

	<!-- 侧边栏切换（顶栏） -->
	<button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
		<i class="fa fa-bars"></i>
	</button>

	<!-- 顶栏搜索栏 -->
	<form class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
		<div class="input-group">
			<input type="text" class="form-control bg-light border-0 small" placeholder="搜索..." aria-label="Search" aria-describedby="basic-addon2">
			<div class="input-group-append">
				<button class="btn btn-primary" type="button">
					<i class="fas fa-search fa-sm"></i>
				</button>
			</div>
		</div>
	</form>

	<!-- 顶栏导航栏 -->
	<ul class="navbar-nav ml-auto">
		<!-- 导航项 - 搜索下拉列表（仅可见 XS） -->
		<li class="nav-item dropdown no-arrow d-sm-none">
			<a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
			   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<i class="fas fa-search fa-fw"></i>
			</a>
			<!-- 下拉菜单 - 消息 -->
			<div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
				 aria-labelledby="searchDropdown">
				<form class="form-inline mr-auto w-100 navbar-search">
					<div class="input-group">
						<input type="text" class="form-control bg-light border-0 small" placeholder="搜索..."
							   aria-label="Search" aria-describedby="basic-addon2">
						<div class="input-group-append">
							<button class="btn btn-primary" type="button">
								<i class="fas fa-search fa-sm"></i>
							</button>
						</div>
					</div>
				</form>
			</div>
		</li>
		<!-- 分隔线 -->
		<div class="topbar-divider d-none d-sm-block"></div>

		<!-- 导航项目 - 用户信息 -->
		<li class="nav-item dropdown no-arrow">
			<a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
			   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
				<span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.user.username} </span>
				<img class="img-profile rounded-circle" src="../img/user/admin.jpg">
			</a>
			<!-- 下拉菜单 - 用户信息 -->
			<div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
				 aria-labelledby="userDropdown">
				<a class="dropdown-item" href="UserDetail.jsp">
					<i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
					个人信息
				</a>
				<a class="dropdown-item" href="#">
					<i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
					设置
				</a>
				<a class="dropdown-item" href="#">
					<i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
					活动日志
				</a>
				<div class="dropdown-divider"></div>
				<a class="dropdown-item" href="${pageContext.request.contextPath}/exit" data-toggle="modal" data-target="#logoutModal">
					<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
					注销
				</a>
			</div>
		</li>
	</ul>
</nav>
</body>
</html>
