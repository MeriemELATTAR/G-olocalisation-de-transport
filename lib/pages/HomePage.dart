
import 'package:firstflutter/AppConstants.dart';
import 'package:firstflutter/models/Station.dart';
import 'package:firstflutter/pages/AddTabs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

CircleMarker perimetrecircle = CircleMarker(point: LatLng(33.699010, -7.383426), radius: 150, color: Colors.lightBlue.withOpacity(0.2));
List<Marker> markers = [];
class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  MyPage createState() => MyPage();
}

class MyPage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 33, 32, 32),
        title: const Text('Public Transportation'),
      ),
      body: Stack(
        children: [
          FlutterMap(
            options: MapOptions(
              zoom: 17,
              center: AppConstants.myLocation,
            ),
            layers: [
              TileLayerOptions(
                urlTemplate:
                "https://api.mapbox.com/styles/v1/ikrametu/clo68wrvl00sx01qs0i6keihg/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaWtyYW1ldHUiLCJhIjoiY2xvNDRldmMxMDhqNjJycDBsdGNmYjZwOCJ9.qUvQx-JPxdPS39ECpDoecw",
                
              ),
              CircleLayerOptions(
                circles: [
                  perimetrecircle
                ]
              ),
              MarkerLayerOptions(
                markers: [
                  Marker(point: LatLng(33.699010, -7.382500), builder: (context) => 
                   Image.asset('assets/map_marker.png', width: 60, height: 60)
                  ),
                  Marker(point: LatLng(33.699010, -7.383426), builder: (context) => 
                   const Icon(Icons.directions_car_filled, color: Colors.black, size: 30.0,)
                  ),
                  Marker(point: LatLng(33.700000, -7.383426), builder: (context) => 
                   const Icon(Icons.directions_car_filled, color: Colors.black, size: 30.0,)
                  ),
                  Marker(point: LatLng(33.698500, -7.383440), builder: (context) => 
                   const Icon(Icons.directions_car_filled, color: Colors.black, size: 30.0,)
                  ),
                  Marker(point: LatLng(33.700100, -7.384000), builder: (context) => 
                   const Icon(Icons.directions_bus_filled, color: Colors.lightGreen, size: 30.0,)
                  ),
                  Marker(point: LatLng(33.699010, -7.382000), builder: (context) => 
                   const Icon(Icons.directions_bus_filled, color: Colors.lightGreen, size: 30.0,)
                  ),
                  Marker(point: LatLng(33.698500, -7.382000), builder: (context) => 
                   const Icon(Icons.directions_train_outlined, color: Colors.redAccent, size: 30.0,)
                  ),
                ], 
              )
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddTabPage())
          );
        },
        child: const Icon(Icons.add),
        ),
    );
  }
}

class FilterForm extends StatefulWidget{
  const FilterForm({super.key});

  @override
  State<StatefulWidget> createState() {
    return FilterFromState();
  }

}

class FilterFromState extends State<FilterForm>{
  final _formKey = GlobalKey<FilterFromState>();
  double perimetre = 0;
  
  
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) {
              setState(() {
                perimetre = double.tryParse(value) ?? 0;
              });
            },
          ),
          ElevatedButton(onPressed: () {
            perimetrecircle = CircleMarker(point: perimetrecircle.point, radius: perimetre);
          },
          child: const Text("Submit"),
          )
        ],
      ),
    );
  }
}

