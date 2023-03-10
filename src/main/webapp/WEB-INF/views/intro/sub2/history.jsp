<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이젠북컴퍼니 > 회사소개 > 연혁</title>
<link rel="stylesheet" href="/resources/css/intro/history.css">
<link rel="stylesheet" href="/resources/css/intro/road.css">
<link rel="stylesheet" href="/resources/css/header.css">
<link rel="stylesheet" href="/resources/css/footer.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" 
 integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
 crossorigin="anonymous"></script>
</head>
<body>

    <div class="header">
    <jsp:include page="../../header.jsp"></jsp:include>
    </div>

    <div class="container">
        <div class="sub_title">
            <div class="doc-info">
                <!-- doc title -->
                <div class="doc-title">
                    <h3>연혁</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/intro/greeting">회사소개</a>
                        </li>
                        <li>
                            <a href="/intro/history">연혁</a>
                        </li>
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
                            <div class="history">
                                <div>
                                    <h2>2022</h2>
                                    <ol>
                                        <li><b>7월</b> : 영남인재교육원 국비교육 시작</li>
                                        <li><b>8월</b> : 기초 웹 교육 </li>
                                        <li><b>9월</b> : 개인프로젝트 시작 </li>
                                        <li><b>10월</b> : 팀프로젝트 이젠북컴퍼니 계획</li>
                                        <li><b>11월</b> : 이젠북컴퍼니 개발 시작</li>
                                        <li><b>12월</b> : 이젠북컴퍼니 개관</li>
                                    </ol>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>
    <script>
        $(function () {
            $(".sub2").addClass("active");
        });

    </script>

</body>
</html>