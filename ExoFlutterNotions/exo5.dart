import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAF',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: component
      
     
    );
  }

}

Scaffold component = Scaffold(body:Center(child:Column(children:[
    Expanded(flex:2,child:Container(color:Colors.yellow,child:Text("sdfghsrherth"))),
    Expanded(flex:1,child:Container(color:Colors.red,child:Text("sdfghsrherth"))),
    Expanded(flex:3,child:Container(color:Colors.blue,child:Text("sdfghsrherth"))),
  ]))
);