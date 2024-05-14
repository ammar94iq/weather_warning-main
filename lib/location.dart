import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

class FreeMap extends StatefulWidget {
  const FreeMap({super.key});

  @override
  State<FreeMap> createState() => _FreeMapState();
}

class _FreeMapState extends State<FreeMap> {
  var cl;

  Future getPosition() async {
    LocationPermission per;
    bool services;

    services = await Geolocator.isLocationServiceEnabled();
    if (services == false) {
      showDialog(
        context: context,
        builder: (builder) {
          return const AlertDialog(
            icon: Icon(Icons.warning),
            title: Text('Geolocator Status'),
            content: Text('Geolocator disabled'),
          );
        },
      );
    }

    per = await Geolocator.checkPermission();
    if (per == LocationPermission.denied) {
      per = await Geolocator.requestPermission();
      if (per == LocationPermission.always) {
        getLatAndLong();
      }
    }
  }

  Future<Position> getLatAndLong() async {
    return await Geolocator.getCurrentPosition().then((value) => value);
  }

  List _data = [];
  late MapZoomPanBehavior _zoomPanBehavior;
  double latitude = 0.0, longitude = 0.0;
  @override
  void initState() {
    getPosition();
    getLatAndLong().then((position) {
      setState(() {
        cl = position;
        if (cl != null) {
          latitude = cl.latitude;
          longitude = cl.longitude;
        }
      });
    });

    _zoomPanBehavior = MapZoomPanBehavior();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isLoad = false;
    setState(() {
      if (latitude != 0.0 && longitude != 0.0) {
        isLoad = false;
        _data = [
          Model('Al-Diwaniyah Teaching Hospital', latitude, longitude),
        ];
      } else {
        isLoad = true;
      }
    });

    return Center(
      child: isLoad == true
          ? const CircularProgressIndicator()
          : SfMaps(
              layers: [
                MapTileLayer(
                  //1- show map image
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  //2- Changing the center latitude and longitude
                  initialFocalLatLng: MapLatLng(latitude, longitude),
                  //3- Changing the initial zoom level
                  initialZoomLevel: 11,
                  //4- add marker on map
                  markerBuilder: (BuildContext context, int index) {
                    return MapMarker(
                      latitude: _data[index].latitude,
                      longitude: _data[index].longitude,
                      iconColor: Colors.black,
                      iconStrokeColor: Colors.green,
                      iconStrokeWidth: 10,
                      iconType: MapIconType.circle,
                    );
                  },
                  //5- move and zoom map
                  zoomPanBehavior: _zoomPanBehavior,
                  //6- select markers point number
                  initialMarkersCount: _data.length,
                ),
              ],
            ),
    );
  }
}

class Model {
  const Model(this.name, this.latitude, this.longitude);

  final String name;
  final double latitude;
  final double longitude;
}
