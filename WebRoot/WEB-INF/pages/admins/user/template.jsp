<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<c:forEach var="user" varStatus="userindex" items="${users}">
	<tr>
          <td class="center">${user.id}</td>
          <td class="center">${user.name}</td>
         <td class="center">${user.sex}</td>
          <td class="center">${user.age}</td>
          <td class="center">${user.isActive}</td>
          <td class="center">${user.isForbid}</td>
          <td class="center">${user.isDelete}</td>
          <td class="center">${user.tel}</td>
          <td class="center">${user.ip}</td>
          <td class="center">${user.qq}</td>
          <td class="center">${user.email}</td>
          <td class="center">${user.ipAddress}</td>
    </tr>
</c:forEach>
