<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>用户安全设置</title>
	<meta http-equiv="pragma" content="no-cache"/>
	<meta http-equiv="cache-control" content="no-cache"/>
	<meta http-equiv="expires" content="0"/>
	<script type="text/javascript" src="${ctx }/jquery/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" charset="UTF-8" src="${ctx }/js/jquery.cookie.js"></script>
	<link id="easyuiTheme" rel="stylesheet" type="text/css" href="${ctx }/easyui132/themes/gray/easyui.css"/>
	<script type="text/javascript" charset="UTF-8" src="${ctx }/js/changeEasyuiTheme.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx }/easyui132/themes/icon.css"/>
	<link rel="stylesheet" type="text/css" href="${ctx }/styles/commons.css"/>
	<script type="text/javascript" src="${ctx }/easyui132/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="${ctx }/easyui132/locale/easyui-lang-zh_CN.js"></script>
	<script type="text/javascript">
	$(document).ready(function(){
		$('#btnSave').click(function(){
			$('#form').form({   
			    url:"${ctx}/user/user_password.do",   
			    onSubmit: function(){   
			        if($('#newPassword1').val()!=$('#newPassword2').val()){
			        	$.messager.alert('提示','请确认两次密码是否一致','infor');
			        	return false;  
			        }
			    },   
			    success:function(data){   
			    	var dat = eval('(' + data + ')');  
			        if(dat.success){
			        	$.messager.alert('提示','密码更新成功','infor');
			        }else{
			        	$.messager.alert('提示',dat.message,'error');
			        }
			    }   
			});   
			$('#form').submit(); 
		});
	});
	</script>
</head>
<body>
  <div id="p" class="easyui-panel" title="用户密码修改" data-options="collapsible:true">
   <br/><br/><br/>
  	<div align="center" >
    	<form id="form" method="post">
    	 <table>
    	 	<tr>
    	 		<td>
    	 		 <div>
			        <label for="password">域密码或系统密码:</label>  
			     </div> 
    	 		</td>
    	 		<td>
    	 			<input id="password" class="easyui-validatebox" type="password" name="password" data-options="required:true" />
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td>
    	 			<div>  
				        <label for="newPassword1">新密码:</label>  
				     </div>
    	 		</td>
    	 		<td>
    	 			<input id="newPassword1" class="easyui-validatebox" type="password" name="newPassword1" data-options="required:true" />
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td>
    	 		 <div>  
			        <label for="newPassword2">确认新密码:</label>  
			     </div>
    	 		</td>
    	 		<td>
    	 			<input id="newPassword2" class="easyui-validatebox" type="password" name="newPassword2" data-options="required:true" />
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td>&nbsp;  </td>
    	 	</tr>
    	 	<tr>
    	 		<td colspan="2" align="center">
    	 		   <a id="btnSave" href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-save'">提交</a>
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td>&nbsp;  </td>
    	 	</tr>
    	 	<tr>
    	 		<td colspan="2" align="left">
    	 		   1、该系统登录密码可使用域账户密码或系统密码;
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td colspan="2" align="left">
				   2、第一次更新密码请输入域账户密码，即开机密码;
    	 		</td>
    	 	</tr>
    	 	<tr>
    	 		<td colspan="2" align="left">
				   3、更新密码时，只能更新系统密码;
    	 		</td>
    	 	</tr>
    	 </table> 
		</form>
    </div>
    <br/><br/>
  </div>
</body>
</html>