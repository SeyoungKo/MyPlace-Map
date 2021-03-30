<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/check_login.jsp"%>      

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">

    <style>

</style>
	<link rel="stylesheet" type="text/css" href="../css/mainCategory.css"> 
</head>
<body>
<p style="margin-top:-12px">

</p>
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
    <ul id="category">
        <li id="BK9" data-order="0" style="font-weight: bold; color:white;"> 
            <span class="category_bg bank"></span>
            은행
        </li>       
        <li id="MT1" data-order="1"style="font-weight: bold; color:white;"> 
            <span class="category_bg mart"></span>
            마트
        </li>  
        <li id="PM9" data-order="2"style="font-weight: bold; color:white;"> 
            <span class="category_bg pharmacy"></span>
            약국
        </li>  
        <li id="OL7" data-order="3"style="font-weight: bold; color:white;"> 
            <span class="category_bg oil"></span>
            주유소
        </li>  
        <li id="CE7" data-order="4"style="font-weight: bold; color:white;"> 
            <span class="category_bg cafe"></span>
            카페
        </li>  
        <li id="CS2" data-order="5"style="font-weight: bold; color:white;"> 
            <span class="category_bg store"></span>
            편의점
        </li>      
    </ul>
</div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d3db11d43c52060594f305f580b09f&libraries=services"></script>
        <script>
            var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}),
                contentNode = document.createElement('div'),
                markers2 = [],
                currCategory = '';

            // 장소 검색 객체 생
            var ps2 = new daum.maps.services.Places(map);

            // 지도에 idle 이벤트 등
            daum.maps.event.addListener(map, 'idle', searchPlaces2);

            // 커스텀 오버레이 컨텐츠 노드에 css class 추가
            contentNode.className = 'placeinfo_wrap';

            addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
            addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

            // 커스텀 오버레이 컨텐츠 설정
            placeOverlay.setContent(contentNode);

            // 각 카테고리 클릭 이벤트 등록
            addCategoryClickEvent();

            // 엘리먼트에 이벤트 핸들러를 등록
            function addEventHandle(target, type, callback) {
                if (target.addEventListener) {
                    target.addEventListener(type, callback);
                } else {
                    target.attachEvent('on' + type, callback);
                }
            }

            // 카테고리 검색 요청
            function searchPlaces2() {
                if (!currCategory) {
                    return;
                }

                // 커스텀 오버레이 숨기
                placeOverlay.setMap(null);

                // 지도에 표시되고 있는 마커 제
                removeMarker();

                ps2.categorySearch(currCategory, placesSearchCB, {useMapBounds:true});
            }

            // 장소검색이 완료됐을 때 호출되는 콜백함수
            function placesSearchCB(data, status, pagination) {
                if (status === daum.maps.services.Status.OK) {

                    //지도에 마커를 표출
                    displayPlaces2(data);
                } else if (status === daum.maps.services.Status.ZERO_RESULT) {
                    // 검색결과가 없는경우

                } else if (status === daum.maps.services.Status.ERROR) {
                    // 에러발생

                }
            }

            // 지도에 마커를 표출
            function displayPlaces2(places) {

                // 몇번째 카테고리가 선택되어 있는지
                var order = document.getElementById(currCategory).getAttribute('data-order');

                for ( var i=0; i<places.length; i++ ) {

                        // 마커를 생성하고 지도에 표시
                        var marker3 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

                        // 마커와 검색결과 항목 클릭 이벤트
                        (function(marker3, place) {
                            daum.maps.event.addListener(marker3, 'click', function() {
                                displayPlaceInfo(place);
                            });
                        })(marker3, places[i]);
                }
            }

            // 마커를 생성, 지도 위에 마커를 표시
            function addMarker(position, order) {
                var imageSrc = '../icon/placeListIcon.png', // 마커 이미지 url, 스프라이트 이미지
                    imageSize = new daum.maps.Size(30, 30),  // 마커 이미지 크기
                    imgOptions =  {
                        spriteSize : new daum.maps.Size(75, 208), // 스프라이트 이미지 크기
                        spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
                        offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
                    },
                    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                        marker3 = new daum.maps.Marker({
                        position: position, // 마커의 위치
                        image: markerImage
                    });

                marker3.setMap(map); // 지도 위에 마커를 표출
                markers2.push(marker3);  // 배열에 생성된 마커를 추가

                return marker3;
            }

            // 지도 위에 표시되고 있는 마커를 모두 제거
            function removeMarker() {
                for ( var i = 0; i < markers2.length; i++ ) {
                    markers2[i].setMap(null);
                }
                markers2 = [];
            }

            // 클릭한 마커에 대한 장소 상세정보 커스텀 오버레이로 표시
            function displayPlaceInfo (place) {
                var content = '<div class="placeinfo">' +
                                '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';

                if (place.road_address_name) {
                    content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                                '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
                }  else {
                    content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
                }

                content += '    <span class="tel">' + place.phone + '</span>' +
                            '</div>' +
                            '<div class="after"></div>';

                contentNode.innerHTML = content;
                placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
                placeOverlay.setMap(map);
            }


            // 각 카테고리에 클릭 이벤트를 등록
            function addCategoryClickEvent() {
                var category = document.getElementById('category'),
                    children = category.children;

                for (var i=0; i<children.length; i++) {
                    children[i].onclick = onClickCategory;
                }
            }

            // 카테고리를 클릭했을 때 호출
            function onClickCategory() {
                var id = this.id,
                    className = this.className;

                placeOverlay.setMap(null);

                if (className === 'on') {
                    currCategory = '';
                    changeCategoryClass();
                    removeMarker();
                } else {
                    currCategory = id;
                    changeCategoryClass(this);
                    searchPlaces2();
                }
            }

            // 클릭된 카테고리에만 클릭된 스타일을 적용
            function changeCategoryClass(el) {
                var category = document.getElementById('category'),
                    children = category.children,
                    i;

                for ( i=0; i<children.length; i++ ) {
                    children[i].className = '';
                }
                if (el) {
                    el.className = 'on';
                }
            }
        </script>
    </body>
</html>
