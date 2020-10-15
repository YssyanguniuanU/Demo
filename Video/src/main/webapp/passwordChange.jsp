<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- saved from url=(0044)http://localhost:8080/Voids/user/password.do -->
<html><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<script src="jquery/jquery.js"></script>
 	<script src="jquery/jquery.validate.min.js"></script>
    <!-- base href="http://localhost:8080/video/" -->
    <meta name="viewport" content="initial-scale=1, maximum-scale=1, user-scalable=no">
    
        
<!--<base href="http://localhost:8080/Voids/">--><base href=".">
    <meta name="renderer" content="webkit">
    <meta name="keywords" content="Web前端视频教程,大数据视频教程,HTML5视频教程,UI视频教程,PHP视频教程,java视频教程,python基础教程">
    <meta name="description" content="智游教育在线课程视频,为您提供java,python,HTML5,UI,PHP,大数据等学科经典视频教程在线浏览学习,精细化知识点解析,深入浅出,想学不会都难,智游教育,学习成就梦想！">
    <link rel="stylesheet" href="./修改密码_files/base.css">
    <link rel="stylesheet" href="./修改密码_files/profile.css">
    <link rel="icon" href="http://localhost:8080/Voids/static/z/favicon.png" type="image/png">
    <title>在线公开课-智游教育|java|大数据|HTML5|python|UI|PHP视频教程</title>
	<style type="text/css">
		input.error { border: 1px solid red; }
		label.error {
			font-weight: bold;
			color: red;
		}
	</style>
</head>

<body class="w100">

<header>
	<div class="container top_bar clearfix">
		<img src="./修改密码_files/logo.png" alt="智游">
		<div id="tele">
			<span>4006-371-555</span>
			<span>0371-88888598</span>
		</div>
	</div>
	<menu>
		<div class="container clearfix">
			<ul class="clearfix f_left">
				<li><a href="index.jsp">首页</a></li>
				
				<li class="menu_active"><a ">个人中心</a></li>
			</ul>
			
			<div id="user_bar">
				<a>
					<img id="avatar" src="${USER.imgUrl }" alt="" "="">		
				</a>
				<a href="userExit?tag=2">退出</a>
			</div>
		</div>
	</menu>
</header>

   <main>
        <div class="container">
            <h2><a href="userShow.jsp">我的资料</a></h2>
            <div id="profile_tab">
                <ul class="profile_tab_header f_left clearfix">
                    <li><a href="getId?id=${USER.userId }">更改资料</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a href="headChange.jsp">更改头像</a></li>
                    <li class="profile_tab_line">|</li>
                    <li><a >密码安全</a></li>
                </ul>
                <div class="proflle_tab_body">
                    <div class="proflle_tab_workplace clearfix">
                        <div class="profile_avatar_area">
		                         <img id="avatar" width="200px;" src="http://localhost:8080/Voids/" alt="">                  
                        </div>
                        <div class="profile_ifo_area">
                            <form id="passwordUpdateForm" action="userUpdate" method="post">
                            	<input type="hidden" name="userId" id="userId" value="${USER.userId}">
                                <div class="form_group">
                                    <span class="dd">旧　密　码：</span>
                                    <input  type="password" name="oldPassword" id="oldpass"><span id="oldMsg"></span>
                                </div>
                                <div class="form_group">
                                    <span class="dd">新　密　码：</span>
                                    <input id="newpass" name="password" type="password"><span id="newMsg"></span>
                                </div>
                                <div class="form_group">
                                    <span class="dd">确认新密码：</span>
                                    <input name="password_again" type="password" id="newpass_ag"><span id="passMsg"></span>
                                </div>
                                <div class="form_submit dd">
                                    <input value="保　存" type="submit" id="btn">
                                    <a href="userShow.jsp">取消</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </main>
    


<footer>
	<div class="container">
		<ul>
			<li><img src="./修改密码_files/footer_logo.png" alt="" id="foot_logo"></li>
			<li>版权所有：智游3G教育　　　©&nbsp;www.zhiyou100.com</li>
			<li><img src="./修改密码_files/a.png" alt="" id="wxgzh"></li>
		</ul>
	</div>
</footer>

<script type="text/javascript">

$().ready(function(){
	$("#passwordUpdateForm").validate({
		/*校验分两部分，第一部分是校验规则*/
		rules:{
			oldPassword:{
				required:true
			},
			password:{
				required:true,
				minlength:4
			},
			password_again:{
				required:true,
				equalTo:"#newpass"
			}
		},
		messages:{
			oldPassword:{
				required:"旧密码不能为空"
			},
			password:{
				required:"新密码不能为空",
				minlength:"密码最低不能少于4位"
			},
			password_again:{
				required:"确认新密码不能为空",
				equalTo:"两次密码不一样"
			}
		}
	});
	//return false;
})

</script>

 	<script type="text/javascript">
 	 /* $(function(){
         $("#newpass_ag").blur(function(){
             if($("#newpass").val()!=$("#newpass_ag").val()){
            	 $("#passMsg").text("两次密码不相同");
            	 $("#passMsg").css('color','red');
            	 document.getElementById("btn").onclick = function(event){
            		 return false;
				 };
             } else if($("#newpass").val()!="" && $("#newpass_ag").val()!="") {
            	 $("#passMsg").text("两次密码相同");
            	 $("#passMsg").css('color','green');
            	 document.getElementById("btn").onclick = function(event){
            		 return true;
            	}; 
			} else {
				$("#passMsg").text("");
				document.getElementById("btn").onclick = function(event){
           		 return false;
				};
			}
         })
     }) */
     
     $("#newpass").blur(function(){
    		$.ajax({
    			url:"checkPassword",
  				data:{
  					userId:$("#userId").val(),
  					password:$("#newpass").val()
  				},
  				success:function(data){
  					if(data=='yes') {
  						document.getElementById("newMsg").innerHTML = "与旧密码相同";
  						$("#newMsg").css('color','red');
  						document.getElementById("btn").onclick = function(event){
  							return false;
  						};
  					} else if($("#newpass").val()!="" && $("#newpass").val().length>=4){
  						document.getElementById("newMsg").innerHTML = "新密码可以使用";
  						$("#newMsg").css('color','green');
  						document.getElementById("btn").onclick = function(event){
  							return true;
  						};
  					} else {
  						$("#newMsg").text("");
  						document.getElementById("btn").onclick = function(event){
  		           		 return false;
  						};
  					}
  				}
    		})
    	})
     
     $("#oldpass").blur(function(){
    		$.ajax({
    			url:"checkPassword",
  				data:{
  					userId:$("#userId").val(),
  					password:$("#oldpass").val()
  				},
  				success:function(data){
  					if(data=='yes') {
  						document.getElementById("oldMsg").innerHTML = "旧密码输入正确";
  						$("#oldMsg").css('color','green');
  						document.getElementById("btn").onclick = function(event){
  							return true;
  						};
  					} else if($("#oldpass").val()!=""){
  						document.getElementById("oldMsg").innerHTML = "旧密码输入错误";
  						$("#oldMsg").css('color','red');
  						document.getElementById("btn").onclick = function(event){
  							return false;
  						};
  					} else {
  						$("#oldMsg").text("");
  						document.getElementById("btn").onclick = function(event){
  							return false;
  						};
  					}
  				}
    		})
    	})
 	</script>
</body></html>