<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
<html>
<head>
	<title>权限管理 - 用户 </title>
	
	<script type="text/javascript">
	$(document).ready(function() {
		//显示用户列表
		$('#btnSearch').click(function() {
			refresh();
		});
		
		//重置
		$('#btnReset').click(function() {
			$('#searchPanel input').val('');
			refresh();
		});
		
		//添加用户
		$('#btnAdd').click(function() {
			$('#ifAdd').attr('src','${ctx }/rms/user/toadd');
			$('#winAdd').window('open');
		});
		
		//修改用户信息
		$('#btnEdit').click(function() {
			if($(this).linkbutton('options').disabled==true){
				return;
			}
			var user = $('#userList').datagrid('getSelected');
			$('#ifEdit').attr('src', '${ctx }/rms/user/toedit?id='+ user.id);
			$('#winEdit').window('open');
			
		});
		
		//删除用户
		$('#btnRemove').click(function(){
			if($(this).linkbutton('options').disabled == true){
				return;
			}
			$.messager.confirm('提示','确定删除',function(r){
				if(r){
					var arr = $('#userList').datagrid('getSelections');
					
					var ids = new Array();
					for(var i=0;i < arr.length;i++){
						ids[i]=arr[i].loginname;
						console.log("+++"+arr[i].loginname);
					}
					$.ajax({
						url:'${ctx }/user/delete',
						data: {
							ids : ids
						},
						dataType: 'json',
						type:'POST',
						success: function(data){
							if(!data.success){
								$.messager.alert('提示',data.message,'error');
							}
							refresh();
						}
					});
				}
			});
		});
	
	});
	
	//页面刷新
	function refresh() {
		$('#userList').datagrid('load', {
			loginname: $.trim($('#loginname').val()),
			username: $.trim($('#username').val())
		});
	}
	
	//按钮控制
	function userTableOnClickRow(rowIndex, rowData) {
		var arr = $('#userList').datagrid('getSelections');
		var status = '';
		for(var i = 0; i<arr.length; i++ ){
			status += arr[i].status;
		}
		if(arr && arr.length==0){
			$('#btnEdit').linkbutton('disable');
			$('#btnRemove').linkbutton('disable');
		}else if(arr && arr.length==1) {
			$('#btnEdit').linkbutton('enable');
			if(status.indexOf('2')==-1){
				$('#btnRemove').linkbutton('enable');
			}else{
				$('#btnRemove').linkbutton('disable');
			}
		}else{
			$('#btnEdit').linkbutton('disable');
			if(status.indexOf('2')==-1){
				$('#btnRemove').linkbutton('enable');
			}else{
				$('#btnRemove').linkbutton('disable');
			}
		}
	}
	
	</script>
</head>
<body>
	<div id="searchPanel" class="easyui-panel" title="查询" style="width:100%px;padding:10px;background:#fafafa;"  
            data-options="iconCls:'icon-search',closable:false,collapsible:true,minimizable:false,maximizable:false,collapsed:false">                     
		<label>用户编号:</label><input id='loginname'/>
		<label>用户姓名:</label><input id='username'/>
		<a id="btnSearch" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true" href="javascript:void(0);">查询</a>
	</div>

	<div id="toolbar">
		<a id="btnAdd" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
		<a id="btnEdit" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,disabled:false">修改</a>
		<!-- <a id="btnRemove" href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-remove" disabled="false">删除</a> 请勿删除用户,此操作可能导致其他功能异常-->
	</div>

	<table id="userList" class="easyui-datagrid" style="width:auto; height:auto"
		data-options="url:'${ctx}/rms/user/list',remoteSort:true,fitColumns:true,singleSelect:false,toolbar:'#toolbar',pagination:true,rownumbers:true,idField:'loginname',
		rowStyler: function(index,row){
							if (row.status == 0){
								return 'color:gray;';
							}
		},onClickRow:function(rowIndex, rowData){userTableOnClickRow(rowIndex, rowData);},pageSize:15, pageList:[15,20,30,40,50]">
		<thead>
			<tr>
				<th data-options="field:'loginname',width:50,sortable:true">用户编号</th>
				<th data-options="field:'username',width:50,sortable:true">用户名称</th>
				<th data-options="field:'password',width:50">密码</th>
				<th data-options="field:'state',width:100,formatter:function(value,row,index){
																				if (value==1){
																					return '正常';
																				} else {
																					return '禁用';
																				}
																		}">状态</th> 
				<th data-options="field:'createtime',fit:true,formatter:function(value){
						if(value==null){
							return '';
						}
						var date = new Date(value);
						return date.getFullYear()+'-'+(date.getMonth()+1)+'-'+date.getDate()+' '+date.getHours()+':'+date.getMinutes()+':'+	date.getSeconds();
				}">创建时间</th>
			</tr>
		</thead>
	</table>
	
	<div id="winAdd" class="easyui-window" title="用户添加" style="width:420px;height:320px"  
     	   data-options="iconCls:'icon-add',modal:true,closed:true,minimizable:false,collapsible:false,maximizable:false,draggable:false">  
	<iframe id="ifAdd" frameborder="0" style="width:100%;height:100%;border:0;" src=""></iframe>
	</div>
	
	<div id="winEdit" class="easyui-window" title="用户修改" style="width:420px;height:320px"  
     	   data-options="iconCls:'icon-edit',modal:true,closed:true,minimizable:false,collapsible:false,maximizable:false,draggable:false">  
	<iframe id="ifEdit" frameborder="0" style="width:100%;height:100%;border:0;" src=""></iframe>
	</div>
</body>
</html>