import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void main(){
  runApp(MyApp());
  Firestore.instance.collection("colec").document("docum").setData({"texto":"julia"});
}

// void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Chat",
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      home: Container(
        child: Text("data"),
      ),
    );
  }
}