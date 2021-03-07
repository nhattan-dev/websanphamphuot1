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
	<jsp:include page="header-static.jsp"></jsp:include>
	<!-- Header End====================================================================== -->
	<div id="mainBody">
		<div class="container">
			<div class="row" style="width: 100% !important;"
				style="display: flex !important; justify-content: center !important;">
				<!-- Sidebar end=============================================== -->
				<div class="span9" style="width: 100% !important;">
					<div class="row" style="width: 100% !important;">
						<div class="span9" style="width: 100% !important;">
							<ul class="nav nav-tabs">
								<li class="active"><a href="#product" data-toggle="tab">Products</a></li>
								<li><a href="#category" data-toggle="tab">Categories</a></li>
								<li><a href="#userlogin" data-toggle="tab">User</a></li>
							</ul>
							<div id="myTabContent" class="tab-content"
								style="display: flex; justify-content: center;">
								<div class="tab-pane fade active in" id="product"
									style="width: 100% !important;">
									<a href="insert-product.htm"><button type="submit"
											class="btn btn-primary">Thêm Sản Phẩm</button></a> <br> <br>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="text-align: center; width: 5%">ID</th>
												<th style="text-align: center; width: 35%">Tên Sản Phẩm</th>
												<th style="text-align: center; width: 10%">Giá</th>
												<th style="text-align: center; width: 10%">Category ID</th>
												<th style="text-align: center;">Mô tả</th>
												<th style="text-align: center; width: 8%">Số lượng</th>
												<th style="text-align: center; width: 13%">Chức năng</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="p" items="${products }">
												<tr>
													<td style="text-align: center;">${p.id }</td>
													<td>${p.name.trim() }</td>
													<td style="text-align: right;">${p.price }</td>
													<td style="text-align: center;">${p.category.cate_id }</td>
													<td>${p.des.trim().substring(0, Math.min(s.length(), 30)) }</td>
													<td style="text-align: right;">${p.quantity}</td>
													<td style="text-align: center;"><a
														href="edit-product/${p.id }.htm">Sửa</a> <a
														onclick="remove_product(${p.id} ,this)">Xóa</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade in" id="category"
									style="width: 50% !important;">
									<a href="insert-cate.htm"><button type="submit"
											class="btn btn-primary">Thêm Chủ Đề</button></a> <br> <br>
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="text-align: center; width: 15%">ID</th>
												<th style="text-align: center;">Tên Chủ Đề</th>
												<th style="text-align: center; width: 25%">Mô tả</th>
												<th style="text-align: center; width: 20%">Chức năng</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="c" items="${categories }">
												<tr>
													<td style="text-align: center;">${c.cate_id }</td>
													<td>${c.cate_name.trim() }</td>
													<td>${c.description.trim() }</td>
													<td style="text-align: center;"><a
														style="margin-right: 10px;"
														href="edit-cate/${c.cate_id }.htm">Sửa</a> <a
														onclick="remove_category( '${c.cate_id}' ,this)">Xóa</a></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="tab-pane fade in" id="userlogin"
									style="width: 50% !important;">
									
									<table class="table table-striped table-bordered">
										<thead>
											<tr>
												<th style="text-align: center; width: 10%">ID</th>
												<th style="text-align: center; width: 25%">Username</th>
												<th style="text-align: center; width: 20%">Password</th>
												<th style="text-align: center; width: 35%">Email</th>
												<th style="text-align: center; width: 10%">Role</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach var="u" items="${userlogin }">
												<tr>
													<td style="text-align: center;">${u.id }</td>
													<td>${u.username.trim() }</td>
													<td>${u.password.trim() }</td>
													<td>${u.email.trim() }</td>
													<td>${u.role_id.trim() }</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
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

	function remove_product(id, btn) {
		if(window.confirm("Bạn có muốn xóa sản phẩm?")){
			$.ajax({
				url:"/SanPhamPhuot1/delete-product/" + id + ".htm",
				type:"GET",
				success: function(value){
					if(value == "nologgedin"){
						window.location.href = "/SanPhamPhuot1/user-login.htm";
					}else if(value == "done"){
						var row = btn.parentNode.parentNode;
						row.parentNode.removeChild(row);
					}	 else if(value == "fail"){
						alert("Thất bại !");
					}
				}
			})
		}
	}
	function remove_category(id, btn) {
		if(window.confirm("Bạn có muốn xóa Category?"))
		{
			$.ajax({
				url:"/SanPhamPhuot1/delete-cate/" + id + ".htm",
				type:"GET",
				success: function(value){
					if(value == "nologgedin"){
						window.location.href = "/SanPhamPhuot1/user-login.htm";
					}else if(value == "done"){
						var row = btn.parentNode.parentNode;
						row.parentNode.removeChild(row);
					} else if(value == "fail"){
						alert("Thất bại !");
					}
				}
			})
		}
	}
	</script>
</body>
</html>