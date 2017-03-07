<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>图标合集</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<script type="text/javascript" src="${ctx }/jquery/jquery-1.8.2.min.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/easyui14/themes/gray/easyui.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/easyui14/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/styles/commons.css"/>
	<script type="text/javascript" src="${ctx }/easyui14/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx }/easyui14/locale/easyui-lang-zh_CN.js"></script>

<script type="text/javascript">

	$(document).ready(function() {
		
	});
</script>
</head>
<body>
	1.4
	<div align="center">
		<table>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-blank'">icon-blank</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-add'">icon-add</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-edit'">icon-edit</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-clear'">icon-clear</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-remove'">icon-remove</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-save'">icon-save</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-cut'">icon-cut</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-ok'">icon-ok</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-no'">icon-no</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-cancel'">icon-cancel</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-reload'">icon-reload</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-search'">icon-search</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-print'">icon-print</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-help'">icon-help</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-undo'">icon-undo</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-redo'">icon-redo</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-back'">icon-back</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-sum'">icon-sum</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-tip'">icon-tip</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-filter'">icon-filter</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-man'">icon-man</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-lock'">icon-lock</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-mini-add'">icon-mini-add</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-mini-edit'">icon-mini-edit</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-mini-refresh'">icon-mini-refresh</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-large-picture'">icon-large-picture</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-large-clipart'">icon-large-clipart</a></td></tr>
			<tr><td><a class='easyui-linkbutton' data-options="iconCls:'icon-large-shapes'">icon-large-shapes</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-large-smartart'">icon-large-smartart</a></td>
				<td><a class='easyui-linkbutton' data-options="iconCls:'icon-large-chart'">icon-large-chart</a></td>
				</tr>
		</table>
	</div>
</body>
</html>