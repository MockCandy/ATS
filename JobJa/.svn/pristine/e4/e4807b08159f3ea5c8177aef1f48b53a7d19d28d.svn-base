<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>



<link rel="stylesheet" href="/resources/css/admin.css">
<link rel="stylesheet" href="/resources/css/resumeModal.css">

<!-- Favicons -->
<link href="/resources/assets/img/favicon.png" rel="icon">
<link href="/resources/assets/img/apple-touch-icon.png"
	rel="apple-touch-icon">

<!-- Google Fonts -->
<!-- <link href="https://fonts.gstatic.com" rel="preconnect"> -->
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" -->
<!-- 	rel="stylesheet"> -->
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;200;300;400;500;600;700;800;900&display=swap"
	rel="stylesheet">
<!-- Vendor CSS Files -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="/resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="/resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="/resources/vendor/quill/quill.snow.css" rel="stylesheet">
<link href="/resources/vendor/quill/quill.bubble.css" rel="stylesheet">
<link href="/resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="/resources/vendor/simple-datatables/style.css"
	rel="stylesheet">

<!-- Template Main CSS File -->
<link href="/resources/css/style.css" rel="stylesheet">
<script type="text/javascript" src="/resources/js/jquery-3.6.0.js"></script>
<section class="section">
      <div class="row">

        <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title"><i class="fa-solid fa-chart-simple"></i>&nbsp;상담사 회원 수가 많은 직군 </h5>
              <c:forEach var="listc" items="${listc}" >
              	<input type="hidden" class="comCdNm" value="${listc.comCdNm}">
              	<input type="hidden" class="count" value="${listc.count}">
              </c:forEach>
              <c:forEach var="listcd" items="${listcd}" >
              	<input type="hidden" class="comCdNmd" value="${listcd.comCdNm}">
              	<input type="hidden" class="countd" value="${listcd.count}">
              </c:forEach>
              <c:forEach var="listci" items="${listci}" >
              	<input type="hidden" class="itemNm" value="${listci.itemNm}">
              	<input type="hidden" class="totalSales" value="${listci.totalSales}">
              	<input type="hidden" class="transactionCount" value="${listci.transactionCount}">
              </c:forEach>
              <!-- Bar Chart -->
              <div id="barChart" style="min-height: 330px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);" class="echart" _echarts_instance_="ec_1704335675500"><div style="position: relative; width: 388px; height: 330px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="388" height="400" style="position: absolute; left: 0px; top: 0px; width: 388px; height: 330px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                	var comCdNm = $(".comCdNm");
                	console.log("comcdnm",comCdNm);
                	var arrayOfName = [];
                	
                	comCdNm.each(function(){
                		arrayOfName.push($(this).val());
                	});
                	
                	var name1 = arrayOfName[0];
                	var name2 = arrayOfName[1];
                	var name3 = arrayOfName[2];
                	var name4 = arrayOfName[3];
                	var name5 = arrayOfName[4];
                	
                	console.log("zz1",arrayOfName);
                	var count = $(".count");
                	var arrayOfCount = [];
                	
                	count.each(function(){
                		arrayOfCount.push($(this).val());
                	})
                	
                	var count1 = arrayOfCount[0];
                	var count2 = arrayOfCount[1];
                	var count3 = arrayOfCount[2];
                	var count4 = arrayOfCount[3];
                	var count5 = arrayOfCount[4];
                	
                  echarts.init(document.querySelector("#barChart")).setOption({
                    xAxis: {
                      type: 'category',
                      data: [name1, name2, name3, name4, name5]
                    },
                    yAxis: {
                      type: 'value'
                    },
                    series: [{
                      data: [count1, count2, count3, count4, count5],
                      type: 'bar'
                    }]
                  });
                });
              </script>
              <!-- End Bar Chart -->

            </div>
            <div class="card-body">
              <h5 class="card-title"><i class="fa-solid fa-chart-simple"></i>&nbsp;상담사 회원 수가 적은 직군 </h5>
             

              <!-- Bar Chart -->
              <div id="barChart2" style="min-height: 330px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);" class="echart" _echarts_instance_="ec_1704335675500"><div style="position: relative; width: 388px; height: 330px; padding: 0px; margin: 0px; border-width: 0px; cursor: default;"><canvas data-zr-dom-id="zr_0" width="388" height="400" style="position: absolute; left: 0px; top: 0px; width: 388px; height: 330px; user-select: none; -webkit-tap-highlight-color: rgba(0, 0, 0, 0); padding: 0px; margin: 0px; border-width: 0px;"></canvas></div></div>

              <script>
                document.addEventListener("DOMContentLoaded", () => {
                	var comCdNm = $(".comCdNmd");
                	var arrayOfName = [];
                	
                	comCdNm.each(function(){
                		arrayOfName.push($(this).val());
                	});
                	
                	var name1 = arrayOfName[0];
                	var name2 = arrayOfName[1];
                	var name3 = arrayOfName[2];
                	var name4 = arrayOfName[3];
                	var name5 = arrayOfName[4];
                	
                	console.log("zz",arrayOfName);
                	var count = $(".countd");
                	var arrayOfCount = [];
                	
                	count.each(function(){
                		arrayOfCount.push($(this).val());
                	})
                	
                	var count1 = arrayOfCount[0];
                	var count2 = arrayOfCount[1];
                	var count3 = arrayOfCount[2];
                	var count4 = arrayOfCount[3];
                	var count5 = arrayOfCount[4];
                	
                  echarts.init(document.querySelector("#barChart2")).setOption({
                    xAxis: {
                      type: 'category',
                      data: [name1, name2, name3, name4, name5]
                    },
                    yAxis: {
                      type: 'value'
                    },
                    series: [{
                      data: [count1, count2, count3, count4, count5],
                      type: 'bar'
                    }]
                  });
                });
              </script>
              <!-- End Bar Chart -->

            </div>
          </div>
        </div>

		   <div class="col-lg-6">
          <div class="card">
            <div class="card-body">
              <h5 class="card-title"><i class="fa-solid fa-chart-simple"></i>&nbsp;상담사 관련 상품별 매출 건수</h5>

              <!-- Bar Chart -->
              <canvas id="barChart3" style="max-height: 330px; display: block; box-sizing: border-box; height: 227px; width: 555px;" width="455" height="280"></canvas>
              <script>
                document.addEventListener("DOMContentLoaded", () => {
                	var itemNm = $(".itemNm");
                	var transactionCount = $(".transactionCount");
                	var arrayOfName = [];
                	var arrayOfTransaction = [];
                	
                	itemNm.each(function(){
                		arrayOfName.push($(this).val());
                	});
                	transactionCount.each(function(){
                		arrayOfTransaction.push($(this).val());
                	});
                    
                	
                  new Chart(document.querySelector('#barChart3'), {
                    type: 'bar',
                    data: {
                      labels: arrayOfName,
                      datasets: [{
                        label: 'Bar Chart',
                        data: arrayOfTransaction,
                        backgroundColor: [
                          'rgba(255, 99, 132, 0.2)',
                          'rgba(255, 159, 64, 0.2)',
                          'rgba(255, 205, 86, 0.2)',
                          'rgba(255, 162, 173, 0.2)'
                        ],
                        borderColor: [
                          'rgb(255, 99, 132)',
                          'rgb(255, 159, 64)',
                          'rgb(255, 205, 86)',
                          'rgb(255, 205, 173)'
                        ],
                        borderWidth: 1
                      }]
                    },
                    options: {
                      scales: {
                        y: {
                          beginAtZero: true
                        }
                      }
                    }
                  });
                });
              </script>
	<br>
            <div class="card-body">
              <h5 class="card-title"><i class="fa-solid fa-chart-simple"></i>&nbsp;각 상품별 매출액</h5>

              <!-- Pie Chart -->
              <canvas id="pieChart" style="max-height: 330px; display: block; box-sizing: border-box; height: 330px; width: 594px;" width="594" height="400"></canvas>
              <script>
                document.addEventListener("DOMContentLoaded", () => {
                	var itemNm = $(".itemNm");
                	var totalSales = $(".totalSales");
                	
                	var arrayOfName = [];
                	var arrayOfTotalSales = [];

                	itemNm.each(function(){
                		arrayOfName.push($(this).val());
                	});
                	totalSales.each(function(){
                		arrayOfTotalSales.push($(this).val());
                	});
                    
                	
                  new Chart(document.querySelector('#pieChart'), {
                    type: 'pie',
                    data: {
                      labels: 
                    	  arrayOfName
                      ,
                      datasets: [{
                        label: 'My First Dataset',
                        data: arrayOfTotalSales,
                        backgroundColor: [
                          'rgb(255, 99, 132)',
                          'rgb(54, 162, 235)',
                          'rgb(255, 205, 86)',
                          'rgb(255, 205, 173)'
                         
                        ],
                        hoverOffset: 4
                      }]
                    }
                  });
                });
              </script>
              <!-- End Pie CHart -->

            </div>
            </div>
          </div>
        </div>
      </div>
    </section>

<!-- Vendor JS Files -->
<script src="/resources/vendor/apexcharts/apexcharts.min.js"></script>
<script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/resources/vendor/chart.js/chart.umd.js"></script>
<script src="/resources/vendor/echarts/echarts.min.js"></script>
<script src="/resources/vendor/quill/quill.min.js"></script>
<script src="/resources/vendor/simple-datatables/simple-datatables.js"></script>
<script src="/resources/vendor/tinymce/tinymce.min.js"></script>
<script src="/resources/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="/resources/js/main.js"></script>

<script src="/resources/js/admin.js"></script>