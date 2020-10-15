<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0084)http://localhost:8080/Voids/user/VideoGo.do?id=218&subjectName=WEB%E5%89%8D%E7%AB%AF -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
 	<script src="jquery/jquery.js"></script>
 	<script src="jquery/jquery.validate.min.js"></script>
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
    <!--<base href="http://localhost:8080/Voids/">--><base href=".">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <script src="jquery/jquery.js"></script>
<link rel="stylesheet" href="./视频播放_files/base.css">
<link rel="stylesheet" href="./视频播放_files/css.css">
<link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png" type="image/png">
    <link href="./视频播放_files/video-js.css" rel="stylesheet" type="text/css">
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>

	<style type="text/css">
    
    	input.error { border: 1px solid red; }
		label.error {
			font-weight: bold;
			color: red;
		}
    
    </style>

</head>

<body class="w100" style="padding-top: 0px;">




<header>
	<div class="container">
		<span>欢迎来到IT培训的黄埔军校——智游教育！</span>

			
			<div id="userBlock" style="float:right"> 
		      <c:if test="${USER==null }">
		          <a onclick="z()">注册</a> 
		       	  <a onclick="w()">登录</a> 
		       </c:if>
		      <c:if test="${USER!=null }">
		       	  <a href="userExit?tag=1">退出</a>
				  <a href="userShow.jsp">${USER.email }</a> 
		      </c:if> 
		    </div>
					
		<a onclick="JavaScript:addFavorite2()"><img src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/sc.png" draggable="false">加入收藏</a>
		<a target="_blank" onclick="l()"><img src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/we.png" draggable="false">后台管理</a>
		<a class="color_e4"><img src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/phone.png" draggable="false"> 0371-88888598　　4006-371-555</a>
	
	</div>
</header>

<div>
    <!--面包屑导航-->
    <div class="container mian-nav"><a href="index.jsp" style="color:blue">公开课</a>/<a href="subjectCourseAndVideoo?subjectId=${videooPlay.course.subjectId}" style="color:blue">${subject.subjectName }</a></div>
    <input id="videoId" value="246" type="hidden">
    <div id="content">

<div class="intro">
	<div class="container">
		<div class="v-intro">
			<div class="left">
			
				<c:if test="${USER == null }">
					<b style="color:red">请先登录才能查看视频</b>
					<video id="videoPlayer" src="${videooPlay.videoUrl }" class="video-js vjs-default-skin" height="280" width="627">
					</video>
				</c:if>
				
				<c:if test="${USER != null }">
					<video id="videoPlayer" src="${videooPlay.videoUrl }" class="video-js vjs-default-skin" controls="controls" poster="${videooPlay.imageUrl }" height="280" width="627">
					</video>
				</c:if>
				
			</div>

			<div class="right">
				<p class="right-title">${videooPlay.title }</p>
				<div class="avatar">
					<span style="background-image: url(${videooPlay.speaker.headImgUrl})"></span>
					<p><b>讲师：${videooPlay.speaker.speakerName }</b><br><i>${videooPlay.speaker.speakerDesc }</i></p>
				</div>
				<p class="video-intro">
					<span>本节内容：</span>${videooPlay.detail }
				</p>
			</div>
		</div>

		<div class="kcjs">
			<p class="title">课程介绍</p>
			<p class="content">${videooPlay.course.courseDesc }</p>
		</div>

	</div>
</div>
<!--目录-->
<div class="catalog">
	<div class="container">
		<p class="title">目录</p>

			<c:forEach items="${videooList }" var="videoo">
			
				<div class="chapter">
				<p class="biaoti"><a href="getVideoList?videooId=${videoo.videooId }&courseId=${videoo.course.courseId}">${videoo.title }</a></p>
				<p class="lecturer">${videoo.detail }</p>
				<p class="lecturer">讲师：${videoo.speaker.speakerName }</p>
					<div class="v-info">
						<span class="count"><img src="./视频播放_files/count.png" alt="">${videoo.playNum }</span>
						<span class="duration"><img src="./视频播放_files/player.png" alt="">${videoo.time }</span>
					</div>
				</div>
			
			</c:forEach>

	</div>
</div></div>



