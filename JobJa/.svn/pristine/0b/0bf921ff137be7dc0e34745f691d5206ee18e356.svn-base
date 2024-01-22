<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<style>
.mypage-aside-con {
  width: 280px !important;
/*padding: 30px !important; */
  overflow: auto;
  height: 100vh;
  background-color:#fff;
  box-shadow: 1px 1px 15px -2px rgba(0,0,0,0.33);
}
.aside-name{
	font-size:24px;
	margin-bottom: 32px;
	text-align: center;
	padding: 4px;
}
.sub-title{
	color : black;
	display:block;
	width:100%;
	font-size: 18px;
	padding:10px 0;
}
.sub-title:hover{
	text-decoration: none;
}
.sub-inner{
	
}

.mem-ul{
    text-indent:50px;
}
ul {
	padding-left:0!important;
	margin-bottom:0!important;
}
.mem-ul li{
	height:0;
	opacity:0;
	transition:all 0.2s;
}
.mem-ul.active {
	transition:all 0s;
}
.mem-ul.active li{
	height:100%;
	opacity:1;
}

.mem-ul.active >a {
	color:#00A95E;
}

.memActive{
/*   	color: #5bd89a;   */
}

.ul-set {
	display: flex;
    flex-direction: column;
    gap: 10px;
}
.admin-a{
	display: inline-block;
}
.span-pd{
	padding-right: 8px;

}

a.active {
	color:#00c362;
}

a { 
	transition:all 0.2s;
}
a:hover { 
	color: #00A95E!important;
}

.depth:hover {
	background-color:#efefef;
}

