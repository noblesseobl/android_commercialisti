import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:progetto_android_commercialisti/Modello.dart';
import 'package:rounded_expansion_tile/rounded_expansion_tile.dart';
import 'package:http/http.dart' as http;
import 'AggiustaSize.dart';

class HomePage extends StatefulWidget {

  HomePage();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<News> notizie=[];
  Modello modello=Modello();

  bool isLoading = true; // Aggiunto indicatore di caricamento

  @override
  void initState() {
    super.initState();
    _getNews();
  }

  _getNews() async {

    //String tt=modello.token!;
    String tt="wUgWkwKL777KrhbKECoJPrGj2GMX32Vi05gB9F4DeKpE6a2ah5YTuewGql5nAkQSSqGvqsMCGkNjpVsJtMg0B2CahV-whUWBMyNLnJ0FJ37C4i9XHMlkGtkN-zomOk7V9fAYWhpyVXoqEFNAJHUHpMvcbSqtZpttowtQpJnOl_njrTkyX-WzOuBApVAeJaLBvNgghbXnarobOcsoH5ZS8w";
    var request = http.Request('POST', Uri.parse('http://www.studiodoc.it/api/Bacheca/BachecaMessageListGet'));
    request.bodyFields={
      //"studioId": modello!.studioId.toString(),        //<-- filtro se non null
      "studioId": "1",        //<-- filtro se non null
      "numMsg": "15",
      "messaggioId": "null"
    };
    request.headers['Authorization'] = 'Bearer $tt';
    http.StreamedResponse response = await request.send();
    response.stream.asBroadcastStream();
    var jsonData=  jsonDecode(await response.stream.bytesToString());
    if (response.statusCode == 200) {
      for(var mex in jsonData){
        DateTime dataInsert= formatoData(mex["dataInserimento"]);
        DateTime dataLastUpdate=formatoData(mex["dataUltimaModifica"]);
        String linkAllegato=mex["linkAllegato"];
        notizie.add(News(mex["titolo"], mex["messaggio"], linkAllegato, mex["messaggioId"], dataInsert, dataLastUpdate));

      }
    }
    else {
      print(response.reasonPhrase);
    }
    setState(() {
      isLoading = false; // Nasconde l'indicatore di caricamento
    });

  }


  DateTime formatoData(String data){
    //gestione date
    //2023-12-18T12:43:07.57

    int year= int.parse(data.substring(0,4));
    int month= int.parse(data.substring(5,7));
    int day= int.parse(data.substring(8,10));
    int hour= int.parse(data.substring(11,13));
    int minute= int.parse(data.substring(14,16));
    int second= int.parse(data.substring(17,19));
    //
    // print (year);
    // print (month);
    // print (day);
    // print (hour);
    // print (minute);
    // print (second);

    return DateTime(year, month, day, hour, minute, second);
  }

  @override
  Widget build(BuildContext context) {



    return Scaffold(
        backgroundColor: Colors.blueGrey.shade50,
        appBar: AppBar(
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
                  Text("Bacheca",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: Colors.grey.shade700)
                  ),
                ],
              ),
              SizedBox(height: 20,),
              if (isLoading) // Aggiunto indicatore di caricamento
                CircularProgressIndicator(), // Puoi personalizzare il tuo indicatore di caricamento

              for (var mex in notizie)
                NewsCARD(mex),
            ],
          ),
        ),

      );

  }
}


class News{

  int messaggioId;
  String titolo;
  String messaggio;
  String? linkAllegato;
  DateTime dataInserimento;
  DateTime dataUltimaModifica;

  News(this.titolo, this.messaggio, this.linkAllegato, this.messaggioId,
      this.dataInserimento, this.dataUltimaModifica);

  // String parseDataUltimaModifica(){
  //   return dataUltimaModifica.day.toString()+"/"+dataUltimaModifica.month.toString()+"/"+dataUltimaModifica.year.toString()+" alle ore: "+dataUltimaModifica.hour.toString()+":"+dataUltimaModifica.minute;
  // }

  String parseDataUltimaModifica() {
    String formattedMinute =
    dataUltimaModifica.minute.toString().padLeft(2, '0');

    return dataUltimaModifica.day.toString() +
        "/" +
        dataUltimaModifica.month.toString() +
        "/" +
        dataUltimaModifica.year.toString() +
        " alle ore: " +
        dataUltimaModifica.hour.toString() +
        ":" +
        formattedMinute;
  }

}



class NewsCARD extends StatefulWidget {


  News messaggio;
  NewsCARD (this.messaggio);

  @override
  _News createState() => _News(messaggio);
}

class _News extends State<NewsCARD> {

  News messaggio;

  _News(this.messaggio);

  @override
  Widget build(BuildContext context) {

    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [

            Material(

              elevation: 30,
              borderRadius: BorderRadius.circular(12),
              color: Colors.deepPurple.shade200,
              shadowColor: Colors.black,
              child: Card(

                shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.deepPurple.shade600,
                    ),
                  borderRadius: BorderRadius.circular(12)),
                shadowColor: Colors.black26,
                color: Colors.purple.shade50,

                child: RoundedExpansionTile(


                    focusColor: Colors.purple.shade50,
                    tileColor: Colors.deepPurple.shade200,

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),

                    title: Text(messaggio.titolo,
                        textAlign: TextAlign.left,
                        maxLines: 2,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.grey.shade900,
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
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    SizedBox(width: 90,),
                                    Text(messaggio.parseDataUltimaModifica(),
                                        style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, )
                                    ),
                                  ],
                                ),

                                SizedBox(
                                  height: 10,
                                ),
                                Text(messaggio.titolo,
                                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Text.rich(
                                  TextSpan(children: <TextSpan>[

                                    TextSpan(
                                        text: messaggio.messaggio,
                                        style: TextStyle(fontSize: 15,)
                                    ),
                                  ]),
                                ),
                                SizedBox(height: 20),
                                if(messaggio.linkAllegato!=null) ElevatedButton(

                                  onPressed: () async {
                                    print("ppvkojrivnm");
                                  },

                                  child: Text("Allegato"),
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.deepPurple.shade400, // Background color
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(20.0)
                                    ),
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
