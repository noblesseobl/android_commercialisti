import 'package:flutter/material.dart';
import 'package:progetto_android_commercialisti/LoginPlayer.dart';

void main() {

  runApp( MyHomePage());

}


class MyHomePage extends StatefulWidget {
   MyHomePage();

  @override

  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override

  Widget build(BuildContext context){
    return MaterialApp(home: LoginPlayer(),
      debugShowCheckedModeBanner: false,);
  }
}
