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
<style type="text/css" id="enject">
*[id$=errors] {
	color: red;
	font-style: italic;
}
</style>
</head>
<body>
	<jsp:include page="header-static.jsp"></jsp:include>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<hr class="soften">
			<h3>Thêm Sản Phẩm:</h3>
			<hr class="soften" />
			<header>
				<section id="form">
					<div class="row-fluid">
						<div class="span6">
							<form:form class="form-inline" action="./edit-product/check.htm"
								enctype="multipart/form-data" modelAttribute="product">
								<fieldset>
									<div class="control-group">
										<label class="control-label" for="input_1">Mã Sản Phẩm</label>
										<div class="controls">
											<form:input path="id" readonly="true" class="input-small" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="input_1">Tên Sản
											Phẩm</label>
										<div class="controls">
											<form:input path="name" class="input-xxlarge" />
											<form:errors path="name"></form:errors>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="input14">Số lượng</label>
										<div class="controls">
											<form:input path="quantity" class="input-small" />
											<form:errors path="quantity"></form:errors>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="input12">Giá</label>
										<div class="controls">
											<form:input path="price" class="input-medium" />
											<form:errors path="price"></form:errors>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="select01">Loại</label>
										<div class="controls">
											<form:select path="cate_id" items="${ categories}"
												itemLabel="cate_name" itemValue="cate_id"></form:select>
											<form:errors path="cate_id"></form:errors>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="textarea">Mô tả</label>
										<div class="controls">
											<form:textarea path="des" class="input-xxlarge" rows="3" />
											<form:errors path="des"></form:errors>
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="fileInput1">Ảnh 1</label>
										<div class="controls">
											<form:errors path="img1"></form:errors>
											<form:input path="img1" class="input-file" id="fileInput1"
												type="file" name="a1" onchange="readURL1(this);" />
											<br> <img id="a1"
												src="./images/${product.img1.getOriginalFilename() }"
												style="width: 200px; height: 200px;" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="fileInput2">Ảnh 2</label>
										<div class="controls">
											<form:errors path="img2"></form:errors>
											<form:input path="img2" class="input-file" id="fileInput2"
												type="file" name="a2" onchange="readURL2(this);" />
											<br> <img id="a2"
												src="./images/${product.img2.getOriginalFilename() }"
												style="width: 200px; height: 200px;" />
										</div>
									</div>
									<div class="control-group">
										<label class="control-label" for="fileInput3">Ảnh 3</label>
										<div class="controls">
											<form:errors path="img3"></form:errors>
											<form:input path="img3" class="input-file" id="fileInput3"
												type="file" name="a3" onchange="readURL3(this);" />
											<br> <img id="a3"
												src="./images/${product.img3.getOriginalFilename() }"
												style="width: 200px; height: 200px;" />
										</div>
									</div>
									<div class="form-actions">
										<button type="submit" class="btn btn-primary" name="btnSave">Save
											changes</button>
										<button class="btn" name="btnReset">Reset</button>
										<button class="btn" name="btnExit">Exit</button>
									</div>
									<form:input path="imgString1" style = "display:none"/>
									<form:input path="imgString2" style = "display:none"/>
									<form:input path="imgString3" style = "display:none"/>
								</fieldset>
							</form:form>

						</div>
					</div>
				</section>
			</header>
		</div>
	</div>
	<!-- MainBody End ============================= -->
	<!-- Footer ================================================================== -->
	<div id="footerSection">
		<div class="container">
			<div class="row">
				<div class="span3">
					<h5>ACCOUNT</h5>
					<a href="login.html">YOUR ACCOUNT</a> <a href="login.html">PERSONAL
						INFORMATION</a> <a href="login.html">ADDRESSES</a> <a
						href="login.html">DISCOUNT</a> <a href="login.html">ORDER
						HISTORY</a>
				</div>
				<div class="span3">
					<h5>INFORMATION</h5>
					<a href="contact.html">CONTACT</a> <a href="register.html">REGISTRATION</a>
					<a href="legal_notice.html">LEGAL NOTICE</a> <a href="tac.html">TERMS
						AND CONDITIONS</a> <a href="faq.html">FAQ</a>
				</div>
				<div class="span3">
					<h5>OUR OFFERS</h5>
					<a href="#">NEW PRODUCTS</a> <a href="#">TOP SELLERS</a> <a
						href="special_offer.html">SPECIAL OFFERS</a> <a href="#">MANUFACTURERS</a>
					<a href="#">SUPPLIERS</a>
				</div>
				<div id="socialMedia" class="span3 pull-right">
					<h5>SOCIAL MEDIA</h5>
					<a href="#"><img width="60" height="60"
						src="./themes/images/facebook.png" title="facebook"
						alt="facebook" /></a> <a href="#"><img width="60" height="60"
						src="./themes/images/twitter.png" title="twitter" alt="twitter" /></a>
					<a href="#"><img width="60" height="60"
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
	<script>
		function readURL1(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#a1').attr('src', e.target.result).width(200)
							.height(200);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		function readURL2(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#a2').attr('src', e.target.result).width(200)
							.height(200);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
		function readURL3(input) {
			if (input.files && input.files[0]) {
				var reader = new FileReader();

				reader.onload = function(e) {
					$('#a3').attr('src', e.target.result).width(200)
							.height(200);
				};

				reader.readAsDataURL(input.files[0]);
			}
		}
	</script>
	<span id="themesBtn"></span>
</body>
</html>