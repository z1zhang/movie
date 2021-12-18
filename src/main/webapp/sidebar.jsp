<%--
  Created by IntelliJ IDEA.
  User: zhang
  Date: 2021/11/18
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>侧边栏</title>
	<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">
	<link href="css/sb-admin-2.min.css" rel="stylesheet">
</head>
<body>
<!-- 侧边栏 -->
<ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	<!-- 侧边栏 - Logo -->
	<a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.jsp">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-film"></i>
		</div>
		<div class="sidebar-brand-text mx-3">电影后台<sup>管理系统</sup></div>
	</a>
	<!-- 分隔线 -->
	<hr class="sidebar-divider my-0">
	<!-- 导航项目 - 仪表板 -->
	<li class="nav-item active">
		<a class="nav-link" href="${pageContext.request.contextPath}/main.jsp">
			<i class="fas fa-fw fa-tachometer-alt"></i>
			<span>仪表盘</span></a>
	</li>
	<!-- 分隔线 -->
	<hr class="sidebar-divider">
	<!-- 一级菜单 -->
	<div class="sidebar-heading">
		全局设置
	</div>
	<!-- 导航项目 - 电影页面折叠菜单 -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true" aria-controls="collapseTwo">
			<i class="fas fa-fw fa-film"></i>
			<span>电影管理</span>
		</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">选项:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/allfilm">电影展示</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/modfilm">电影信息管理</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/alltypes">电影类别管理</a>
			</div>
		</div>
	</li>
	<!-- 导航项目 - 新闻页面折叠菜单 -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities"
		   aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-newspaper"></i>
			<span>新闻管理</span>
		</a>
		<div id="collapseUtilities" class="collapse" aria-labelledby="headingUtilities"
			 data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">选项:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/news/NewsAdd.jsp">新闻上传</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/allnews">新闻信息管理</a>
			</div>
		</div>
	</li>
	<!-- 导航项目 - 分类页面折叠菜单 -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseType"
		   aria-expanded="true" aria-controls="collapseUtilities">
			<i class="fas fa-fw fa-tags"></i>
			<span>分类管理</span>
		</a>
		<div id="collapseType" class="collapse" aria-labelledby="headingType" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">选项:</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/alltypes">分类管理</a>
			</div>
		</div>
	</li>
	<!-- 分隔线 -->
	<hr class="sidebar-divider">
	<!-- 一级菜单 -->
	<div class="sidebar-heading">
		系统设置
	</div>
	<!-- 导航项目 - 用户页面折叠菜单 -->
	<li class="nav-item">
		<a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages"
		   aria-expanded="true" aria-controls="collapsePages">
			<i class="fas fa-fw fa-user">
			</i>
			<span>用户管理</span>
		</a>
		<div id="collapsePages" class="collapse" aria-labelledby="headingPages" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">权限</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/404.jsp">404</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/register.jsp">添加管理员</a>
				<div class="collapse-divider"></div>
				<h6 class="collapse-header">个人信息</h6>
				<a class="collapse-item" href="${pageContext.request.contextPath}/user/UserDetail.jsp">修改信息</a>
				<a class="collapse-item" href="${pageContext.request.contextPath}/user/PwdUpdate.jsp">修改密码</a>
			</div>
		</div>
	</li>
	<!-- 分隔线 -->
	<hr class="sidebar-divider d-none d-md-block">
	<!-- 侧边栏切换器（侧边栏） -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>
</ul>
</body>
</html>
