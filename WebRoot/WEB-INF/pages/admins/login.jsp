<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@include file="/WEB-INF/pages/common/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
	<title>登录页</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="ThemeBucket">
	<%@include file="/WEB-INF/pages/admins/common/common.jsp"%>
</head>
<body class="login-body">
	<div class="container">
	    <form class="form-signin" action="index.html">
	        <div class="form-signin-heading text-center">
	            <h1 class="sign-title">Sign In</h1>
	            <img src="${basePath}/resources/imgs/logo/logo.png" alt=""/>
	        </div>
	        <div class="login-wrap">
				<p class="input">
					<input type="text" class="form-control" placeholder="username" autofocus>
					<!-- <i class="fa fa-user fs18 icon"></i> -->
				</p>
				<p class="input">
	            	<input type="password" class="form-control" placeholder="password">
					<!-- <i class="fa fa-key fs18 icon"></i> -->
				</p>
				<p class="input">
	            	<input type="text" class="form-control" placeholder="verify">
					<!-- <i class="fa fa-key fs18 icon"></i> -->
				</p>
	            <button class="btn btn-lg btn-login btn-block" type="submit">
	                <i class="fa fa-check"></i>
	            </button>
	            <div class="registration">
	                Not a member yet?
	                <a class="" href="registration.html">Signup</a>
	            </div>
	            <label class="checkbox">
	                <input type="checkbox" value="remember-me"> Remember me
	                <span class="pull-right">
	                    <a data-toggle="modal" href="#myModal"> Forgot Password?</a>
	                </span>
	            </label>
	        </div>
	        <!-- Modal -->
	        <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal" class="modal fade">
	            <div class="modal-dialog">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	                        <h4 class="modal-title">Forgot Password ?</h4>
	                    </div>
	                    <div class="modal-body">
	                        <p>Enter your e-mail address below to reset your password.</p>
	                        <input type="text" name="email" placeholder="Email" autocomplete="off" class="form-control placeholder-no-fix">
	                    </div>
	                    <div class="modal-footer">
	                        <button data-dismiss="modal" class="btn btn-default" type="button">Cancel</button>
	                        <button class="btn btn-primary" type="button">Submit</button>
	                    </div>
	                </div>
	            </div>
	        </div>
	        <!-- modal -->
	    </form>
	</div>
</body>
</html>
