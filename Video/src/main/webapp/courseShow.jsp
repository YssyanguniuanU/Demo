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
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
		    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<link href="./后台课程展示_files/bootstrap.css" rel="stylesheet">
<script src="jquery/jquery.js"></script>
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
    
    <div class="jumbotron" style="padding-top: 15px;padding-bottom: 15px;">
	  <div class="container">
	          <h2>课程管理</h2>
	  </div>
	</div>
	<form action="courseShow">
			<input type="search" name="value">
			<select name="key">
				<option value="courseTitle">课程名</option>
				<option value="courseDesc">课程描述</option>
			</select>
			<input type="hidden" name="tag" value="2">
			<input type="submit" value="搜索">
			<a href="courseShow">返回首页</a>
	</form>
	<form action="courseDeleteAll">
	<input type="hidden" name="courseId" id="courseId" value="${course.courseId }"/>
	<div class="container">
	    <button id="add" onclick="location.href='courseGetSubject'" type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
          <th style="width:16%">课程名</th>
          <th style="width:10%">所属学科</th>
          <th style="width:55%">课程描述</th>
          <th>编辑</th>
          <th>删除</th>
        </tr>
      </thead>
      <tbody>
      <c:forEach items="${courseList }" var="course">
      		<tr>
	          <td><input type="checkbox" name="deleteBox" value="${course.courseId }"></td>
	          <td>${course.courseId }</td>
	          <td>${course.courseTitle }</td>
	          <td>${course.subject.subjectName }</td>
	          <td style="overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">${course.courseDesc }</td>
	          <td><a href="courseById?id=${course.courseId }">✎</a></td>
	          <td><a id="delCourse" href="javascript:;" onclick="deleteGe(${course.courseId },this)">X</a></td>
	        </tr>
      </c:forEach>
        <tr><td colspan="7">
	        <a href="courseShow?page=${pageInfo.firstPage}&tag=${tag}">首页</a>
			<c:if test="${pageInfo.hasPreviousPage == true}">
				<a href="courseShow?page=${pageInfo.prePage}&tag=${tag}">上一页</a>
			</c:if>
			<c:if test="${pageInfo.hasPreviousPage == false }">
				上一页
			</c:if>
			
			<c:forEach items="${pageInfo.navigatepageNums}" var="ye">
				<a href="courseShow?page=${ye}">${ye}</a>
			</c:forEach>
			
			<c:if test="${pageInfo.hasNextPage == true}">
				<a href="courseShow?page=${pageInfo.nextPage}&tag=${tag}">下一页</a>
			</c:if>
			<c:if test="${pageInfo.hasNextPage == false }">
				下一页
			</c:if>
			<a href="courseShow?page=${pageInfo.lastPage}&tag=${tag}">末页</a> 
			<br>
			共有${pageInfo.total}条数据，共${pageInfo.pages}页，当前为${pageInfo.pageNum}页
        </td></tr>
        </tbody>
      </table>
    
	</div>
	  </form>
		
	
	<script type="text/javascript">
		//删除一个
		function deleteGe(byid,obj){
			if(window.confirm('你确定要删除吗？')){
				$.ajax({
					type: "POST",
					url: "courseDeleteAll",
					data: "id="+byid,
					success: function(msg){
					if(msg=="success"){
						alert("刪除成功");
						//删除byId的结点
						var tr=obj.parentNode.parentNode;
						var tbody=tr.parentNode;
						tbody.removeChild(tr);
					}else{
						alert("删除失败");
					}
				}
			});
			return true;
			} else {
				//alert("取消");
				return false;
			}
		}
		
	</script>

	<script type="text/javascript">
		//复选框全选
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