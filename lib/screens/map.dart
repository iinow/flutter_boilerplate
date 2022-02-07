import 'dart:async';
import 'dart:developer' as dev;

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:rxdart/rxdart.dart';

class Map extends StatelessWidget {
  const Map({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CupertinoPageScaffold(
      child: MapSample(),
      // const MapSample(),,
    );
  }
}

class MapSample extends StatefulWidget {
  const MapSample({Key? key}) : super(key: key);

  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  final Completer<GoogleMapController> _controller = Completer();
  late CameraPosition _currentPosition;

  // target: LatLng(37.42796133580664, -122.085749655962),
  // zoom: 14.4746,

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  void initState() {
    super.initState();
    GestureDetector(
      onPanUpdate: (details) {
        if (details.delta.dx > 0) {
          print('swiping in right direction');
        }

        if (details.delta.dx < 0) {
          print('swiping in left direction');
        }
      },
      child: Text('heool'),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getCurrentLocation().single,
      builder: (builderContext, shapshot) {
        if (shapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Stack(
              children: [
                Positioned.fill(
                  child: GoogleMap(
                    zoomControlsEnabled: false,
                    mapType: MapType.normal,
                    initialCameraPosition: shapshot.data as CameraPosition,
                    onMapCreated: (GoogleMapController controller) {
                      _controller.complete(controller);
                    },
                  ),
                ),
                Positioned(
                  right: 0,
                  bottom: 0,
                  child: CupertinoButton(
                    child: const Text('클릭 me'),
                    onPressed: () {
                      // _getCurrentLocation();
                      _goToPosition();
                    },
                  ),
                )
              ],
            ),
          );
        }

        return const Center(
          child: Text('waiting'),
        );
      },
    );
  }

  Future<void> _goToPosition([CameraPosition position = _kLake]) {
    return Rx.fromCallable(() => _controller.future).forEach((controller) {
      _currentPosition = position;
      controller
          .animateCamera(CameraUpdate.newCameraPosition(_currentPosition));
    });
  }

  ///현재 위치 카메라 조회
  Stream<CameraPosition> _getCurrentLocation() {
    return Rx.fromCallable(() => _determinePosition()).doOnError(
      (p0, p1) {
        dev.log('map error: $p0, messages: $p1');
      },
    ).map(
      (position) => CameraPosition(
        target: LatLng(position.latitude, position.longitude),
        zoom: 14.4746,
      ),
    );
  }

  ///위치 권한 요청
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }
}