.depth a {
	font-size: 15px;
	display:block;
	width:100%;
	padding:3px 15px;
}
</style>
<c:set var="path" value="${requestScope['javax.servlet.forward.servlet_path']}"/>
<div class="mypage-aside-con">
			<p><a href="/" class="aside-logo logo mt-40 mb-30">날 JOB아줘</a></p>
		<div class="ul-set">
			<ul class="mem-ul normalMem">
				<a href="#" class="sub-title">일반회원관리</a>
				<li class="depth adminMemberMyPage">
					<a href="/admin/adminMemberMyPage" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminMemberMyPage' }">active</c:if>
					">일반회원</a>
				</li>
			</ul>
			<ul class="mem-ul consultantMem">
				<a href="#" class="sub-title">상담사회원관리</a>
				<li class="depth adminCounselorMyPage">
					<a href="/admin/adminCounselorMyPage" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminCounselorMyPage' }">active</c:if>
						">상담회원</a>
				</li>
				<li class="depth adminCounselorProposal">
					<a href="/admin/adminCounselorProposal" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminCounselorProposal' }">active</c:if>
						">승인요청</a>
				</li>
			</ul>	
			<ul class="mem-ul enterpriseMem">
				<a href="#" class="sub-title">기업회원관리</a>
				<li class="depth adminEnterpriseMyPage">
					<a href="/admin/adminEnterpriseMyPage" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminEnterpriseMyPage' }">active</c:if>
						">기업회원</a>
				</li>
				<li class="depth adminEnterpriseProposal">
					<a href="/admin/adminEnterpriseProposal" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminEnterpriseProposal' }">active</c:if>
						">승인요청</a>
				</li>
				<li class="depth adminEnterpriseAnnouncement">
					<a href="/admin/adminEnterpriseAnnouncement" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminEnterpriseAnnouncement' }">active</c:if>
						">채용공고</a>
				</li>
			</ul>
			<ul class="mem-ul items">
				<a href="#" class="sub-title">상품관리</a>
				<li class="depth adminEnterItemsList">
					<a href="/admin/adminEnterItemsList" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminEnterItemsList' }">active</c:if>
						">기업상품</a>
				</li>
				<li class="depth adminCounItemsList">
					<a href="/admin/adminCounItemsList" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminCounItemsList' }">active</c:if>
						">상담상품</a>
				</li>
			</ul>		
			<ul class="mem-ul charts">
				<a href="#" class="sub-title">통계</a>
				<li class="depth adminEnterChart">
					<a href="/admin/adminEnterChart" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminEnterChart' }">active</c:if>
						">기업</a>
				</li>
				<li class="depth adminCounselChart">
					<a href="/admin/adminCounselChart" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminCounselChart' }">active</c:if>
						">상담사</a>
				</li>
				
				<li class="depth adminTotalChart">
					<a href="/admin/adminTotalChart" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminTotalChart' }">active</c:if>
						">총 매출</a>
				</li>
			</ul>	
			<ul class="mem-ul reports">
				<a href="#" class="sub-title">신고관리</a>
				<li class="depth adminReport">
					<a href="/admin/adminReport" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminReport' }">active</c:if>
						">신고목록</a>
				</li>
				<li class="depth adminReportBlackListPage">
					<a href="/admin/adminReportBlackListPage" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminReportBlackListPage' }">active</c:if>
						">블랙리스트관리</a>
				</li>
			</ul>	
			
			<ul class="mem-ul boards">
				<a href="#" class="sub-title">게시판관리</a>
				<li class="depth adminBoardNotice">
					<a href="/admin/adminBoardNotice" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardNotice' }">active</c:if>
						">공지사항</a>
				</li>
				<li class="depth adminBoardInquiry">
					<a href="/admin/adminBoardInquiry" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardInquiry' }">active</c:if>
						">1 : 1문의</a>
				</li>
				<li class="depth adminBoardQnA">
					<a href="/admin/adminBoardQnA" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardQnA' }">active</c:if>
						">취업Q&A</a>
				</li>
				<li class="depth adminBoardInterview">
					<a href="/admin/adminBoardInterview" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardInterview' }">active</c:if>
						">현직자 인터뷰</a>
				</li>
				<li class="depth adminBoardClass">
					<a href="/admin/adminBoardClass" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardClass' }">active</c:if>
						">강의 클래스</a>
				</li>
				<li class="depth adminBoardNews">
					<a href="/admin/adminBoardNews" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardNews' }">active</c:if>
						">취업 뉴스</a>
				</li>
				<li class="depth adminBoardConsult">
					<a href="/admin/adminBoardConsult" class="sub-inner my-title admin-a
						<c:if test="${path == '/admin/adminBoardConsult' }">active</c:if>
						">취업 상담</a>
				</li>
			</ul>	
		</div>
	
</div>
 <script src="/resources/js/jquery-3.6.3.min.js"></script>
 
<script>
$(document).ready(function(){

	let normalMem = document.querySelector(".normalMem");
	let consultantMem = document.querySelector(".consultantMem");
	let enterpriseMem = document.querySelector(".enterpriseMem");
	let items = document.querySelector(".items");
	let charts = document.querySelector(".charts");
	let reports = document.querySelector(".reports");
	let boards = document.querySelector(".boards");
	
	let uls = document.querySelectorAll(".mem-ul");
	let lis = document.querySelectorAll(".depth");
	
	console.log(lis);
	
	if(url.includes('adminMemberMyPage')){
		for(let i = 0; i < lis.length; i++){
			lis[i].classList.remove("active");
		}
		normalMem.classList.add("active");
	}else if(url.includes('adminCounselor')){
		for(let i = 0; i < uls.length; i++){
			uls[i].classList.remove("active");
		}
		consultantMem.classList.add("active");
	}else if(url.includes('adminEnterprise')){
		for(let i = 0; i < uls.length; i++){
			uls[i].classList.remove("active");
		}
		enterpriseMem.classList.add("active");
	}else if(url.includes('ItemsList')){
		for(let i = 0; i < uls.length; i++){
			uls[i].classList.remove("active");
		}
		items.classList.add("active");
	}else if(url.includes('Chart')){
		for(let i = 0; i < uls.length; i++){
			uls[i].classList.remove("active");
		}
		charts.classList.add("active");
	}else if(url.includes('Report')){
		for(let i = 0; i < uls.length; i++){
			uls[i].classList.remove("active");
		}
		reports.classList.add("active");
	}else if(url.includes('adminBoard')){
		for(let i = 0; i < uls.length; i++){
			uls[i].classList.remove("active");
		}
		boards.classList.add("active");
	}

	for(let i = 0; i < uls.length; i++){
		
		uls[i].addEventListener("click", function(e){
			
			let flag = false;
			
			console.log(e.target.parentElement.classList);
			if(e.target.parentElement.classList.contains("active")){
				flag = !flag;
			}
			
			for(let j = 0 ; j < uls.length; j++){
				uls[j].classList.remove("active");
			}
			
			if(flag){
				e.target.parentElement.classList.remove("active");				
			}else {
				e.target.parentElement.classList.add("active");
			}
		})
		
	}

	for(let i = 0; i < lis.length; i++){
		
		lis[i].addEventListener("click", function(e){
			
			for(let j = 0 ; j < lis.length; j++){
				lis[j].classList.remove("active");
			}
			
			e.target.parentElement.classList.add("active");
		})
		
	}

});

