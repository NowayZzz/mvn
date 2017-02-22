<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
<html>
<head>
<title>菜单添加</title>
<script type="text/javascript">
$(document).ready(function(){
	$('#btnSubmit').click(function(){
		if($('#roleAddForm').form('validate')){
			$.ajax({
				type:'POST',
				dataType:'json',
				url:'${ctx}/rms/resource/add',
				data:$('#roleAddForm').serialize(),
				success:function(data){		
					if(!data.success){
						$.messager.alert('提示',data.message,'info');
					}else {
						window.parent.$('#winAdd').window('close');
						window.parent.refresh();
					}
				},
			});
		}
	});
	
});

</script>
</head>
<body>
<form id="roleAddForm" method="post">
<table class="form_table" align="center">
	<tr>
		<td><label for="name">进程名字:</label></td>
        <td><input class="easyui-validatebox" type="text" name="name" data-options="required:true" /></td>  
	</tr>
	<tr>
		<td><label for="url">地址:</label></td>
        <td><input class="easyui-validatebox" type="text" name="url" /></td>  
	</tr>
	<tr>
		<td><label for="state">菜单状态:</label>  
   		<td><input class="" type="radio" name="state" checked="checked" value="1"/>开启
   			<input class="" type="radio" name="state" value="0"/>禁用
   		</td>
	</tr>
	<tr>
		<td><label for="sort">顺序:</label></td>  
        <td><input class="easyui-validatebox" type="text" id="sort" name="sort" data-options="required:true" /></td>
	</tr>
	<tr>
		<td><label for="parentId">父节点:</label></td>
       	<td><select id="parentId" class="easyui-combotree" name="parentId" data-options="url:'${ctx}/rms/resource/getAllResource',panelHeight:'auto',width:'170px'"></td>
        <td></select>
	</tr>
	<tr>
		<td><label for="icon">图标:</label></td>
        <td><input class="easyui-validatebox" type="text" name="icon" /></td>
	</tr>
	<tr>
		<td colspan="2" align="right">
        	<a id="btnSubmit" data-options="iconCls:'icon-save',plain:true"  href="javascript:void(0)" class="easyui-linkbutton" >提交</a>
		</td>     
	</tr>
</table>
</form>

</body>
</html>