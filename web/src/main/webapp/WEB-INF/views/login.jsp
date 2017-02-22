<%@ page pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<html>
<head>
<title>权限管理系统-用户登录</title>
<meta name="viewport" content="width=device-width" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=10" />

<link href="${ctx}/favicon.ico" type="image/x-icon" rel="icon" />
<link href="${ctx}/favicon.ico" type="image/x-icon" rel="shortcut Icon" />
<link href="${ctx}/static/login/login.css" rel="stylesheet" type="text/css" />

<script src="${ctx}/static/jquery/jquery-1.10.1.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){
		if(window.parent!==window){
			window.parent.location.href = "${ctx}/login";
		}
		
		//禁止退格键 作用于Firefox、Opera   
		document.onkeypress = banBackSpace;
		//禁止退格键 作用于IE、Chrome  
		document.onkeydown = banBackSpace;
		
		$("#loginname").focus();
		$('#loginname,#password').on('keyup', function(event){
			if (event.keyCode == 13){
				$("#btnLogin").click();
			}
		});
	
		$('#btnCanel').click(function(){
			$("#loginname").val("");
			$("#password").val("");
			$("#loginname").focus();
		});
	
		$("#btnLogin").click(function(){
			if ($("#loginname").val() == ""){
				$("#loginMsg").text("用户名不能为空！");
				return;
			}
			$.post("${ctx}/login", {
				loginname : $("#loginname").val(),
				password : $("#password").val(),
			}, function(result){
				/* if (!result.success){
					$("#loginMsg").text(result.msg);
				}
				else{
					window.location.href = "${ctx}/interface?" + Math.random();
				} */
					window.location.href = "${ctx}/interface?" + Math.random();
			});
		});
	
		//得到焦点
		$("#password").focus(function(){
			$("#left_hand").animate({
				left: "150",
				top: " -38"
			},{
				step: function(){
				if(parseInt($("#left_hand").css("left"))>140){
					$("#left_hand").attr("class","left_hand");
				}
			}}, 2000);
			$("#right_hand").animate({
				right: "-64",
				top: "-38px"
			},{step: function(){
				if(parseInt($("#right_hand").css("right"))> -70){
					$("#right_hand").attr("class","right_hand");
				}
			}}, 2000);
		});
		//失去焦点
		$("#password").blur(function(){
			$("#left_hand").attr("class","initial_left_hand");
			$("#left_hand").attr("style","left:100px;top:-12px;");
			$("#right_hand").attr("class","initial_right_hand");
			$("#right_hand").attr("style","right:-112px;top:-12px");
		});
	});
	
	function banBackSpace(e){
		//alert(event.keyCode)  
		var ev = e || window.event;//获取event对象     
		var obj = ev.target || ev.srcElement;//获取事件源       
		var t = obj.type || obj.getAttribute('type');//获取事件源类型       
		//获取作为判断条件的事件类型   
		var vReadOnly = obj.readOnly;
		var vDisabled = obj.disabled;
		//处理undefined值情况   
		vReadOnly = (vReadOnly == undefined) ? false : vReadOnly;
		vDisabled = (vDisabled == undefined) ? true : vDisabled;
		//当敲Backspace键时，事件源类型为密码或单行、多行文本的，    
		//并且readOnly属性为true或disabled属性为true的，则退格键失效    
		var flag1 = ev.keyCode == 8 && (t == "password" || t == "text" || t == "textarea") && (vReadOnly == true || vDisabled == true);
		//当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效      
		var flag2 = ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea";
		//判断      
		if (flag2 || flag1)
			event.returnValue = false;//这里如果写 return false 无法实现效果   
	}
</script>
</head>
<body>
	<div class="top_div"></div>
	<div style="background: rgb(255, 255, 255); margin: -100px auto auto; border: 1px solid rgb(231, 231, 231); 
				border-image: none; width: 400px; height: 200px; text-align: center;">
		<div style="width: 165px; height: 96px; position: absolute;">
			<div class="tou"></div>
			<div class="initial_left_hand" id="left_hand"></div>
			<div class="initial_right_hand" id="right_hand"></div>
		</div>
		<p style="padding: 30px 0px 10px; position: relative;">
			<span class="u_logo"></span> <input id="loginname" class="ipt" type="text" placeholder="请输入用户名或邮箱" value="">
		</p>
		<p style="position: relative;">
			<span class="p_logo"></span> <input id="password" class="ipt" type="password" placeholder="请输入密码" value="">
		</p>
		<div style="height: 50px; line-height: 50px; margin-top: 30px; border-top-color: rgb(231, 231, 231); border-top-width: 1px; border-top-style: solid;">
			<p style="margin: 0px 35px 20px 45px;">
					<span style="float: right;">
						<A id="btnCanel" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); 
							  border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="#">重置</A>
						<A id="btnLogin" style="background: rgb(0, 142, 173); padding: 7px 10px; border-radius: 4px; border: 1px solid rgb(26, 117, 152); 
							  border-image: none; color: rgb(255, 255, 255); font-weight: bold;" href="#" >登录</A> 
				    </span>
			</p>
		</div>
	</div>
	<div style="text-align: center;">
		<p>
			版权所有:<a href="https://github.com/NowayZzz/common" target="_blank">NOWAY</a>
		</p>
	</div>
</body>
</html>