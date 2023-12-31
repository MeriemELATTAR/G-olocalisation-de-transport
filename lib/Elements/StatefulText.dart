import 'package:flutter/material.dart';

class StatefullText extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyText();
  } 
  
}

class MyText extends State<StatefullText> {
  @override
  Widget build(BuildContext context) {
    return Text("Hey");
  } 

}

void setText(String text) { 
  
}