<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>로드뷰에 이미지 올리기</title>
    <style>
    #overlayImg {
        width: 394px;
        height: 242px;
        border: 1px solid #096320;
        transition: linear 0.5s opacity;
    }
    #overlayImg:hover {
        opacity: 0;
    }
</style>
</head>
<body>
<div id="roadview" style="width:100%;height:600px"></div> <!-- 로드뷰를 표시할 div 입니다 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=3010ba59fe5cb4ef476a120272fd67f0"></script>
<script>
var img = document.createElement('img');
img.id = 'overlayImg';
img.src = 'http://www.namdonews.com/news/photo/201903/513707_134045_3850.png';

var rvContainer = document.getElementById('roadview'); // 로드뷰를 표시할 div
var rv = new kakao.maps.Roadview(rvContainer); // 로드뷰 객체 생성
var rc = new kakao.maps.RoadviewClient(); // 좌표를 통한 로드뷰의 panoid를 추출하기 위한 로드뷰 help객체 생성 
var rvPosition = new kakao.maps.LatLng(37.572743, 126.977228);

rc.getNearestPanoId(rvPosition, 50, function(panoid) {
    rv.setPanoId(panoid, rvPosition);//좌표에 근접한 panoId를 통해 로드뷰를 실행합니다.
});

// 로드뷰 초기화 이벤트
kakao.maps.event.addListener(rv, 'init', function() {
    
    //로드뷰의 viewpoint값을 적절하게 이동시킵니다.
    rv.setViewpoint( new kakao.maps.Viewpoint( 300, -7, 3 ) );

    //커스텀 오버레이를 로드뷰 위에 올립니다.
    new kakao.maps.CustomOverlay({
        map: rv,
        position:  new kakao.maps.Viewpoint(299.7, -7.6),
        content: img
    });
});
</script>
</body>
</html>