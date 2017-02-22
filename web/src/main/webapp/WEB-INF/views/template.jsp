<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>权限管理系统 - Noway</title>
<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	
	$('#btnLogout').click(function(){
		$.messager.confirm('确认', '真得要退出吗?', function(r){
			if(r){
				window.location.href = "${ctx}/loginout";
			}
		});
	});
});
</script>
</head>
<body>
<div>test</div>
</body>
</html>