<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>

	<title>관리자모드</title>
	
	<script src="/resources/jquery/jquery-3.5.1.min.js"></script>
	
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap.min.css">
	<link rel="stylesheet" href="/resources/bootstrap/bootstrap-theme.min.css">
	<script src="/resources/bootstrap/bootstrap.min.js"></script>
	
	<script src="/resources/ckeditor/ckeditor.js" ></script>

	<link rel="stylesheet" href="/resources/css/admin/index.css">
	<link rel="stylesheet" href="/resources/css/admin/goods/register.css">
	
	<link rel="icon" href="/resources/images/gun.png" />

</head>

<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<%@ include file="../include/header.jsp"%>
			</div>
		</header>
	
		<nav id="nav">
			<div id="nav_box">
				<%@ include file="../include/nav.jsp"%>
			</div>
		</nav>
	
		<section id="container">
			<aside>
				<%@ include file="../include/aside.jsp"%>
			</aside>
			<div id="container_box">
				<h2>상품 등록</h2>
	
				<form role="form" method="post" autocomplete="off" enctype="multipart/form-data" class="registerForm">
	
				<div class="inputArea"> 
					<label>1차 분류</label>
					<select class="category1">
						<option value="">전체</option>
					</select>
				
					<label>2차 분류</label>
					<select class="category2" name="cateCode">
						<option value="">전체</option>
					</select>
				</div>
				
				<div class="inputArea">
					<label for="gdsName">상품명</label>
					<input type="text" id="gdsName" name="gdsName" />
				</div>
				
				<div class="inputArea">
					<label for="gdsPrice">상품가격</label>
					<input type="text" id="gdsPrice" name="gdsPrice" />
				</div>
				
				<div class="inputArea">
					<label for="gdsStock">상품수량</label>
					<input type="text" id="gdsStock" name="gdsStock" />
				</div>
				
				<div class="inputArea">
					<label for="gdsDes">상품소개</label>
					<textarea rows="5" cols="50" id="gdsDes" name="gdsDes"></textarea>
					
					<script>
						var ckeditor_config = {
							resize_enaleb : false,
							enterMode : CKEDITOR.ENTER_BR,
							shiftEnterMode : CKEDITOR.ENTER_P,
							filebrowserUploadUrl : "/admin/goods/ckUpload"
						};
	
						CKEDITOR.replace("gdsDes", ckeditor_config);
					</script>
				</div>
				
				<div class="inputArea">
					<label for="gdsImg">이미지</label>
					<input type="file" id="gdsImg" name="file" />
					<div class="select_img"><img src="" /></div>
					
					<script>
						$("#gdsImg").change(function(){
							if(this.files && this.files[0]) {
								var reader = new FileReader;
								reader.onload = function(data){
									$(".select_img img").attr("src", data.target.result).width(500);
								}
								reader.readAsDataURL(this.files[0]);
							}
						});
					</script>
					
					<%=request.getRealPath("/") %>
				</div>
				
				<div class="inputArea">
					<button type="button" id="register_Btn" class="btn btn-primary">등록</button>
					<script>
						$("#register_Btn").click(function(){
							var regConfirm = confirm("정말로 등록하시겠습니까?");

							if(regConfirm == true){
								$(".registerForm").submit();
							} else{
								return;
							}
						});
					</script>
				</div>
				
				</form>
			</div>
		</section>
	</div>
	
	<%@ include file="../include/TopBtn.jsp" %>

	<footer id="footer">
		<div id="footer_box">
			<%@ include file="../include/footer.jsp"%>
		</div>
	</footer>
	
	<script>
		if($("#root").height() >= 486){
			$("#footer").css("position", "relative");
		}
	</script>
	
	<script>
		var jsonData = JSON.parse('${category}');
		console.log(jsonData);

		var cate1Arr = new Array();
		var cate1Obj = new Object();

		for (var i = 0; i < jsonData.length; i++) {
			if (jsonData[i].level == "1") {
				cate1Obj = new Object(); 
				cate1Obj.cateCode = jsonData[i].cateCode;
				cate1Obj.cateName = jsonData[i].cateName;
				cate1Arr.push(cate1Obj);
			}
		}

		var cate1Select = $("select.category1")

		for (var i = 0; i < cate1Arr.length; i++) {
			cate1Select.append("<option value='" + cate1Arr[i].cateCode + "'>" + cate1Arr[i].cateName + "</option>");
		}

		
		$(document).on("change", "select.category1", function(){

			var cate2Arr = new Array();
			var cate2Obj = new Object();
			
			for(var i = 0; i < jsonData.length; i++) {
				if(jsonData[i].level == "2") {
					cate2Obj = new Object(); 
					cate2Obj.cateCode = jsonData[i].cateCode;
					cate2Obj.cateName = jsonData[i].cateName;
					cate2Obj.cateCodeRef = jsonData[i].cateCodeRef;
				 	cate2Arr.push(cate2Obj);
				}
			}
			 
			var cate2Select = $("select.category2");
			
			cate2Select.children().remove();

			$("option:selected", this).each(function(){
				var selectVal = $(this).val();
				cate2Select.append("<option value='" + selectVal + "'>전체</option>");

				for(var i = 0; i < cate2Arr.length; i++){
					if(selectVal == cate2Arr[i].cateCodeRef){
						cate2Select.append("<option value='" + cate2Arr[i].cateCode + "'>" + cate2Arr[i].cateName + "</option>");
					}
				}
			})
		});
	</script>
	<script>
		var regExp = /[^0-9]/gi;

		$("#gdsPrice").keyup(function(){ numCheck($(this));});
		$("#gdsStock").keyup(function(){ numCheck($(this));});

		function numCheck(selector){
			var tempVal = selector.val();
			selector.val(tempVal.replace(regExp,""));
		}
	</script>
</body>
</html>
