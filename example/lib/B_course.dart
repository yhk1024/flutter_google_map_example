/*

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Acourse extends StatefulWidget {
  @override
  _AcourseState createState() => _AcourseState();
}

class _AcourseState extends State<Acourse> {

  Completer<NaverMapController> _controller = Completer();
  List<Marker> _markers = [];
  // 마커 좌표
  List<dynamic> _location = [
    LatLng(33.301577, 126.260575),  // A01
    LatLng(33.301323, 126.260833),  // A02
    LatLng(33.301658, 126.261576),  // A03
    LatLng(33.302793, 126.262634),  // A04
    LatLng(33.302323, 126.263532),  // A05
    LatLng(33.304719, 126.263798),  // A06
    LatLng(33.304451, 126.264617),  // A07
    LatLng(33.301953, 126.266909),  // A08
    LatLng(33.300029, 126.268030),  // AB01
    LatLng(33.298572, 126.266630),  // AB02
    LatLng(33.300711, 126.265126),  // ABC01
    LatLng(33.3020835, 126.26376340000003),  // ABC02
    LatLng(33.301645, 126.261553),  // ABC03
    LatLng(33.301701, 126.260317),  // ABC04
  ];
  // 마커 텍스트
  List<String> _list = [
    ('A01'), ('A02'), ('A03'), ('A04'), ('A05'), ('A06'), ('A07'), ('A08'), ('AB01'), ('AB02'), ('ABC01'), ('ABC02'), ('ABC03'), ('ABC04')
  ];

  // 경로 좌표
  List<LatLng> _coordinates = [
    LatLng(33.3021592, 126.2589828),
    LatLng(33.301577, 126.260575),  // A01
    LatLng(33.3013391, 126.260821),
    LatLng(33.301323, 126.260833),  // A02
    LatLng(33.3016392, 126.2614269),
    LatLng(33.301658, 126.261576),  // A03
    LatLng(33.301644599999996, 126.26160559999998),
    LatLng(33.302495099999994, 126.26253709999997),
    LatLng(33.302793, 126.262634),  // A04
    LatLng(33.302323, 126.263532),  // A05
    LatLng(33.303114099999995, 126.26375709999999),
    LatLng(33.3034478, 126.2635436),
    LatLng(33.30394589999999, 126.26347387777778),
    LatLng(33.304066, 126.26344019999999),
    LatLng(33.3042375, 126.26343769999998),
    LatLng(33.304719, 126.263798),  // A06
    LatLng(33.304451, 126.264617),  // A07
    // LatLng(33.289244088888886, 126.2673215),
    LatLng(33.3036797, 126.26520077777775),
    LatLng(33.3033661, 126.26583110000001),
    LatLng(33.3023914, 126.2665054),
    LatLng(33.3018363, 126.2666807),
    LatLng(33.301953, 126.266909),  // A08
    LatLng(33.3000992, 126.26818250000002),
    LatLng(33.30006100000001, 126.26815619999998),
    LatLng(33.300029, 126.268030),  // AB01
    LatLng(33.298572, 126.266630),  // AB02
    // LatLng(33.3007376, 126.26517159999999),
    LatLng(33.300711, 126.265126),  // ABC01
    LatLng(33.3020835, 126.26376340000003),  // ABC02
    LatLng(33.301645, 126.261553),  // ABC03
    LatLng(33.301329599999995, 126.26087720000001),
    LatLng(33.301701, 126.260317),  // ABC04
  ];

  int _width = 5;

  @override
  // 위에 적은 위치에 마커를 찍음.
  void initState() {
    _location.forEach((point) {
      _markers.add(Marker(
        markerId: point.json.toString(),
        position: point,
        alpha: 0.7,
        width: 20,
        height: 27,
        onMarkerTab: _onMarkerTap,
      ));
    });
    super.initState();
  }

  // 실제로 화면에 지도를 보여줌
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            _naverMap(),
          ],
        ),
      ),
    );
  }

  // Follow : 위치추적을 활성화하고 현재 위치 오버레이와 카메라 좌표가 사용자의 위치를 따라 이동.
  LocationTrackingMode _trackingMode = LocationTrackingMode.Follow;

  // 화면에 보여주는 지도
  _naverMap() {
    return Expanded(
      child: Stack(
        children: <Widget>[
          NaverMap(
            onMapCreated: _onMapCreated,
            initLocationTrackingMode: _trackingMode,
            locationButtonEnable: true,
            markers: _markers,
            // 경로를 그림.
            pathOverlays: {
              PathOverlay(
                PathOverlayId('path'),
                _coordinates,
                width: _width,
                color: Colors.red,
                outlineColor: Colors.white,
              )
            },
          ),
        ],
      ),
    );
  }

  // ================== method ==========================

  // 화면에 오면 처음부터 자동으로 경로 그린 위치를 보여줌
  void _onMapCreated(NaverMapController controller) {
    _controller.complete(controller);
    controller.moveCamera(CameraUpdate.fitBounds(
      LatLngBounds.fromLatLngList(_coordinates),
      padding: 48,
    ));
  }

  // 경로 마크를 클릭하면 몇 번인지 보여줌
  void _onMarkerTap(Marker marker, Map<String, int> iconSize) {
    int pos = _markers.indexWhere((m) => m.markerId == marker.markerId);
    setState(() {
      _markers[pos].infoWindow = _list[pos];
    });
  }

}
*/