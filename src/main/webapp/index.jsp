<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no">
<!-- <meta name="x5-fullscreen" content="true">
<meta name="full-screen" content="yes"> -->
<meta name="apple-mobile-web-app-capable" content="yes" />
<style type="text/css">
html, body {
	overflow: hidden;
	margin: 0px;
	background-color: yellow;
}
div {=

}
#leftMouse {
	z-index : 10;
	width: 50px;
	height: 100px;
	background-color: red; 
	position:absolute;
	right: 0px;
	top: 0px;
}
</style>
<title>Insert title here</title>
</head>

<body>

	<div id="workdiv"
		style="width: 85%; height: 1000px; background-color: gray">
		<div>10.0aaa</div>
		<div>
			<span id="coordinate"></span>
		</div>
		<div>
			<span id="return"></span>
		</div>
		<div>
			<span id="startcurrent"></span>
		</div>
	</div>
	<div id="leftMouse">
	</div>
</body>
<script src="js/jquery-3.1.1.js"></script>
<script type="text/javascript">
var html = document.querySelector('html');
html.addEventListener('touchmove', function(event) {
	event.preventDefault();
	});
html.addEventListener('touchstart', function(event) {
	event.preventDefault();
	});
	var obj = document.querySelector('#workdiv');
	var lastDate = new Date();
	obj.addEventListener('touchmove', function(event) {
		var currentDate = new Date();
		if(currentDate.getTime() - lastDate.getTime() < 50) {
			return;
		} else {
			lastDate = currentDate;
		}
		event.preventDefault();
		// 如果这个元素的位置内只有一个手指的话
		if (event.targetTouches.length == 1) {
			var touch = event.targetTouches[0];
			var spanX = touch.pageX - pressX;
			var spanY = touch.pageY - pressY;
			$("#coordinate").text(touch.pageX + ", " + touch.pageY);

			$.get("coordinate.jsp?spanX="+spanX+"&spanY=" + spanY, function(data, status) {
				$('#return').text("Data: " + data + "nStatus: " + status);
			});
			pressX = touch.pageX;
			pressY = touch.pageY;
			/* var direct = "none";
			if (Math.abs(spanX) > Math.abs(spanY)) {
			    //水平方向
			    if (spanX > 0) {
			        direct = "right";//向右
			        //do right function
			    } else {
			        direct = "left";//向左
			        //do left function
			    }
			} else {
			    //垂直方向
			    if (spanY > 0) {
			        direct = "down";//向下
			        //do down function
			    } else {
			        direct = "up";//向上
			        //do up function
			    }
			}
			
			// 把元素放在手指所在的位置
			touchMove.value = direct + "(" + spanX + ';' + spanY + ")"; */
		}

	}, false);
	
	obj.addEventListener('touchstart', function(event) {
		event.preventDefault();

		// 如果这个元素的位置内只有一个手指的话
		if (event.targetTouches.length == 1) {
			var touch = event.targetTouches[0];
			// 把元素放在手指所在的位置
			pressX = touch.pageX;
			pressY = touch.pageY;
			$('#startcurrent').text(pressX + ',' + pressY);
			touchStart.value = pressX + ';' + pressY;
		}
	}, false);
	obj.addEventListener('touchend', function(event) {
		event.preventDefault();

		// 如果这个元素的位置内只有一个手指的话
		if (event.targetTouches.length == 1) {
			var touch = event.targetTouches[0];
			// 把元素放在手指所在的位置
			pressX = touch.pageX;
			pressY = touch.pageY;
			$('#startcurrent').text(pressX + ',' + pressY);
			touchStart.value = pressX + ';' + pressY;
		}
	}, false);
	document.querySelector('#leftMouse').addEventListener('touchstart',function(){
		$('#return').text("leftMouse");
		$.get("click.jsp?click=0", function(data, status) {
			$('#return').text("Data: " + data + "nStatus: " + status);
		});
	});
</script>
<script type="text/javascript">
	$(function() {
	});
</script>
</html>