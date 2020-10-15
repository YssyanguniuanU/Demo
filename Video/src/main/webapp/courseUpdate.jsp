<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0055)http://localhost:8080/Voids/Course/Courseupdate.do?id=6 -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!--<base href="http://localhost:8080/Voids/">--><base href=".">
<!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
<title>智游教育</title>

<link href="./课程修改_files/bootstrap.css" rel="stylesheet">

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

<script type="text/javascript">
	window.onload = function(){
	    change();
	}
	function change(){
		document.getElementById("subjectId")[${course.subjectId-1}].selected=true;
	}
</script>

</head>

<body>

	<div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
		<div class="container">	
				<h2>修改课程</h2>
		</div>
	</div>

	<div class="container" style="margin-top: 20px;">

		<form id="infoForm" action="courseUpdate" class="form-horizontal" >

			<input name="courseId" value="${course.courseId }" type="hidden">
			
			<div class="form-group">
			    <label for="subjectId" class="col-sm-2 control-label">所属学科</label>
			    <div class="col-sm-10">
									
					<select name="subjectId" id="subjectId" class="form-control">
						<c:forEach items="${subjectList }" var="subject">
							<option value="${subject.subjectId }">${subject.subjectName }</option>
						</c:forEach>
					</select>

			    </div>
			  </div>
			<div class="form-group">
				<label for="subjectTitle" class="col-sm-2 control-label">标题</label>
				<div class="col-sm-10">
					<input class="form-control" name="courseTitle" id="courseTitle" value="${course.courseTitle }" type="text">
				</div>
			</div>
			<div class="form-group">
				<label for="courseDesc" class="col-sm-2 control-label">简介</label>
				<div class="col-sm-10">
					<textarea class="form-control" id="courseDesc" name="courseDesc" rows="3">${course.courseDesc }</textarea>
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
<script src="./课程修改_files/jquery-1.js.下载"></script>
<script src="./课程修改_files/bootstrap.js.下载"></script>
<script src="./课程修改_files/confirm.js.下载"></script>
<script src="./课程修改_files/jquery.js.下载"></script>
<script src="./课程修改_files/message_cn.js.下载"></script>

<div id="modal-background" class=""></div><div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1"><div class="modal-dialog modal-undefined"><div class="modal-content"><div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button"><span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div><div id="modal-body" class="modal-body"> Modal Message </div><div id="modal-footer" class="modal-footer"></div></div></div></div><div id="modal-background" class=""></div></body></html>