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
		//删除用户角色按钮
		$('#btnDelRole').click(function(){
			var arr = $('#role_table').datagrid('getSelections');
			if(arr.length===0){
				$.messager.alert('提示','请选择需要删除的角色','warning'); 
			}
			$.messager.confirm('提示', '确认删除选中的记录?', function(r){
				if (r){	
					var userId = $('#user_table').datagrid('getSelected').id;
					
					var ids = [];
					
					for(var i=0; i<arr.length; i++ ){
						ids[i] = arr[i].id;
						//console.log("赋值中"+ids[i]+"---"+user_id);
					}
					$.ajax({
						type: 'POST',
						dataType: 'json',
						url:'${ctx}/rms/user_role/del_role',
						data: {
							ids: ids,
							userId:userId
						},
						success: function(data){
							$('#role_table').datagrid('load',{
								userId: userId
							});
						}
					});						       
				}
		    });			
	    });
		
		
		$('#btnAddRole').click(function(){
			if($('#user_table').datagrid('getSelected')==null){
			    $.messager.alert('提示','请选择用户','warning'); 
			    return false;
			}else{
			var userId= $('#user_table').datagrid('getSelected').id;
			$('#winAdd').window('open');
			
			$('#user_role_add').datagrid({
				url:'${ctx}/rms/user_role/role/addlist?userId='+userId,
				toolbar: [{
					id:'btnAddRoleAffirm',
					iconCls: 'icon-ok',
					plain: true,
					text:'确定',
					handler:function(){
						var me = this;
						var userId = $('#user_table').datagrid('getSelected').id;
						var arr = $('#user_role_add').datagrid('getSelections');
						var ids = [];
						for(var i=0; i<arr.length; i++){
							ids[i] = arr[i].id;
						}
						if(ids.length===0){
							$.messager.alert('提示','请选择角色','warning'); 
							return;
						}
						$.ajax({
							type: 'POST',
							dataType: 'json',
							url:'${ctx}/rms/user_role/add_role',
							data: {
								ids: ids,
								userId:userId
							},
							success: function(data){
								if(data.success === false){
									$.messager.alert('提示', data.message,'warning'); 
									return ;
								}
								$('#role_table').datagrid('load',{
									userId: userId
								});
								$('#user_role_add').datagrid('reload');
								$('#winAdd').window('close');
							}
						});
					}
				},{
					iconCls: 'icon-reload',
					text:'重置',
					handler: function(){
						$('#user_role_add').datagrid('clearSelections');
					}
				}],
				rownumbers:true,
				pagination:true,
				fit:true,
				columns:[[
				           {field:'check',checkbox:true},
				           {field:'name',title:'角色名称',width:320}
				       ]]  ,
				 idField:'id'
			});	
			}
		});
		
		$('#user_table').datagrid({
			onClickRow: function(rowIndex, rowData){
				$('#role_table').datagrid('load',{
					userId: rowData.id
				});
			}
		 });
	});
	
	//role_datagrid加载前处理
	function roleTalbeOnLoad(params){
		if(params.userId == undefined){
			return false;
		}
		return true;
	}
	
    function serchBox_user(value,name){  
        // 用户查询按钮 
     	$('#user_table').datagrid('load',{	
			userSerchKey: value
		}); 
    }
    
	</script>
</head>
<body>
    <!--用户表按钮  -->
    <div id="tbar_user">
	<input id="serchBox_user" class="easyui-searchbox" style="width:300px"  
        data-options="searcher:serchBox_user,prompt:'请输入关键字查询',menu:'#serchUser_menu'"></input> 
	</div>
	
	<!--搜索框  SerchBox -->
	<div id="serchUser_menu" style="width:35px">  
	    <div data-options="name:'loginname'"></div>  
	    <div data-options="name:'username'"></div>  
	</div>

	<!--用户列表  -->
	<div style="width:50%;float:left;">
	    <table id="user_table" class="easyui-datagrid" data-options="url:'${ctx}/rms/user_role/user/list',fitColumns:true,
	    	singleSelect:true,toolbar:'#tbar_user',idField:'id'" striped="true" pagination="true" rownumbers="true">  
	        <thead>  
	            <tr>
	                <th data-options="field:'loginname', width:20" >用户代码</th>    
	                <th data-options="field:'username', width:100" >姓名</th>
	            </tr>
	        </thead>  
	    </table>
    </div>
    
	<!--角色表按钮 -->
	<div id="tbar_role">
		<a id="btnAddRole" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">添加</a>
		<a id="btnDelRole" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">删除</a>
	</div>

    <!--角色列表  -->
    <div id="role" style="width:50%;float:left;">
	    <table id="role_table" class="easyui-datagrid" style="width:100%px;"  
	            data-options="onBeforeLoad:function(params){return roleTalbeOnLoad(params);},url:'${ctx}/rms/user_role/role/list',fitColumns:true,singleSelect:false,
	            toolbar:'#tbar_role',idField:'id',striped:true,pagination:true,rownumbers:true" >  
	        <thead> 
	            <tr>
	            	<th data-options="field:'CHECKED',checkbox:true"></th>
	            	<th id="role_id_tr" data-options="field:'id',width:150" resizable="true">角色编号</th>
	                <th data-options="field:'name',width:80" resizable="true">角色名</th>      
	            </tr>
	        </thead>  
	    </table> 
    </div>
    
    <!--弹出窗口  -->
    <div id="winAdd" class="easyui-window" title="增加" style="width:410px;height:405px"  
        data-options="iconCls:'icon-save',modal:true,closed:true,minimizable:false">  
      <table id="user_role_add" ></table>
   </div>
</body>
</html>