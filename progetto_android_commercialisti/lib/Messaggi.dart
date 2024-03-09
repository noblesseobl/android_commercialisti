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
        backgroundColor: Colors.deepPurple.shade200,
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return StatefulBuilder(
                    builder: (BuildContext context, StateSetter setState) {
                      return AlertDialog(
                        backgroundColor: Colors.deepPurple.shade100,
                        scrollable: true,
                        content: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              //dropdown menu

                              Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Container(
                                  decoration:BoxDecoration(
                                  color: Colors.blueGrey.shade50,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(color: Colors.deepPurple.shade400)
                                  ),
                                  child:Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: DropdownButtonHideUnderline(
                                  child: DropdownButton(
                                  items: list!.map<DropdownMenuItem<String>>(
                                          (dynamic value) {
                                        return DropdownMenuItem<String>(
                                          child: Text(value),
                                          value: value.toString(),
                                        );
                                      }).toList(),
                                  value: dropdownValue,
                                  iconEnabledColor: Colors.deepPurple.shade400,
                                  iconDisabledColor: Colors.deepPurple.shade400,
                                  hint: Text("Seleziona destinatario"),
                                  isExpanded: true,
                                  icon: const Icon(Icons.arrow_downward),
                                  elevation: 16,
                                  style:
                                  TextStyle(color: Colors.blueGrey.shade700),
                                  underline: Container(
                                    width: 100,
                                    height: 2,
                                    color: Colors.deepPurple.shade400,
                                  ),
                                  onChanged: (String? value) {
                                    setState(() {
                                      dropdownValue = value;
                                      print(dropdownValue);
                                    });
                                  }),),),),),


                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Container(
                                  decoration:BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.deepPurple.shade400)
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.only(left: 12),

                                    child: TextFormField(
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          hintText: 'Inserisci titolo'
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 10,),
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                child: Container(
                                  height: 170,
                                  decoration:BoxDecoration(
                                      color: Colors.blueGrey.shade50,
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(color: Colors.deepPurple.shade400)
                                  ),
                                  child:Padding(
                                    padding: const EdgeInsets.only(left: 0),

                                    child: TextFormField(

                                      decoration: InputDecoration(
                                        hintText: 'Inserisci testo',
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
                                ),
                              ),

                              SizedBox(height: 30,),


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(

                                    padding: const EdgeInsets.all(1.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple.shade400, // Background color
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)
                                        ),
                                      ),
                                      child: Icon(Icons.upload_rounded),

                                      onPressed: () {
                                        if (_formKey.currentState!.validate()) {
                                          _formKey.currentState!.save();
                                        }
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Colors.deepPurple.shade400, // Background color
                                        shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(20.0)
                                        ),
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


                              SizedBox(height: 10,),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: RichText(
                                    overflow: TextOverflow.ellipsis,
                                    strutStyle: StrutStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
                                    text: TextSpan(
                                        style: TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.bold, ),
                                        text: 'Topic'),
                                  ),
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

                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
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

