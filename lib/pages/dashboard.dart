import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:latlong2/latlong.dart';
import 'package:rangelandsapp/components/buttons.dart';
import 'package:rangelandsapp/components/page_switch.dart';
import 'package:rangelandsapp/constants/basemaps.dart';
import 'package:rangelandsapp/modals/basemap_modal.dart';
import 'package:rangelandsapp/modals/indicators_modal.dart';
import 'package:rangelandsapp/modals/location_modal.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}

class _Dashboard extends State<Dashboard> {
  final MapController _mapController = MapController();
  String _mapType = "satellite";
  TileLayer _baseMap = satellite;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _mapController.dispose();
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

  _showChooseLocationModal() async {
    final data = await showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      constraints: BoxConstraints(
        maxHeight: MediaQuery.sizeOf(context).height * (3 / 5),
      ),
      builder: (context) {
        return const LocationModal();
      },
    );

    if (data != null) {}
  }

  _showIndicatorsModal() async {
    final data = await showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return const IndicatorsModal();
      },
    );
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
            //  ==================================== Flutter Map ==============================================
            FlutterMap(
              mapController: _mapController,
              options: const MapOptions(
                initialCenter: LatLng(0.8119865892372503, 40.1057605465886127),
                initialZoom: 7,
              ),
              children: [
                _baseMap,
              ],
            ),
            //  ==================================== Profile, Notifications and Logos =========================
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                margin: EdgeInsets.only(top: pagePadding),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: pagePadding),
                  child: Row(
                    children: [
                      MapButton(
                        icon: const Icon(TablerIcons.user, size: 24),
                        onPressed: () {},
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
            //  ==================================== Layers and Basemaps ======================================
            Align(
              alignment: Alignment.topRight,
              child: Container(
                margin: EdgeInsets.only(top: 72, right: pagePadding),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MapButton(
                      icon: SvgPicture.asset("assets/icons/layers.svg"),
                      onPressed: _showIndicatorsModal,
                    ),
                    const SizedBox(height: 16),
                    MapButton(
                      icon: Image.asset("assets/icons/satellite.jpg"),
                      onPressed: _showBaseMapModal,
                    )
                  ],
                ),
              ),
            ),
            //  ==================================== Zoom Controls =============================================
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
            //  ==================================== My Location and AOI selection =============================
            Align(
                alignment: Alignment.bottomRight,
                child: Container(
                  margin: EdgeInsets.only(
                    bottom: 72,
                    right: pagePadding,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MapButton(
                        icon: SvgPicture.asset("assets/icons/my_location.svg"),
                        onPressed: () {},
                      ),
                      const SizedBox(height: 16),
                      MapButton(
                        icon: SvgPicture.asset("assets/icons/location_pin.svg"),
                        onPressed: _showChooseLocationModal,
                      ),
                    ],
                  ),
                )),
            //  ==================================== Bottom Navigation, Info and Custom Draw ===================
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(bottom: pagePadding),
                padding: EdgeInsets.symmetric(horizontal: pagePadding),
                child: Row(
                  children: [
                    MapButton(
                      icon: const Icon(TablerIcons.chart_bar),
                      onPressed: () {},
                    ),
                    const SizedBox(width: spacing),
                    Expanded(
                      child: PageSwitch(
                        activePage: "dashboard",
                        onDashboardClicked: () {},
                        onDataCollectionClicked: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ),
                    const SizedBox(width: spacing),
                    MapButton(
                      icon: SvgPicture.asset("assets/icons/polygon.svg"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
