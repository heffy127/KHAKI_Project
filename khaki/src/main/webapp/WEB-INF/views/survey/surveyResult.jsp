<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link href="resources/assets/img/brand/favicon.png" rel="icon" type="image/png">
<!-- Fonts -->
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet">
<!-- Icons -->
<link href="resources/assets/js/plugins/nucleo/css/nucleo.css" rel="stylesheet" />
<link href="resources/assets/js/plugins/@fortawesome/fontawesome-free/css/all.min.css" rel="stylesheet" />
<!-- CSS Files -->
<link href="resources/assets/css/argon-dashboard.css?v=1.1.0" rel="stylesheet" />
<!-- jquery -->
<script src="resources/assets/js/plugins/jquery/dist/jquery.min.js"></script>
<!-- 구글 차트 -->
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<style type="text/css">
.chart
{   
   width: 600px;
   height: 350px;
   float: left;
}
body
{
   background: white;
}
</style>
<script type="text/javascript">
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

$(document).ready(
   function() {
      var today = new Date()
      var dd = today.getDate()
      var mm = (today.getMonth()+1) < 10 ? "0" + (today.getMonth()+1) : (today.getMonth()+1)   
      var yy = today.getFullYear()
      var date = yy + '.' + mm + '.' + dd
      $('#date').text(date)   
})


