<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0052)http://localhost:8080/Voids/controller/courseShow.do -->
<html>
	<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<!--<base href="http://localhost:8080/Voids/">--><base href=".">
		
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>智游教育</title>
		
<link href="./后台课程展示_files/bootstrap.css" rel="stylesheet">

<script src="./后台课程展示_files/jquery-1.js.下载"></script>
<script src="./后台课程展示_files/bootstrap.js.下载"></script>
<script src="./后台课程展示_files/confirm.js.下载"></script>
<script src="./后台课程展示_files/jquery.js.下载"></script>
<script src="./后台课程展示_files/message_cn.js.下载"></script>

		<style type="text/css">
		th {
			text-align: center;
		}
		</style>
	</head>

	<body>
<nav class="navbar-inverse">
	<div class="container">
		
		<div class="navbar-header">
			<a class="navbar-brand">视频管理系统</a>
		</div>

		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-9">
			<ul class="nav navbar-nav">
				<li><a onclick="iframe.src='videooShow'">视频管理</a></li>
				<li><a onclick="iframe.src='speakerShow'">主讲人管理</a></li>
				<li><a onclick="iframe.src='courseShow'">课程管理</a></li>
			</ul>
			<p class="navbar-text navbar-right">
				<span>${ADMIN.username }</span>&nbsp;&nbsp;<a  class="navbar-link" href="adminExit">退出</a>
			</p>
		</div>
		<!-- /.navbar-collapse -->

	</div>
	<!-- /.container-fluid -->
</nav>
<div style="width: 100%; height: 100%">
	<iframe id="iframe" style="width:100%;height:655px;frameborder:0; scrolling:no;top:0;left:0" src="welcome.html">
    </iframe>
</div>
	
</body>


</html>