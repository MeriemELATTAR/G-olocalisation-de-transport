

import 'package:firstflutter/Elements/AddStationForm.dart';
import 'package:flutter/material.dart';

class AddTabPage extends StatefulWidget{
  const AddTabPage({super.key});
  @override
  State<StatefulWidget> createState() {
    return Page();
  }

}


class Page extends State<AddTabPage>{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(icon: Icon(Icons.directions)),
                Tab(icon: Icon(Icons.directions_car_filled))
              ]
              ),
              title: const Text(" Stations / Transport creation interface"),
          ),
          body: const TabBarView(
            children:[
                AddStationForm(),
                Icon(Icons.directions_car_filled)
            ] 
            ),
          floatingActionButton: FloatingActionButton(
            onPressed: () { 
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back),
            ),  
          ),
      ),
    );
  }
}