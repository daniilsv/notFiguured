import 'package:google_maps_flutter/google_maps_flutter.dart';

DateTime convertDateFromJson(String date) => DateTime.tryParse(date ?? '')?.toLocal();

LatLng convertLatLngFromJson(dynamic jsonObject) => jsonObject == null
    ? null
    : LatLng(double.parse(jsonObject['latitude'].toString() ?? '0'),
        double.parse(jsonObject['longitude'].toString() ?? '0'));
