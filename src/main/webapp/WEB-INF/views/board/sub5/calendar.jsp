<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<html>
<head>
<title>이젠북컴퍼니 > 열린공간 > 도서관일정</title>
</head>
<link rel="stylesheet" href="/resources/css/board/sub5/calendar.css">
<link rel="stylesheet" href="/resources/css/board/sub5/calendar2.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"
	integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
	crossorigin="anonymous"></script>

<body>
	
	<div class="header">
    <jsp:include page="../../header.jsp"></jsp:include>
    </div>
	
	<div class="container">
		<div class="sub_title">
			<div class="doc-info">
				<!-- doc title -->
				<div class="doc-title">
					<h3>도서관일정</h3>
					<ul>
						<!-- 홈 btn img -->
						<li class="first" style="background-image: none;">
						<a href="/"><img src="/resources/imges/common/navi_home_icon.gif">
						</a></li>
						<li><a href="/board/noticeList">열린공간</a></li>
						<li><a href="/board/calendar">도서관일정</a></li>
					</ul>

				</div>
			</div>
		</div>
		<div class="section">
			<div class="doc">

				<!-- 왼쪽 사이드바 -->
				<jsp:include page="../lnb.jsp"></jsp:include>

				<!-- 본문 -->
				<div class="content">
					<div class="doc">
						<div class="wrapper-bbs">
							<!-- 테이블 -->
							<div id='calendar'></div>

						</div>
					</div>

				</div>

			</div>


		</div>

	</div>

	<!-- footer -->
	<jsp:include page="../../footer.jsp"></jsp:include>
	<script src="/resources/js/board/calendar.js"></script>
	<script>
        $(function () {
            $(".sub5").addClass("active");
        });
    </script>
	<script>

		$.ajax({ 
			type:"get", 
			url:"/board/calendar_list", 
			dataType:"json",
			success: function(data) {
				cbkRes(data);
			}
		});
	
		function cbkRes(data){
			var calendarEl = document.getElementById('calendar');
	        // new FullCalendar.Calendar(대상 DOM객체, {속성:속성값, 속성2:속성값2..}) 
	        var calendar = new FullCalendar.Calendar(calendarEl, {
	            headerToolbar: {
	                left: 'prev,next',
	                center: 'title',
	                right: 'today'
	            },
	            
	            titleFormat : function(date) { // title 설정
	            	return date.date.year +"년 "+(date.date.month +1)+"월"; 
	            },
	            
	            dayHeaderContent: function (date) { // 요일 설정
	                let weekList = ["일", "월", "화", "수", "목", "금", "토"];
	                return weekList[date.dow];
	            },
	            
	            // 이벤트명 : function(){} : 각 날짜에 대한 이벤트를 통해 처리할 내용.. 
	            dayMaxEvents: true, // allow "more" link when too many events
	            events: data
			});
	   		calendar.render();
		}
	</script>

</body>
</html>
