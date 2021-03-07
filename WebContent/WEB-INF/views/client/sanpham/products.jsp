<%@ page pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Bootshop online Shopping cart</title>
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
	<script src="./themes/js/less.js" type="text/javascript"></script> -->

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
	<jsp:include page="header.jsp" />
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row">
				<!-- Sidebar ================================================== -->
				<div id="sidebar" class="span3">
					<div class="well well-small">
						<a id="myCart" href="./product/summary.htm"><img
							src="./themes/images/ico-cart.png" alt="cart">Go to your
							cart </a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked"
						style="overflow:;">
						<li class="subMenu open"><a> Category</a>
							<ul>
								<c:forEach var="c" items="${categorys }">
									<li><a class="active"
										href="./category/${c.cate_id }.htm"><i
											class="icon-chevron-right"></i>${c.cate_name } </a></li>
								</c:forEach>
							</ul></li>
					</ul>
					<br /> <br />
					<div class="thumbnail">
						<img src="./themes/images/payment_methods.png"
							title="Bootshop Payment Methods" alt="Payments Methods">
						<div class="caption">
							<h5>Payment Methods</h5>
						</div>
					</div>
				</div>
				<!-- Sidebar end=============================================== -->
				<div class="span9">
					<ul class="breadcrumb">
						<li><a href="./index.htm">Home</a> <span class="divider">/</span></li>
						<li class="active">Products Name</li>
					</ul>
					<h3>
						Products Name <small class="pull-right"> ${prods.size() }
							products are available </small>
					</h3>
					<hr class="soft" />
					<p>Nowadays the lingerie industry is one of the most successful
						business spheres.We always stay in touch with the latest fashion
						tendencies - that is why our goods are so popular and we have a
						great number of faithful customers all over the country.</p>
					<hr class="soft" />
					<form class="form-horizontal span6">
						<div class="control-group">
							<label class="control-label alignL">Sort By </label> <select>
								<option>Priduct name A - Z</option>
								<option>Priduct name Z - A</option>
								<option>Priduct Stoke</option>
								<option>Price Lowest first</option>
							</select>
						</div>
					</form>

					<div id="myTab" class="pull-right">
						<a href="#listView" data-toggle="tab"><span
							class="btn btn-large"><i class="icon-list"></i></span></a> <a
							href="#blockView" data-toggle="tab"><span
							class="btn btn-large btn-primary"><i class="icon-th-large"></i></span></a>
					</div>
					<br class="clr" />
					<div class="tab-content">
						<div class="tab-pane" id="listView">
							<!-- ===========================================Product======================= -->
							<c:forEach var="p" items="${prods }">
								<div class="row">
									<div class="span2">
										<img src="./images/${p.images[0].image }" alt="" />
									</div>
									<div class="span4">
										<h3>New | Available</h3>
										<hr class="soft" />
										<h5>${p.name }</h5>
										<p>Nowadays the lingerie industry is one of the most
											successful business spheres.We always stay in touch with the
											latest fashion tendencies - that is why our goods are so
											popular..</p>
										<a class="btn btn-small pull-right"
											href="./product_details/${p.id }.htm">View Details</a> <br
											class="clr" />
									</div>
									<div class="span3 alignR">
										<form class="form-horizontal qtyFrm">
											<h3>$${p.price }</h3>
											<br> <br /> <a class="btn btn-large btn-primary"
												onclick="add(${p.id})"> Add to <i
												class=" icon-shopping-cart"></i>
											</a> <a class="btn btn-large"><i class="icon-zoom-in"></i></a>

										</form>
									</div>
								</div>
								<hr class="soft" />
							</c:forEach>
						</div>
						<!-- ===========================================Product======================= -->
						<div class="tab-pane  active" id="blockView">
							<ul class="thumbnails">
								<c:forEach var="p" items="${prods }">
									<li class="span3">
										<div class="thumbnail" style="min-height: 430px; !important">
											<a href="./product_details/${p.id }.htm"><img
												src="./images/${p.images[0].image }" alt=""
												style="max-height: 210px; !important" /></a>
											<div class="caption" style="position: absolute; bottom: 5px;">
												<h5>${p.name }</h5>
												<p>I'm a paragraph. Click here</p>
												<h4 style="text-align: center;">
													<a class="btn" href="./product_details/${p.id }.htm">
														<i class="icon-zoom-in"></i>
													</a> <a class="btn" onclick="add(${p.id})">Add to <i
														class="icon-shopping-cart"></i>
													</a> <a class="btn btn-primary">&euro;${p.price }</a>
												</h4>
											</div>
										</div>
									</li>
								</c:forEach>
							</ul>
							<hr class="soft" />
						</div>
					</div>

					<a class="btn btn-large pull-right">Compair
						Product</a>
					<div class="pagination">
						<ul>
							<li><a >&lsaquo;</a></li>
							<li><a >1</a></li>
							<li><a >2</a></li>
							<li><a >3</a></li>
							<li><a >4</a></li>
							<li><a >...</a></li>
							<li><a >&rsaquo;</a></li>
						</ul>
					</div>
					<br class="clr" />
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
					<a>YOUR ACCOUNT</a> <a>PERSONAL
						INFORMATION</a> <a>ADDRESSES</a> <a>DISCOUNT</a>
					<a>ORDER HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a>CONTACT</a> <a>REGISTRATION</a>
					<a>LEGAL NOTICE</a> <a>TERMS
						AND CONDITIONS</a> <a>FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a>NEW PRODUCTS</a> <a>TOP SELLERS</a> <a
						>SPECIAL OFFERS</a> <a>MANUFACTURERS</a>
					<a>SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a><img width="60" height="60"
						src="./themes/images/facebook.png" title="facebook" alt="facebook" /></a>
					<a><img width="60" height="60"
						src="./themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a><img width="60" height="60"
						src="./themes/images/youtube.png" title="youtube" alt="youtube" /></a>
				</div>
			</div>
			<p class="pull-right">&copy; Bootshop</p>
		</div>
		<!-- Container End -->
	</div>
	<!-- Placed at the end of the document so the pages load faster ============================================= -->
	<script src="./themes/js/jquery.js" type="text/javascript"></script>
	<script src="./themes/js/bootstrap.min.js" type="text/javascript"></script>
	<script src="./themes/js/google-code-prettify/prettify.js"></script>

	<script src="./themes/js/bootshop.js"></script>
	<script src="./themes/js/jquery.lightbox-0.5.js"></script>

	<!-- Themes switcher section ============================================================================================= -->
	<div id="secectionBox">
		<link rel="stylesheet" href="./themes/switch/themeswitch.css"
			type="text/css" media="screen" />
		<script src="./themes/switch/theamswitcher.js" type="text/javascript"
			charset="utf-8"></script>
		<div id="themeContainer">
			<div id="hideme" class="themeTitle">Style Selector</div>
			<div class="themeName">Oregional Skin</div>
			<div class="images style">
				<a href="./themes/css/#" name="bootshop"><img
					src="./themes/switch/images/clr/bootshop.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="./themes/css/#" name="businessltd"><img
					src="./themes/switch/images/clr/businessltd.png"
					alt="bootstrap business templates" class="active"></a>
			</div>
			<div class="themeName">Bootswatch Skins (11)</div>
			<div class="images style">
				<a href="./themes/css/#" name="amelia" title="Amelia"><img
					src="./themes/switch/images/clr/amelia.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="spruce" title="Spruce"><img
					src="./themes/switch/images/clr/spruce.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="superhero" title="Superhero"><img
					src="./themes/switch/images/clr/superhero.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="cyborg"><img src="./themes/switch/images/clr/cyborg.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="cerulean"><img
					src="./themes/switch/images/clr/cerulean.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="journal"><img
					src="./themes/switch/images/clr/journal.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="readable"><img
					src="./themes/switch/images/clr/readable.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="simplex"><img
					src="./themes/switch/images/clr/simplex.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="slate"><img src="./themes/switch/images/clr/slate.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="spacelab"><img
					src="./themes/switch/images/clr/spacelab.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="united"><img src="./themes/switch/images/clr/united.png"
					alt="bootstrap business templates"></a>
				<p
					style="margin: 0; line-height: normal; margin-left: -10px; display: none;">
					<small>These are just examples and you can build your own
						color scheme in the backend.</small>
				</p>
			</div>
			<div class="themeName">Background Patterns</div>
			<div class="images patterns">
				<a href="./themes/css/#" name="pattern1"><img
					src="./themes/switch/images/pattern/pattern1.png"
					alt="bootstrap business templates" class="active"></a> <a
					href="./themes/css/#" name="pattern2"><img
					src="./themes/switch/images/pattern/pattern2.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern3"><img
					src="./themes/switch/images/pattern/pattern3.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern4"><img
					src="./themes/switch/images/pattern/pattern4.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern5"><img
					src="./themes/switch/images/pattern/pattern5.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern6"><img
					src="./themes/switch/images/pattern/pattern6.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern7"><img
					src="./themes/switch/images/pattern/pattern7.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern8"><img
					src="./themes/switch/images/pattern/pattern8.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern9"><img
					src="./themes/switch/images/pattern/pattern9.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern10"><img
					src="./themes/switch/images/pattern/pattern10.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern11"><img
					src="./themes/switch/images/pattern/pattern11.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern12"><img
					src="./themes/switch/images/pattern/pattern12.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern13"><img
					src="./themes/switch/images/pattern/pattern13.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern14"><img
					src="./themes/switch/images/pattern/pattern14.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern15"><img
					src="./themes/switch/images/pattern/pattern15.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern16"><img
					src="./themes/switch/images/pattern/pattern16.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern17"><img
					src="./themes/switch/images/pattern/pattern17.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern18"><img
					src="./themes/switch/images/pattern/pattern18.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern19"><img
					src="./themes/switch/images/pattern/pattern19.png"
					alt="bootstrap business templates"></a> <a href="./themes/css/#"
					name="pattern20"><img
					src="./themes/switch/images/pattern/pattern20.png"
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