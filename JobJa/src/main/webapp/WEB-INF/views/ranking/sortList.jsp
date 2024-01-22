<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="stylesheet" type="text/css" href="/resources/css/search.css">
<link rel="stylesheet" type="text/css" href="/resources/css/enterprise.css">
<div class="cen">
	<div class="bg-white">
		<div class="div-top">
			<p class="bold p-14 flex w-100">
				<span class="txt-sig">${total}</span>건의 검색결과
				
				<form action="/entRanking/sortList" class="ml-auto" method="get">
					<select style="width:220px;" id="sortSelect" name="sort" class="input01">
						<option 
							<c:if test="${param.sort == 'reviewCount' }">
								selected
							</c:if> 
						value="reviewCount">리뷰 많은 순</option>
						<option 
							<c:if test="${param.sort == 'avgScore' }">
								selected
							</c:if>  
						value="avgScore">총 만족도 순</option>
						<option 
							<c:if test="${param.sort == 'chances' }">
								selected
							</c:if>  
						 value="chances">승진 가능성 및 기회 순</option>
						<option 
							<c:if test="${param.sort == 'welfare' }">
								selected
							</c:if>  
						 value="welfare">복지 및 급여 순</option>
						<option 
							<c:if test="${param.sort == 'balance' }">
								selected
							</c:if>  
						 value="balance">업무와 삶의 균형 순</option>
						<option 
							<c:if test="${param.sort == 'culture' }">
								selected
							</c:if>  
						 value="culture">사내 문화 순</option>
						<option 
							<c:if test="${param.sort == 'manager' }">
								selected
							</c:if>  
						 value="manager">경영진 순</option>
					</select>
				</form>
			</p>
		</div>
		<div class="recruit-line">
			<c:if
				test="${fn:length(data.content) == 0 || fn:length(data.content) == null}">
				<p class="bold p-18 flex align-center justify-center empty-recruit">
					 해당하는 기업이 없습니다.
				</p>
			</c:if>
			<c:forEach var="enterpriseVO" items="${data.content}">
				<div class="ent-list-item">
					<div class="ent-list-left">
	                    <span class="mr-20 
	                    	<c:if test="${enterpriseVO.rnum <= 3}">txt-red bold</c:if>
	                    ">${enterpriseVO.rnum }</span>
	                    
						<div class="ent-logo">
							<c:choose>
								<c:when test="${enterpriseVO.entLogo != null && enterpriseVO.entLogo != ''}">
									<img alt="" src="/resources/upload/${enterpriseVO.entLogo }">
								</c:when>
								<c:otherwise>		
									<a class="hover_underline" href="/enterprise/${enterpriseVO.entNo}/info">						
										<img alt="" src="/resources/images/ent-logo.png">
									</a>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="ent-cont">
							<div class="ent-name">
								<p class="bold">
									<a class="hover_underline" href="/enterprise/${enterpriseVO.entNo}/info">
										${enterpriseVO.entNm }
									</a>
								</p>
		    					<span class="interest-ent
		    						<c:forEach var="interestEntVO" items="${interestEntVOList }">
		    							<c:if test="${interestEntVO.entNo == enterpriseVO.entNo }">
			    							active
		    							</c:if>
		    						</c:forEach>
		    					"></span>
		    					<input type="hidden" name="entNo" value="${enterpriseVO.entNo }">
							</div>
							<div class="ent-info">
								<p>${enterpriseVO.comDetCodeInfoVOList[0].comDetCdNm }</p>
								<div class="v-div-line"></div>
								<p>${fn:split(enterpriseVO.entAddr,' ')[0]} ${fn:split(enterpriseVO.entAddr,' ')[1]}</p>
							</div>
						</div>
					</div>
					
					<div class="ent-list-right">
						<c:if test="${param.sort == 'reviewCount' }">
							<p class="p-13">
								${enterpriseVO.reviewCount }개의 리뷰
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.entAvgRate }" pattern="0.0"/></span>
							</div>
						</c:if>
						<c:if test="${param.sort == 'avgScore' }">
							<p class="p-13">
								총 만족도 순
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.entAvgRate }" pattern="0.0"/></span>
							</div>
						</c:if>
						<c:if test="${param.sort == 'chances' }">
							<p class="p-13">
								승진 기회 및 가능성 순
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.sumEntRevChances }" pattern="0.0"/></span>
							</div>
						</c:if>
						<c:if test="${param.sort == 'welfare' }">
							<p class="p-13">
								복지 및 급여 순
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.sumEntRevWelfare }" pattern="0.0"/></span>
							</div>
						</c:if>
						<c:if test="${param.sort == 'balance' }">
							<p class="p-13">
								업무와 삶의 균형 순
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.sumEntRevBalance }" pattern="0.0"/></span>
							</div>
						</c:if>
						<c:if test="${param.sort == 'culture' }">
							<p class="p-13">
								사내 문화 순
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.sumEntRevCulture }" pattern="0.0"/></span>
							</div>
						</c:if>
						<c:if test="${param.sort == 'manager' }">
							<p class="p-13">
								경영진 순
							</p>
							<div class="flex align-center justify-center">
				                <span class="star star-ssm">
				                  	 ★★★★★
				                    <span style="width: 20%;">★★★★★</span>
				                    <input type="range" value="1" step="1" min="1" max="5">
				                </span>
				
				                <span class="rate p-14 ml-7"> <fmt:formatNumber value="${enterpriseVO.sumEntRevManager }" pattern="0.0"/></span>
							</div>
						</c:if>
					</div>
				</div>
			</c:forEach>



		</div>
		
		<div class="board-pagi mt-30 pb-30">
			${data.getPagingArea5() }
		</div>

	</div>
</div>

<script type="text/javascript">

	let rate = document.querySelectorAll(".rate");
	for(let i = 0; i < rate.length; i++){		
		let star =rate[i].previousElementSibling.children[0];
		star.style.width = rate[i].innerText * 20 +'%'; 
	}
	
	//////////////////////관심공고 기능
	$(document).on("click",".interest-ent",function(e) {

		if(${getCurrentLoginVO == null}){
			alert("로그인 한 회원만 관심기업을 등록할 수 있습니다.");
			return;
		};
		
		let entNo = e.target.parentElement.children.entNo.value;
		console.dir(entNo);
		e.target.classList.toggle("active");

		data = {
			"entNo" : entNo,
			"memId" : "${getCurrentLoginVO.memId}"
		}
		console.log(data);

		$.ajax({
			url : "/enterprise/ajaxInterestEnt",
			data : JSON.stringify(data),
			type : "post",
    		contentType : "application/json;charset=utf-8",
    		dataType:"json",
			beforeSend : function(xhr) {
				xhr.setRequestHeader(header, token);
			},
			success : function(res) {
				console.log("res", res);
				
				$("#storedRecruit").text(res);
			}

		})
	})

	document.querySelector("#sortSelect").addEventListener("change", function(e){
		e.target.parentElement.submit();
	});
	
</script>