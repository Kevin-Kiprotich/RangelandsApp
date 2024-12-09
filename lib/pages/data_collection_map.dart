import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_location_marker/flutter_map_location_marker.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:rangelandsapp/components/buttons.dart';
import 'package:rangelandsapp/constants/basemaps.dart';
import 'package:rangelandsapp/functions/permissions.dart';
import 'package:rangelandsapp/modals/basemap_modal.dart';

class DataCollectionMap extends StatefulWidget {
  const DataCollectionMap({super.key});

  @override
  State<DataCollectionMap> createState() => _DataCollectionMapState();
}

class _DataCollectionMapState extends State<DataCollectionMap> {
  final StreamController<Position> _locStream = StreamController();
  late StreamSubscription<Position> locationSubscription;
  final LocationSettings lSettings = const LocationSettings(
      distanceFilter: 1, accuracy: LocationAccuracy.high);
  final MapController _mapController = MapController();
  StreamSubscription<Position>? _positionStream;
  LatLng _currentCenter = const LatLng(0, 0);
  bool _showMyLocationMarker = false;
  LatLng _center = const LatLng(0, 0);
  String _mapType = "satellite";
  TileLayer _baseMap = satellite;
  Position? _currentPosition;
  double _accuracy = 3.8;
  

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  // function to zoom in in the map
  void zoomIn() {
    double zoomLevel = _mapController.camera.zoom + 1;
    LatLng position = _mapController.camera.center;
    _mapController.move(position, zoomLevel);
  }

  // function to zoom out
  void zoomOut() {
    double zoomLevel = _mapController.camera.zoom - 1;
    LatLng position = _mapController.camera.center;
    _mapController.move(position, zoomLevel);
  }

  void _showBaseMapModal() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return BaseMapModal(
            changeLayersFunction: _changeMapType, activeMapType: _mapType);
      },
    );
  }

  //this changes the map type/basemap
  void _changeMapType(String type) {
    setState(() {
      if (type == 'street') {
        _mapType = 'street';
        _baseMap = traffic;
      } else if (type == 'satellite') {
        _mapType = "satellite";
        _baseMap = satellite;
      } else if (type == 'dark') {
        _mapType = 'dark';
        _baseMap = dark;
      } else if (type == 'light') {
        _mapType = 'light';
        _baseMap = light;
      }
    });
  }

  //function to get position streams
  startLocation() {
    getLocationpermission();
    _positionStream =
        Geolocator.getPositionStream(locationSettings: lSettings)
            .handleError((error) {}).listen((Position position) {
      _locStream.sink.add(position);
      if (mounted) {
        setState(() {
          _accuracy = position.accuracy;
          _center = LatLng(position.latitude, position.longitude);
          double zoomLevel=_mapController.camera.zoom;
          _mapController.move(_center,zoomLevel);
          // print(_currentPosition);
          // print(_center);
          
        });
      }
    });
  }

  // function to end location streams
  endLocation() {
    setState(() {
      _positionStream!.cancel();
    });
  }


  @override
  Widget build(BuildContext context) {
    final double pagePadding =
        MediaQuery.of(context).size.width < 500 ? 16 : 32;
    const double spacing = 16;
    const double buttonHeights = 40;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            // ==================== Flutter Map ====================
            FlutterMap(
              mapController: _mapController,
              options: const MapOptions(
                initialCenter: LatLng(0.8119865892372503, 40.1057605465886127),
                initialZoom: 7,
              ),
              children: [
                _baseMap,
                if (_showMyLocationMarker) CurrentLocationLayer()
              ],
            ),
            //  ==================== Logos ====================
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: pagePadding),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: pagePadding),
                  child: Row(
                    children: [
                      MapButton(
                        icon: const Icon(TablerIcons.chevron_left, size: 24),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                      const SizedBox(width: spacing),
                      Expanded(
                        child: Container(
                          height: buttonHeights,
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromRGBO(17, 17, 26, 0.05),
                                offset: Offset(0, 1),
                                blurRadius: 0,
                              ),
                              BoxShadow(
                                color: Color.fromRGBO(17, 17, 26, 0.1),
                                offset: Offset(0, 0),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  'assets/logos/mercycorps.svg',
                                  height: 24,
                                ),
                                Image.asset(
                                  'assets/logos/garissa.jpg',
                                  height: 24,
                                ),
                                Image.asset(
                                  'assets/logos/wajir.jpg',
                                  height: 24,
                                )
                              ]),
                        ),
                      ),
                      const SizedBox(width: spacing),
                      MapButton(
                        icon: const Icon(TablerIcons.bell),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),

            //  ==================== Zoom Controls ====================
            Align(
              alignment: Alignment.topLeft,
              child: Container(
                margin: EdgeInsets.only(top: 72, left: pagePadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapButton(
                      icon: SvgPicture.asset("assets/icons/zoom_in.svg"),
                      onPressed: zoomIn,
                    ),
                    const SizedBox(height: 16),
                    MapButton(
                      icon: SvgPicture.asset("assets/icons/zoom_out.svg"),
                      onPressed: zoomOut,
                    ),
                  ],
                ),
              ),
            ),

            // ==================== Basemaps & My location ====================
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 72, right: pagePadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapButton(
                      icon: SvgPicture.asset("assets/icons/layers.svg"),
                      onPressed: _showBaseMapModal,
                    ),
                    const SizedBox(height: 16),
                    MapButton(
                      icon: SvgPicture.asset("assets/icons/my_location.svg"),
                      onPressed: () {
                        setState(() {
                          if (_showMyLocationMarker){
                          endLocation();
                          _showMyLocationMarker = false;
                        }else{
                          startLocation();
                          _showMyLocationMarker = true;
                        }
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            // ==================== Record data ==================
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                    left: pagePadding, right: pagePadding, bottom: pagePadding),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surface,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(TablerIcons.chart_pie_filled,
                            color: Theme.of(context).colorScheme.primary,
                            size: 24),
                        const SizedBox(width: 8),
                        Text(
                          'Kollecta',
                          style: Theme.of(context).textTheme.titleLarge?.apply(
                              color: Theme.of(context).colorScheme.primary),
                        )
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 36,
                          width: 36,
                          decoration: BoxDecoration(
                            color: _accuracy <= 5
                                ? Theme.of(context).colorScheme.secondary
                                : Theme.of(context).colorScheme.error,
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: Center(
                            child: Text(
                              _accuracy.toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge
                                  ?.apply(color: Colors.white),
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Text(
                          "Location Accuracy",
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      width: 160,
                      child: PrimaryButton(
                        backgroundColor: Theme.of(context).colorScheme.secondary,
                        onPressed: _accuracy <= 5 ? () {} : null,
                        buttonText: "Record Data",
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