function drawChart() {
   /* 어떤 목적으로 카셰어링 서비스를 이용하셨나요? */
    var data1 = google.visualization.arrayToDataTable([
         ['종류', '이용목적'],
         ['혼자 드라이브',     parseInt('${car_surveyResultDTO1.checked6}')],
         ['친구와 드라이브',     parseInt('${car_surveyResultDTO1.checked5}')],
         ['가족과 드라이브',  parseInt('${car_surveyResultDTO1.checked4}')],
         ['출퇴근', parseInt('${car_surveyResultDTO1.checked3}')],
         ['짐 나르기',    parseInt('${car_surveyResultDTO1.checked2}')],
         ['기타',    parseInt('${car_surveyResultDTO1.checked1}')]
       ]);
    
    var options1 = {
      title : 'Q1. 어떤 목적으로 카셰어링 서비스를 이용하셨나요?',
      pieHole: 0.4,
      height: 350,
      width: 600,
      }
    
    /* 차량의 관리 상태에 만족하십니까? (청결도, 부품상태) */
    var data2 = google.visualization.arrayToDataTable([
         ['평가', '선호도'],
         ['매우 그렇다',     parseInt('${car_surveyResultDTO2.checked5}')],
         ['조금 그렇다',      parseInt('${car_surveyResultDTO2.checked4}')],
         ['보통이다',  parseInt('${car_surveyResultDTO2.checked3}')],
         ['조금 아니다', parseInt('${car_surveyResultDTO2.checked2}')],
         ['매우 아니다',    parseInt('${car_surveyResultDTO2.checked1}')]
       ]);
    
    var options2 = {
      title : 'Q2. 차량의 관리 상태에 만족하십니까? (청결도, 부품상태)',
      pieHole: 0.4,
      height: 350,
      width: 600,
      slices: {
         0: { color: '#005be3'},
         1: { color: '#04d186'},
         2: { color: '#858585'},
         3: { color: '#ffa200'},
         4: { color: '#f72f39'}
      }
    }
    
    /* KHAKI존 접근성에 만족하십니까? */
    var data3 = google.visualization.arrayToDataTable([
         ['평가', '선호도'],
         ['매우 그렇다',     parseInt('${car_surveyResultDTO3.checked5}')],
         ['조금 그렇다',      parseInt('${car_surveyResultDTO3.checked4}')],
         ['보통이다',  parseInt('${car_surveyResultDTO3.checked3}')],
         ['조금 아니다', parseInt('${car_surveyResultDTO3.checked2}')],
         ['매우 아니다',    parseInt('${car_surveyResultDTO3.checked1}')]
       ]);
    
    var options3 = {
      title : 'Q3. KHAKI존 접근성에 만족하십니까?',
      pieHole: 0.4,
      height: 350,
      width: 600,
      slices: {
         0: { color: '#005be3'},
         1: { color: '#04d186'},
         2: { color: '#858585'},
         3: { color: '#ffa200'},
         4: { color: '#f72f39'}
      }
    }
    
    /* 서비스 이용 요금에 만족하십니까? (예약비용, 주행거리, 보험료) */
    var data4 = google.visualization.arrayToDataTable([
         ['평가', '선호도'],
         ['매우 그렇다',     parseInt('${car_surveyResultDTO4.checked5}')],
         ['조금 그렇다',      parseInt('${car_surveyResultDTO4.checked4}')],
         ['보통이다',  parseInt('${car_surveyResultDTO4.checked3}')],
         ['조금 아니다', parseInt('${car_surveyResultDTO4.checked2}')],
         ['매우 아니다',    parseInt('${car_surveyResultDTO4.checked1}')]
       ]);
    
    var options4 = {
      title : 'Q4. 서비스 이용 요금에 만족하십니까? (예약비용, 주행거리, 보험료)',
      pieHole: 0.4,
      height: 350,
      width: 600,
      slices: {
         0: { color: '#005be3'},
         1: { color: '#04d186'},
         2: { color: '#858585'},
         3: { color: '#ffa200'},
         4: { color: '#f72f39'}
      }
    }
    
    /* 차량의 관리 상태에 만족하십니까? (청결도, 부품상태) */
    var data5 = google.visualization.arrayToDataTable([
         ['평가', '선호도'],
         ['그렇다',     parseInt('${car_surveyResultDTO5.checked2}')],
         ['아니다',      parseInt('${car_surveyResultDTO5.checked1}')]
       ]);
    
    var options5 = {
      title : 'Q5. KHAKI 카셰어링 서비스를 다른 사람에게 추천해주고 싶은가요?',
      pieHole: 0.4,
      height: 350,
      width: 600,
      slices: {
         0: { color: '#005be3'},
         1: { color: '#f72f39'}
      }
    }
    
    var chart1 = new google.visualization.PieChart(document.getElementById('piechart_q1'));
     chart1.draw(data1, options1);
    
     var chart2 = new google.visualization.PieChart(document.getElementById('piechart_q2'));
     chart2.draw(data2, options2);
   
     var chart3 = new google.visualization.PieChart(document.getElementById('piechart_q3'));
     chart3.draw(data3, options3);
    
     var chart4 = new google.visualization.PieChart(document.getElementById('piechart_q4'));
     chart4.draw(data4, options4);
    
     var chart5 = new google.visualization.PieChart(document.getElementById('piechart_q5'));
     chart5.draw(data5, options5);
   }
   
</script>
<body>
<div>
   <div>
      <nav class="navbar navbar-horizontal navbar-expand-lg navbar-dark bg-success">
          <div class="container" style="margin-left: 300px;">
              <a class="navbar-brand" href="admin_surveyResult.do"><font size="4">SURVEY SYNTHESIS</font></a>
          </div>
          <div style="margin-right: 300px; width: 50%; color: white; font-weight: bold;">
             <span>조사기간 : 2019.8.20 ~ </span><span id="date"></span>
          </div>
      </nav>
   </div>
   <div align="center">
   <br>
   <h1>KHAKI 차량 이용 만족도 조사</h1>
      <div style="width: 1200px;">
         <div class="chart" id="piechart_q1"></div>
         <div class="chart" id="piechart_q2"></div>
         <div class="chart" id="piechart_q3"></div>
         <div class="chart" id="piechart_q4"></div>
         <div class="chart" id="piechart_q5"></div>
         <div class="chart" id="opinionDiv">
            <iframe id="opinion" src="surveyQ6.do" style="width: 100%; height: 350px;" frameborder="0"></iframe>
         </div>
      </div>
   </div>
</div>
</body>
</html>