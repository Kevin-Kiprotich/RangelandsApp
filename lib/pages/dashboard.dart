import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class Dashboard extends StatefulWidget{
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _Dashboard();
}


class _Dashboard extends State<Dashboard>{

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body:Stack(
        children: [
          FlutterMap(children: [],),
        ],
      )
    );
  }
}