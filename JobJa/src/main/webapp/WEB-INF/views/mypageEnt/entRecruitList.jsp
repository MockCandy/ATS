<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">

<style>


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
    justify-content: flex-end;
}

.not-keyword {
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
    padding: 5px;
}

.not-search-btn {
    align-items: center;
    justify-content: center;
    background-color: white;
    border: 1px solid rgb(212, 212, 212);
    border-radius: 5px;
    cursor: pointer;
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

.recruite-cen{
	width: 1060px;
	padding: 20px 0px;
    margin: auto;
}

</style>


<div class="mypage-div">
	<div class="mypage-left">
		<div class="mypage-left-tit">채용공고</div>
		<ul>
			<li class="active"><a href="/entRecruit/list">채용공고 목록 (${fn:length(recruitVO)})</a></li>
			<li><a href="/entRecruit/insert">채용공고 등록</a></li>
		</ul>
	</div>
	
	

	<div class="mypage-body-con">
		<div class="sub-title-area">
			<div class="body-sub-title">채용공고 목록  <span class="highlight">(${fn:length(recruitVO)})</span> </div>
		</div>
			<div class="body-sub-con">
		<div class="recruite-cen">
		
	<!-- 		<div class="rec-list"> -->
	<!-- 			<button type="button" id="ingRecruit" class=" recruit-li rec-btn"> ※  진행 중인 채용 공고 ※ </button> -->
	<!-- 			<button type="button" id="endRecruit" class=" recruit-li rec-btn"> ※ 마감된 채용 공고 ※ </button> -->
	<!-- 		</div> -->
			
			<div class="cen" style="padding:0">
					<p class="active recruit-li p-18"> ※  진행 중인 채용 공고 ※ </p>
			<!-- <span class="highlight">(${fn:length(recruitVO)})</span> --> 
			</div>
			
		
		<div class="recruit-sector">
			
			<c:if test="${fn:length(recruitVO) == 0 }">
				<div class="bg-white mt-20">
					<p class="empty-title"> ※ 진행중인 채용 공고가 없습니다 ※ </p>
				</div>
			</c:if>
					
			<!-- D-DAY 남은 공고 -->
			<div class="recruit-list">
			    <c:forEach var="recruitingVO" items="${recruitVO}">
	                <c:choose>
	                    <c:when test="${recruitingVO.remainingDate > 0 }">
				        	<div class="recruit-item" onclick="window.location.href='/enter/${recruitingVO.recruitNo}/detail'">
				        	
					            <div class="recruit-item-top">
					            	<input type="hidden" name="recruitNo" value="${recruitingVO.recruitNo }">
			            		</div>
			            
				            <div class="recruit-item-mid">
		                        <div class="txt-orange p-13 bold">D-${recruitingVO.remainingDate}</div>
		                        
				                <p class="rec-part">${recruitingVO.recruitPart}</p>
				                <p class="rec-info"> ${recruitingVO.recruitCareer} · ${recruitingVO.recruitSkill} </p>
			            	</div>
			            	
			            <div class="recruit-item-footer">
			                <div class="tags">
			                    <div class="workType">
			                        <c:if test="${recruitingVO.recruitWorkType == 'IWS01001' }"> 비정규직 </c:if>
			                        <c:if test="${recruitingVO.recruitWorkType == 'IWS01002' }"> 정규직 </c:if>
			                    </div>
			                    <div class="loc">${fn:split(fn:split(recruitingVO.recruitLocation,' ')[0], ',')[1]}</div>
			                </div>
			            </div>
			            
				        </div>
	                    </c:when>
	                </c:choose>
			    </c:forEach>
			</div>
			
			<!-- 상시채용 -->
			<div class="recruit-list mt-30">
				<c:forEach var="currentRecruitVO" items="${recruitVO}">
				    <c:choose>
				        <c:when test="${currentRecruitVO.remainingDate == null}">
				            	<div class="recruit-item" onclick="window.location.href='/enter/${currentRecruitVO.recruitNo }/detail'">
				                
					            <div class="recruit-item-top">
				                    <input type="hidden" name="recruitNo" value="${currentRecruitVO.recruitNo }">
				                </div>
				                
				                <div class="recruit-item-mid">
				                    <div class="txt-sig p-13 bold">상시채용</div>
				                
				                    <p class="rec-part">${currentRecruitVO.recruitPart}</p>
				                    <p class="rec-info"> ${currentRecruitVO.recruitCareer} · ${currentRecruitVO.recruitSkill} </p>
				                </div>
				                
				                <div class="recruit-item-footer">
				                    <div class="tags">
				                        <div class="workType">
				                            <c:if test="${currentRecruitVO.recruitWorkType == 'IWS01001' }"> 비정규직 </c:if>
				                            <c:if test="${currentRecruitVO.recruitWorkType == 'IWS01002' }"> 정규직 </c:if>
				                        </div>
				                        <div class="loc">${fn:split(fn:split(currentRecruitVO.recruitLocation,' ')[0], ',')[1]}</div>
				                    </div>
				                </div>
				                
				            	</div>
				        </c:when>
				    </c:choose>
				</c:forEach>
			</div>
			
			<!-- 마감된 공고 -->
			<div class="cen" style="padding:0">
					<p class="active recruit-li p-18 mt-40"><a href="/enter/recruit"> ※ 마감된 채용 공고 ※ </a> </p>
			</div>
			
			<div class="recruit-list">
			    <c:forEach var="blankRecruitVO" items="${recruitVO}">
	                <c:choose>
	                    <c:when test="${blankRecruitVO.remainingDate < 0 }">
				        	<div class="recruit-item" onclick="window.location.href='/enter/${blankRecruitVO.recruitNo}/detail'">
				        	
					            <div class="recruit-item-top">
					            	<input type="hidden" name="recruitNo" value="${blankRecruitVO.recruitNo }">
			            		</div>
			            
				            <div class="recruit-item-mid">
								<div class="txt-darkgray p-13 bold">마감</div>							
		                        
				                <p class="rec-part">${blankRecruitVO.recruitPart}</p>
				                <p class="rec-info"> ${blankRecruitVO.recruitCareer} · ${blankRecruitVO.recruitSkill} </p>
			            	</div>
			            	
			            <div class="recruit-item-footer">
			                <div class="tags">
			                    <div class="workType">
			                        <c:if test="${blankRecruitVO.recruitWorkType == 'IWS01001' }"> 비정규직 </c:if>
			                        <c:if test="${blankRecruitVO.recruitWorkType == 'IWS01002' }"> 정규직 </c:if>
			                    </div>
			                    <div class="loc">${fn:split(fn:split(blankRecruitVO.recruitLocation,' ')[0], ',')[1]}</div>
			                </div>
			            </div>
			            
				        </div>
	                    </c:when>
	                </c:choose>
			    </c:forEach>
			</div>
			<div id="endList"></div>
		</div>
	</div>
	</div>
	</div>
		
</div>