</div>
    
    
<!--页脚-->
<footer>
	<ul>
		<li>
			<img src="./视频播放_files/footer_logo.png" alt="" draggable="false">
		</li>
		<li class="mt25">
			<h3>各校区地址</h3>
			<ul>
				<li>总部地址<br>中国-郑州经济技术开发区河南省通信产业园六层</li>
				<li>郑州校区一<br>中国-郑州经济技术开发区第一大街与经北一路</li>
				<li>郑州校区二<br>中国-郑州经济技术开发区第四大街经开人才市场七楼</li>
				<li>郑州校区三<br>中国-郑州经济技术开发区第八大街河南省留学生创业园九层、十层</li>
				<li>西安分校<br>中国-西安莲湖区　联系人：梁老师 13201570801</li>
			</ul>
		</li>
		<li class="mt25">
			<h3>联系我们</h3>
			<ul id="foo_icon">
				<li>中国-郑州经济技术开发区经北三路河南通信产业园六层</li>
				<li>e-mail:zy@zhiyou100.com</li>
				<li>电话:4006-371-555 0371-88888598</li>
				<li class="erwei">
					<br>
					<div>
						<img class="weixin" src="./视频播放_files/a.png" alt="" draggable="false">
						<img class="weibo" src="./视频播放_files/a_002.png" alt="" draggable="false">
					</div>
				</li>
			</ul>
		</li>
	</ul>
	<div class="record">智游教育 © 豫ICP备17000832号-1 　河南智游臻龙教育科技有限公司</div>
</footer>


<!--登录注册弹出框-->
<div class="mask hidden" id="login">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="loginForm" action="adminLogin">
				<h3>管理员登录</h3>
				<input id="username" placeholder="用户名" name="username" type="text">
				<input id="password" placeholder="请输入密码" name="password" type="text">
				<div id="forget">
					<a href="http://localhost:8080/video/front/user/forgetPassword.action">忘记密码？</a>
				</div>
				<input value="登　录" type="submit">
			</form>
		</div>
		<div class="mask_content_footer">
			<span onclick="p()" id="login_close">关　闭</span>
		</div>
	</div>
</div>

<!--登录注册弹出框-->
<div class="mask hidden" id="loginu" >
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="userLoginForm" action="userLogin" ><!-- onsubmit="return qq()" -->
				<h3>快速登录</h3>
				<input id="loginEmail" placeholder="请输入邮箱" name="email" type="email"/>
				<input id="loginPassword" placeholder="请输入密码" name="password" type="password"/><br>
				<b id="message" style="color:red"></b>
				<!-- <div id="forget">
					<a href="http://localhost:8080/video/front/user/forgetPassword.action">忘记密码？</a>
				</div> -->
				<input onclick="return commitLogin()" value="登　录" type="submit">
			</form>
		</div>
		<div class="mask_content_footer">
			<span onclick="t()" id="login_close">关　闭</span>
		</div>
	</div>
</div>

<div class="mask hidden" id="reg">
	<div class="mask_content">
		<div class="mask_content_header">
			<img src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/logo.png" alt="" class="ma">
		</div>
		<div class="mask_content_body">
			<form id="regForm" action="userRegister" method="post">
				<h3>新用户注册</h3>
				<input type="hidden" name="flag" id="flag" value="2" />
				<input id="regEmail" placeholder="请输入邮箱" name="email" type="email"><span id="emailMsg"></span>
				<input id="regPsw" placeholder="请输入密码" name="password" type="password"><span id="passMsg"></span>
				<input id="regPswAgain" placeholder="请再次输入密码" name="psw_again" type="password"><span id="aginMsg"></span>
				<%-- <div id="yzm" class="form-inline">
					<input name="yzm" style="width: 45%; display: inline-block;" type="text">
					<div id="v_container" style="width: 45%;height: 40px;float:right;"><canvas id="verifyCanvas" width="100" height="38" style="cursor: pointer;">您的浏览器版本不支持canvas</canvas><canvas id="verifyCanvas" width="100" height="38" style="cursor: pointer;">您的浏览器版本不支持canvas</canvas></div>
				</div> --%>
				<input id="regBtn" onclick="return commitRegForm()" value="注　册" type="submit">
			</form>
		</div>
		<div class="mask_content_footer">
			<span onclick="q()" id="reg_close">关　闭</span>
		</div>
	</div>
</div>


    
<script src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/jquery-1.js.下载"></script>
<script src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/gVerify.js.下载"></script>
<script src="./在线公开课-智游教育_java_大数据_HTML5_python_UI_PHP视频教程_files/index.js.下载"></script>

</body>

