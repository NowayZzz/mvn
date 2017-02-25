<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
<html>
<head>
	<title>权限管理 - 登录用户 </title>
	
	<script type="text/javascript">
	$(document).ready(function() {
		var si = setInterval(refresh, 5000);
	});
	
	//页面刷新
	function refresh() {
		$('#userList').datagrid('load', {});
	}
	
	</script>
</head>
<body>
	<table id="userList" class="easyui-datagrid" style="width:auto; height:auto"
		data-options="url:'${ctx}/onLineUser/list',remoteSort:true,fitColumns:true,singleSelect:false,
							pagination:true,rownumbers:true,idField:'loginname',
		rowStyler: function(index,row){
							if (row.status == 0){
								return 'color:gray;';
							}
		},pageSize:15, pageList:[15,20,30,40,50]">
		<thead>
			<tr>
				<th data-options="field:'loginname',width:50,sortable:true">用户编号</th>
				<th data-options="field:'username',width:50,sortable:true">用户名称</th>
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
</body>
</html>