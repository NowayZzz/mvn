<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
<html>
<head>
	<title>菜单管理</title>
	<script type="text/javascript" charset="UTF-8">
	$(document).ready(function(){
		$('#btnAdd').click(function(){
			$('#ifAdd').attr('src','${ctx}/rms/resource/toadd');
			$('#winAdd').window('open');
			});
		$('#btnEdit').click(function(){
			var resource=$('#resource_tree').treegrid('getSelected');
			$('#ifEdit').attr('src','${ctx}/rms/resource/toedit?id='+resource.id);
			$('#winEdit').window('open');
		});
	});
	
	function onRowAble(){
		var arr=$('#resource_tree').treegrid('getSelections');
		if(arr.length==0){
			$('#btnEdit').linkbutton('disable');
		}else if(arr.length==1){
			$('#btnEdit').linkbutton('enable');
		}else{
			$('#btnEdit').linkbutton('disable');
		}
	}
	
	function refresh(){
		$('#resource_tree').treegrid('reload');
		}
	
	function close(){
		$('#winAdd').window('close');
		}
	</script>
</head>
<body>
	<div id="toolbar">
 		 <a id="btnAdd" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true">增加</a>
 		 <a id="btnEdit" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true,disabled:true" >修改</a>
	</div>
	
	<table id="resource_tree" class="easyui-treegrid" style="fit:true"
		    data-options="url:'${ctx}/rms/resource/list',onClickRow:function(){onRowAble()},singleSelect:false,
		    idField:'id',treeField:'name',toolbar:'#toolbar'">  
        <thead> 
            <tr>  
                <th data-options="field:'name',width:400,align:'left'">名称</th>
                <th data-options="field:'url',width:250">地址</th>
                <th data-options="field:'state',width:100,formatter:function(value,rowData,rowIndex){
								                		if(value==1 ){return '启用'} 
								                		else if(value==0){return '禁用'}}">状态</th>
                <th data-options="field:'sort',width:100">顺序</th>
                <th data-options="field:'poid',width:100">父节点</th>
                <th data-options="field:'icon',width:200">图标</th>
            </tr>
        </thead> 
    </table>  
    
    <div id="winAdd" class="easyui-window" title="增加" style="width:400px;height:320px" 
        data-options="iconCls:'icon-save',modal:true,closed:true,maximizable:false,minimizable:false,shadow:true,collapsible:false,resizable:false">  
   	 <iframe id="ifAdd" frameborder="0" style="width:100%;height:100%;border:0" ></iframe>
	</div> 
	
	<div id="winEdit" class="easyui-window" title="修改" style="width:400px;height:320px"  
        data-options="iconCls:'icon-edit',modal:true,closed:true,maximizable:false,minimizable:false,collapsible:false,resizable:false">  
   	 <iframe id="ifEdit" frameborder="0" style="width:100%;height:100%;border:0" ></iframe>
	</div> 
	
</body>
</html>