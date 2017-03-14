<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="user" varStatus="userindex" items="${datas}">
	<tr>
		<td>
			${user.id}
			<c:if test="${userindex.index==0}">
				<input type="hidden" id="itemCount" value="${itemCount}"/>
			</c:if>
		</td>	
		<td>${user.name}</td>	
		<td>${user.userId}</td>	
		<%-- <td class="tmui-tips" tip="${tz:formatDate(user.createTime,'yyyy-MM-dd HH:mm:ss')}">
			${tz:timeFormat(user.createTime)}
		</td> --%>	
		<td>
			<tz:if test="${user.isDelete==0}">
				<tz:then><a href="javascript:void(0)" opid="${user.id}" mark="isDelete" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${user.id}" mark="isDelete" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td>
			<tz:if test="${user.status==0}">
				<tz:then><a href="javascript:void(0)" opid="${user.id}" mark="status" val="1" onclick="tzAdmin.op(this);" class="red">否</a></tz:then>
				<tz:else><a href="javascript:void(0)" opid="${user.id}" mark="status" val="0" onclick="tzAdmin.op(this);" class="green">是</a></tz:else>
			</tz:if>	
		</td>	
		<td><a href="javascript:void(0);">未删除</a></td>
	</tr>
</c:forEach>
