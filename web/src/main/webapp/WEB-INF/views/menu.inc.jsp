<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />

<div id="mb_${s.id }"  data-options="menu:'#mm_${s.id }',iconCls:'${s.icon }'">
	<span>${s.name}</span>
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
</div>
