<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>权限管理系统 - [${user.loginname } ${user.username }]</title>
	<link href="${ctx}/favicon.ico" type="image/x-icon" rel="icon" />
	<link href="${ctx}/favicon.ico" type="image/x-icon" rel="shortcut Icon" />
	<script type="text/javascript" src="${ctx }/static/jquery/jquery-1.10.1.min.js"></script>
	<script type="text/javascript" src="${ctx }/static/bootstrap.js"></script>
	<script type='text/javascript' src='${ctx}/dwr/engine.js'></script>
	<script type='text/javascript' src='${ctx}/dwr/util.js'></script>
	<script type="text/javascript" src="${ctx}/dwr/interface/userMessage.js"></script>
<style type="text/css">
.home_logo {
	float: left;
	width: 300px; height: 60px;
	font-size: 36px;
	background-image: url(${ctx}/static/images/noway.jpg); background-repeat: no-repeat;
}
.home_banner {
	float: left;
}
.home_banner span{
	font-size: 14px;
	color:navy;
}
.home_menu {
	float: left;
}
.datagrid-header, .datagrid-body {
	font-size: 12px;
}
.grayfont{color: #808080;}
.tab_iframe{width:100%;height:100%;border:0;}
.themeCbb{
	position: absolute;
	bottom: 10px;
	right: 50px;
}
</style>
<script type="text/javascript">
	//dwr错误信息处理，覆盖原方法
	dwr.engine._errorHandler = function(message, ex) {
		dwr.engine._debug("Error: " + ex.name + ", " + ex.message, true);
		console.log('dwr.engine._debug:'+"Error: " + ex.name + ", " + ex.message);
	};
</script>
<script type="text/javascript">
var updateDate = new Date(2014,10,6);

$(document).ready(function(){
	try {
		dwr.engine.setActiveReverseAjax(true);
		dwr.engine.setNotifyServerOnPageUnload(true);
		userMessage.onPageLoad('${user.id}');
	} catch (error) {
		//alert(error.toString());
	}
	
	if(window.parent!==window){
		window.parent.href = "${ctx}/loginout.do";
	}
	$('#btnLogout').click(function(){
		$.messager.confirm('确认', '真得要退出吗?', function(r){
			if(r){
				window.location.href = "${ctx}/loginout.do";
			}
		});
	});
	
	$(".menubtn").click(function(){
		var url = '${ctx}/'+$(this).attr('_url');
		var text = $(this).text();
		var id = $(this).attr('id');
		
		var index = 0;
		var exists = false;
		var tt = $("#tabs").tabs('getTab', index);
		while(tt != null){
			if($(tt).attr('id') == id){
				exists = true;
				break;
			}
			index++;
			tt = $("#tabs").tabs('getTab', index);
		}
		
		if(!exists){
			$('#tabs').tabs('add',{
				id: id,
		        title: text,
		        content: '<iframe id="if_'+id+'" frameborder="false" class="tab_iframe" src="'+url+'"></iframe>',  
		        closable: true,
		        tools:[{
                    iconCls: 'icon-mini-refresh',
                    handler:function(){
						$('#if_'+id).attr('src', url);
                    }
          		}]
		    });
		}else{
			$('#tabs').tabs('select',index);
		}
		
	});
	
	$('#theme').combobox({
		/* onSelect:function(record){
			console.log(record);
			changeThemeFun(record.value);
		} */
		onSelect:function(record){
			if(record!=null && record!='') changeThemeFun(record.value);
			$.messager.show({
				title:'提示',
				msg:'您已成功更换主题,系统将会为您保存2个月。若清除cookie或历史记录，可能需重新设置主题。',
				timeout:10000,
				showType:'slide',
				width:280,
				height:150
			});
		}
	});
	
});

	/*
	*初始化，获得theme的combobox的初始值，从cookie中取得
	*/
	function initializ(){
		//console.log($.cookie('easyuiThemeName'));
		/* if($.cookie('easyuiThemeName')){
			$('#theme').combobox('setValue',$.cookie('easyuiThemeName'));
			changeThemeFun($.cookie('easyuiThemeName'));
		}else{
			changeThemeFun('gray');
		} */
	}

	function noticeUser(data){
		$.messager.show({
			title:'提示',
			msg:data,
			timeout:10000,
			showType:'slide',
			width:280,
			height:150
		});
	}
</script>
</head>
<body>

<div id="root" class="easyui-layout" style="" fit="true">  
    <div data-options="region:'north',title:''" style="height:66px;background-color: #FFFFFF;">
    
    	<div class="home_logo" ></div>
    	
    	<div style="float:left;">
    	
    	<div class="home_banner">
    	<span >WELCOME ${user.username }(${user.loginname })</span>
    	<a id="btnLogout" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true">退出</a>
    	</div>
    	<div style="clear:both; float:none;"></div>
 	
    	<div class="home_menu">	<!-- 菜单 -->
    		<div style="border:1px solid #ddd" id="menu" >
				<c:forEach items="${menuList}" var="s" >
					<c:if test="${! empty s.children}">
						<a href="javascript:void(0)" id="mb_${s.id }" class="easyui-menubutton" data-options="menu:'#mm_${s.id }',iconCls:'${s.icon }'">${s.name}</a>
							<div id="mm_${s.id }" style="width:150px;">
								<c:forEach items="${s.children}" var="cc" >
									<c:if test="${! empty cc.children}">
										<c:set var="s" value="${cc }" scope="request"/>
										<jsp:include page="menu.inc.jsp" />
									</c:if>
									<c:if test="${ empty cc.children}">
										<c:if test="${ empty cc.url}">
											<div id="lb_${cc.id }" data-options="disabled:true,plain:true,iconCls:'${cc.icon }'">${cc.name}</div>
										</c:if>
										<c:if test="${! empty cc.url}">
											<div id="lb_${cc.id }" class="menubtn" _url="${cc.url }" data-options="plain:true,iconCls:'${cc.icon }'">${cc.name}</div>
										</c:if>
									</c:if>
								</c:forEach>
							</div>
					</c:if>
					<c:if test="${ empty s.children}">
						<c:if test="${ empty s.url}">
							<a id="lb_${s.id }" class="easyui-linkbutton" data-options="disabled:true,plain:true,iconCls:'${s.icon }'">${s.name}</a>
						</c:if>
						<c:if test="${! empty s.url}">
							<a id="lb_${s.name }" class="easyui-linkbutton menubtn" _url="${s.url }" data-options="plain:true,iconCls:'${s.icon }'">${s.name}</a>
						</c:if>
					</c:if>
				</c:forEach>
			</div>			
    	</div>
	
    	</div>
		
		<div style="float:right;">
			<div class="themeCbb">
				<!-- <span style="font-size: 16px">主题:</span> -->
				<!-- <a id="btn" href="#" class="easyui-linkbutton" data-options="plain:true">主题:</a>  -->
				主题:
				<select id="theme" class="easyui-combobox" name="theme" data-options="editable:false,panelHeight:'auto'">  
					    <option value="gray">灰霾（默认）</option>  
					    <option value="default">天空蓝（推荐）</option>
					    <option value="bootstrap">银色</option>  
					    <option value="metro">磁贴</option>  
				</select>
			</div>
		</div>
    </div>
    <div data-options="region:'center',title:''" style="background:#eee;">   
    	<div id="tabs" class="easyui-tabs" data-options="border:false,fit:true">    
    	</div>
    
    </div>  
</div>

</body>
</html>