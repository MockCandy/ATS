	
// 날짜가 7월이면 07 이런식으로 표현하기 위함
function CF_leftPad(value){
	if (Number(value) >= 10) {
		return value;
	}
	return "0" + value;
}

// 숫자를 한글로 표현해주는 함수
function num2han(num) {
	
	num = parseInt((num + '').replace(/[^0-9]/g, ''), 10) + '';  // 숫자/문자/돈 을 숫자만 있는 문자열로 변환
	if(num == '0'){
		return '영';
	}
	var number = ['영', '일', '이', '삼', '사', '오', '육', '칠', '팔', '구']; 
	var unit = ['', '만', '억', '조'];  
	var smallUnit = ['천', '백', '십', ''];
	
	var result = [];  //변환된 값을 저장할 배열
	var unitCnt = Math.ceil(num.length / 4);  //단위 갯수. 숫자 10000은 일단위와 만단위 2개이다.
	
	num = num.padStart(unitCnt * 4, '0')  //4자리 값이 되도록 0을 채운다
	
	var regexp = /[\w\W]{4}/g;  //4자리 단위로 숫자 분리 
	var array = num.match(regexp);
	
	//낮은 자릿수에서 높은 자릿수 순으로 값을 만든다(그래야 자릿수 계산이 편하다)  
	for(var i = array.length - 1, unitCnt = 0; i >= 0; i--, unitCnt++) {
		
		var hanValue = _makeHan(array[i]);  //한글로 변환된 숫자    
		
		if(hanValue == '')  {//값이 없을땐 해당 단위의 값이 모두 0이란 뜻.       
			continue;    
		}
		
		result.unshift(hanValue + unit[unitCnt]);  //unshift는 항상 배열의 앞에 넣는다.  }
	
	}

	//여기로 들어오는 값은 무조건 네자리이다. 1234 -> 일천이백삼십사  
	function _makeHan(text) {    
		var str = '';    
		for(var i = 0; i < text.length; i++) {
			var num = text[i];      if(num == '0')  //0은 읽지 않는다        
			continue;   
			
			str += number[num] + smallUnit[i];    
		}    
		
		return str;  
	}

	return result.join(' ');
}

// 숫자를 4자리씩 한글로
const thousandUnits = ["", "만", "억", "조", "경", "해"];

// 배열 쪼개기
function chunkAtEnd(value = "", n = 1) {
  const result = [];

  for (let end = value.length; end > 0; end -= n) {
    result.push(value.substring(Math.max(0, end - n), end));
  }

  return result;
}

// 4자리씩 숫자로 변환
function formatNumber(number) {
  return chunkAtEnd(String(number), 4)
    .reduce((acc, item, index) => {
      const unit = thousandUnits[index] ?? "";

      if (!Number(item)) {
        return acc;
      }

      return `${Number(item)}${unit} ${acc}`;
    }, "")
    .trim();
}

// 숫자 3자리마다 콤마(,) 찍어주는 함수
function insertNumCommas(n) {
	n = parseInt(n);
	// get stuff before the dot
	let s1 = n.toString();
	var d = s1.indexOf('.');
	var s2 = d === -1 ? s1 : s1.slice(0, d);
	
	// insert commas every 3 digits from the right
	for (var i = s2.length - 3; i > 0; i -= 3)
	  s2 = s2.slice(0, i) + ',' + s2.slice(i);
	
	// append fractional part
	if (d !== -1)
	  s2 += s1.slice(d);
	
	return s2;
}


// 일수(370일 등)를 연/월/일(1년5일)로 바꾸는 함수
function daysToYearsMonthsDays(days) {
    const years = Math.floor(days / 365);
    const months = Math.floor((days % 365) / 30);
    const remainingDays = (days % 365) % 30;

    return {
        years,
        months,
        days: remainingDays
    };
}

const getByteSize = (size) => {
  const byteUnits = ["KB", "MB", "GB", "TB"];

  for (let i = 0; i < byteUnits.length; i++) {
    size = Math.floor(size / 1024);

    if (size < 1024) return size.toFixed(1) + byteUnits[i];
  }
};


function timeConvert(){

	let time = document.querySelectorAll(".time");
		
	console.log(time);

	for(let i = 0 ; i < time.length; i++){
		console.log(time[i].innerText);
		let year = time[i].innerText.split(" ")[5];
		console.log(year);
		let month = time[i].innerText.split(" ")[1];
		if(month == "Jan"){
			month = '01';
		}else if(month == "Feb"){
			month = '02';			
		}else if(month == "Mar"){
			month = '03';			
		}else if(month == "Apr"){
			month = '04';			
		}else if(month == "May"){
			month = '05';			
		}else if(month == "Jun"){
			month = '06';			
		}else if(month == "Jul"){
			month = '07';			
		}else if(month == "Aug"){
			month = '08';			
		}else if(month == "Sep"){
			month = '09';			
		}else if(month == "Oct"){
			month = '10';			
		}else if(month == "Nov"){
			month = '11';			
		}else if(month == "Dec"){
			month = '12';			
		}
		let day = time[i].innerText.split(" ")[2];
		console.log(day);
		
		time[i].innerText = year+"-"+month+"-"+day
	}
}
function timeConvertOne(str){

	console.log(str);
	let year = str.split(" ")[5];
	console.log(year);
	let month = str.split(" ")[1];
	if(month == "Jan"){
		month = '01';
	}else if(month == "Feb"){
		month = '02';			
	}else if(month == "Mar"){
		month = '03';			
	}else if(month == "Apr"){
		month = '04';			
	}else if(month == "May"){
		month = '05';			
	}else if(month == "Jun"){
		month = '06';			
	}else if(month == "Jul"){
		month = '07';			
	}else if(month == "Aug"){
		month = '08';			
	}else if(month == "Sep"){
		month = '09';			
	}else if(month == "Oct"){
		month = '10';			
	}else if(month == "Nov"){
		month = '11';			
	}else if(month == "Dec"){
		month = '12';			
	}
	let day = str.split(" ")[2];
	console.log(day);
	
	return year+"-"+month+"-"+day;
}


function numberComma(e){
	console.log(e.value);
	var len;
	var str = e.value;
	str = str.replace(/,/g,'');
	var str1 = '';
	
	len = str.length;
	
	if(len>3) {
	  for(var i=0;len-i-3>0;i+=3) {
	    str1 = ','+str.substring(len-3-i,len-i)+str1;
	  }
	  str1 = str.substring(0,len-i)+str1;
	  e.value = str1;
	}
	console.log(e.target.value);
}