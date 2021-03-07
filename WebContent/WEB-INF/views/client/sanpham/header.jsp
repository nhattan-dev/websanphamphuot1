<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Vi Vu Phượt</title>
<base href="${pageContext.servletContext.contextPath }/">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="./themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="./themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="./themes/less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="./themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="./themes/bootshop/bootstrap.min.css" media="screen" />
<link href="./themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="./themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="./themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="./themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="./themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="./themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="./themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="./themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="./themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<div id="header">
		<div class="container" style="margin-bottom: 127px;">
			<div
				style="position: fixed; z-index: 9999; top: 0; background: white;">
				<div id="welcomeLine" class="row">
					<div class="span6">
						<c:if test="${user!=null }"> Welcome! ${user.username }</c:if>
					</div>
					<div class="span6">
						<div class="pull-right">
							<a href="./product/summary.htm"><span
								class="btn btn-mini btn-primary"><i
									class="icon-shopping-cart icon-white"></i> <span id="cartsize">[
										${user.cart.size() == null ? '0' : user.cart.size()} ] Itemes
										in your cart </span> </span> </a>
						</div>
					</div>
				</div>
				<!-- Navbar ================================================== -->
				<div id="logoArea" class="navbar">
					<a id="smallScreen" data-target="#topMenu" data-toggle="collapse"
						class="btn btn-navbar"> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
					</a>
					<div class="navbar-inner">
						<a class="brand" href="./index.htm"><img
							src="./themes/images/logo.png" alt="Bootsshop" /></a>


						<form class="form-inline navbar-search" method="post"
							action="./product/search.htm">
							<input id="srchFld" class="srchTxt" name="srchTxt" type="text" />
							<select class="srchTxt" name="srchOpt">
								<option>All</option>
								<c:forEach var="c" items="${categorys }">
									<option value="${c.cate_id }" label="${c.cate_name }"></option>
								</c:forEach>
							</select>
							<button type="submit" id="submitButton" class="btn btn-primary">Go</button>
						</form>
						<ul id="topMenu" class="nav pull-right">
							<li class=""><a href="#">Specials Offer</a></li>
							<li class=""><a href="#">Contact</a></li>
							<!--LOGIN BUTTON  -->
							<li class="" style="${user!=null?'display: none;':''}"><a
								href="#login" role="button" data-toggle="modal"
								style="padding-right: 0"><span
									class="btn btn-large btn-success">Login</span></a>
								<div id="login" class="modal hide fade in" tabindex="-1"
									role="dialog" aria-labelledby="login" aria-hidden="false">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h3>Login Block</h3>
									</div>
									<div class="modal-body">
										<form class="form-horizontal loginFrm" action="./login.htm">
											<input type="hidden" name="from"
												value="${pageContext.request.requestURL }">
											<div class="control-group">
												<input type="text" id="inputEmail" name="inputEmail"
													placeholder="Email">
											</div>
											<div class="control-group">
												<input type="password" id="inputPassword"
													name="inputPassword" placeholder="Password">
											</div>
											<div class="control-group">
												<label class="checkbox"> <input type="checkbox">
													Remember me
												</label>
											</div>
											<button type="submit" class="btn btn-success" name="btnLogin">Sign
												in</button>
											<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
										</form>
									</div>
								</div></li>
							<li style="${user!=null?'display: none;':''}"><a
								href="register.htm" style="padding-right: 0"><span
									class="btn btn-large btn-success">Register</span></a></li>
							<!--LOGOUT BUTTON  -->
							<li class="" style="${user==null?'display: none;':''}">
								<form action="./logout.htm">
									<button name="btnLogout" style="margin-top: 20px;" class="btn"
										formaction="./logout.htm">Logout</button>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Header End====================================================================== -->
</body>
</html>