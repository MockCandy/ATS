let headerr = document.querySelector("header");
let scrollHeader = document.querySelector("#scroll-header");

console.log(scrollHeader);

let searchInput = document.querySelectorAll(".schbar-input");

let header = $("meta[name='_csrf_header']").attr('content');
let token = $("meta[name='_csrf']").attr('content');

let body = document.querySelector("body");

window.onscroll = function () { 
    
    let windowTop = window.scrollY;
    // 스크롤 세로값이 헤더높이보다 크거나 같으면 
    // 헤더에 클래스 'drop'을 추가한다
    // console.log(windowTop);
    if (windowTop > 0 && scrollHeader != null) {
        headerr.style.display = "none";
        scrollHeader.style.display = "flex";
        body.style.paddingTop = "112px";
    } 
    else {
        headerr.style.display = "block";
        scrollHeader.style.display = "none"
        body.style.paddingTop = "0";
    }
}


function search(e){
	let searchWord = e.target.value;
	
	console.log(searchWord);
	
	if(e.keyCode == 13){
		window.location.href="/search/list?keyword="+searchWord;
	}
	
}

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
}else if(url.includes('compare') ){
	document.querySelector(".li-compare").classList.add("active");
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
}else if(url.includes('consultantLog') || url.includes('consultantHistory') ||url.includes('myConsultReview') ){
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
}else if(url.includes('entApplication') ){
	document.querySelector(".entMypage-application").classList.add("active");
}else if(url.includes('entReview') ){
	document.querySelector(".entMypage-review").classList.add("active");
}

$("#fileInput").on('change',function(){
  var fileName = $("#fileInput").val();
  $(".upload-name").val(fileName);
});


