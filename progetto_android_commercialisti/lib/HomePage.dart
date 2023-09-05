import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:progetto_android_commercialisti/Messaggi.dart';
import 'package:progetto_android_commercialisti/Profilo.dart';
import 'package:progetto_android_commercialisti/transition.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:http/http.dart' as http;
import 'AggiustaSize.dart';

class HomePage extends StatefulWidget {

  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  Text("News",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w900, )
                  ),
                ],
              ),
              SizedBox(height: 30,),
              for (int i = 0; i < 14; i++)
                News(i)
            ],
          ),
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
              selectedIndex: 0,
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
                }else if (index==2){
                  Navigator.of(context).push(
                    CustomPageRoute(
                        child: Profilo(),
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






class News extends StatefulWidget {

  int i;

  News(this.i);

  @override
  _News createState() => _News(i);
}

class _News extends State<News> {

  int i;

  _News(this.i);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [

            Material(

              elevation: 30,
              borderRadius: BorderRadius.circular(12),
              color: Colors.deepPurple.shade300,
              shadowColor: Colors.black,
              child: Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
                shadowColor: Colors.black26,
                color: Colors.purple.shade100,

                child: RoundedExpansionTile(


                    focusColor: Colors.purple.shade100,
                    tileColor: Colors.deepPurple.shade400,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),

                    title: Text("${i+1}\t\t\t\t\t\t  ciao bergamasco",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.white,
                        )),

                    children: [


                      Center(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text('Topic',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, )
                                    ),
                                    Text('11/09/2001',
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, )
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Text('Lorem ipsum',
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text.rich(
                                  TextSpan(children: <TextSpan>[

                                    TextSpan(
                                        text: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'
                                            ' Ut enim ad minim veniam, quis nostrud exercitation '
                                            'ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse '
                                            'cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non '
                                            'proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                                        style: TextStyle(fontSize: 15,)
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(

                                  onPressed: () async {


                                    var request = http.Request('POST', Uri.parse('http://localhost:80/token'));
                                    request.bodyFields = {
                                      'username': 'super',
                                      'password': 'super',
                                      'grant_type': 'password'
                                    };

                                    http.StreamedResponse response = await request.send();

                                    if (response.statusCode == 200) {
                                      print(await response.stream.bytesToString());
                                    }
                                    else {
                                      print(response.reasonPhrase);
                                    }


                                    print("ppvkojrivnm");
                                  },

                                  child: Text("Allegato"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple.shade400, // Background color
                                  ),
                                ),
                              ],
                            )),),


                    ]),
              ),
            ),
            SizedBox(height: 20,),

          ],
        ));
  }
}
