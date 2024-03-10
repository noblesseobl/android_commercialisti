


class Modello {
  static final Modello _singleton = Modello._internal();


  factory Modello() {
    return _singleton;
  }

  dispose(){
    token=null;
    token_type=null;
    expiration=null;
    codiceUtente=null;


    nome=null;
    cognome=null;
    email=null;
    telefono=null;
    clienteId=null;
    studioId=null;
    studioNome=null;
  }

  Modello._internal();



  String? token=null;
  String? token_type=null;
  int? expiration=null;
  String? codiceUtente=null;
  String? nome=null;
  String? cognome=null;
  String? email=null;
  String? telefono=null;
  int? clienteId=null;
  //bool? superAdmin=true;
  int? studioId=null;
  String? studioNome=null;

}

