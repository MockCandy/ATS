let cenWide = document.querySelector(".filter-area .cen-wide");

console.log(cenWide);

window.addEventListener("scroll", function(){ 
    
    let windowTop = window.scrollY;
    // 스크롤 세로값이 헤더높이보다 크거나 같으면 
    // 헤더에 클래스 'drop'을 추가한다
    console.log(windowTop);
    if (parseInt(windowTop) > 0 && cenWide != null) {
        cenWide.style.padding = "15px 0";
    } 
    else if(parseInt(windowTop) <= 0 && cenWide != null){
        cenWide.style.padding = "30px 0";
    }
})


let chkboxSig = $(".chkbox-sig");
let chkboxTxt = $(".chkbox-txt");

console.log(chkboxSig);
console.log(chkboxTxt);

chkboxSig.on("change", function (e) {
	console.log(e.target);
	console.log(e.target.id);
})

$(document).on("click",chkboxTxt, function(e){
	let chkbox = e.target.parentElement.children[0];
    if(chkbox.checked == false){
        chkbox.checked = true;
    }else {
        chkbox.checked = false;
    }
})


//document.querySelector('.carrerRange').addEventListener('input',function(event){
//	console.log(event.target.value);
// 	var gradient_value = 100 / event.target.attributes.max.value;
//    event.target.style.background = 'linear-gradient(to right, #6fc37d 0%, #6fc37d '+gradient_value * event.target.value +'%, rgb(236, 236, 236) ' +gradient_value *  event.target.value + '%, rgb(236, 236, 236) 100%)';
//  });










