<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script src="/resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>

<!-- lecture CSS 파일 링크 -->
<link rel="stylesheet" type="text/css" href="/resources/css/lecture.css">
<link rel="stylesheet" type="text/css" href="/resources/css/resume.css">
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">

<style>


.justify-content-center {
	-ms-flex-pack: center !important;
	justify-content: center !important;
}

.ck-content {
	height: 500px;
}

.title {
	text-align: left;
	margin: 10px 10px 10px 10px;
}

.list-btn {
	font-size: 14px;
	background-color: #0000;
	border-radius: 15px;
	border-color: #0000;
	cursor: pointer;
	display: inline-block;
	margin-right: 10px;
	margin-top: 10px;
	padding: 5px;
}

.list-btn:hover {
	padding:8px;
	background-color: rgba(143, 188, 143, 1);
	color: white;
}

.port-cntnt{
	text-align: left;
	margin-top: 10px;
	margin-bottom: 10px;
}

.textarea {
	 overflow:hidden;
	 resize: none;
     border: 1px solid #c7c6c6;
     width: 100%;
     height:200px;;
     padding: 10px;
     box-sizing: border-box;
     border-radius: 5px;
     margin-bottom: 15px;
}

#wrapper {
	 flex-wrap: wrap;
     justify-content: center;
     margin: 0 auto;
     padding: 20px;
     max-width: 1170px;
 }
 
 .mypage-body-con{
 	padding:40px;
 }
</style>

<!-- 기본양식 등록 페이지 -->


<div class="mypage-body-con body-sub-con" >
	<div class="body-sub-title justify-center mb-30">자기소개서 작성(기본양식)</div>

	<form class="mt-20" name="frm" action="/memberPortfolio/portfolioCreateForm?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
		<sec:csrfInput />
	
		<p> <input type="hidden" name="memId" value="${memId}" /> </p>
		
		<div class="ptfl-name">
			<input class="notice-title-input" type="text" name="ptflTitle" value="" placeholder="자기소개서 제목을 입력해 주세요">
		</div>
		
		<div class="ptfl-one-line">
			<p class="ptfl-tit">성장과정</p>
			<textarea class="textarea" name="ptflGrowth" placeholder="성장과정을 입력해 주세요"></textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">지원동기</p>
			<textarea class="textarea" name="ptflMotive" placeholder="지원동기를 입력해 주세요" ></textarea>
		</div>
		
		<div class="ptfl-one-line">
			<p class="ptfl-tit">성격 및 장단점</p>
			<textarea class="textarea" name="ptflPersonality" placeholder="성격 및 장단점을 입력해 주세요" ></textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">관련 업무 경험 및 경력</p>
			<textarea class="textarea" name="ptflJobExp" placeholder="관련 업무 경험 및 경력을 입력해 주세요" ></textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">프로젝트 경험</p>
			<textarea class="textarea" name="ptflProjExp" placeholder="프로젝트 경험을 입력해 주세요" ></textarea>
		</div>
	
		<div class="ptfl-one-line">
			<p class="ptfl-tit">입사 후 포부</p>
			<textarea class="textarea" name="ptflAspirations" placeholder="입사 후 포부를 입력해 주세요" ></textarea>
		</div>
	
		<div class="fixed-footer">
			<div class="cen">
				<button type="button"
					class="btn btn-big btn-primary p-17 btn-user btn-block" onclick="window.location.href='/memberPortfolio/portfolioList'">목록</button>
				<button type="submit" id="edit"
					class="btn btn-big btn-primary p-17 bg-sig color-white btn-user btn-block">저장</button>
				<button type="button" id="reset"
					class="btn btn-big btn-primary p-17 btn-user btn-block">초기화</button>
				<button type="button" id="port-complete"
					class="btn btn-big btn-primary p-17 btn-user btn-block">자동완성</button>
			</div>
		</div>


	</form>
	
</div>

<script type="text/javascript">

let reset = document.querySelector("#reset");
let inputs = document.querySelectorAll("input");
let textareas = document.querySelectorAll("textarea");

console.log(reset);

