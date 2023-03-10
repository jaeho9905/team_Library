<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ page session="false" %>
<html>
<head>
	<title>이젠북컴퍼니 > 열린공간 > 묻고답하기</title>
</head>
	<link rel="stylesheet" href="/resources/css/board/sub3/qna_page.css">
	<link rel="stylesheet" href="/resources/css/header.css">
	<link rel="stylesheet" href="/resources/css/footer.css">
	<script
  src="https://code.jquery.com/jquery-3.6.0.js"
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
                    <h3>묻고답하기</h3>
                    <ul>
                        <!-- 홈 btn img -->
                        <li class="first" style="background-image: none;">
                            <a href="/">
                                <img src="/resources/imges/common/navi_home_icon.gif">
                            </a>
                        </li>
                        <li>
                            <a href="/board/noticeList">열린공간</a> 
                        </li>
                        <li>
                            <a href="/board/qnaBoardList">묻고답하기</a>
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
                            <!-- 게시물 수 -->
                            <div class="inline">
                            	<form action="">
                            		<input type="hidden" name="type" value="${pageMaker.cri.type}">
                                	<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
                            	
	                                <span style="margin-right: 10px;"> 총 게시물 : <b>${total}</b> 건</span>
	                                <select name="amount">
	                                
	                                <c:if test="${pageMaker.cri.amount == 10}">
	                                    <option value="10" selected="selected">10개씩 보기</option>
	                                    <option value="20">20개씩 보기</option>
	                                    <option value="30">30개씩 보기</option>
	                                    <option value="40">40개씩 보기</option>
	                                </c:if>
	                                
	                                <c:if test="${pageMaker.cri.amount == 20}"> 
	                                    <option value="10">10개씩 보기</option>
	                                    <option value="20" selected="selected">20개씩 보기</option>
	                                    <option value="30">30개씩 보기</option>
	                                    <option value="40">40개씩 보기</option>
	                                </c:if>
	                                
	                                <c:if test="${pageMaker.cri.amount == 30}"> 
	                                    <option value="10">10개씩 보기</option>
	                                    <option value="20">20개씩 보기</option>
	                                    <option value="30" selected="selected">30개씩 보기</option>
	                                    <option value="40">40개씩 보기</option>
	                                </c:if>
	                                
	                                <c:if test="${pageMaker.cri.amount == 40}"> 
	                                    <option value="10">10개씩 보기</option>
	                                    <option value="20">20개씩 보기</option>
	                                    <option value="30">30개씩 보기</option>
	                                    <option value="40" selected="selected">40개씩 보기</option>
	                                </c:if>
	                                
	                                </select>
	                                
	                                <input type="hidden" name="page" value="1">
	                                <button class="btn">이동</button>
                                </form>

                            </div>

                            <!-- 테이블 -->
                            <div class="table-wrap">
                            	<c:if test="${not empty qnaBoardList }">
                                <table>
                                    <thead>
                                        <tr>
                                            <th style="width: 12%;">번호</th>
                                            <th>제목</th>
                                            <th style="width: 18%;">작성자</th>
                                            <th style="width: 12%;">작성일</th>
                                            <th style="width: 15%;">조회수</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach var="eBod" items="${qnaBoardList}">
                                    
                                        <tr>
                                            <td class="num">${eBod.enquiry_no}</td>
                                            <td class="left contentGo" style="padding-left: 15px;">
 												<a href="${eBod.enquiry_no}">${eBod.enquiry_title}</a>
                                            </td>
                                            <td>${eBod.writer_name}</td>
                                            <td>
                                            	<fmt:formatDate var="enquiry_reg_date" value="${eBod.enquiry_reg_date}" pattern="yyyy-MM-dd"/>
												${enquiry_reg_date}
                                            </td>
                                            <td>${eBod.enquiry_hits}</td>
                                        </tr>
                                        
                                        <c:if test="${eBod.answerList.answer_title != null}">
                                        <tr>
                                            <td class="num"><input type="hidden" value="${eBod.answerList.answer_no}"></td>
                                            <td class="left answerContentGo" style="padding-left: 15px;">
 												<a href="${eBod.answerList.answer_no}">
 												<img src=/resources/imges/common/icon_reply.gif alt="답변 아이콘 이미지">
 													${eBod.answerList.answer_title}
 												</a>
                                            </td>
                                            <td>관리자</td>
                                            <td>
                                            	<fmt:formatDate var="answer_reg_date" value="${eBod.answerList.answer_reg_date}" pattern="yyyy-MM-dd"/>
												${answer_reg_date}
                                            </td>
                                            <td>${eBod.answerList.answer_hits}</td>
                                        </tr>
                                        </c:if>
                                    </c:forEach>   
                                    </tbody>
                                </table>
                                
                                </c:if>
                                <c:if test="${empty qnaBoardList }">
                                <br>
                                <h2>조회된 게시글이 없습니다.</h2>
								</c:if>
								
								
                                <!-- 글쓰기 btn -->
                                <button class="write_btn" onclick="location.href='/board/qnaBoardWrite'" style="cursor: pointer">글쓰기</button>
                                
                                <br>
                                
                                <div class="pageInfo" style="">
   
		                           <c:if test="${pageMaker.prev }">
		                              <a class="not" href="${pageMaker.startPage - 1}">이전</a>
		                           </c:if>
		                           
		                           <c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
		                              <a class="${pageMaker.cri.page == num ? "current":"not" }" href="${num }"><span>${num }</span></a>
		                           </c:forEach>
		                           
		                           <c:if test="${pageMaker.next }">
		                              <a class="not" href="${pageMaker.endPage + 1}">다음</a>
		                           </c:if>
		                        </div>
								
                                <br>
                                
                                <div class="searchBox">
                                	<form action="/board/qnaBoardList" method="get">
                                		<input type="hidden" name="page" value="1">
                                		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
                                		
                                		<select name="type">
                                		<c:choose>
                                			<c:when test="${pageMaker.cri.type eq 'title'}">
                                				<option value="TC">제목+내용</option>
		                                		<option value="title" selected="selected">제목</option>
		                                		<option value="content">내용</option>
                                			</c:when>
                                			
                                			<c:when test="${pageMaker.cri.type eq 'content'}">
                                				<option value="TC">제목+내용</option>
		                                		<option value="title">제목</option>
		                                		<option value="content" selected="selected">내용</option>
                                			</c:when>
                                		
                                			<c:otherwise>
                                				<option value="TC" selected="selected">제목+내용</option>
		                                		<option value="title">제목</option>
		                                		<option value="content">내용</option>
                                			</c:otherwise>
                                		</c:choose>
                                		</select>
                                		
                                		<c:choose>
                                			<c:when test="${fn:length(pageMaker.cri.keyword) == 0}">
                                				<input type="text" name="keyword" placeholder="검색어를 입력하세요" autocomplete="off">
                                			</c:when>
                                			<c:otherwise>
                                				<input type="text" name="keyword" value="${pageMaker.cri.keyword}" autocomplete="off">
                                			</c:otherwise>
                                		</c:choose>
                                		
                                		
                                		<input class="search_btn" type="submit" value="검색">
                                	</form>
                                </div>
                                
                                                 
                            </div>

                        </div>

                    </div>

                </div>

            </div>
        </div>
    </div> 
    
    <form action="/board/qnaBoardList" method="get" class="moveForm">
		<input type="hidden" name="page" value="${pageMaker.cri.page}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
	</form>
	
	<form action="/board/qnaBoardContent" method="get" class="moveForm2">
		<input type="hidden" name="page" value="${pageMaker.cri.page}">
		<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		<input type="hidden" name="type" value="${pageMaker.cri.type}">
		<input type="hidden" name="enquiry_no" value="">
		<input type="hidden" name="answer_no" value="">
	</form>


    <!-- footer -->
    <jsp:include page="../../footer.jsp"></jsp:include>

	
<script>

	$(function() {
		$(".sub3").addClass("active");
		var moveForm = $(".moveForm");
		var moveForm2 = $(".moveForm2");

		$(".pageInfo a").on("click", function(e) {
			e.preventDefault();
			moveForm.find("input[name = 'page']").val($(this).attr("href"));
			moveForm.submit();
		})
		
		$(".answerContentGo a").on("click", function(e) {
			e.preventDefault();
			moveForm2.find("input[name = 'answer_no']").val($(this).attr("href"));
			moveForm2.attr("action", "/board/answerBoardContent");
			moveForm2.submit();
			
		}); 
		
		$(".contentGo a").on("click", function(e) {
			e.preventDefault();
			moveForm2.find("input[name = 'enquiry_no']").val($(this).attr("href"));
			moveForm2.attr("action", "/board/qnaBoardContent");
			moveForm2.submit();
			
		}); 
		
		
		
		
		
	});

	
</script>
</body>
</html>
