<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
<html>
<head>
	<script>
	$(document).ready(function(){
		
		$('#btSave').click(function(){
			if($('#addForm').form('validate')){
				$.ajax({
					type: 'POST',
					dataType: 'json',
					url:'${ctx}/rms/user/add',
					data: $("#addForm").serialize(),
					success: function(data){
						if(!data.success){
							$.messager.alert('提示',data.message,'info');
						}else {
							window.parent.$('#winAdd').window('close');
							window.parent.refresh();
						}
					}
				});
			}
		});
		
	});	
    </script>
</head>
<body>

<form id="addForm" method="post">
<table class="form_table" align="center">
	<tr>
		<td><label class="label" for="usid">用户编号:</label></td>
		<td><input id="usid" class="easyui-validatebox" name="loginname" data-options="required:true" />  </td>
	</tr>
	<tr>
		<td><label class="label" for="nama">用户名称:</label></td>
		<td><input id="nama" class="easyui-validatebox" name="username" data-options="required:true" />  </td>
	</tr>
	<tr>
		<td><label class="label" for="pawd">用户密码:</label></td>
		<td><input id="pawd" class="easyui-validatebox" name="password" data-options="required:true" />  </td>
	</tr>
	<tr>
		<td><label class="label" for="clss">电话:</label></td>
		<td><input id="clss" class="easyui-validatebox" name="phone" data-options=""/>  </td>
	</tr>
	<tr>
		<td><label class="label" for="emil">邮箱地址:</label></td>
		<td><input id="emil" class="easyui-validatebox" name="emil" data-options="validType:'emil'"/>  </td>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<a id="btSave" href="javascript:void(0);" data-options="iconCls:'icon-save',plain:true" class="easyui-linkbutton">保存</a>
		</td>     
	</tr>
</table>
</form>

</body>
</html>
