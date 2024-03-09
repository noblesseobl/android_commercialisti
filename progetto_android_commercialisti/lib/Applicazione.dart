
import 'package:flutter/material.dart';
import 'package:progetto_android_commercialisti/HomePage.dart';
import 'package:progetto_android_commercialisti/Messaggi.dart';
import 'package:progetto_android_commercialisti/Profilo.dart';


class Applicazione extends StatefulWidget {


  @override
  State<Applicazione> createState() => _ApplicazioneState();
}

class _ApplicazioneState extends State<Applicazione> {


  int _indicePaginaCorrente = 0;

  // Lista delle schermate
  final List<Widget> _schermate = [
    HomePage(),
    Messaggi(),
    Profilo(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _schermate[_indicePaginaCorrente],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indicePaginaCorrente,
        onTap: (int index) {
          setState(() {
            _indicePaginaCorrente = index;
          });
        },
        backgroundColor: Colors.black87,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.white54,
        iconSize: 25,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail),
            label: 'Messaggi',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profilo',
          ),
        ],
      ),
    );
  }
}
