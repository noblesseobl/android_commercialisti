import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:progetto_android_commercialisti/transition.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';

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
          leading: Icon(Icons.account_circle),
          backgroundColor: Colors.deepPurple.shade400,
          shadowColor: Colors.blueGrey,
          title: const Text(
            'NOME APP!',
            textAlign: TextAlign.center,
          ),
        ),

        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              for (int i = 0; i < 4; i++)
                News(i)
            ],


          ),
        ),

        bottomNavigationBar: Container(
          color: Colors.black,
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 15.0, vertical: 7),
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
                  await Future.delayed(const Duration(milliseconds: 100));
                }else if (index==2){
                  Navigator.of(context).push(
                    CustomPageRoute(
                        child: Placeholder(),
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
        padding: const EdgeInsets.symmetric(horizontal: 75),
        child: Column(
          children: [

            Material(
              elevation: 30,
              borderRadius: BorderRadius.circular(12),
              color: Colors.purple.shade400,
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
                      SizedBox(
                        height: 20,
                      ),
                      Text('Lorem ipsum',
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)
                      ),
                      SizedBox(
                        height: 20,
                      ),

                      Center(
                        child: Container(
                            padding: EdgeInsets.all(20),
                            child: Text.rich(
                              TextSpan(children: <TextSpan>[

                                TextSpan(
                                    text: 'Lorem ipsum dolor sit amet, consectetur \nadipiscing elit, sed do eiusmod tempor incididunt\n ut labore et dolore magna aliqua. \nUt enim ad minim veniam, quis nostrud exercitation \n'
                                        'ullamco laboris nisi ut aliquip ex ea commodo consequat. \nDuis aute irure dolor in reprehenderit in \nvoluptate velit esse cillum dolore eu fugiat \nnulla pariatur. Excepteur sint occaecat cupidatat non \nproident, sunt in culpa qui officia \ndeserunt mollit anim id est laborum.',
                                    style: TextStyle(fontSize: 15,)
                                ),
                              ]),
                            )),),

                      SizedBox(height: 20),


                      ElevatedButton(
                        onPressed: () {
                          print("ppvkojrivnm");
                        },
                        child: Text("Allegato"),
                        style: ElevatedButton.styleFrom(
                          primary: Colors.deepPurple.shade400, // Background color
                        ),
                      ),
                    ]),
              ),
            ),
            SizedBox(height: 20,),

          ],
        ));
  }
}
