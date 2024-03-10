import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progetto_android_commercialisti/Applicazione.dart';
import 'package:progetto_android_commercialisti/Modello.dart';
import 'package:progetto_android_commercialisti/SignIn.dart';
import 'package:progetto_android_commercialisti/transition.dart';
import 'package:http/http.dart' as http;
import '../AggiustaSize.dart';
import 'recuperoPassword.dart';


class Login extends StatefulWidget {
  Login();

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {


  _LoginState();


  String username="";
  String password="";
  Modello? modello=Modello();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    mediaQueryData = MediaQuery.of(context);
    bool sbagliato=false;

    return Scaffold(
        backgroundColor: Colors.purple.shade100,
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
                                padding: getPadding(top: 10),
                                child: Text("Login",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20
                                    ))),

                            SizedBox(height: 40,),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 25.0),
                              child: Container(
                                decoration:BoxDecoration(
                                    color: Colors.blueGrey.shade50,
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
                                        return 'Please enter some text';}
                                      // }else if (!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value) ){
                                      //   return 'Please enter a valid email';
                                      // }
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
                                    color: Colors.blueGrey.shade50,
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
                              onPressed: ()    async {
                                Navigator.of(context).push(
                                  CustomPageRoute(
                                      child: Applicazione(),
                                      direction:AxisDirection.up
                                  ),);
                                //
                                // if (_formKey.currentState!.validate()) {
                                //
                                //
                                //   try{
                                //
                                //     //chiamata per il login
                                //     http.Response response = await login();
                                //
                                //     print(response.body);
                                //     final jsonData = jsonDecode(response.body) as Map<String, dynamic>;
                                //
                                //     if (jsonData["retCode"]==-1 || response.statusCode != 200) {
                                //       if (response.statusCode !=200){
                                //         print(response.reasonPhrase);
                                //       }else{
                                //         print(jsonData["retDescr"]);
                                //         ScaffoldMessenger.of(context).showSnackBar(
                                //           const SnackBar(content: Text('Utente non trovato, la password o l\'username potrebbero essere sbagliati')),
                                //         );
                                //       }
                                //     }
                                //     else { //login andato a buon fine
                                //
                                //
                                //       modello!.clienteId=jsonData["retCode"];
                                //
                                //       //chiamata per il token
                                //       http.StreamedResponse response2 = await getToken();
                                //
                                //       final jsonData2 =  jsonDecode(await response2.stream.bytesToString()) as Map<String, dynamic>;
                                //       response2.stream.asBroadcastStream();
                                //
                                //       if (response2.statusCode == 200) {
                                //         //salva token ed entra
                                //
                                //         modello!.token= jsonData2["access_token"];
                                //         modello!.token_type= jsonData2["token_type"];
                                //         modello!.expiration= jsonData2["expires_in"];
                                //
                                //
                                //         print(modello!.token);
                                //         //chiamata per definire il ruolo e i dati del cliente
                                //
                                //
                                //         http.StreamedResponse response3 = await getCliente();
                                //
                                //         response3.stream.asBroadcastStream();
                                //         final jsonData3 =  jsonDecode(await response3.stream.bytesToString());
                                //
                                //         if (response3.statusCode == 200) {
                                //
                                //           for (var tizio in jsonData3){
                                //             if(modello!.clienteId==tizio["dipendenteId"]){
                                //               modello!.codiceUtente= tizio["codiceUtente"];
                                //               modello!.nome= tizio["dipendenteNome"];
                                //               modello!.cognome= tizio["dipendenteCognome"];
                                //               modello!.email= tizio["email"];
                                //               modello!.telefono= tizio["telefono"];
                                //               modello!.studioId= tizio["studioId"];
                                //               modello!.studioNome= tizio["studioNome"];
                                //
                                //             }
                                //           }
                                //
                                //
                                //           Navigator.of(context).push(
                                //             CustomPageRoute(
                                //                 child: Applicazione(),
                                //                 direction:AxisDirection.up
                                //             ),);
                                //         }
                                //         else {
                                //           print(response3.reasonPhrase);
                                //         }
                                //
                                //       } else {
                                //         print(response2.reasonPhrase);
                                //       }
                                //
                                //     }
                                //
                                //   }catch(er){
                                //     print(er);
                                //     ScaffoldMessenger.of(context).showSnackBar(
                                //       const SnackBar(content: Text('Errore del Server!')),
                                //     );
                                //   }
                                //
                                // }
                              },
                              child: Text("Accedi", style: TextStyle(fontSize: 16),),
                              style: ElevatedButton.styleFrom(
                                primary: Colors.deepPurple.shade400, // Background color
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0)
                                ),
                              ),
                            ),

                            SizedBox(height: 25,),
                            _divider(),
                            SizedBox(height: 30,),


                            Padding(
                                padding: getPadding(top: 22),
                                child: Text("Non hai un account?",
                                    overflow: TextOverflow.ellipsis,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold
                                    )
                                )),

                            GestureDetector(
                                onTap: () {
                                  Navigator.of(context).push(
                                    CustomPageRoute(
                                        child: SignIn(),
                                        direction:AxisDirection.up),);
                                  print("registrati");
                                },
                                child: Padding(
                                    padding: getPadding(top: 9),
                                    child: Text("Registrati",
                                        overflow: TextOverflow.ellipsis,
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                            color: Colors.deepPurple.shade600,
                                            decoration: TextDecoration.underline)
                                    ))),

                            SizedBox(height: 20,),
                            Padding(
                                padding: getPadding(top: 0),
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
                                          color: Colors.deepPurple.shade600,
                                          decoration: TextDecoration.underline)
                                  )),
                            ),

                          ]))),
            ),

        )));
  }


  Future<http.Response> login() {

    return http.post( Uri.parse('http://www.studiodoc.it/api/Login/LoginCheck'),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        "codiceUtente": username,
        "password" : password
      }),
    );
  }


  Future<http.StreamedResponse> getCliente(){

    var request = http.Request('POST', Uri.parse('http://www.studiodoc.it/api/Dipendente/DipendenteListGet'));
    String tt=modello!.token!;
    request.bodyFields =
    {
      "studioId": "null",
      "clienteId": modello!.clienteId.toString(),
      "tipologiaClienteId": "null"
    };
    request.headers['Authorization'] = 'Bearer $tt';

    return request.send();
  }


  Future<http.StreamedResponse> getToken() {

    var request = http.Request('POST', Uri.parse('http://www.studiodoc.it/api/token'));
    request.bodyFields = {
      'username': 'super',
      'password': 'super',
      'grant_type': 'password'
    };
    return request.send();

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




