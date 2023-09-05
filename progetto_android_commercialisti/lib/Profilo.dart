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


            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                children: [

                  Material(
                    elevation: 30,
                    borderRadius: BorderRadius.circular(12),
                    shadowColor: Colors.black,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      shadowColor: Colors.black26,
                      color: Colors.purple.shade100,
                      child: Column(
                        children: [


                          Center(
                            child: Container(
                                padding: EdgeInsets.all(20),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [

                                    //immagine


                                    Container(
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blueGrey.shade200,
                                        backgroundImage: AssetImage('/account.png'),
                                        radius: 80,

                                      ),),


                                    SizedBox(
                                        height: 30
                                    ),

                                    Text('Studio commercialistico Giovanni Giorgio',
                                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,)
                                    ),



                                    SizedBox(
                                        height: 20
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.directions),
                                        Text('via roma 34',
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, )
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.phone),
                                        Text('333 333 33 ',
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, )
                                        ),
                                      ],
                                    ),

                                    SizedBox(
                                      height: 10
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Icon(Icons.alternate_email_outlined),
                                        Text('ciaone@prontone.com',
                                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, )
                                        ),
                                      ],
                                    ),

                                    SizedBox(height: 10),

                                  ],
                                )),),
                        ],
                      ),

                    ),


                  ),
                  SizedBox(height: 20,),
                ],
              ),
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
            selectedIndex: 2,
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
