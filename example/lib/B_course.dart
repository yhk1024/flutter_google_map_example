// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_background_geolocation/flutter_background_geolocation.dart' as bg;

class Bcourse extends StatefulWidget {
  @override
  BcourseState createState() => BcourseState();
}

class BcourseState extends State<Bcourse> {
  GoogleMapController? controller;
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  late String currentLocation;
  // 위치 사용 권환 확인
  Future <void> _getCurrentLocation() async {
    LocationPermission permission;

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      // 위치 사용 권한 부여 요청
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // 수동으로 권한을 거부하면 'currentLocation'에 권한 거부 값을 할당
        setState(() {
          currentLocation ="Permission Denied";
        });
      }else{
        // 현재 위치 값을 가져와 positoin 변수에 할당
        var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        setState(() {
          currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
        });
      }
    }else{
      var position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      setState(() {
        currentLocation ="latitude: ${position.latitude}" + " , " + "Logitude: ${position.longitude}";
      });
    }
  }

  List<Marker> _markers = [];
  List<Polyline> _polyline = [];
  List<Circle> _circle = [];
  List<LatLng> _locations = [
    LatLng(33.301545, 126.260609),  // S01 입구
    LatLng(33.301310, 126.260811),  // ABC01 삼거리
    LatLng(33.301622, 126.261615),  // ABC02 우측 갈림길, 숨골
    LatLng(33.302137, 126.263790),  // ABC03 고릅써
    LatLng(33.300696, 126.265148),  // ABC04 AB코스 갈림길, 곶자왈의 동물
    LatLng(33.298536, 126.266667),  // AB01 갈림길 좌측
    LatLng(33.300089, 126.268161),  // AB02 A코스 갈림길, 반딧불이
    LatLng(33.301934, 126.266904),  // A01 힐링길 백서향 반딧불인형 2개
    LatLng(33.304484, 126.264612),  // AB03 AB코스 합류, 물통과 목장
    LatLng(33.304719, 126.263791),  // AB04 경사로 바로 앞, 숨골
    LatLng(33.302267, 126.263503),  // AB05 옵데강 우측
    LatLng(33.302795, 126.262610),  // AB06 좌측
    LatLng(33.301651, 126.261710),  // AB07 ABC02 합류점, Y자
    LatLng(33.301339, 126.260856),  // ABC05 출구방향
    LatLng(33.301541, 126.260621), ];  // E01 종료
  List<dynamic> _list = [
    ('S01'), ('ABC01'), ('ABC02'), ('ABC03'), ('ABC04'), ('AB01'), ('AB02'), ('A01'),
    ('AB03'), ('AB04'), ('AB05'), ('AB06'), ('AB07'), ('ABC05'), ('E01') ];


  @override
  void initState() {
    for(int i=0; i < _locations.length; i++) {
      // 마커 생성 코드
      _markers.add(
          Marker(
            markerId: MarkerId('marker' + i.toString()),
            draggable: false,
            // 마커를 클릭하면 _list 리스트에 작성한 텍스트 표시
            infoWindow: InfoWindow(
                title: _list[i]
            ),
            position: _locations[i],
          )
      );
      // 원 형태의 영역 생성 코드
      _circle.add(
          Circle(
            circleId: CircleId('circle' + i.toString()),
            center: _locations[i],  // 원 중심 위치
            radius: 10, // 미터 단위의 원 반지름
            strokeWidth: 1, // 원 테두리 두께
            fillColor: Color.fromRGBO(171, 39, 133, 0.1), // 원 내부의 색
          )
      );
    }
    // 경로 그리기 코드
    _polyline.add(
        Polyline(
          polylineId: PolylineId('polyline'),
          width: 4, // 선의 두께
          color: Colors.blue, // 선의 색
          points: _createPoints(),  // 좌표
        )
    );
    _getCurrentLocation();  // 위치 사용 권한 확인
    _addGeofeence();  // 지오펜싱 추가 실행
    bg.BackgroundGeolocation.onGeofence(_onGeofence); // 지오펜싱 이벤트 실행

    super.initState();
  }

  // 지오펜싱 추가
  void _addGeofeence() {
    for(int i=0; i < _locations.length; i++) {
      double bgY = _locations[i].latitude;
      double bgX = _locations[i].longitude;

      bg.BackgroundGeolocation.addGeofence(bg.Geofence(
        identifier: 'bg' + i.toString(),
        radius: 10,
        latitude: bgY,  // 지오펜싱 중심 Y좌표
        longitude: bgX, // 지오펜싱 중심 X좌표
      ));
    }
  }
  void _onGeofence(bg.GeofenceEvent event) {
    print('_onGeofence');
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('C course'),),
      body: Column(
        // child widget 사이의 여유 공간을 모두 균등하게 배분
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // 좌우를 꽉 차게 배치
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Center(
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set.from(_markers),  // 구글맵에 마커 표시
                polylines: Set.from(_polyline), // 구글맵에 경로 표시
                circles: Set.from(_circle), // 구글맵에 원(영역) 표시
                initialCameraPosition: const CameraPosition(
                  target: LatLng(33.301577, 126.260575),  // 처음 들어왔을 때 보여줄 위치
                  zoom: 17.0, // 위치를 얼마나 확대해서 보여줄 것인가
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 경로 그리기 위한 좌표
  List<LatLng> _createPoints() {
    final List<LatLng> points = <LatLng>[];

    points.add(LatLng(33.301545, 126.260609));  // S01 입구
    points.add(LatLng(33.301310, 126.260811));  // ABC01 삼거리
    points.add(LatLng(33.301622, 126.261615));  // ABC02 우측 갈림길, 숨골
    points.add(LatLng(33.302137, 126.263790));  // ABC03 고릅써
    points.add(LatLng(33.300696, 126.265148));  // ABC04 AB코스 갈림길, 곶자왈의 동물
    points.add(LatLng(33.298536, 126.266667));  // AB01 갈림길 좌측
    points.add(LatLng(33.300089, 126.268161));  // AB02 A코스 갈림길, 반딧불이
    points.add(LatLng(33.301934, 126.266904));  // A01 힐링길 백서향 반딧불인형 2개
    points.add(LatLng(33.304484, 126.264612));  // AB03 AB코스 합류, 물통과 목장
    points.add(LatLng(33.304719, 126.263791));  // AB04 경사로 바로 앞, 숨골
    points.add(LatLng(33.302267, 126.263503));  // AB05 옵데강 우측
    points.add(LatLng(33.302795, 126.262610));  // AB06 좌측
    points.add(LatLng(33.301651, 126.261710));  // AB07 ABC02 합류점, Y자
    points.add(LatLng(33.301339, 126.260856));  // ABC05 출구방향
    points.add(LatLng(33.301541, 126.260621));  // E01 종료

    return points;
  }
}
