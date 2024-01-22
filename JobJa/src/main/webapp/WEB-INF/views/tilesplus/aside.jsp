<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<style>
	.menu_wrap{
	position: absolute;
    left:0;
    width: 150px;
    float: left;
    background-color: white;}
</style>

<div class="menu_wrap ">
	<ul class="dep1">
		<li>
			<a href="#">내정보<i class="fa-solid fa-chevron-down"></i></a>	
			<ul class="dep2 ">
				<li><a href="/member/myInfo">- 내 정보 관리</a></li>
				<li><a href="#">- 내 파일 보관함</a></li>
				<li><a href="#">- 개인 일정 관리</a></li>
			</ul>	
		</li>
		<li>
			<a href="#">이력서<i class="fa-solid fa-chevron-down"></i></a>	
			<ul class="dep2">
				<li><a href="#">- 등록</a></li>
				<li><a href="#">- 목록</a></li>
			</ul>	
		</li>
		<li>
			<a href="#">자기소개서<i class="fa-solid fa-chevron-down"></i></a>	
			<ul class="dep2">
				<li><a href="#">- 등록</a></li>
				<li><a href="#">- 목록</a></li>
			</ul>	
		</li>
		<li>
			<a href="#">활동내역<i class="fa-solid fa-chevron-down"></i></a>	
			<ul class="dep2">
				<li><a href="#">- 문의 사항</a></li>
			</ul>	
		</li>
		<li>
			<a href="#">관심정보<i class="fa-solid fa-chevron-down"></i></a>	
			<ul class="dep2">
				<li><a href="#">- 관심기업</a></li>
				<li><a href="#">- 저장한 채용공고</a></li>
			</ul>	
		</li>
		<li>
			<a href="#">결제내역<i class="fa-solid fa-chevron-down"></i></a>	
		</li>
		<li>
			<a href="#">지원관리<i class="fa-solid fa-chevron-down"></i></a>	
			<ul class="dep2">
				<li><a href="#">- 입사지원 관리</a></li>
				<li><a href="#">- 받은지원 관리</a></li>
			</ul>	
		</li>
		
	</ul>

</div>
