import '../Services/Api.dart';
import '../Models/teamsModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class TeamViewModel with ChangeNotifier {
  //Api _api = locator<Api>();
  Api _api = Api('teams');

  List<Teams> teams;

  Future<List<Teams>> fetchTeams() async {  
    var result = await _api.getDataCollection();
    teams = result.documents
        .map((doc) => Teams.fromMap(doc.data, doc.documentID))
        .toList();
    return teams;
  }

  Stream<QuerySnapshot> fetchTeamsAsStream() {
    return _api.streamDataCollection();
  }

  Future<Teams> getTeamsById(String id) async {
    var doc = await _api.getDocumentById(id);
    return  Teams.fromMap(doc.data, doc.documentID) ;
  }


  Future removeTeam(String id) async{
    await _api.removeDocument(id) ;
    return ;
  }
  Future updateTeam(Teams data,String id) async{
    await _api.updateDocument(data.toJson(), id) ;
    return ;
  }

  Future addTeam(Teams data) async{
    var result  = await _api.addDocument(data.toJson()) ;
    return result;

  }


}