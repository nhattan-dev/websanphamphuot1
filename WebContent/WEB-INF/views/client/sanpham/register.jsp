<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
<base href="${pageContext.servletContext.contextPath }/">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<style type="text/css" id="enject">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
<!--Less styles -->
<!-- Other Less css file //different less files has different color scheam
	<link rel="stylesheet/less" type="text/css" href="themes/less/simplex.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/classified.less">
	<link rel="stylesheet/less" type="text/css" href="themes/less/amelia.less">  MOVE DOWN TO activate
	-->
<!--<link rel="stylesheet/less" type="text/css" href="themes/less/bootshop.less">
	<script src="themes/js/less.js" type="text/javascript"></script> -->

<!-- Bootstrap style -->
<link id="callCss" rel="stylesheet"
	href="themes/bootshop/bootstrap.min.css" media="screen" />
<link href="themes/css/base.css" rel="stylesheet" media="screen" />
<!-- Bootstrap style responsive -->
<link href="themes/css/bootstrap-responsive.min.css" rel="stylesheet" />
<link href="themes/css/font-awesome.css" rel="stylesheet"
	type="text/css">
<!-- Google-code-prettify -->
<link href="themes/js/google-code-prettify/prettify.css"
	rel="stylesheet" />
<!-- fav and touch icons -->
<link rel="shortcut icon" href="themes/images/ico/favicon.ico">
<link rel="apple-touch-icon-precomposed" sizes="144x144"
	href="themes/images/ico/apple-touch-icon-144-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="114x114"
	href="themes/images/ico/apple-touch-icon-114-precomposed.png">
<link rel="apple-touch-icon-precomposed" sizes="72x72"
	href="themes/images/ico/apple-touch-icon-72-precomposed.png">
<link rel="apple-touch-icon-precomposed"
	href="themes/images/ico/apple-touch-icon-57-precomposed.png">
