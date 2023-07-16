// ignore_for_file: unused_local_variable

import 'package:exfai/all_export.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:http/http.dart ' as http;

Future getPolyLine(lat, long, destlat, destlong) async {
  List<LatLng> polylineco = [];
  PolylinePoints polylinePoints = PolylinePoints();
  Set<Polyline> polylineSet = {};
  String url =
      "http://maps.googleapis.com/maps/api/directions/json?origin=$lat.$long&destination=$destlat,$destlong&key";
  var response = await http.post(Uri.parse(url));
  var responsebody = jsonDecode(response.body);
  var point = responsebody['routes'][0]['overview_polyline']['points'];
  List<PointLatLng> result = polylinePoints.decodePolyline(point);
  if (result.isNotEmpty) {
    for (var pointLatLng in result) {
      polylineco.add(LatLng(point.latitude, point.longitude));
    }
  }
  Polyline polyline = Polyline(
      polylineId: const PolylineId("wael"),
      color: const Color(0x0ff3498b),
      width: 5,
      points: polylineco);
  polylineSet.add(polyline);
  return polylineSet;
}
