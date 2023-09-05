import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:http/http.dart' as http;
import 'package:progetto_android_commercialisti/AggiustaSize.dart';
import 'package:progetto_android_commercialisti/HomePage.dart';
import 'package:progetto_android_commercialisti/Profilo.dart';
import 'package:progetto_android_commercialisti/transition.dart';
import 'dart:io';


class Messaggi extends StatefulWidget {
  const Messaggi();

  @override
  State<Messaggi> createState() => _MessaggiState();
}


List list =["Gerry Scotti","Lino Banfi","Gabibbo"];

class _MessaggiState extends State<Messaggi> {

  final _formKey = GlobalKey<FormState>();

  String? testo;

  String? dropdownValue;

  String? get $dropdownValue => null;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      appBar: AppBar(
        //leading: Icon(Icons.account_circle, size: 45,),
        elevation: 5,
        toolbarHeight: 80,
        backgroundColor: Colors.deepPurple.shade600,
        shadowColor: Colors.deepPurple.shade600,
        centerTitle: true,
        automaticallyImplyLeading: false,

        title: Stack(
          children: [

            Padding(
                padding: getPadding(top: 0),
                child: Text("Studio Grassi",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 4,
                      fontWeight: FontWeight.bold,
                      foreground: Paint()
                        ..style = PaintingStyle.stroke
                        ..strokeWidth = 3
                        ..color = Colors.black,
                    ))),
            // Implement the stroke

            Padding(
                padding: getPadding(top: 0),
                child: Text("Studio Grassi",
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30,
                      letterSpacing: 4,
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
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(width: 35,),
                Text("Messaggi",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey.shade700)
                ),
              ],
            ),
            SizedBox(height: 20,),
            for (int i = 0; i < 6; i++)
              Message(i)
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.deepPurple.shade400,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              //dropdown menu

                              DropdownButton(


                                  items: list!.map<DropdownMenuItem<String>>(
                                          (dynamic value) {
                                        return DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value.toString(),
                                        );
                                      }).toList(),
                                  value: dropdownValue,
                                  hint: Text("seleziona destinatario"),
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                  TextStyle(color: Colors.blueGrey.shade700),
                                  underline: Container(
                                    width: 100,
                                    height: 2,
                                    color: Colors.blueGrey,
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue = value;
                                      print(dropdownValue);
                                    });
                                  }),


                              SizedBox(height: 10,),
                              Flexible(
                                //padding: EdgeInsets.all(8.0),

                                child: TextFormField(
                                  decoration: InputDecoration(
                                    hintText: 'inserisci titolo',
                                    filled: true,
                                  ),
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Flexible(
                                //padding: EdgeInsets.all(8.0),

                                child: TextFormField(

                                  decoration: InputDecoration(
                                    hintText: 'inserisci testo',
                                    filled: true,
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  expands: false,
                                  maxLines: null,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Inserisci testo!';
                                    }
                                    testo=value;
                                    return null;
                                  },
                                ),
                              ),

                              SizedBox(height: 15,),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(

                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple.shade400, // Background color
                                      ),
                                      child: Icon(Icons.upload_rounded),

                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                        }
                                      },
                                    ),
                                  ),
                                ],
                              ),


                              SizedBox(height: 15,),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple.shade400, // Background color
                                  ),
                                  child: Text("Submit"),

                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      _formKey.currentState!.save();
                                    }
                                  },
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }
                );
              });
        },
        child: Icon(Icons.edit),
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
            selectedIndex: 1,
            tabBackgroundColor: Colors.white24,
            padding: EdgeInsets.all(11),
            gap: 8,
            iconSize: 25,
            onTabChange: (index) async {
              if (index == 0) {
                Navigator.of(context).push(
                  CustomPageRoute(
                      child: HomePage(),
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





class Message extends StatefulWidget {

  Message(this.i);

  int i;

  @override
  State<Message> createState() => _MessageState(i);
}

class _MessageState extends State<Message> {

  int i;
  _MessageState(this.i);


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: [

          Material(
            elevation: 30,
            borderRadius: BorderRadius.circular(12),
            shadowColor: Colors.black,
            child: Card(
              shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Colors.deepPurple.shade600,
                  ),
                  borderRadius: BorderRadius.circular(12)),
              shadowColor: Colors.black26,
              color: Colors.purple.shade50,
              child: Column(
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
                            Row(

                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [

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

                                  child:   Text("Allegato"),

                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple.shade400, // Background color
                                  ),
                                ),
                                Icon(Icons.check_outlined, color: Colors.green.shade600, size: 40,),

                                Text('11/09/2001',
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, )
                                ),
                              ],
                            ),
                          ],
                        )),),
                ],
              ),

            ),


          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

