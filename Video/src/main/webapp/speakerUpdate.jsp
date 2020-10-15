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
				<h2>修改主讲人</h2>
		</div>
	</div>

	<div class="container" style="margin-top: 20px;">

		<form id="infoForm" class="form-horizontal" action="speakerUpdate" method="post" >
			<input name="speakerId" value="${speaker.speakerId }" type="hidden">
			<div class="form-group">
			    <label for="subjectId" class="col-sm-2 control-label">姓名</label>
			    <div class="col-sm-10">
					<input class="form-control" name="speakerName" id="speakerName" placeholder="主讲人姓名" type="text" value="${speaker.speakerName }">
			    </div>
			 </div>
			
			<div class="form-group">
				<label for="subjectTitle" class="col-sm-2 control-label">职位</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerJob" id="speakerJob" placeholder="职位" type="text" value="${speaker.speakerJob }">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">头像地址</label>
				<div class="col-sm-10">
					<input class="form-control" name="headImgUrl" id="headImgUrl" placeholder="头像地址" type="text" value="${speaker.headImgUrl }">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<input class="form-control" name="speakerDesc" id="speakerDesc" placeholder="简介" type="text" value="${speaker.speakerDesc }">
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