<style type="text/css" id="enject"></style>
</head>
<body>
	<jsp:include page="header.jsp" />
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="#"><img src="themes/images/ico-cart.png"
							alt="cart"> <span id="cartsize1">${user.cart.size() == null ? '0' : user.cart.size()}</span>
							Items in your cart </a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
						<li class="subMenu open"><a> Category </a>
							<ul>
								<c:forEach var="c" items="${categorys }">
									<li><a class="active" href="category/${c.cate_id }.htm"><i
											class="icon-chevron-right"></i>${c.cate_name } </a></li>
								</c:forEach>
							</ul></li>
					</ul>
					<br /> <br />
					<div class="thumbnail">
						<img src="themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="index.htm">Home</a> <span class="divider">/</span></li>
						<li class="active">Registration</li>
					</ul>
					<h3>Registration</h3>
					<div class="well">
						<!--
	<div class="alert alert-info fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	<div class="alert fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply dummy</strong> text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div>
	 <div class="alert alert-block alert-error fade in">
		<button type="button" class="close" data-dismiss="alert">×</button>
		<strong>Lorem Ipsum is simply</strong> dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s
	 </div> -->
						<form:form class="form-horizontal" modelAttribute="newUser"
							action="register.htm">
							<h4>Your personal information</h4>
							<div class="control-group">
								<label class="control-label">Title <sup>*</sup></label>
								<div class="controls">
									<select class="span1" name="days">
										<option value="">-</option>
										<option value="1">Mr.</option>
										<option value="2">Mrs</option>
										<option value="3">Miss</option>
									</select>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputFname1">First
									name <sup>*</sup>
								</label>
								<div class="controls">
									<input type="text" id="inputFname1" placeholder="First Name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputLnam">Last name <sup>*</sup></label>
								<div class="controls">
									<input type="text" id="inputLnam" placeholder="Last Name">
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="input_email">Email <sup>*</sup></label>
								<div class="controls">
									<form:input path="email" type="text" id="input_email"
										placeholder="Email" />
									<form:errors path="email"></form:errors>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="username">User name <sup>*</sup></label>
								<div class="controls">
									<form:input path="username" type="text" id="username"
										placeholder="User name" />
									<form:errors path="username"></form:errors>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="inputPassword1">Password
									<sup>*</sup>
								</label>
								<div class="controls">
									<form:input path="password" type="password" id="inputPassword1"
										placeholder="Password" />
									<form:errors path="password"></form:errors>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label" for="confirm">Confirm <sup>*</sup>
								</label>
								<div class="controls">
									<form:input path="confirm" type="password" id="confirm"
										placeholder="Confirm" />
									<form:errors path="confirm"></form:errors>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Date of Birth <sup>*</sup></label>
								<div class="controls">
									<select class="span1" name="days">
										<option value="">-</option>
										<option value="1">1&nbsp;&nbsp;</option>
										<option value="2">2&nbsp;&nbsp;</option>
										<option value="3">3&nbsp;&nbsp;</option>
										<option value="4">4&nbsp;&nbsp;</option>
										<option value="5">5&nbsp;&nbsp;</option>
										<option value="6">6&nbsp;&nbsp;</option>
										<option value="7">7&nbsp;&nbsp;</option>
									</select> <select class="span1" name="days">
										<option value="">-</option>
										<option value="1">1&nbsp;&nbsp;</option>
										<option value="2">2&nbsp;&nbsp;</option>
										<option value="3">3&nbsp;&nbsp;</option>
										<option value="4">4&nbsp;&nbsp;</option>
										<option value="5">5&nbsp;&nbsp;</option>
										<option value="6">6&nbsp;&nbsp;</option>
										<option value="7">7&nbsp;&nbsp;</option>
									</select> <select class="span1" name="days">
										<option value="">-</option>
										<option value="1">1&nbsp;&nbsp;</option>
										<option value="2">2&nbsp;&nbsp;</option>
										<option value="3">3&nbsp;&nbsp;</option>
										<option value="4">4&nbsp;&nbsp;</option>
										<option value="5">5&nbsp;&nbsp;</option>
										<option value="6">6&nbsp;&nbsp;</option>
										<option value="7">7&nbsp;&nbsp;</option>
									</select>
								</div>
							</div>

							<div class="alert alert-block alert-error fade in">
								<button type="button" class="close" data-dismiss="alert">×</button>
								<strong>Lorem Ipsum is simply</strong> dummy text of the
								printing and typesetting industry. Lorem Ipsum has been the
								industry's standard dummy text ever since the 1500s
							</div>

							<div class="control-group">
								<div class="controls">
									<button name="btnRegister" class="btn btn-large btn-success">Register</button>
								</div>
							</div>
						</form:form>
					</div>

				</div>
			</div>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a>YOUR ACCOUNT</a> <a>PERSONAL INFORMATION</a> <a>ADDRESSES</a> <a>DISCOUNT</a>
					<a>ORDER HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a>CONTACT</a> <a>REGISTRATION</a> <a>LEGAL NOTICE</a> <a>TERMS
						AND CONDITIONS</a> <a>FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a>NEW PRODUCTS</a> <a>TOP SELLERS</a> <a>SPECIAL OFFERS</a> <a>MANUFACTURERS</a>
					<a>SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a><img width="60" height="60" src="themes/images/facebook.png"
						title="facebook" alt="facebook" /></a> <a><img width="60"
						height="60" src="themes/images/twitter.png" title="twitter"
						alt="twitter" /></a> <a><img width="60" height="60"
						src="themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; Bootshop</p>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="themes/js/jquery.js" type="text/javascript"></script>
	<script src="themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="themes/js/google-code-prettify/prettify.js"></script>

	<script src="themes/js/bootshop.js"></script>
	<script src="themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Themes switcher section ============================================================================================= -->
	<div id="secectionBox">
		<link rel="stylesheet" href="themes/switch/themeswitch.css"
			type="text/css" media="screen" />
		<script src="themes/switch/theamswitcher.js" type="text/javascript"
			charset="utf-8"></script>
		<div id="themeContainer">
			<div id="hideme" class="themeTitle">Style Selector</div>
			<div class="themeName">Oregional Skin</div>
			<div class="images style">
				<a href="themes/css/#" name="bootshop"><img
					src="themes/switch/images/clr/bootshop.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="themes/css/#" name="businessltd"><img
					src="themes/switch/images/clr/businessltd.png"
					alt="bootstrap business templates" class="active"></a>
			</div>
			<div class="themeName">Bootswatch Skins (11)</div>
			<div class="images style">
				<a href="themes/css/#" name="amelia" title="Amelia"><img
					src="themes/switch/images/clr/amelia.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="spruce" title="Spruce"><img
					src="themes/switch/images/clr/spruce.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="superhero" title="Superhero"><img
					src="themes/switch/images/clr/superhero.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="cyborg"><img src="themes/switch/images/clr/cyborg.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="cerulean"><img
					src="themes/switch/images/clr/cerulean.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="journal"><img src="themes/switch/images/clr/journal.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="readable"><img
					src="themes/switch/images/clr/readable.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="simplex"><img src="themes/switch/images/clr/simplex.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="slate"><img src="themes/switch/images/clr/slate.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="spacelab"><img
					src="themes/switch/images/clr/spacelab.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="united"><img src="themes/switch/images/clr/united.png"
					alt="bootstrap business templates"></a>
				<p
					style="margin: 0; line-height: normal; margin-left: -10px; display: none;">
					<small>These are just examples and you can build your own
						color scheme in the backend.</small>
				</p>
			</div>
			<div class="themeName">Background Patterns</div>
			<div class="images patterns">
				<a href="themes/css/#" name="pattern1"><img
					src="themes/switch/images/pattern/pattern1.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="themes/css/#" name="pattern2"><img
					src="themes/switch/images/pattern/pattern2.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern3"><img
					src="themes/switch/images/pattern/pattern3.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern4"><img
					src="themes/switch/images/pattern/pattern4.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern5"><img
					src="themes/switch/images/pattern/pattern5.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern6"><img
					src="themes/switch/images/pattern/pattern6.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern7"><img
					src="themes/switch/images/pattern/pattern7.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern8"><img
					src="themes/switch/images/pattern/pattern8.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern9"><img
					src="themes/switch/images/pattern/pattern9.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern10"><img
					src="themes/switch/images/pattern/pattern10.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern11"><img
					src="themes/switch/images/pattern/pattern11.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern12"><img
					src="themes/switch/images/pattern/pattern12.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern13"><img
					src="themes/switch/images/pattern/pattern13.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern14"><img
					src="themes/switch/images/pattern/pattern14.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern15"><img
					src="themes/switch/images/pattern/pattern15.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern16"><img
					src="themes/switch/images/pattern/pattern16.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern17"><img
					src="themes/switch/images/pattern/pattern17.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern18"><img
					src="themes/switch/images/pattern/pattern18.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern19"><img
					src="themes/switch/images/pattern/pattern19.png"
					alt="bootstrap business templates"></a> <a href="themes/css/#"
					name="pattern20"><img
					src="themes/switch/images/pattern/pattern20.png"
					alt="bootstrap business templates"></a>

			</div>
		</div>
	</div>
	<span id="themesBtn"></span>
</body>
</html>