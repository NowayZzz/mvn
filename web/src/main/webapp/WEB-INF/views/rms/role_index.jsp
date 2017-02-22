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
		$('#btnAdd').click(function(){
			$('#ifAdd').attr('src', '${ctx}/rms/role/toadd');
			$('#winAdd').window('open');
		 });
		$('#btnEdit').click(function(){
			if($(this).linkbutton('options').disabled == true){
				return;
			}
			var  id = $('#role_table').datagrid("getSelected").id;

			$('#ifEdit').attr('src', '${ctx}/rms/role/toedit?id='+id);
			$('#winEdit').window('open'); 
			
		  }); 
		
		//向后台传查询条件 
		$('#btnQuery').click(function(){
			dataGridQuery();
		});
		
		//设置按钮禁用 
		$('#role_table').datagrid({
			onClickRow:function(index, data){
				//console.log(data);
				var arr = $('#role_table').datagrid("getSelections");
				
				//console.log(arr);
				if(arr.length == 0){
					//没
					$('#btnEdit').linkbutton('disable');
					$('#btnDel').linkbutton('disable');
				}else if(arr.length == 1){
					//1
					$('#btnEdit').linkbutton('enable');
					$('#btnDel').linkbutton('enable');
				}else{
					//多
					$('#btnEdit').linkbutton('disable');
					$('#btnDel').linkbutton('enable');
				}		
			}
		});
		
	});
	//window.refresh();用于刷新iframe的父窗口 
	function refresh(){
		dataGridQuery();
	}
	function reload(){
		dataGridQuery();
		$('#btnEdit').linkbutton('disable');
	}
	function closeWinEdit(){
		$('#winEdit').window('close');
	}
	function closeWinAdd(){
		$('#winAdd').window('close');
	}
	
	function dataGridQuery(){
		$('#role_table').datagrid('load',{
			name: $.trim($('#name').val())
		});
	}
	</script>
</head>
<body>
     <div class="easyui-panel" title="查询"   
            style="width:100%px;background:#fafafa;"  
            data-options="iconCls:'icon-search',closable:false,  
                    collapsible:true,minimizable:false,maximizable:false,collapsed:true">  
        
        <label for="name">角色名称:</label>
        <input id="name" name="name" type="text" value="" />       
	    <a id="btnQuery" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-search',plain:true,disabled:true">查询</a>
        
    </div>
    <div id="toolbar1">
	  <a id="btnAdd" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
	  <a id="btnEdit" href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,disabled:true">修改</a>
	</div>

    <table id="role_table" class="easyui-datagrid" style="width:100%px;height:auto;"  
            data-options="url:'${ctx}/rms/role/list',fitColumns:true,singleSelect:false,toolbar:'#toolbar1',pagination:true,rownumbers:true">  
        <thead>
            <tr>
                <th data-options="field:'name',width:200">ID</th>  
                <th data-options="field:'status',width:200,formatter:function(value,row,index){if(value==1){return '启用';}else{return '禁用';}}">状态</th>  
                <th data-options="field:'sort',width:200">排序</th>  
            </tr>
        </thead>  
   </table>

   <div id="winAdd" class="easyui-window" title="角色增加" style="width:420px;height:200px"  
        data-options="iconCls:'icon-add',modal:true,closed:true,minimizable:false">  
      <iframe id="ifAdd" frameborder="0" style="width:100%;height:100%;border:0;" src=""></iframe>
   </div>
   <div id="winEdit" class="easyui-window" title="修改" style="width:420px;height:200px"  
        data-options="iconCls:'icon-edit',modal:true,closed:true,minimizable:false">  
    <iframe id="ifEdit" frameborder="0" style="width:100%;height:100%;border:0;" src=""></iframe>
   </div>
   
</body>
</html>
