<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=49bbefdec55f169fc3e4f0fa9d24f2e3&libraries=services"></script>
<style type="text/css">

#category {
	position: absolute;
    top: 65px;
    display: grid;
    left: 345px;
    border-radius: 5px;
    border: 1px solid #909090;
    box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
    background: #fff;
    overflow: hidden;
    z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:url("css/sub_img/css_sprites.png") no-repeat;
}

#category li span>#text
{
    font-size: 10px;
}

#category li .bg-bank {
	background-position: -10px -10px;
	
}

#category li .bg-tourist_attraction {
	background-position: -10px -54px;
	
}

#category li .bg-mart {
	background-position: -10px -98px;
	
}

#category li .bg-dish {
	background-position: -10px -142px;
	
}

#category li .bg-cafe {
	background-position: -10px -186px;
	
}

#category li .bg-24hours {
	background-position: -10px -230px;
	
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}

</style>
<section class="Site-content">
	<div id="map"></div>
	<ul id="category">
		<li id="BK9" data-order="0"><span class="category_bg bg-bank"></span>
			은행</li>
		<li id="AT4" data-order="1"><span
			class="category_bg bg-tourist_attraction"></span> 관광명소</li>
		<li id="MT1" data-order="2"><span class="category_bg bg-mart"></span>
			마트</li>
		<li id="FD6" data-order="3"><span class="category_bg bg-dish"></span>
			음식점</li>
		<li id="CE7" data-order="4"><span class="category_bg bg-cafe"></span>
			카페</li>
		<li id="CS2" data-order="5"><span class="category_bg bg-24hours"></span>
			편의점</li>
	</ul>
	<!-- 지도타입 컨트롤 div 입니다 -->
	<div class="custom_typecontrol radius_border">
		<span id="btnRoadmap" class="selected_btn"
			onclick="setMapType('roadmap')">지도</span> <span id="btnSkyview"
			class="btn" onclick="setMapType('skyview')">스카이뷰</span>
	</div>
	<!-- 지도 확대, 축소, 현재위치 컨트롤 div 입니다 -->
	<div class="Set_Map Control_Map">
		<button type="button" class="btn_control mctr_nowpos" onclick="getLocation()">
			<span class="ico_comm ico_now">현위치</span>
			<div class="nowpos_spinner_wrap">
				<div class="spinner_wrapper">
					<div class="spinner_main">
						<div class="spinner_left">
							<div class="half_circle"></div>
						</div>
						<div class="spinner_right">
							<div class="half_circle"></div>
						</div>
					</div>
				</div>
			</div>
		</button>
		<button type="button" class="btn_control btn_zoomin mctr_zoomin" onclick="zoomIn()">
			<span class="ico_comm ico_zoomin">확대</span>
		</button>
		<button type="button" class="btn_control btn_zoomout mctr_zoomout" onclick="zoomOut()">
			<span class="ico_comm ico_zoomout">축소</span>
		</button>
	</div>
		<script>
		// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
		var placeOverlay = new kakao.maps.CustomOverlay({
			zIndex : 1
		}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
		markers = [], // 마커를 담을 배열입니다
		currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.5638420, 126.9976000), //지도의 중심좌표
		level : 3
	};

		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places(map);

		// 지도에 idle 이벤트를 등록합니다
		kakao.maps.event.addListener(map, 'idle', searchPlaces);

		// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
		contentNode.className = 'placeinfo_wrap';
		
		// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
		// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
		addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
		addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);

		// 커스텀 오버레이 컨텐츠를 설정합니다
		placeOverlay.setContent(contentNode);

		// 각 카테고리에 클릭 이벤트를 등록합니다
		addCategoryClickEvent();

		// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
		function addEventHandle(target, type, callback) {
			if (target.addEventListener) {
				target.addEventListener(type, callback);
			} else {
				target.attachEvent('on' + type, callback);
			}
		}

		// 카테고리 검색을 요청하는 함수입니다
		function searchPlaces() {
			if (!currCategory) {
				return;
			}

			// 커스텀 오버레이를 숨깁니다 
			placeOverlay.setMap(null);

			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();

			ps.categorySearch(currCategory, placesSearchCB, {
				useMapBounds : true
			});
		}

		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {

				// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
				displayPlaces(data);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

			} else if (status === kakao.maps.services.Status.ERROR) {
				// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요

			}
		}

		// 지도에 마커를 표출하는 함수입니다
		function displayPlaces(places) {

			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute(
					'data-order');

			for (var i = 0; i < places.length; i++) {

				// 마커를 생성하고 지도에 표시합니다
				var marker = addMarker(new kakao.maps.LatLng(places[i].y,
						places[i].x), order);

				// 마커와 검색결과 항목을 클릭 했을 때
				// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
				(function(marker, place) {
					kakao.maps.event.addListener(marker, 'click', function() {
						displayPlaceInfo(place);
					});
				})(marker, places[i]);
			}
		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, order) {
			var imageSrc = 'css/sub_img/css_sprites.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(27, 28), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(112, 264), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(46, (order * 46)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(11, 28)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});

			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다

			return marker;
		}

		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}

		// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
		function displayPlaceInfo(place) {
			var content = '<div class="placeinfo">'
					+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
					+ place.place_name + '</a>';

			if (place.road_address_name) {
				content += '    <span title="' + place.road_address_name + '">'
						+ place.road_address_name
						+ '</span>'
						+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
						+ place.address_name + ')</span>';
			} else {
				content += '    <span title="' + place.address_name + '">'
						+ place.address_name + '</span>';
			}

			content += '    <span class="tel">' + place.phone + '</span>'
					+ '</div>' + '<div class="after"></div>';

			contentNode.innerHTML = content;
			placeOverlay.setPosition(new kakao.maps.LatLng(place.y, place.x));
			placeOverlay.setMap(map);
		}

		// 각 카테고리에 클릭 이벤트를 등록합니다
		function addCategoryClickEvent() {
			var category = document.getElementById('category'), children = category.children;

			for (var i = 0; i < children.length; i++) {
				children[i].onclick = onClickCategory;
			}
		}

		// 카테고리를 클릭했을 때 호출되는 함수입니다
		function onClickCategory() {
			var id = this.id, className = this.className;

			placeOverlay.setMap(null);

			if (className === 'on') {
				currCategory = '';
				changeCategoryClass();
				removeMarker();
			} else {
				currCategory = id;
				changeCategoryClass(this);
				searchPlaces();
			}
		}

		// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
		function changeCategoryClass(el) {
			var category = document.getElementById('category'), children = category.children, i;

			for (i = 0; i < children.length; i++) {
				children[i].className = '';
			}

			if (el) {
				el.className = 'on';
			}
		}
	
	// 지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
	function setMapType(maptype) {
		var roadmapControl = document.getElementById('btnRoadmap');
		var skyviewControl = document.getElementById('btnSkyview');
		if (maptype === 'roadmap') {
			map.setMapTypeId(daum.maps.MapTypeId.ROADMAP);
			roadmapControl.className = 'selected_btn';
			skyviewControl.className = 'btn';
		} else {
			map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
			skyviewControl.className = 'selected_btn';
			roadmapControl.className = 'btn';
		}
	}
	function getLocation() {
		// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
		if (navigator.geolocation) {
		    
		    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		    navigator.geolocation.getCurrentPosition(function(position) {
		        
		        var lat = position.coords.latitude, // 위도
		            lon = position.coords.longitude; // 경도
		        
		        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		            message = '<div style="padding:5px;">여기에 계신가요?!</div>'; // 인포윈도우에 표시될 내용입니다
		        
		        // 마커와 인포윈도우를 표시합니다
		        displayMarker(locPosition, message);
		            
		      });
		    
		} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		    
		   
		    message = 'geolocation을 사용할수 없어요..'
		        
		    displayMarker(message);
		}

		// 지도에 마커와 인포윈도우를 표시하는 함수입니다
		function displayMarker(locPosition, message) {

		    // 마커를 생성합니다
		    var marker = new kakao.maps.Marker({  
		        map: map, 
		        position: locPosition
		    }); 
		    
		    var iwContent = message, // 인포윈도우에 표시할 내용
		        iwRemoveable = true;

		    // 인포윈도우를 생성합니다
		    var infowindow = new kakao.maps.InfoWindow({
		        content : iwContent,
		        removable : iwRemoveable
		    });
		    
		    // 인포윈도우를 마커위에 표시합니다 
		    infowindow.open(map, marker);
		    
		    // 지도 중심좌표를 접속위치로 변경합니다
		    map.setCenter(locPosition);      
		}    
	}

	// 지도 확대, 축소 컨트롤에서 확대 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomIn() {
		map.setLevel(map.getLevel() - 1);
	}

	// 지도 확대, 축소 컨트롤에서 축소 버튼을 누르면 호출되어 지도를 확대하는 함수입니다
	function zoomOut() {
		map.setLevel(map.getLevel() + 1);
	}

</script>
</section>