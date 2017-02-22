<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap.js"></script>
<html>
<head>
<script>
$(document).ready(function(){	
	$("#form").form('load','${ctx}/rms/role/preedit?id='+$("#id").val());
	$('#btnSave').click(function(){
		if($('#form').form('validate')){
			$.ajax({
				url:"${ctx}/rms/role/update",
				type: 'post',
				dataType:'json',
				data:$("#form").serialize(),
				success: function(data){
					if(!data.success){
						$.messager.alert('提示',data.message,'info');
					}else {
						window.parent.reload();
						window.parent.closeWinEdit();
					}
	         	}
			});
		};
	}); 

});
   </script>
</head>
<body>
	    
<form id="form" method="post" >
<input type="hidden" id="id"  name="id" value="${id}" />
	<table align="center">
		<tr>
			<td width="100" align="right"><label for="name" class="label">角色名:</label></td>
			<td><input id="name" class="easyui-validatebox" name="name" data-options="required:true" readonly=true/>  </td>
		</tr>
		
		<td align="right"><label for="status" class="label">用户类型:</label></td>
			<td>
				<select id="status" class="easyui-combobox" name="status" panelHeight="auto">   
			    <option value ="1">启用</option>
		    	<option value ="0">禁用</option>   
			</select> 
			</td>
		</tr>
		<tr>
			<td align="right"><label class=label for="sort">排序:</label></td>
			<td><input id="sort"  class="easyui-validatebox" name="sort" data-options="required:true" />  </td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<a id="btnSave" href="javascript:void(0);" iconCls="icon-add" class="easyui-linkbutton">保存</a>
			</td>
		</tr>
	</table>
</form>
    
</body>
</html>
