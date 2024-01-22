
let chkboxSig = document.querySelector(".chkbox-sig");
let chkboxTxt = document.querySelector(".chkbox-txt");

console.log(chkboxSig);
console.log(chkboxTxt);

chkboxSig.addEventListener("change", function (e) {
    console.dir(e.target.checked);
})

chkboxTxt.addEventListener("click", function(){
    console.log(chkboxSig.checked == false);
    if(chkboxSig.checked == false){
        chkboxSig.checked = true;
    }else {
        chkboxSig.checked = false;
    }
})




