import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class Apolyline extends StatefulWidget {
  @override
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