let url = window.location.href;

if( url.includes('entRanking') ){
	document.querySelector(".li-entRanking").classList.add("active");
}else if( url.includes('recruit') ){
	document.querySelector(".li-recruit").classList.add("active");
}else if(url.includes('boardQNA') ){
	document.querySelector(".li-boardQna").classList.add("active");
}else if(url.includes('boardInterView')){
	document.querySelector(".li-devCarr").classList.add("active");
	document.querySelector(".boardInterView").classList.add("active");
}else if(url.includes('boardClass')){
	document.querySelector(".li-devCarr").classList.add("active");
	document.querySelector(".boardClass").classList.add("active");
}else if(url.includes('news')){
	document.querySelector(".li-devCarr").classList.add("active");
	document.querySelector(".news").classList.add("active");
}else if(url.includes('boardConsulting') ){
	document.querySelector(".li-devCarr").classList.add("active");
	document.querySelector(".boardConsulting").classList.add("active");
}
console.log(url);

if( url.includes('memberAccount') ){
	document.querySelector(".mypage-account").classList.add("active");
}else if( url.includes('memberResume') ){
	document.querySelector(".mypage-resume").classList.add("active");
}else if(url.includes('memberPortfolio') ){
	document.querySelector(".mypage-portfolio").classList.add("active");
}else if(url.includes('memberCalendar')){
	document.querySelector(".mypage-calendar").classList.add("active");
}else if(url.includes('memberInterest')){
	document.querySelector(".mypage-interested").classList.add("active");
}else if(url.includes('memberMyActivity')){
	document.querySelector(".mypage-activity").classList.add("active");
}else if(url.includes('memberApplication') ){
	document.querySelector(".mypage-apply").classList.add("active");
}else if(url.includes('memberPremium') ){
	document.querySelector(".mypage-premium").classList.add("active");
}else if(url.includes('consultantLog') ){
	document.querySelector(".mypage-consult").classList.add("active");
}else if(url.includes('entmypage') || url.includes('changePw')){
	document.querySelector(".entMypage-account").classList.add("active");
}else if(url.includes('files') ){
	document.querySelector(".entMypage-files").classList.add("active");
}else if(url.includes('entRecruit') ){
	document.querySelector(".entMypage-recruits").classList.add("active");
}else if(url.includes('entApplicant') ){
	document.querySelector(".entMypage-applicant").classList.add("active");
}else if(url.includes('entCalendar') ){
	document.querySelector(".entMypage-calendar").classList.add("active");
}else if(url.includes('entOffer') ){
	document.querySelector(".entMypage-offer").classList.add("active");
}else if(url.includes('entPremium') ){
	document.querySelector(".entMypage-premium").classList.add("active");
}


</script>
