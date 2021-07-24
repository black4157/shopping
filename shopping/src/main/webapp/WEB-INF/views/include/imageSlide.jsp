<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>
	$(document).ready(function() {
		var imgs;
		var img_count;
		var img_position = 1;

		imgs = $(".slide ul");
		img_count = imgs.children().length;

		$("#back").click(function() {
			back();
		});
		$("#next").click(function() {
			next();
		});

		function back() {
			if (1 < img_position) {
				imgs.animate({
					left : "+=400px"
				});

				img_position--;
			} else {
				imgs.animate({
					left : "-=2000px"
				});
				img_position = 6;
				//alert("첫 사진입니다.");
			}
		}

		function next() {
			if (img_count > img_position) {
				imgs.animate({
					left : "-=400px"
				});

				img_position++;
			} else {
				imgs.animate({
					left : "+=2000px"
				});
				img_position = 1;
				//alert("마지막 사진입니다.");
			}
		}
	});
</script>