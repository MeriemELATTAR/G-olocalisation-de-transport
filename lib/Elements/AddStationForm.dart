import 'package:firstflutter/models/Station.dart';
import 'package:flutter/material.dart';

class AddStationForm extends StatefulWidget{
  const AddStationForm({super.key});
  @override
  State<StatefulWidget> createState() {
    return FormState();
  }

}


class FormState extends State<AddStationForm> {
  final _formKey = GlobalKey<FormState>();
  final stationNameController = TextEditingController();
  final stationCityController = TextEditingController();
  @override
  void dispose() {
    stationNameController.dispose();
    stationCityController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Station Name :'
            ),
            controller: stationNameController,
            validator: (value) { 
              if(value == null || value.isEmpty){
                return 'Please enter a name for the station';
              }
              return null;
            },
          ),
          TextFormField(
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Station City :'
            ),
            controller: stationCityController,
            validator: (value) { 
              if(value == null || value.isEmpty){
                return 'Please enter a city for the station';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: ElevatedButton(
              onPressed: () { 
                print("Adding a station .. ");
                Station.createStation(stationNameController.text, stationCityController.text);
              },
              child: const Icon(Icons.add),
            ),
            )
        ],
      )
    );
  } 
}