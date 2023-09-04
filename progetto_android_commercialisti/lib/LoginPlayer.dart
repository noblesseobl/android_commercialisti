import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:progetto_android_commercialisti/HomePage.dart';
import 'package:progetto_android_commercialisti/main.dart';
import 'package:progetto_android_commercialisti/transition.dart';
import 'package:http/http.dart' as http;
import '../AggiustaSize.dart';
import 'recuperoPassword.dart';


class LoginPlayer extends StatefulWidget {
  LoginPlayer();

  @override
  State<LoginPlayer> createState() => _LoginPlayerState();
}

class _LoginPlayerState extends State<LoginPlayer> {


  _LoginPlayerState();


  String username="";
  String password="";

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    bool sbagliato=false;

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

                            Padding(
                                padding: getPadding(top: 11),
                                child: Text("Welcome!",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 30
                                    ))),

                            Padding(
                                padding: getPadding(top: 20),
                                child: Text("Login",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ))),

                            SizedBox(height: 20,),
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
                                        hintText: 'Username'
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(height: 10,),
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

                            SizedBox(height: 25,),


                            Visibility(
                              visible: sbagliato,
                              child: Text("Username o password errati",
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 15,
                                      backgroundColor: Colors.white70,
                                      fontWeight: FontWeight.bold)),
                            ),

                            SizedBox(height: 25,),

                            ElevatedButton(
                              onPressed: () async {

                                if (_formKey.currentState!.validate()) {
                                  // If the form is valid, display a snackbar. In the real world,
                                  // you'd often call a server or save the information in a database.
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Processing Data')),
                                  );
                                  try{

                                    var request = http.Request('POST', Uri.parse('http://localhost:51868/Login/LoginCheck'));
                                    request.body = '''{\r\n    "codiceUtente": "TEST_2",\r\n\t"password" : "Algo@2022!"\r\n\r\n}''';

                                    http.Response response = (await request.send()) as Response;



                                    final jsonData = jsonDecode(response.body) as Map< String, dynamic>;
                                    if (jsonData["retCode"]=="0" && jsonData["retDescr"]=="Accesso consentito") {
                                      Navigator.of(context).push(
                                        CustomPageRoute(
                                            child: HomePage(),
                                            direction:AxisDirection.up
                                        ),);

                                    }
                                    else if (jsonData["retCode"]=="1" && jsonData["retDescr"]=="Accesso negato"){
                                      print(response.reasonPhrase);
                                      sbagliato=true;
                                    }else{
                                      print(response.reasonPhrase);
                                      sbagliato=true;
                                    }



                                  }catch(er){
                                    print(er);
                                  }



                                }

                                //cambia route

                              },
                              child: Text("Accedi"),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.blueAccent.shade700, // Background color
                              ),
                            ),

                            SizedBox(height: 25,),
                            _divider(),
                            SizedBox(height: 30,),


                            Padding(
                                padding: getPadding(top: 28),
                                child: Text("Password dimenticata?",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold
                                    )
                                )),

                            GestureDetector(
                              onTap: (){
                                Navigator.of(context).push(
                                  CustomPageRoute(
                                      child: RecuperaPassword(),
                                      direction:AxisDirection.up),);
                                print("Recupera");
                              },
                              child: Padding(
                                  padding: getPadding(top: 11),
                                  child: Text("Recupera password",
                                      overflow: TextOverflow.ellipsis,
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          color: Colors.indigoAccent,
                                          decoration: TextDecoration.underline)
                                  )),
                            ),

                          ]))),
            ),

        )));
  }


  Widget _divider() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: Divider(
                color: Colors.black,
                thickness: 1,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}




