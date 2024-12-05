import 'package:flutter/material.dart';
import 'package:rangelandsapp/components/buttons.dart';

class BaseMapModal extends StatefulWidget {
  const BaseMapModal({
    super.key,
    required this.changeLayersFunction,
    // required this.toggleLocationMarker,
    // required this.locationMarker,
    required this.activeMapType,
  });
  final Function(String) changeLayersFunction;
  // final Function() toggleLocationMarker;
  // final bool locationMarker;
  final String activeMapType;

  @override
  State<BaseMapModal> createState() => _BaseMapModalState();
}

class _BaseMapModalState extends State<BaseMapModal> {
  bool isMapTypeDefault = true;
  bool isMapTypeSatellite = false;
  bool isMapTypeTerrain = false;
  bool isMapTypeLight = false;
  
  @override
  void initState() {
    super.initState();
    // widget.locationMarker
    //     ? _toggleIconData = FontAwesomeIcons.eye
    //     : _toggleIconData = FontAwesomeIcons.eyeSlash;

    if (widget.activeMapType == 'street') {
      isMapTypeDefault = true;
      isMapTypeSatellite = false;
      isMapTypeTerrain = false;
      isMapTypeLight = false;
    } else if (widget.activeMapType == 'satellite') {
      isMapTypeDefault = false;
      isMapTypeSatellite = true;
      isMapTypeTerrain = false;
      isMapTypeLight = false;
    } else if (widget.activeMapType == 'dark') {
      isMapTypeDefault = false;
      isMapTypeSatellite = false;
      isMapTypeTerrain = true;
      isMapTypeLight = false;
    } else if (widget.activeMapType == 'light') {
      isMapTypeDefault = false;
      isMapTypeSatellite = false;
      isMapTypeTerrain = false;
      isMapTypeLight = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Layers',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BasemapButton(
                    activeColor: const Color.fromRGBO(116, 178, 128, 1),
                    isActive: isMapTypeDefault,
                    mapType: 'Street',
                    onPressed: () {
                      widget.changeLayersFunction('street');
                      setState(() {
                        isMapTypeDefault = true;
                        isMapTypeSatellite = false;
                        isMapTypeTerrain = false;
                        isMapTypeLight = false;
                      });
                    },
                    image: Image.asset('assets/Images/default.png'),
                  ),
                  BasemapButton(
                    activeColor: const Color.fromRGBO(116, 178, 128, 1),
                    isActive: isMapTypeSatellite,
                    mapType: 'Satellite',
                    onPressed: () {
                      widget.changeLayersFunction('satellite');
                      setState(() {
                        isMapTypeDefault = false;
                        isMapTypeSatellite = true;
                        isMapTypeTerrain = false;
                        isMapTypeLight = false;
                      });
                    },
                    image: Image.asset('assets/Images/satellite.png'),
                  ),
                  BasemapButton(
                    activeColor: const Color.fromRGBO(116, 178, 128, 1),
                    isActive: isMapTypeTerrain,
                    mapType: 'Dark',
                    onPressed: () {
                      widget.changeLayersFunction('dark');
                      setState(() {
                        isMapTypeDefault = false;
                        isMapTypeSatellite = false;
                        isMapTypeTerrain = true;
                        isMapTypeLight = false;
                      });
                    },
                    image: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/Images/dark.png'),
                    ),
                  ),
                  BasemapButton(
                    activeColor: const Color.fromRGBO(116, 178, 128, 1),
                    isActive: isMapTypeLight,
                    mapType: 'Light',
                    onPressed: () {
                      widget.changeLayersFunction('light');
                      setState(() {
                        isMapTypeDefault = false;
                        isMapTypeSatellite = false;
                        isMapTypeTerrain = false;
                        isMapTypeLight = true;
                      });
                    },
                    image: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset('assets/Images/light.jpg'),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            // Text(
            //   'Map Layers',
            //   style: TextStyle(
            //     fontSize: 12,
            //     fontWeight: FontWeight.w800,
            //     color: Colors.grey[600],
            //   ),
            // ),
            // const SizedBox(
            //   height: 8,
            // ),
          ],
        ),
      ),
    );
  }
}