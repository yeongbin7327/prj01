<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function Slider(target, type) {
	  // 상태
	  let index = 1;
	  let isMoved = true;
	  const speed = 1000; // ms

	  // 방향
	  const transform = "transform " + speed / 1000 + "s";
	  let translate = (i) => "translateX(-" + 100 * i + "%)";
	  if (type === "V") {
	    translate = (i) => "translateY(-" + 100 * i + "%)";
	  }

	  // 슬라이더
	  const slider = document.querySelector(target);
	  const sliderRects = slider.getClientRects()[0];
	  slider.style["overflow"] = "hidden";

	  // 슬라이더 화면 컨테이너
	  const container = document.createElement("div");
	  container.style["display"] = "flex";
	  container.style["flex-direction"] = type === "V" ? "column" : "row";
	  container.style["width"] = sliderRects.width + "px";
	  container.style["height"] = sliderRects.height + "px";
	  container.style["transform"] = translate(index);

	  // 슬라이더 화면 목록
	  let boxes = [].slice.call(slider.children);
	  boxes = [].concat(boxes[boxes.length - 1], boxes, boxes[0]);

	  // 슬라이더 화면 스타일
	  const size = boxes.length;
	  for (let i = 0; i < size; i++) {
	    const box = boxes[i];
	    box.style["flex"] = "none";
	    box.style["flex-wrap"] = "wrap";
	    box.style["height"] = "100%";
	    box.style["width"] = "100%";
	    container.appendChild(box.cloneNode(true));
	  }

	  // 처음/마지막 화면 눈속임 이벤트
	  container.addEventListener("transitionstart", function () {
	    isMoved = false;
	    setTimeout(() => {
	      isMoved = true;
	    }, speed);
	  });
	  container.addEventListener("transitionend", function () {
	    // 처음으로 순간이동
	    if (index === size - 1) {
	      index = 1;
	      container.style["transition"] = "none";
	      container.style["transform"] = translate(index);
	    }
	    // 끝으로 순간이동
	    if (index === 0) {
	      index = size - 2;
	      container.style["transition"] = "none";
	      container.style["transform"] = translate(index);
	    }
	  });

	  // 슬라이더 붙이기
	  slider.innerHTML = "";
	  slider.appendChild(container);

	  return {
	    move: function (i) {
	      if (isMoved === true) {
	        index = i;
	        container.style["transition"] = transform;
	        container.style["transform"] = translate(index);
	      }
	    },
	    next: function () {
	      if (isMoved === true) {
	        index = (index + 1) % size;
	        container.style["transition"] = transform;
	        container.style["transform"] = translate(index);
	      }
	    },
	    prev: function () {
	      if (isMoved === true) {
	        index = index === 0 ? index + size : index;
	        index = (index - 1) % size;
	        container.style["transition"] = transform;
	        container.style["transform"] = translate(index);
	      }
	    }
	  };
	}

	const s1 = new Slider("#slider1", "H");
	const s2 = new Slider("#slider2", "V");

	setInterval(() => {
	  s1.next();
	  s2.next();
	}, 1000)
</script>
<style>
section {
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
}

.slider {
  width: 100px;
  height: 100px;
}
.box {
  text-align: center;
  line-height: 100px;
  font-size: 60px;
  color: #fff;
  font-weight: bold;
}
</style>
</head>
<body>
	<%@ include file="../header.jsp"%>

	<section>
	<!-- 
		<div class="right_menu">
			<a href="#"><img
				src="httpds://contents.kyobobook.co.kr/resources/fo/images/common/ink/btn_header_my@2x.png"></a>
		</div>
	 -->

			<div id="slider1" class="slider">
				<div class="box" style="background-color: #000;">1</div>
				<div class="box" style="background-color: #000;">2</div>
				<div class="box" style="background-color: #000;">3</div>
				<div class="box" style="background-color: #000;">4</div>
				<div class="box" style="background-color: #000;">5</div>
			</div>

			<div id="slider2" class="slider">
				<div class="box" style="background-color: #ff0000;">1</div>
				<div class="box" style="background-color: #ff0000;">2</div>
				<div class="box" style="background-color: #ff0000;">3</div>
				<div class="box" style="background-color: #ff0000;">4</div>
				<div class="box" style="background-color: #ff0000;">5</div>
			</div>

	</section>

	<%@ include file="../footer.jsp"%>

</body>
</html>
