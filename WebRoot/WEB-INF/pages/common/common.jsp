<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="http://at.alicdn.com/t/font_rh6e2dwvhcbu766r.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/css/common.css"/>
<link rel="stylesheet" type="text/css" href="${basePath}/resources/layer/skin/default/layer.css"/>
<%-- <script type="text/javascript" src="${basePath}/build/dev/js/common.js"></script> --%>
<script type="text/javascript" src="${basePath}/resources/js/jquery-3.0.0.min.js"></script>
<script type="text/javascript" src="${basePath}/resources/js/common.js"></script> 
<script type="text/javascript" src="${basePath}/resources/layer/layer.js"></script> 
<script type="text/javascript" src="${basePath}/resources/kimUtils/KimUtils.js"></script>
<script type="text/javascript">
	var basePath = "${basePath}";
	var adminPath = "${basePath}/admin";
	var loginUserId = "<%= session.getAttribute("userId") %>";
	var loginUserName = "<%= session.getAttribute("userName") %>";
</script>

