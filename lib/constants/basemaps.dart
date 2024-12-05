import 'package:flutter_map/flutter_map.dart';

final satellite = TileLayer(
  urlTemplate:
      'https://api.mapbox.com/styles/v1/kevin-kiprotich/clyyda4pb00cb01pf7l1ofsfq/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
  additionalOptions: const {
    'access_token':
        'pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
    'id': 'mapbox.satellite',
  },
);

final traffic = TileLayer(
  urlTemplate:
      'https://api.mapbox.com/styles/v1/kevin-kiprotich/clyy98sjl00bh01r2fxr90ikf/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
  additionalOptions: const {
    'access_token':
        'pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
    'id': 'mapbox.mapbox-traffic-v1',
  },
);

final dark = TileLayer(
  urlTemplate:
      'https://api.mapbox.com/styles/v1/kevin-kiprotich/clyyde86n00br01po1llq559b/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
  additionalOptions: const {
    'access_token':
        'pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
    'id': 'mapbox.mapbox-traffic-v1',
  },
);

final light = TileLayer(
  urlTemplate:
      'https://api.mapbox.com/styles/v1/kevin-kiprotich/clyydlp8000c301nu454l5c4t/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
  additionalOptions: const {
    'access_token':
        'pk.eyJ1Ijoia2V2aW4ta2lwcm90aWNoIiwiYSI6ImNseXd0cHBrMjExc2YyanNsYzIzNGFwZGEifQ.tPvuj0xU8c6hTS0d_1jusw',
    'id': 'mapbox.mapbox-traffic-v1',
  },
);
