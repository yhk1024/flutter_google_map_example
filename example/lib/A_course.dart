// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
// 구글 지도 연결
import 'page.dart';

// 구글 지도 출력 코드
class Acourse extends GoogleMapExampleAppPage {
  Acourse() : super(const Icon(Icons.drag_handle), 'Drag marker');
  @override
  Widget build(BuildContext context) {
    return const AcourseBody();
  }
}

class AcourseBody extends StatefulWidget {
  const AcourseBody();
  @override
  State<StatefulWidget> createState() => AcourseState();
}

class AcourseState extends State<AcourseBody> {
  AcourseState();

  GoogleMapController? controller;
  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }

  var locations = [
    ['A01', 33.301577, 126.260575],  // A01
    ['A02', 33.301323, 126.260833],  // A02
    ['A03', 33.301658, 126.261576],  // A03
    ['A04', 33.302793, 126.262634],  // A04
    ['A05', 33.302323, 126.263532],  // A05
    ['A06', 33.304719, 126.263798],  // A06
    ['A07', 33.304451, 126.264617],  // A07
    ['A08', 33.301953, 126.266909],  // A08
    ['AB01', 33.300029, 126.268030],  // AB01
    ['AB02', 33.298572, 126.266630],  // AB02
    ['ABC01', 33.300711, 126.265126],  // ABC01
    ['ABC02', 33.3020835, 126.26376340000003],  // ABC02
    ['ABC03', 33.301645, 126.261553],  // ABC03
    ['ABC04', 33.301701, 126.260317],  // ABC04
  ];

  List<Marker> _markers = [];

  @override
  void initState() {
    super.initState();
    _markers.add(Marker(
        markerId: MarkerId("1"),
        draggable: true,
        onTap: () => print("Marker!"),
        position: LatLng(33.301577, 126.260575)));
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
                markers: Set.from(_markers),
                initialCameraPosition: const CameraPosition(
                  target: LatLng(33.301577, 126.260575),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
