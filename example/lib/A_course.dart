// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

import 'Acourse_polyline.dart';

class Acourse extends StatefulWidget {
  @override
  AcourseState createState() => AcourseState();
}

class AcourseState extends State<Acourse> {
  GoogleMapController? controller;
  Map<PolylineId, Polyline> polylines = <PolylineId, Polyline>{};

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  List<Marker> _markers = [];
  List<Polyline> _polyline = [];

  List<dynamic> _locations = [
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
    LatLng(33.301541, 126.260621),  // E01 종료
  ];
  List<dynamic> _list = [
    ('S01'), ('ABC01'), ('ABC02'), ('ABC03'), ('ABC04'), ('AB01'), ('AB02'), ('A01'),
    ('AB03'), ('AB04'), ('AB05'), ('AB06'), ('AB07'), ('ABC05'), ('E01')
  ];

  @override
  // 마커 생성 코드
  void initState() {
    for(int i=0; i < _locations.length; i++) {
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
    }
    _polyline.add(
        Polyline(
          polylineId: PolylineId('polyline'),
          visible: true,
          width: 4,
          color: Colors.blue,
          points: _createPoints(),
        )
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('A course'),),
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
                markers: Set.from(_markers),
                polylines: Set.from(_polyline),
                initialCameraPosition: const CameraPosition(
                  target: LatLng(33.301577, 126.260575),
                  zoom: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

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
