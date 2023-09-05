import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:progetto_android_commercialisti/HomePage.dart';
import 'package:progetto_android_commercialisti/Messaggi.dart';
import 'package:progetto_android_commercialisti/transition.dart';

import 'AggiustaSize.dart';

class Profilo extends StatefulWidget {
  const Profilo();

  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        //leading: Icon(Icons.account_circle, size: 45,),
        elevation: 5,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple.shade600,
        shadowColor: Colors.blueGrey,
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Stack(
          children: [

            Padding(
                padding: getPadding(top: 20),
                child: Text("NOME APP!",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 7,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.black,
                    ))),
            // Implement the stroke

            Padding(
                padding: getPadding(top: 20),
                child: Text("NOME APP!",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 40,
                      letterSpacing: 7,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ))),

          ],),
      ),

      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,

              children: [
                Text("Il tuo studio",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, )
                ),
              ],
            ),
            SizedBox(height: 30,),

            Card(

              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.black,
                ),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              color: Colors.white70,
              child: Container(
                padding: const EdgeInsets.all(70),
                height: 1000,
                child: Column(
                  children: [
                    SizedBox(
                      width: 120,
                      height: 120,
                      child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(100)),
                           child: Image(image: AssetImage("/mole.png"))),
                    ),
                    Text("cmcjfnrfjrnvjrnrjnvrjvnrjvnrjvnrvnrjvnrjvnrjvnrjvnrjvnrjvnrjvnrjvnrjvnjnnnnnrjnrjn")
                  ],
                )),
              ),


          ],
        )
      ),

      bottomNavigationBar: Container(
        color: Colors.black,
        child: Padding(
          padding:
          const EdgeInsets.symmetric(horizontal: 35.0, vertical: 15),
          child: GNav(
            backgroundColor: Colors.black87,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.white24,
            padding: EdgeInsets.all(11),
            gap: 8,
            iconSize: 25,
            onTabChange: (index) async {
              if (index == 1) {
                Navigator.of(context).push(
                  CustomPageRoute(
                      child: Messaggi(),
                      direction:AxisDirection.up),);
              }else if (index==0){
                Navigator.of(context).push(
                  CustomPageRoute(
                      child: HomePage(),
                      direction:AxisDirection.up),);
              }
            },
            tabs: [
              GButton(
                icon: Icons.home,
                text: 'Home',
              ),
              GButton(
                icon: Icons.mail,
                text: 'Messaggi',
              ),
              GButton(
                icon: Icons.account_circle,
                text: 'Profilo',
              ),

            ],
          ),
        ),
      ),

    );
  }
}
