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
		
	<script type="text/javascript">
		window.onload = function(){
		    change();
		}
		function change(){
			document.getElementById("speakerId")[${Videoo.speakerId}].selected=true;
			document.getElementById("courseId")[${Videoo.courseId}].selected=true;
		}
	</script>
		
	</head>

	<body>
    
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
	  <div class="container">
	          <h2>视频管理</h2>
	  </div>
	</div>
	<form action="videooShow">
			<select name="speakerId" id="speakerId">
				<option value="">--讲师--</option>
				<c:forEach items="${speakerList }" var="speaker">
					<option value="${speaker.speakerId}">${speaker.speakerName }</option>
				</c:forEach>
			</select>
			<select name="courseId" id="courseId">
				<option value="">--课程--</option>
				<c:forEach items="${courseList }" var="course">
					<option value="${course.courseId}">${course.courseTitle }</option>
				</c:forEach>
			</select>
			<input type="hidden" name="tag" value="2">
			<input type="submit" value="搜索">
			<a href="videooShow">返回首页</a>
	</form>
	<form action="videooDeleteAll">
	<div class="container">
	    <button onclick="showAddPage()" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      添加
		</button>
		
		<button onclick="deleteAll()" type="submit" id="btn" class="btn btn-info dropdown-toggle">
		      批量删除
		</button>
		
	</div>
	
	<div class="container" style="margin-top: 20px;">
		
		<table class="table table-bordered table-hover" style="text-align: center;table-layout:fixed;">
      <thead>
        <tr class="active">
          <th><input type="checkbox" id="all"></th>
          <th>序号</th>
          <th style="width: 13%">标题</th>
          <th style="width: 15%">所属学科</th>
          <th style="width: 35%">介绍</th>
          <th style="width: 10%">讲师</th>
          <th>时长</th>
          <th style="width: 8%">播放次数</th>
          <th>编辑</th>
          <th>删除</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${videooList }" var="videoo">
      		<tr>
	          <td><input type="checkbox" name="deleteBox" value="${videoo.videooId }"></td>
	          <td>${videoo.videooId }</td>
	          <td>${videoo.title }</td>
	          <td>${videoo.course.courseTitle }</td>
	          <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${videoo.detail }</td>
	          <td>${videoo.speaker.speakerName }</td>
	          <td>${videoo.time }</td>
	          <td>${videoo.playNum }</td>
	          <td><a href="videooById?id=${videoo.videooId }">✎</a></td>
	          <td><a href="videooDeleteAll?id=${videoo.videooId }" >X</a></td>
	        </tr>
      </c:forEach>
        <tr><td colspan="10">
	        <a href="videooShow?page=${pageInfo.firstPage}&tag=${tag}">首页</a>
			<c:if test="${pageInfo.hasPreviousPage == true}">
				<a href="videooShow?page=${pageInfo.prePage}&tag=${tag}">上一页</a>
			</c:if>
			<c:if test="${pageInfo.hasPreviousPage == false }">
				上一页
			</c:if>
			
			<c:forEach items="${pageInfo.navigatepageNums}" var="ye">
				<a href="videooShow?page=${ye}">${ye}</a>
			</c:forEach>
			
			<c:if test="${pageInfo.hasNextPage == true}">
				<a href="videooShow?page=${pageInfo.nextPage}&tag=${tag}">下一页</a>
			</c:if>
			<c:if test="${pageInfo.hasNextPage == false }">
				下一页
			</c:if>
			<a href="videooShow?page=${pageInfo.lastPage}&tag=${tag}">末页</a> 
			<br>
			共有${pageInfo.total}条数据，共${pageInfo.pages}页，当前为${pageInfo.pageNum}页
        </td></tr>
        </tbody>
      </table>
	</div>
	  </form>
		
	


	<script type="text/javascript">
		function showAddPage(){
			location.href="videoGetSpeakerAndCourse";
		}
		var allInput = document.getElementById("all");
		var inputs = document.getElementsByName("deleteBox");
		allInput.onclick = function(){
			for(var i = 0; i < inputs.length; i++){
				inputs[i].checked = allInput.checked;
			}
		}
		for(var i = 0; i < inputs.length; i++){
			inputs[i].onclick = function(){
				allInput.checked=false;
			}
		}
	</script>
<div id="modal-background" class=""></div><div id="confirm-modal" class="modal fade role=" dialog"="" tabindex="-1"><div class="modal-dialog modal-undefined"><div class="modal-content"><div class="modal-header"><button id="modal-upper-close" class="close modal-close" aria-label="Close" type="button"><span aria-hidden="true">×</span></button><h4 id="modal-title" class="modal-title">Modal Title</h4></div><div id="modal-body" class="modal-body"> Modal Message </div><div id="modal-footer" class="modal-footer"></div></div></div></div><div id="modal-background" class=""></div></body></html>