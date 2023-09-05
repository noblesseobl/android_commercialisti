import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progetto_android_commercialisti/AggiustaSize.dart';
import 'package:progetto_android_commercialisti/HomePage.dart';
import '../transition.dart';

import 'package:http/http.dart' as http;

class SignIn extends StatefulWidget {
   SignIn();

  @override
  State<SignIn> createState() => _SignInState();
}



class _SignInState extends State<SignIn> {


  String? dropdownValue=null;
  String? dropdownValue2=null;
  String? dropdownValue3=null;
  String? get $dropdownValue => null;
  String? get $dropdownValue2 => null;
  String? get $dropdownValue3 => null;

  String username="";
  String password="";
  String password2="";

  File ? imageFile;

  String nome="";
  String cognome="";


  List list =["Uomo","Donna","Altro"];
  List list2 =["Principiante","Medio","Avanzato"];


  GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(

              key: _formKey,
              child: Container(
                width: double.maxFinite,
                padding: getPadding(left: 41, top: 49, right: 41, bottom: 49),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [


                    //Scritta registrazione

                    Padding(
                        padding: getPadding(top: 11),
                        child: Text("Registrazione",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30
                            ))),

                    //image picker
                    SizedBox(height: 40,),

                    CircleAvatar(
                      backgroundColor: Colors.white70,
                      backgroundImage: AssetImage('/account.png'),
                      radius: 80,
                    ),

                    SizedBox(height: 15,),

                    new Wrap(
                      direction: Axis.horizontal,
                      alignment: WrapAlignment.center,
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            //_getFromCamera();
                          },
                          child: Text("PICK FROM CAMERA"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent.shade700, // Background color
                          ),
                        ),
                        SizedBox(width: 10,),
                        ElevatedButton(
                          onPressed: () {
                            //_getFromGallery();
                          },
                          child: Text("PICK FROM GALLERY"),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent.shade700, // Background color
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 30,),


                    //nome

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration:BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 20),

                          child: TextFormField(
                            onChanged: (String value) {
                              nome=value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Nome'
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    //cognome

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration:BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 20),

                          child: TextFormField(
                            onChanged: (String value) {
                              cognome=value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Cognome'
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),

                    //email

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration:BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 20),

                          child: TextFormField(
                            onChanged: (String value) {
                              username=value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ){
                                return 'Please enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Email'
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    //password?

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration:BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (String value) {
                              password=value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Password'
                            ),
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: 10,),
                    //verifica password????

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        decoration:BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Colors.black)
                        ),
                        child:Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            obscureText: true,
                            onChanged: (String value) {
                              password2=value;
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }else if(password!=password2){
                                return 'Le password non corrispondono';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Conferma Password'
                            ),
                          ),
                        ),
                      ),
                    ),

                    //genere  (dropdown)

                    SizedBox(height: 20,),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 60),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),

                        child: DropdownButton(
                            items: list!.map<DropdownMenuItem<String>>(
                                    (dynamic value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value.toString(),
                                  );
                                }).toList(),
                            value: dropdownValue,
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
                      ),
                    ),

                    //livello (dropdown)


                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20, horizontal: 60),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black)),

                        child: DropdownButton(
                            items: list2!.map<DropdownMenuItem<String>>(
                                    (dynamic value) {
                                  return DropdownMenuItem<String>(
                                    child: Text(value),
                                    value: value.toString(),
                                  );
                                }).toList(),
                            value: dropdownValue2,
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
                                dropdownValue2 = value;
                                print(dropdownValue2);
                              });
                            }),
                      ),
                    ),

                    //circoli pop up?



                    //tasto submit


                    SizedBox(height: 10,),

                    ElevatedButton(
                      onPressed: () async {

                        /*if (_formKey.currentState!.validate()) {

                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Processing Data')),
                          );
                          try{

                            var request = http.Request('POST', Uri.parse('http://localhost:51868/Login/LoginMng'));
                            request.body = '''{\r\n    "codiceUtente": "TEST_2",\r\n\t"password" : "Algo@2022!",\r\n\t"utenteId": "-999"\r\n}''';

                            http.Response response = (await request.send()) as Response;


                            final jsonData = jsonDecode(response.body) as Map< String, dynamic>;
                            if (/**/) {
                              Navigator.of(context).push(
                                CustomPageRoute(
                                    child: HomePage(),
                                    direction:AxisDirection.up
                                ),);

                            }
                            else if (/**/){
                              print(response.reasonPhrase);
                            }else{
                              print(response.reasonPhrase);
                            }



                          }catch(er){
                            print(er);
                          }



                        }*/


                        Navigator.of(context).push(
                          CustomPageRoute(
                              child: HomePage(),
                              direction:AxisDirection.up),);
                       // }

                        //chiamata http
                        //gestione risposta
                        //cambia route

                      },
                      child: Text("Registrati"),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.blueAccent.shade700, // Background color
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }




  // _getFromGallery() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.gallery,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

  // _getFromCamera() async {
  //   final pickedFile = await ImagePicker().pickImage(
  //     source: ImageSource.camera,
  //     maxWidth: 1800,
  //     maxHeight: 1800,
  //   );
  //   if (pickedFile != null) {
  //     setState(() {
  //       imageFile = File(pickedFile.path);
  //     });
  //   }
  // }

}


