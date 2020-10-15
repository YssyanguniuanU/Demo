<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0047)http://localhost:8080/Voids/Course/addCourse.do -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<base href="http://localhost:8080/Voids/">--><base href=".">


<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>智游教育</title>

<link href="./课程添加_files/bootstrap.css" rel="stylesheet">

<style type="text/css">
.col-md-1 {
	padding-top: 20px;
}

.a1 {
	color: gray;
}

b {
	float: right;
}
</style>



</head>

<body>

	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">
				<h2>添加视频信息</h2>
		</div>
	</div>

	<div class="container" style="margin-top: 20px;">

		<form id="infoForm" class="form-horizontal" action="videooAdd" method="post" >
			<div class="form-group">
			    <label for="subjectId" class="col-sm-2 control-label">视频标题</label>
			    <div class="col-sm-10">
					<input class="form-control" name="title" id="title" placeholder="视频标题" type="text">
			    </div>
			 </div>
			
			<div class="form-group">
				<label for="subjectTitle" class="col-sm-2 control-label">主讲人</label>
				<div class="col-sm-10">
					<select name="speakerId" id="speakerId" class="form-control">
						<c:forEach items="${speakerList }" var="speaker">
							<option value="${speaker.speakerId}">${speaker.speakerName }</option>
						</c:forEach> 
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">所属课程</label>
				<div class="col-sm-10">
					<select name="courseId" id="courseId" class="form-control">
						<c:forEach items="${courseList }" var="course">
							<option value="${course.courseId}">${course.courseTitle }</option>
						</c:forEach> 
					</select>
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">视频时长（秒）</label>
				<div class="col-sm-10">
					<input class="form-control" name="time" id="time" placeholder="视频时长" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">视频播放地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="videoUrl" id="videoUrl" placeholder="视频播放地址" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">封面图片地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="imageUrl" id="imageUrl" placeholder="封面图片地址" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">视频详情介绍</label>
				<div class="col-sm-10">
					<input class="form-control" name="detail" id="detail" placeholder="视频信息介绍" type="text">
				</div>
			</div>
			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<button type="submit" class="btn btn-default">保存</button>
				</div>
			</div>
		</form>
	</div>

	<!-- å¦æIEçæ¬å°äº9ï¼å è½½ä»¥ä¸js,è§£å³ä½çæ¬å¼å®¹é®é¢ -->
<!--[if lt IE 9]>
<script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
<script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->
<script src="./课程添加_files/jquery-1.js.下载"></script>
<script src="./课程添加_files/bootstrap.js.下载"></script>
<script src="./课程添加_files/confirm.js.下载"></script>
<script src="./课程添加_files/jquery.js.下载"></script>
<script src="./课程添加_files/message_cn.js.下载"></script>

<div id="modal-background" class=""></div><div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1"><div class="modal-dialog modal-undefined"><div class="modal-content"><div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button"><span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div><div id="modal-body" class="modal-body"> Modal Message </div><div id="modal-footer" class="modal-footer"></div></div></div></div><div id="modal-background" class=""></div></body></html>