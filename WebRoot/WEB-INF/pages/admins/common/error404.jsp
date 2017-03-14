<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>

<!DOCTYPE html>
<html>
<head>
  <title>404 Page</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="ThemeBucket">
  <%@include file="/WEB-INF/pages/admins/common/common.jsp"%>
  
</head>

<body class="error-page">

<section>
    <div class="container ">
        <section class="error-wrapper text-center">
            <h1><img alt="" src="${basePath}/resources/admins/images/404-error.png"></h1>
            <h2>page not found</h2>
            <h3>We Couldn’t Find This Page</h3>
            <a class="back-btn" href="${basePath}/admin/index"> Back To Home</a>
        </section>
    </div>
</section>

</body>
</html>
