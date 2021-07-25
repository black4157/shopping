<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- top버튼 -->
<button type="button" href="#" id="TopBtn"><img src="/resources/images/top.png" id="TopImg"></button>
<script>
	$(function() {
		$(window).scroll(function(){
			if($(this).scrollTop() > 200){
				$("#TopBtn").fadeIn();
			} else {
				$("#TopBtn").fadeOut();
			}
		});

		$("#TopBtn").click(function(){
			$("html, body").animate({
				scrollTop : 0
			},400);
		});
	});
</script>