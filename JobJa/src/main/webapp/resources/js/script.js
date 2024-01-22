let header = document.querySelector("header");
let scrollHeader = document.querySelector("#scroll-header");

let body = document.querySelector("body");

window.onscroll = function () { 
    
    let windowTop = window.scrollY;
    // 스크롤 세로값이 헤더높이보다 크거나 같으면 
    // 헤더에 클래스 'drop'을 추가한다
    console.log(windowTop);
    if (windowTop > 0) {
        header.style.display = "none";
        scrollHeader.style.display = "flex";
        body.style.paddingTop = "112px";
    } 
    else {
        header.style.display = "block";
        scrollHeader.style.display = "none"
        body.style.paddingTop = "0";
    }
}

let mypageLi = document.querySelectorAll(".mypage-menu>li");
console.log(mypageLi);
mypageLi.forEach(function(li,index){

    li.addEventListener("click", function(e){
        this.classList.toggle("active");
        this.children[1].classList.toggle('active');
    
        mypageLi.forEach(function(button2, index2) {
            if ( index !== index2 ) {
                button2.classList.remove("active");
                button2.children[1].classList.remove('active');
            }
        });
    })

})

let depth = document.querySelectorAll(".depth")

for(let i = 0; i < depth.length; i++){
    depth[i].addEventListener("click", function (e) {
        e.stopPropagation();
    })
}

document.querySelector("#kkk").addEventListener("change", function(e){
    console.dir(e.target.checked);
})

// JAVASCRIPT CODE
const drawStar = (target) => {
    document.querySelector(`.star span`).style.width = `${target.value * 20}%`;
}


document.querySelector(".star input").addEventListener("change", function(e){
    console.dir(e.target.value);
})
let rate = document.querySelector("#rate").value;
document.querySelector(".aaa span").style.width = `${rate * 20}%`; 






