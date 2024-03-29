import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:progetto_android_commercialisti/Modello.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;
import 'AggiustaSize.dart';

class Profilo extends StatefulWidget {
  const Profilo();

  @override
  State<Profilo> createState() => _ProfiloState();
}

class _ProfiloState extends State<Profilo> {


  Modello modello=Modello();

  // bool isLoading = true; // Aggiunto indicatore di caricamento
  //
  //
  // @override
  // void initState() {
  //   super.initState();
  //   _getInfo();
  // }
  // _getInfo() async {
  //   String tt="wUgWkwKL777KrhbKECoJPrGj2GMX32Vi05gB9F4DeKpE6a2ah5YTuewGql5nAkQSSqGvqsMCGkNjpVsJtMg0B2CahV-whUWBMyNLnJ0FJ37C4i9XHMlkGtkN-zomOk7V9fAYWhpyVXoqEFNAJHUHpMvcbSqtZpttowtQpJnOl_njrTkyX-WzOuBApVAeJaLBvNgghbXnarobOcsoH5ZS8w";
  //   var request = http.Request('POST', Uri.parse('http://www.studiodoc.it/api/Cliente/ClienteListGet'));
  //   request.bodyFields={
  //     //"studioId": modello!.studioId.toString(),        //<-- filtro se non null
  //     "studioId": "null",
  //     //"cliente": modello!.clienteId.toString(),
  //     "clienteId": "1",
  //     "tipologiaClienteId": "null"
  //
  //   };
  //   request.headers['Authorization'] = 'Bearer $tt';
  //   http.StreamedResponse response = await request.send();
  //   response.stream.asBroadcastStream();
  //   var jsonData=  jsonDecode(await response.stream.bytesToString());
  //   if (response.statusCode == 200) {
  //
  //   }
  //   else {
  //     print(response.reasonPhrase);
  //   }
  //   setState(() {
  //     isLoading = false; // Nasconde l'indicatore di caricamento
  //   });
  //
  // }

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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                SizedBox(width: 35,),
                Text("Il tuo studio",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey.shade700)
                ),
              ],
            ),
            SizedBox(height: 20,),
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
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // if (isLoading) // Aggiunto indicatore di caricamento
                                      //   CircularProgressIndicator(), // Puoi personalizzare il tuo indicatore di caricamento


                                      SizedBox(height: 10,),
                                      Container(
                                        child: CircleAvatar(
                                          backgroundColor: Colors.blueGrey.shade200,
                                          backgroundImage: AssetImage('/account.png'),
                                          radius: 80,

                                        ),),


                                      SizedBox(
                                          height: 20
                                      ),

                                      Text('Studio commercialistico Giovanni Giorgio',
                                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)
                                      ),



                                      SizedBox(
                                          height: 30
                                      ),

                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 10,),
                                          Icon(Icons.directions, color: Colors.deepPurple.shade600),
                                          SizedBox(
                                              width: 7
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                MapsLauncher.launchQuery(
                                                    'Via Roma 34, Torino');
                                              },
                                              child: Padding(
                                                padding: getPadding(top: 0),
                                                child:
                                                RichText(
                                                  overflow: TextOverflow.ellipsis,
                                                  strutStyle: StrutStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                                                  text: TextSpan(
                                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400, ),
                                                      text: 'Via Roma, 34'),
                                                ),
                                                ),),
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
                                          SizedBox(width: 10,),
                                          Icon(Icons.phone, color: Colors.deepPurple.shade600),
                                          SizedBox(
                                              width: 7
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                launch("tel://33333333");
                                              },
                                              child: Padding(
                                                padding: getPadding(top: 0),
                                                child:
                                                RichText(
                                                  overflow: TextOverflow.ellipsis,
                                                  strutStyle: StrutStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                                                  text: TextSpan(
                                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400, ),
                                                      text: '333 333333'),
                                                ),),),
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
                                          SizedBox(width: 10,),
                                          Icon(Icons.alternate_email_outlined, color: Colors.deepPurple.shade600),
                                          SizedBox(
                                              width: 7
                                          ),
                                          Expanded(
                                            child: GestureDetector(
                                              onTap: (){
                                                String? encodeQueryParameters(Map<String, String> params) {
                                                  return params.entries
                                                      .map((MapEntry<String, String> e) =>
                                                  '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                                                      .join('&');
                                                }
  // ···
                                                final Uri emailLaunchUri = Uri(
                                                  scheme: 'mailto',
                                                  path: 'ciaone@prontone.com',
                                                  query: encodeQueryParameters(<String, String>{
                                                    'subject': 'Richiesta di informazioni',
                                                  }),
                                                );

                                                launchUrl(emailLaunchUri);
                                              },
                                              child: Padding(
                                                padding: getPadding(top: 0),
                                                child: RichText(
                                                  overflow: TextOverflow.ellipsis,
                                                  strutStyle: StrutStyle(fontSize: 20.0, fontWeight: FontWeight.w400),
                                                  text: TextSpan(
                                                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w400, ),
                                                      text: 'ciaone@prontone.commmmmmmmmmmmmmmmmmmmmm'),
                                                ),
                                                ),),
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
                  SizedBox(height: 30,),

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

                                    SizedBox(height: 10,),

                                    Text('I tuoi riferimenti',
                                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)
                                    ),

                                    SizedBox(
                                        height: 20
                                    ),

                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(width: 5,),
                                        Expanded(
                                          child: Text('Giusy  -  Contabilità',
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400,)
                                          ),
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
                                        SizedBox(width: 5,),
                                        Expanded(
                                          child: Text('Agata  -  Segreteriaahahahahahhahahahaahajajajajajajajaj',
                                              maxLines: 1,
                                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400, overflow: TextOverflow.ellipsis)
                                          ),
                                        ),
                                        
                                      ],
                                    ),

                                    SizedBox(
                                        height: 10
                                    ),

                                    SizedBox(height: 5),

                                  ],
                                )),),
                        ],
                      ),

                    ),


                  ),
                  SizedBox(height: 60,)
                ],
              ),
            ),


          ],
        )
      ),



    );
  }
}
