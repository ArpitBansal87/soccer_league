import 'package:arpit_soccer_league/Core/Models/teamsModel.dart';
import 'package:arpit_soccer_league/Core/ViewModels/teamViewModel.dart';
import 'package:arpit_soccer_league/UI/Shared/drawer.dart';
import 'package:arpit_soccer_league/UI/Widgets/teamCard.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TeamsDetails extends StatefulWidget{
  @override
  _TeamDetailsState createState() => _TeamDetailsState();
}

class _TeamDetailsState extends State<TeamsDetails> {
  List<Teams> teams;

  @override
  Widget build(BuildContext context) {
    final teamProvider = Provider.of<TeamViewModel>(context);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF03fc39),
        onPressed: () {
          Navigator.pushNamed(context, '/addTeam');
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Center(child: Text('Home')),
        backgroundColor: Color(0xFF03fc39),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                colorFilter: new ColorFilter.mode(Colors.blueGrey.withOpacity(0.8), BlendMode.dstATop),
                image: AssetImage("images/hussain-ibrahim-gZoRGh-GGKY-unsplash.jpg"), fit: BoxFit.cover)),
        child: StreamBuilder(
            stream: teamProvider.fetchTeamsAsStream(),
            builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasData) {
                teams = snapshot.data.documents
                    .map((doc) => Teams.fromMap(doc.data, doc.documentID))
                    .toList();
                return ListView.builder(
                  itemCount: teams.length,
                  itemBuilder: (buildContext, index) =>
                      TeamCard(teamDetails: teams[index]),
                );
              } else {
                return Text('fetching');
              }
            }),
      ),
      drawer: DrawerWidget(),
    );
  }
}