reset.addEventListener("click", function(){
	for(let i = 0; i < inputs.length; i++){
		inputs[i].value = "";
	}
	
	for(let i = 0; i < textareas.length; i++){
		textareas[i].value = "";
	}
});

	$(document).on("click", "#port-complete", function() {
		
		$('input[name="ptflTitle"]').attr('value',"열정과 전문성이 어우러진 나의 이야기");
		$('textarea[name="ptflGrowth"]').val(`제가 성장한 여정은 다양한 도전과 경험을 통해 시작되었습니다. 
대학에서 전공한 IT 분야는 처음에는 낯설고 어려운 것들이 많아 적응하는 데 어려움을 겪었습니다. 
그러나 이 어려움은 동시에 제게 새로운 지식과 기술을 습득하는 기회를 제공했습니다.

학업 외에도 산업계에서의 실무 경험이 큰 성장을 가져왔습니다. 
프로젝트를 진행하면서 팀원들과의 협업, 기술적인 도전에 직면하며 문제를 해결하는 과정에서 많은 것을 배웠습니다. 
특히, 프로젝트 중에 발생한 예상치 못한 문제들은 책임감 있게 해결하며 저의 역량을 키울 수 있는 기회로 나타났습니다.

또한, 스스로를 계속 발전시키기 위해 여러 자기개발 활동을 시도했습니다. 
새로운 기술에 대한 학습, 온라인 코스 수강, 그리고 도서를 통한 지식 습득은 제가 전문성을 키우는 데 큰 역할을 했습니다.`);
		
		$('textarea[name="ptflMotive"]').val(`저는 귀사가 추구하는 가치와 목표에 강한 공감을 느끼고 있습니다. 
귀사는 혁신적인 기술과 창의적인 솔루션을 통해 산업에 기여하고 있으며, 이는 제가 항상 추구해온 가치입니다. 
귀사의 팀은 뛰어난 역량을 가진 전문가들이 모여 있으며, 이런 환경에서 제 경험과 역량을 발휘하고 함께 성장하고 싶어졌습니다.

특히, 귀사의 프로젝트와 제품은 최신 기술과 동향을 반영하고 있어, 항상 새로운 도전에 적극적으로 대처하고자 하는 제 모습과 일치합니다. 
제가 개발자로서 기여할 수 있는 분야에서 귀사와 함께 일하며, 더 나은 결과물을 만들어 나가고 싶습니다. 
귀사에서 제 역량을 발휘하고 함께 성장하는 기회를 얻게 된다면, 흥미로운 도전에 적극적으로 대응하여 귀사의 비전을 실현하는데 기여하고 싶습니다.`);
		
		
		$('textarea[name="ptflPersonality"]').val(`저는 적극적이고 목표지향적인 성격을 가지고 있습니다. 
어떠한 도전이나 문제에도 긍정적으로 대처하며, 목표를 달성하기 위해 노력하는 것을 중요하게 생각합니다. 
또한, 협업과 소통을 중요시하며 팀원들과의 원활한 관계 구축에 주력합니다.
장점
1. 문제 해결 능력: 어려운 상황에서도 냉정하게 문제를 분석하고 해결하는 능력이 있습니다.
2. 능동적인 태도: 새로운 아이디어를 적극적으로 받아들이고, 주도적으로 일을 추진합니다.

단점
1. 퍼펙션리즘: 때때로 완벽주의 성향이 강해져 너무 세세한 부분에 신경을 쓰는 경향이 있습니다.
2. 시간 관리 어려움: 여러 가지 일을 동시에 처리하려는 노력에도 불구하고, 때로는 시간 관리에 어려움을 겪을 때가 있습니다.`);
		
		$('textarea[name="ptflJobExp"]').val(`1. 프로젝트 참여:
[날JOB아줘]: [잡플래닛 벤치마킹]
[기간]: [2024-12-01 ~ 2024-01-10]
[내용]: [맡은 역할 : DA]

2. 기술 스택:
[주로 사용한 언어]: [JavaScript, Python]
[프레임워크 및 라이브러리]: [React, Django]
[데이터베이스]: [MySQL, MongoDB]`);
		
		$('textarea[name="ptflProjExp"]').val(`프로젝트명: 온라인 쇼핑 몰 개발 프로젝트

기간: 2021년 4월 - 2021년 8월
내용:
이 프로젝트는 온라인 쇼핑 몰을 개발하는 것이 목표였습니다. 
제가 맡은 부분은 프론트엔드 개발이었으며, React를 사용하여 사용자 인터페이스를 개발했습니다. 
주로 상품 목록 페이지, 장바구니 기능, 사용자 계정 관리 등을 담당했습니다.`);
		
		$('textarea[name="ptflAspirations"]').val(`저는 회사의 일원으로서 기여하고, 함께 성장하기 위해 노력할 것입니다. 
첫째로, 주어진 업무에 최선을 다해 열심히 수행하고 팀원들과의 원활한 협업을 통해 프로젝트의 성공에 기여하고자 합니다. 
둘째로, 끊임없이 새로운 기술과 도구에 대한 학습을 추구하여 회사의 업무에 최신 기술을 적용하고 발전시키는데 기여할 것입니다. 
마지막으로, 팀 내외에서의 효과적인 소통과 지식 공유를 통해 팀원들 간의 업무 효율성을 높이며, 회사의 목표 달성에 기여하는 개발자로 성장하고자 합니다.

이를 통해 회사와 함께 미래를 고민하고, 함께 성장하는데 기여하고 싶습니다.`);
		
		
	});

</script>