<script type="text/javascript">

	function commitLogin(){
		/* console.log(123) */
	   var email =$("#loginEmail").val();
	   var password =$("#loginPassword").val();
	   if(null!=email && email!="" && null!=password && password!=""){
		   var params=$("#userLoginForm").serialize();
	        console.log(params)
	        // post要小写
	        $.post("userLogin",params,function(data){
		       /*   var json = eval(data) */
		       /*  console.log(json.email) */
                if(data=='success'){
                	alert("登录成功");
                    document.location.reload();
                }
                else{
                	alert("账号或密码错误");
               	    //$("#message").text("账号或密码错误");
               	    $("#loginEmail").val("");
                	$("#loginPassword").val("");
                }
	        },"json");
	        
	        return false;
	   }
	   return false;
	}
	
	function commitRegForm(){
		 var regEmail =$("#regEmail").val();
		 var regEmailError = $("#regEmail-error").html();
		 var regPsw =$("#regPsw").val();
		 var regPswError = $("#regPsw-error").html();
		 var regPswAgain =$("#regPswAgain").val();
		 var regPswAgainError = $("#regPswAgain-error").html();
		 var emailMsg = $("#emailMsg").html();
		 
		   if(emailMsg !="该邮箱已被注册" && (regEmailError==null || regEamilError=="") && (regPswError==null || regPswError=="") 
				   && (regPswAgainError==null || regPswAgainError=="") && null!=regEmail && regEmail!="" && 
				   null!=regPsw && regPsw!="" && null!=regPswAgain && regPswAgain!=""){
			   var params=$("#regForm").serialize();
		        console.log(params)
		        // post要小写
		        $.post("userRegister",params,function(data){
			       /*   var json = eval(data) */
			       /*  console.log(json.email) */
	                if(data=='success'){
	                	alert("注册成功");
	                    document.location.reload();
	                } else{
	                	alert("账号或密码错误");
	                }
		        },"json");
		        return false;
		   }
		   return false;
	 }

</script>

<script type="text/javascript">

$("#regEmail").blur(function(){
	$.ajax({
		type:"POST",
		url:"userRegister?flag=1",
		data:{
			email:$("#regEmail").val()
		},
		success:function(data){
			if(data=='no' && $("#regEmail").val()!="") {
				document.getElementById("emailMsg").innerHTML = "该邮箱可以使用";
				$("#emailMsg").css('color','green');
				
			} else if(data=='yes' && $("#regEmail").val()!=""){
				document.getElementById("emailMsg").innerHTML = "该邮箱已被注册";
				$("#emailMsg").css('color','red');
				 
			} else {
				$("#emailMsg").text("");
				
			}
		}
	})
})

	$().ready(function(){
		$("#regForm").validate({
			/*校验分两部分，第一部分是校验规则*/
			rules:{
				email:{
					required:true,
					email:true
				},
				password:{
					required:true,
					minlength:4
				},
				psw_again:{
					required:true,
					equalTo:"#regPsw"
				}
			},
			messages:{
				email:{
					required:"邮箱不能为空",
					email:"邮箱格式错误xxx@xxx"
				},
				password:{
					required:"密码不能为空",
					minlength:"密码最低不能少于4位"
				},
				psw_again:{
					required:"确认密码不能为空",
					equalTo:"两次密码不一样"
				}
			}
		});
	})
	
</script>


<script type="text/javascript">
var u=document.getElementById('loginu');

var o=document.getElementById('login');
var x=document.getElementById('reg');


function w(){
	 u.className="mask";
}
function t(){
	 u.className='mask hidden';
	 
 }
 
function l(){
	
	 o.className="mask";
}
function p(){
	 o.className='mask hidden';
	 
}

 function z(){
	 x.className="mask";
 }
 function q(){
	 x.className="mask hidden";
 }

</script>

<input type="hideen" id="videooId" value="${videooPlay.videooId }">

    
<script src="./视频播放_files/jquery-1.js.下载"></script>
<script src="./视频播放_files/gVerify.js.下载"></script>
<script src="./视频播放_files/index.js.下载"></script>

<script src="./视频播放_files/video.js.下载"></script>
   
 <script type="text/javascript">
	 var myVid=document.getElementById("videoPlayer");
	 //myVid.play();
	 //当播放结束使用ajax传递数据
	 myVid.addEventListener("ended", function()
	   {
		 $.ajax({
				type: "POST",
				url: "addPlayNum",
				data: {
					videooId:$("#videooId").val()
				},
				success: function(msg){
				if(msg=="success"){
					alert("播放完毕");
				}
			}
	   	}
	 	);
	   })
		
		
 </script>



</body></html>