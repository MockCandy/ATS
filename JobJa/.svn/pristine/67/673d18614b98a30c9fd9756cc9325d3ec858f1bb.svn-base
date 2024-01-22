<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">

<style>

.body-sub-title {
	font-size: 24px;
	font-weight: bold;
	margin-bottom: 8px;
}

.title-hr {
	border: 1px solid #ccc;
	margin-bottom: 8px;
}

tr:hover .appList {
	font-weight:bold;
}

.recruit-li{
    font-size: 15px;
    font-weight: bold;
}

.empty-title{
	text-align: center;
    font-size: 20px;
    font-weight: bold;
    margin-top: 20%;
    color: tomato;
}

.highlight {
    color: #00c362; 
}

.not-search{
	display: flex;
}

.not-keyword {
    border: 1px solid rgb(212, 212, 212);
    cursor: pointer;
    padding: 5px;
}

.not-search-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-left:none;
    padding:5px;
}

.not-keyword:focus {
	 border: 1px solid green;
	 outline: none;
}

.not-search-btn:hover {
	border: 1px solid green;
}

.not-keyword:hover {
	 border: 1px solid green;
}

.date{
	border: 1px solid #c9c9c9;
}

.rec-list{
	margin-top: 16px;
}

.span-list {
/* 	text-align: center; */
    display: grid;
    align-items: center;
    grid-template-columns: 1fr 1fr 1fr 1fr 1fr;
}

.span-list > :last-child {
    text-align: center;
}

.span-list > :nth-child(4) {
	text-align: center;
}

.span-list > :nth-child(3) {
	text-align: center;
}

.rec-part2 {
	color: #323438;
    line-height: 22px;
    font-size: 15px;
    white-space: nowrap;
    margin: 16px 0 16px;
}

.select-form{
	border-color: gray;
    border-radius: 5px;
    width: 140px;
    border: 1px solid #C4C4C4;
    box-sizing: border-box;
    border-radius: 10px;
    padding: 5px 5px;
}

.rec-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}

.rec-btn:hover{
	background-color: #00c362;
	color: white;
};

.ajax-rec-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 8px;
}

.ajax-rec-btn:hover{
	background-color: #00c362;
	color: white;
};

.appList {
	font-size: 14px;
	font-weight: bold;
	cursor: pointer;
	text-align: center;
	cursor: pointer;
}

.appList:hover {
	font-weight:bold;
}

.not-search{
	display: flex;
}
 
 .sp-bold {
 	font-weight: bold;
 }
 
body{
	background-color:#fff;
}
.cen {
	padding-bottom:0;
}
</style>

<!-- 지원자 현황에 채용공고 목록 페이지 -->
<div class="mypage-body-con">
		
	<div class="rec-item mt-20">
		
			<div class="recruite-cen">
				
				<form class="not-search mb-12">
					<h2 class="body-sub-title">채용 공고 <span class="highlight">(${total})</span></h2>
					<input class="not-keyword ml-auto" type="text" placeholder="검색할 내용을 입력해주세요" name="keyword" value="${keyword}" />
					<input class="not-search-btn btn-search" type="submit" value="검색" />
				</form>
				
			</div>
			<table class="table1">
				<colgroup>
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				
				<thead>
					<tr>
						<th>마감날짜</th>
						<th>공고제목</th>
						<th>모집기간</th>
						<th>지원자목록</th>
						<th>지원자 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="recruitVO" items="${info.content}">
					<tr>
						<c:choose>
							<c:when test="${recruitVO.remainingDate > 0}">
								<td class="txt-orange p-13 bold">D-${recruitVO.remainingDate}</td>
							</c:when>
							<c:when test="${recruitVO.remainingDate == null}">
								<td class="txt-sig p-13 bold">상시채용</td>							
							</c:when>
							<c:when test="${recruitVO.remainingDate < 0}">
								<td class="txt-gray p-13 bold">마감</td>							
							</c:when>
							<c:otherwise>								
								<td class="txt-red p-13 bold">오늘 마감!</td>							
							</c:otherwise>
						</c:choose>
		                <td class="rec-part2">${recruitVO.recruitTitle}</td>
			            <td><fmt:formatDate value="${recruitVO.recruitStdt}" pattern="yy-MM-dd" /> ~
			            <fmt:formatDate value="${recruitVO.recruitEddt}" pattern="yy-MM-dd" /></td>
						<td class="appList">
							<a href="/entApplicant/applicationList?recruitNo=${recruitVO.recruitNo}"> 지원자 현황 </a>
						</td>
						<td class="sp-bold">${recruitVO.appCount} 명</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
				
			<div class="pagez">
				${info.getPagingArea4() }
			</div>
	</div>
</div>
