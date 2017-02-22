<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="${ctx}/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx}/static/bootstrap.js"></script>
<html>
<head>
	<script type="text/javascript">
	$(document).ready(function(){
	
	$('#btnQuery').click(function(){
		$('#role_table').datagrid('load',{
			name: $.trim($('#name').val())
		});
	});
	
	$('#saveBtn').click(function(){
		var arr=$('#resource_ul').tree("getChecked");
		var resource_list=[];
		for(var i=0;i<arr.length;i++){
			 resource_list[i]=arr[i].id;
		}
		$.ajax({
				type:'post',
				data:{
					roid:$('#role_table').datagrid("getSelected").id,
					resource_list:resource_list
				},
				url:'${ctx}/rms/role_resource/resource/save',
				dataType:'json',
				success:function(data){
					//console.log(data);
					$.messager.alert(
							' ','修改成功'		
					);
				}
			});
	});
});

function roleTableOnClickRow(rowIndex, rowData){
	$.ajax({
		type: 'post',
		dataType: 'json',
		url:'${ctx}/rms/role_resource/resource/list',
		data: {
			roid: rowData.id
		       },
		success: function(data){
			$('#resource_ul').tree('loadData',data);
		}
	});
}
</script>

</head>

<body class="easyui-layout">

	<!-- 角色 -->
	<div data-options="region:'center'" style="width: 2px;">
		<div id="p" class="easyui-panel" title="查询"
			style=" padding: 10px; background: #fafafa"
			data-options="iconCls:'icon-query',closable:false,  
	                collapsible:true,minimizable:false,maximizable:false,collapsed:true">
			角色名称： <input id="name" type="text" name=name></input>
			 <a id="btnQuery" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-search'" >查询</a>
		</div>
		<table id="role_table" class="easyui-datagrid"
			data-options="url:'${ctx}/rms/role_resource/role/list',toolbar:'#toolbar',fitColumns:true,singleSelect:true,pagination:true,rownumbers:true,
			onClickRow:function(rowIndex, rowData){roleTableOnClickRow(rowIndex, rowData)},
			rowStyler:function(rowIndex,rowData){if(rowData.levl==1){return ''}else if(rowData.levl==0){return 'color:gray'}}">
			<thead>
				<tr align="center" >
					<th  sortable="true" data-options="field:'id',width:300">序号</th>
					<th  data-options="field:'name',width:300">名称</th>
					<th data-options="field:'levl',width:100,formatter:function(value,rowData,rowIndex){if(rowData.levl==1){return '启用'}else if(rowData.levl==0){return '禁用'}}">状态</th>
				</tr>
			</thead>
		</table>
	</div>

	<!-- 节点 -->
	<div data-options="region:'east',split:true" style="width: 600px;">
		<a id="saveBtn" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save',plain:true">保存</a> 
		<ul id="resource_ul" class="easyui-tree" data-options="checkbox:true,cascadeCheck:false"></ul>
	</div>
	
		<div id="winEdit" class="easyui-window" title="修改" style="width:400px;height:300px"  
        data-options="iconCls:'icon-edit',modal:true,closed:true,minimizable:false">  
      <iframe id="ifEdit" frameborder="0" style="width:100%;height:100%;border:0;" src=""></iframe>
   </div>

</body>
</html>