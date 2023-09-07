class Modello{
  String? _token;
  List<Studio>? _studi;
  List<Dipendente>? _dipendenti;
  List<Messaggio>? _messaggi;
}

class Studio{

  int? studioId;
  String? studioNome;
  String? indirizzo;
  String? email;
  String? telefono;
  String? descrizione;
  String? linkImmagine;


}

class Dipendente{

  int? UtenteId;
  int? DipendenteId;
  String? dipendenteNome;
  String? dipendenteCognome;
  int? ufficioId;
  String? ufficioDesc;

  String? email;
  String? telefono;
  bool? amministratore;

}

class Messaggio{

}