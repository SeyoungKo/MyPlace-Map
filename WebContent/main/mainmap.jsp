<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/check_login.jsp"%>  

<%@ include file = "/layout/header.jsp" %> 

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>

	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=29d3db11d43c52060594f305f580b09f&libraries=services"></script>
    <link rel="stylesheet" type="text/css" href="../css/mainMap.css">
	
</head>
    <body>
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
        <div class="map_wrap" >
            <div id="map" style="max-width:100%;height:600px;position:relative;overflow:hidden; opacity: 0.9;"></div>
                <div id="menu_wrap" class="bg_white" style="height: 40px; overflow: hidden;">
                    <div class="option" >
                        <div>
                            <form onsubmit="searchPlaces(); return false;">
                                &nbsp;&nbsp;&nbsp;<input type="text" value=" " id="keyword" size="20"
                                       style=" margin-top:6px;height:40px; width:300px; border-radius: 10px;
                                              border:4px solid #BDBDBD; font-size:15px;"  >
                                <button type="submit" id="btnsub" onclick="lon()">&nbsp;&nbsp;<img src="../icon/searchIcon.png" id="img1"></button>
                            </form>
                        </div>
                    </div>
                <ul id="placesList"></ul>
                <div id="pagination"></div>
            </div>
        </div>
        <script type="text/javascript" src='../icon/searchMapIcon.png'></script>
        <script>
            function lon() {
                var a=document.getElementById("menu_wrap");
                a.style=false;

            }
            var markers = [];
            var mapContainer = document.getElementById('map'),
                mapOption = {
                    center: new daum.maps.LatLng(37.568076, 126.978640),
                    level:5 // 지도의 확대 레벨
                };
            var map = new daum.maps.Map(mapContainer, mapOption);
            var ps = new daum.maps.services.Places();
            var infowindow = new daum.maps.InfoWindow({zIndex:1},style="magin: 0px solid red;");

            searchPlaces();

            function searchPlaces() {
                var keyword = document.getElementById('keyword').value;
                if (!keyword.replace(/^\s+|\s+$/g)) {
                    alert('키워드를 입력해주세요!');
                    return false;
                }
                ps.keywordSearch( keyword, placesSearchCB);
            }

            function placesSearchCB(data, status, pagination) {
                if (status === daum.maps.services.Status.OK) {

                    displayPlaces(data);
                    displayPagination(pagination);

                } else if (status === daum.maps.services.Status.ERROR) {
                    alert('검색 결과 중 오류가 발생했습니다.');
                    return;
                }
            }

            function displayPlaces(places) {

                var listEl = document.getElementById('placesList'),
                menuEl = document.getElementById('menu_wrap'),
                fragment = document.createDocumentFragment(),
                bounds = new daum.maps.LatLngBounds(),
                removeAllChildNods(listEl);

                removeMarker();

                for ( var i=0; i<places.length; i++ ) {

                    var placePosition = new daum.maps.LatLng(places[i].y, places[i].x),
                        marker = addMarker(placePosition, i),
                        itemEl = getListItem(i, places[i]);

                    bounds.extend(placePosition);

                    (function(marker, title) {
                        daum.maps.event.addListener(marker, 'mouseover', function() {
                            displayInfowindow(marker, title);
                        });

                        daum.maps.event.addListener(marker, 'mouseout', function() {
                            infowindow.close();
                        });

                        itemEl.onmouseover =  function () {
                            displayInfowindow(marker, title);
                        };

                        itemEl.onmouseout =  function () {
                            infowindow.close();
                        };
                    })(marker, places[i].place_name);

                    fragment.appendChild(itemEl);
                }
                listEl.appendChild(fragment);
                menuEl.scrollTop = 0;

                map.setBounds(bounds);
            }

            function getListItem(index, places) {

                var el = document.createElement('li'),
                itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                            '<div class="info">' +
                            '   <h5>' + places.place_name + '</h5>';

                if (places.road_address_name) {
                    itemStr += '    <span>' + places.road_address_name + '</span>' +
                                '   <span class="jibun gray">' +  places.address_name  + '</span>';
                } else {
                    itemStr += '    <span>' +  places.address_name  + '</span>';
                }
                            '</div>';

                el.innerHTML = itemStr;
                el.className = 'item';

                return el;
            }

            function addMarker(position, idx, title) {

                var imageSrc = '../icon/resultIcon.png';

                imageSize = new daum.maps.Size(30, 30),
                    imgOptions =  {
                        spriteSize : new daum.maps.Size(36, 691),
                        spriteOrigin : new daum.maps.Point(0, 46+10),
                        offset: new daum.maps.Point(13, 37)
                    },
                    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize/* , imgOptions */),
                        marker = new daum.maps.Marker({
                        position: position,
                        image: markerImage
                    });
                marker.setMap(map);
                markers.push(marker);

                return marker;
            }

            function removeMarker() {
                for ( var i = 0; i < markers.length; i++ ) {
                    markers[i].setMap(null);
                }
                markers = [];
            }

            function displayPagination(pagination) {
                var paginationEl = document.getElementById('pagination'),
                    fragment = document.createDocumentFragment(),
                    i;

                while (paginationEl.hasChildNodes()) {
                    paginationEl.removeChild (paginationEl.lastChild);
                }

                for (i=1; i<=pagination.last; i++) {
                    var el = document.createElement('a');
                    el.href = "#";
                    el.innerHTML = i;

                    if (i===pagination.current) {
                        el.className = 'on';
                    } else {
                        el.onclick = (function(i) {
                            return function() {
                                pagination.gotoPage(i);
                            }
                        })(i);
                    }
                    fragment.appendChild(el);
                }
                paginationEl.appendChild(fragment);
            }

            function displayInfowindow(marker, title) {
                var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

                infowindow.setContent(content);
                infowindow.open(map, marker);
            }

            function removeAllChildNods(el) {
                while (el.hasChildNodes()) {
                    el.removeChild (el.lastChild);
                }
            }

            function save(f){

                 var place = f.place.value;
                 var memo = f.memo.value;

                 if(place ==''){
                     alert("저장할 장소를 입력하세요!");
                     return;
                 }

                 if(memo =='') {
                     alert("저장할 메모를 입력하세요!");
                     return;
                 }

                f.action= "input.do";
                f.method= "post";
                f.submit();
             }

                var geocoder = new daum.maps.services.Geocoder();

                var imageSrc = '../icon/bulbIcon.png'
                    imageSize = new daum.maps.Size(35, 35),
                    imgOptions =  {
                        spriteSize : new daum.maps.Size(36, 691),
                        spriteOrigin : new daum.maps.Point(0, (46)+10),
                        offset: new daum.maps.Point(13, 37)
                    },
                    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize/* , imgOptions */);

                var marker2 = new daum.maps.Marker({image:markerImage}),
                    infowindow = new daum.maps.InfoWindow({zindex:1});

                searchAddrFromCoords(map.getCenter(), displayCenterInfo);

                daum.maps.event.addListener(map, 'click', function(mouseEvent) {
                    searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
                        var a=document.getElementById("menu_wrap");
                         a.style="height: 40px; overflow:hidden";

                        var keyword = document.getElementById("keyword");

                        if (status === daum.maps.services.Status.OK) {
                            var detailAddr = !!result[0].road_address ? '<div>선택한 장소의 주소 : ' + result[0].road_address.address_name + '</div>' : '';

                          var content =
                          '<form> <div>장소: <input type="text"  name="place"><br>' +
                          '<div>메모: <input type="text" name="memo">' +
                          '<div><input type="hidden" name="latlng" value="'+mouseEvent.latLng+'">' +
                          '<div><input type="hidden" name="id" value="${id}">' +
                          '<div><input type="hidden" name="area" value="'+ result[0].address.address_name +'">' +
                          '<input type = "button" value ="저장" onclick="save(this.form);" ><br>'+
                          '<span class="title" style="text-align:center;">***선택한 장소***<br>'+
                          result[0].address.address_name;

                            marker2.setPosition(mouseEvent.latLng);
                            marker2.setMap(map);

                            infowindow.setContent(content);
                            infowindow.open(map, marker2);
                        }
                    });
                });

                daum.maps.event.addListener(map, 'idle', function() {
                    searchAddrFromCoords(map.getCenter(), displayCenterInfo);
                });

                function searchAddrFromCoords(coords, callback) {
                    geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);
                }

                function searchDetailAddrFromCoords(coords, callback) {
                    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
                }

                function displayCenterInfo(result, status) {
                    if (status === daum.maps.services.Status.OK) {
                        var infoDiv = document.getElementById('centerAddr');

                        for(var i = 0; i < result.length; i++) {
                            if (result[i].region_type === 'H') {
                                break;
                            };
                        }
                    }
                }

            <%@ include file = "/main/fixedmarkerMain.jsp" %>

            var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}),
                contentNode = document.createElement('div'),
                markers2 = [],
                currCategory = '';
            var ps2 = new daum.maps.services.Places(map);

            daum.maps.event.addListener(map, 'idle', searchPlaces2);

            contentNode.className = 'placeinfo_wrap';

            addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
            addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

            placeOverlay.setContent(contentNode);

            addCategoryClickEvent();

            function addEventHandle(target, type, callback) {
                if (target.addEventListener) {
                    target.addEventListener(type, callback);
                } else {
                    target.attachEvent('on' + type, callback);
                }
            }

            function searchPlaces2() {
                if (!currCategory) {
                    return;
                }

                placeOverlay.setMap(null);

                removeMarker();

                ps2.categorySearch(currCategory, placesSearchCB2, {useMapBounds:true});
            }

            function placesSearchCB2(data, status, pagination) {
                if (status === daum.maps.services.Status.OK) {

                    displayPlaces2(data);
                } else if (status === daum.maps.services.Status.ZERO_RESULT) {
                    // 검색결과가 없는경우

                } else if (status === daum.maps.services.Status.ERROR) {
                    // 에러 발생

                }
            }

            function displayPlaces2(places) {

                var order = document.getElementById(currCategory).getAttribute('data-order');

                for ( var i=0; i<places.length; i++ ) {

                        var marker3 = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

                        (function(marker3, place) {
                            daum.maps.event.addListener(marker3, 'click', function() {
                                displayPlaceInfo(place);
                            });
                        })(marker3, places[i]);
                }
            }

            function addMarker(position, order) {
                var imageSrc = '../icon/placeListIcon.png',
                    imageSize = new daum.maps.Size(30, 30),
                    imgOptions =  {
                        spriteSize : new daum.maps.Size(75, 208),
                        spriteOrigin : new daum.maps.Point(46, (order*36)),
                        offset: new daum.maps.Point(11, 28)
                    },
                    markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
                        marker3 = new daum.maps.Marker({
                        position: position,
                        image: markerImage
                    });

                marker3.setMap(map);
                markers2.push(marker3);

                return marker3;
            }

            function removeMarker() {
                for ( var i = 0; i < markers2.length; i++ ) {
                    markers2[i].setMap(null);
                }
                markers2 = [];
            }

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

            function addCategoryClickEvent() {
                var category = document.getElementById('category'),
                    children = category.children;

                for (var i=0; i<children.length; i++) {
                    children[i].onclick = onClickCategory;
                }
            }

            function onClickCategory() {
                var a=document.getElementById("menu_wrap");
                a.style="height: 40px; overflow:hidden";
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

<%@ include file = "/layout/footer.jsp" %> 