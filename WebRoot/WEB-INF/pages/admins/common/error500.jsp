<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
  <title>500 Page</title>
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
            <h1><img alt="" src="${basePath}/resources/admins/images/500-error.png"></h1>
            <h2>OOOPS!!!</h2>
            <h3>Something went wrong.</h3>
            <p class="nrml-txt">Why not try refreshing you page? Or you can <a href="#">contact our support</a> if the problem persists.</p>
            <a class="back-btn" href="${adminPath}/index"> Back To Home</a>
        </section>

    </div>
</section>

</body>
</html>
