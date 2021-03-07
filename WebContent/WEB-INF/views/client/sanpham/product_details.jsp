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
							src="./themes/images/ico-cart.png" alt="cart"> <span
							id="cartsize1"> ${user.cart.size() }</span> Items in your cart </a>
					</div>
					<ul id="sideManu" class="nav nav-tabs nav-stacked">
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
						<li><a href="./index.htm">Products</a> <span class="divider">/</span></li>
						<li class="active">${product.name}</li>
					</ul>
					<div class="row">
						<div id="gallery" class="span3">
							<a href="./images/${product.images[0].image }"
								title="${product.name }"> <img
								src="./images/${product.images[0].image }" style="width: 100%"
								alt="Fujifilm FinePix S2950 Digital Camera" />
							</a>
							<div class="item <!-- active -->">
								<a href="./images/${product.images[0].image }"> <img
									style="width: 29%" src="./images/${product.images[0].image }"
									alt="" />
								</a> <a href="./images/${product.images[1].image }"> <img
									style="width: 29%" src="./images/${product.images[1].image }"
									alt="" />
								</a> <a href="./images/${product.images[2].image }"> <img
									style="width: 29%" src="./images/${product.images[2].image }"
									alt="" />
								</a>
							</div>
							<div class="btn-toolbar">
								<div class="btn-group">
									<span class="btn"><i class="icon-envelope"></i></span> <span
										class="btn"><i class="icon-print"></i></span> <span
										class="btn"><i class="icon-zoom-in"></i></span> <span
										class="btn"><i class="icon-star"></i></span> <span class="btn"><i
										class=" icon-thumbs-up"></i></span> <span class="btn"><i
										class="icon-thumbs-down"></i></span>
								</div>
							</div>
						</div>
						<div class="span6">
							<h3>${product.name }</h3>
							<small>${product.des.substring(0,Math.min(Integer.parseInt(30), product.des.length())) }</small>
							<hr class="soft" />
							<form class="form-horizontal qtyFrm">
								<div class="control-group">
									<label class="control-label"><span>$${product.price
											}</span></label>
									<div class="controls">
										<a type="submit" onclick="add(${product.id })"
											class="btn btn-large btn-primary pull-right"> Add to cart
											<i class=" icon-shopping-cart"></i>
										</a>
									</div>
								</div>
							</form>

							<hr class="soft" />
							<h4>${product.quantity} items in stock</h4>
							<form class="form-horizontal qtyFrm pull-right">
								<div class="control-group">
									<label class="control-label"><span>Color</span></label>
									<div class="controls">
										<select class="span2">
											<%-- <c:forEach var="c" items="${product.colors }">
												<option>${c.color }</option>
											</c:forEach> --%>
											<!-- <option>Black</option>
											<option>Red</option>
											<option>Blue</option>
											<option>Brown</option> -->
										</select>
									</div>
								</div>
							</form>
							<hr class="soft clr" />
							<p>${product.des }</p>
							<a class="btn btn-small pull-right" href="#detail">More
								Details</a> <br class="clr" /> <a href="#" name="detail"></a>
							<hr class="soft" />
						</div>

						<div class="span9">
							<ul id="productDetail" class="nav nav-tabs">
								<li class="active"><a href="#home" data-toggle="tab">Product
										Details</a></li>
								<li><a href="#profile" data-toggle="tab">Related
										Products</a></li>
							</ul>
							<div id="myTabContent" class="tab-content">
								<div class="tab-pane fade active in" id="home">
									<h4>Product Information</h4>
									<table class="table table-bordered">
										<tbody>
											<tr class="techSpecRow">
												<th colspan="2">Product Details</th>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Brand:</td>
												<td class="techSpecTD2">Fujifilm</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Model:</td>
												<td class="techSpecTD2">FinePix S2950HD</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Released on:</td>
												<td class="techSpecTD2">2011-01-28</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Dimensions:</td>
												<td class="techSpecTD2">5.50" h x 5.50" w x 2.00" l,
													.75 pounds</td>
											</tr>
											<tr class="techSpecRow">
												<td class="techSpecTD1">Display size:</td>
												<td class="techSpecTD2">3</td>
											</tr>
										</tbody>
									</table>

									<h5>Features</h5>
									<p>
										14 Megapixels. 18.0 x Optical Zoom. 3.0-inch LCD Screen. Full
										HD photos and 1280 x 720p HD movie capture. ISO sensitivity
										ISO6400 at reduced resolution. Tracking Auto Focus. Motion
										Panorama Mode. Face Detection technology with Blink detection
										and Smile and shoot mode. 4 x AA batteries not included. WxDxH
										110.2 Ã81.4x73.4mm. Weight 0.341kg (excluding battery and
										memory card). Weight 0.437kg (including battery and memory
										card).<br /> OND363338
									</p>

									<h4>Editorial Reviews</h4>
									<h5>Manufacturer's Description</h5>
									<p>With a generous 18x Fujinon optical zoom lens, the S2950
										really packs a punch, especially when matched with its 14
										megapixel sensor, large 3.0" LCD screen and 720p HD (30fps)
										movie capture.</p>

									<h5>Electric powered Fujinon 18x zoom lens</h5>
									<p>The S2950 sports an impressive 28mm â 504mm* high
										precision Fujinon optical zoom lens. Simple to operate with an
										electric powered zoom lever, the huge zoom range means that
										you can capture all the detail, even when you're at a
										considerable distance away. You can even operate the zoom
										during video shooting. Unlike a bulky D-SLR, bridge cameras
										allow you great versatility of zoom, without the hassle of
										carrying a bag of lenses.</p>
									<h5>Impressive panoramas</h5>
									<p>With its easy to use Panoramic shooting mode you can get
										creative on the S2950, however basic your skills, and rest
										assured that you will not risk shooting uneven landscapes or
										shaky horizons. The camera enables you to take three
										successive shots with a helpful tool which automatically
										releases the shutter once the images are fully aligned to
										seamlessly stitch the shots together in-camera. It's so easy
										and the results are impressive.</p>

									<h5>Sharp, clear shots</h5>
									<p>Even at the longest zoom settings or in the most
										challenging of lighting conditions, the S2950 is able to
										produce crisp, clean results. With its mechanically stabilised
										1/2 3", 14 megapixel CCD sensor, and high ISO sensitivity
										settings, Fujifilm's Dual Image Stabilisation technology
										combines to reduce the blurring effects of both hand-shake and
										subject movement to provide superb pictures.</p>
								</div>
								<div class="tab-pane fade" id="profile">
									<div id="myTab" class="pull-right">
										<a href="#listView" data-toggle="tab"><span
											class="btn btn-large"><i class="icon-list"></i></span></a> <a
											href="#blockView" data-toggle="tab"><span
											class="btn btn-large btn-primary"><i
												class="icon-th-large"></i></span></a>
									</div>
									<br class="clr" />
									<hr class="soft" />
									<div class="tab-content">
										<div class="tab-pane" id="listView">
											<c:forEach var="p" items="${relatedProducts }">
												<div class="row">
													<div class="span2">
														<img src="./images/${p.images[0].image }" alt="" />
													</div>
													<div class="span4">
														<h3>New | Available</h3>
														<hr class="soft" />
														<h5>${p.name }</h5>
														<p>Nowadays the lingerie industry is one of the most
															successful business spheres.We always stay in touch with
															the latest fashion tendencies - that is why our goods are
															so popular..</p>
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
											<div class="row">
												<div class="span2">
													<img src="./themes/images/products/4.jpg" alt="" />
												</div>
												<div class="span4">
													<h3>New | Available</h3>
													<hr class="soft" />
													<h5>Product Name</h5>
													<p>Nowadays the lingerie industry is one of the most
														successful business spheres.We always stay in touch with
														the latest fashion tendencies - that is why our goods are
														so popular..</p>
													<a class="btn btn-small pull-right"
														href="product_details.htm">View Details</a> <br
														class="clr" />
												</div>
												<div class="span3 alignR">
													<form class="form-horizontal qtyFrm">
														<h3>$222.00</h3>
														<label class="checkbox"> <input type="checkbox">
															Adds product to compair
														</label><br />
														<div class="btn-group">
															<a href="product_details.htm"
																class="btn btn-large btn-primary"> Add to <i
																class=" icon-shopping-cart"></i></a> <a
																href="product_details.htm" class="btn btn-large"><i
																class="icon-zoom-in"></i></a>
														</div>
													</form>
												</div>
											</div>

										</div>
										<div class="tab-pane active" id="blockView">
											<ul class="thumbnails">
												<c:forEach var="p" items="${relatedProducts }">
													<li class="span3">
														<div class="thumbnail"
															style="min-height: 430px; !important">
															<a href="./product_details/${p.id }.htm"><img
																src="./images/${p.images[0].image }" alt=""
																style="max-height: 210px; !important" /></a>
															<div class="caption"
																style="position: absolute; bottom: 5px;">
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
									<br class="clr">
								</div>
							</div>
						</div>

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