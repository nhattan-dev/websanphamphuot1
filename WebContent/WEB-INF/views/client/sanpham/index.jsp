<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<base href="${pageContext.servletContext.contextPath }/">
<title>Vi Vu Phượt</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
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
							<a href="product/summary.htm"><span id="cartsize"
								class="btn btn-mini btn-primary"><i
									class="icon-shopping-cart icon-white"></i> [ ${user.cart.size() == null ? '0' : user.cart.size()}
									] Itemes in your cart </span> </a>
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
						<a class="brand" href="index.htm"><img
							src="themes/images/logo.png" alt="Bootsshop" /></a>

						<form class="form-inline navbar-search" method="post"
							action="product/search.htm">
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
										<form class="form-horizontal loginFrm" action="login.htm">
											<input type="hidden" name="from"
												value="${requestScope['javax.servlet.forward.request_uri']}">
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
							<li  style="${user!=null?'display: none;':''}"><a href="register.htm" style="padding-right: 0"><span
									class="btn btn-large btn-success">Register</span></a></li>
							<!--LOGOUT BUTTON  -->
							<li class="" style="${user==null?'display: none;':''}">
								<form action="logout.htm">
									<button name="btnLogout" style="margin-top: 20px;" class="btn">Logout</button>
								</form>
							</li>
						</ul>
					</div>
				</div>
			</div>

		</div>
	</div>
	<!-- Header End====================================================================== -->
	<div id="carouselBlk">
		<div id="myCarousel" class="carousel slide">
			<div class="carousel-inner">
				<div class="item active">
					<div class="container">
						<a href="category/fullface.htm"><img style="width: 100%"
							src="images/SLIDE/fullface.jpg" alt="special offers" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="category/gangtay.htm"><img style="width: 100%"
							src="images/SLIDE/gangtay.jpg" alt="special offers" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="#"><img style="width: 100%"
							src="images/SLIDE/giapgoi.jpg" alt="special offers" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
				<div class="item">
					<div class="container">
						<a href="category/giapao.htm"><img style="width: 100%"
							src="images/SLIDE/giapao.jpg" alt="special offers" /></a>
						<div class="carousel-caption">
							<h4>Second Thumbnail label</h4>
							<p>Cras justo odio, dapibus ac facilisis in, egestas eget
								quam. Donec id elit non mi porta gravida at eget metus. Nullam
								id dolor id nibh ultricies vehicula ut id elit.</p>
						</div>
					</div>
				</div>
			</div>
			<a class="left carousel-control" href="#myCarousel" data-slide="prev">&lsaquo;</a>
			<a class="right carousel-control" href="#myCarousel"
				data-slide="next">&rsaquo;</a>
		</div>
	</div>
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="product/summary.htm"><img
							src="themes/images/ico-cart.png" alt="cart">Go to your cart</a>
					</div>
					<!-- -----------------------------CATEGORY--------------------------------- -->
					<ul id="sideManu" class="nav nav-tabs nav-stacked"
						style="overflow:;">
						<li class="subMenu open"><a> Category</a>
							<ul>
								<c:forEach var="c" items="${categorys }">
									<li><a class="active" href="category/${c.cate_id }.htm"><i
											class="icon-chevron-right"></i>${c.cate_name } </a></li>
								</c:forEach>
							</ul></li>
					</ul>
					<!-- ----------------------------END CATEGORY---------------------------------------- -->
					<br /> <br />
					<div class="thumbnail">
						<img src="themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- =================================SIDEBAR END=========================================================== -->
				<!-- =================================BEGIN FEATURED PRODUCTS=============================================== -->
				<div class="span9">
					<div class="well well-small">
						<h4>
							Featured Products <small class="pull-right">200+ featured
								products</small>
						</h4>
						<div class="row-fluid">
							<div id="featured" class="carousel slide">
								<div class="carousel-inner">
									<div class="item active">
										<ul class="thumbnails">
											<!--==============================================================  -->
											<c:forEach var="f" items="${featured }" begin="0" end="3">
												<li class="span3">
													<div class="thumbnail" style="min-height: 300px">
														<i class="tag"></i> <a href="product_details/${f.id }.htm"><img
															src="images/${f.images[0].image }" alt=""></a>
														<div class="caption">
															<h5>${f.name }</h5>
															<h4 style="position: absolute; bottom: 5px;">
																<a class="btn" style="margin-right: 10px;"
																	href="product_details/${f.id }.htm">VIEW</a> <span
																	class="pull-right">$${f.price }</span>
															</h4>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<!--==============================================================  -->
											<c:forEach var="f" items="${featured }" begin="4" end="7">
												<li class="span3">
													<div class="thumbnail" style="min-height: 300px">
														<i class="tag"></i> <a href="product_details/${f.id }.htm"><img
															src="images/${f.images[0].image }" alt=""></a>
														<div class="caption">
															<h5>${f.name }</h5>
															<h4 style="position: absolute; bottom: 5px;">
																<a class="btn" style="margin-right: 10px;"
																	href="product_details/${f.id }.htm">VIEW</a> <span
																	class="pull-right">$${f.price }</span>
															</h4>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
									<div class="item">
										<ul class="thumbnails">
											<!--==============================================================  -->
											<c:forEach var="f" items="${featured }" begin="8" end="11">
												<li class="span3">
													<div class="thumbnail" style="min-height: 300px">
														<i class="tag"></i> <a href="product_details/${f.id }.htm"><img
															src="images/${f.images[0].image }" alt=""></a>
														<div class="caption">
															<h5>${f.name }</h5>
															<h4 style="position: absolute; bottom: 5px;">
																<a class="btn" style="margin-right: 10px;"
																	href="product_details/${f.id }.htm">VIEW</a> <span
																	class="pull-right">$${f.price }</span>
															</h4>
														</div>
													</div>
												</li>
											</c:forEach>
										</ul>
									</div>
								</div>
								<a class="left carousel-control" href="#featured"
									data-slide="prev">‹</a> <a class="right carousel-control"
									href="#featured" data-slide="next">›</a>
							</div>
						</div>
					</div>
					<h4>Latest Products</h4>
					<ul class="thumbnails">
						<c:forEach var="p" items="${products }">
							<li class="span3">
								<div class="thumbnail" style="min-height: 410px">
									<a href="product_details/${p.id }.htm"><img
										src="./images/${p.images[0].image }" alt=""
										style="max-height: 210px; !important" /></a>
									<div class="caption">
										<h5>${p.name }</h5>
										<p>Lorem Ipsum is simply dummy text.</p>

										<h4
											style="text-align: center; position: absolute; bottom: 5px;">
											<a class="btn"> <i class="icon-zoom-in"></i></a> <a
												class="btn" onclick="add(${p.id} )">Add to <i
												class="icon-shopping-cart"></i>
											</a> <a class="btn btn-primary" style="min-width: 80px">$${p.price }</a>
										</h4>
									</div>
								</div>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
	</div>
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
					<a>NEW PRODUCTS</a> <a>TOP SELLERS</a> <a>SPECIAL
						OFFERS</a> <a>MANUFACTURERS</a> <a>SUPPLIERS</a>
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
	<script>
	function add(id) {
		/* alert("sss"); */
		
			$.ajax({
				url:"/SanPhamPhuot1/add.htm",
				type:"GET",
				data:{
					id : id
				},
				success: function(value){
					if(value == "nologgedin"){
						window.location.href = "/SanPhamPhuot1/user-login.htm";
					}else if(value == "failquantity"){
						alert("Hết hàng !");
					}else{
						$("#cartsize").text("[ " + value + " ] Itemes in your cart");
					}	
				}
			})
	}
	</script>
</body>
</html>