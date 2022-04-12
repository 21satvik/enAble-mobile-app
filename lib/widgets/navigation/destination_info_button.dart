import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';
import 'package:ultron_5/screens/destination_data_screen.dart';

import '../../helpers/mapbox_handler.dart';
import '../../helpers/shared_prefs.dart';

Widget destinationInfoButton(BuildContext context) {
  return IconButton(
    icon: const Icon(Icons.info_outline),
    onPressed: () async {
      LatLng destinationLatLng = getTripLatLngFromSharedPrefs('destination');
      final reverse = await getParsedReverseGeocoding(destinationLatLng);
      String address = reverse['name'];
      double lat = destinationLatLng.latitude;
      double lng = destinationLatLng.longitude;

      print(destinationLatLng);

      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) =>
                  DestinationDataScreen(address: address, lat: lat, lng: lng)));
    },
  );
}
