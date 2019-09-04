import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:arpit_soccer_league/routesList.dart';

class TeamsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCS Premier League',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TeamsPage(),
      routes: routesList.routes,
    );
  }
}

class TeamsPage extends StatefulWidget {
  TeamsPage({Key key});

  @override
  _TeamsPage createState() => _TeamsPage();
}

class _TeamsPage extends State<TeamsPage> {
  TextEditingController teamNameController = TextEditingController();
  TextEditingController teamPrimaryColorsController = TextEditingController();
  TextEditingController teamCaptainNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(
                  Colors.lightGreen.withOpacity(0.8), BlendMode.dstATop),
              image:
                  AssetImage("images/hussain-ibrahim-gZoRGh-GGKY-unsplash.jpg"),
              fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('TCS Football League'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(children: <Widget>[
              new Expanded(child:
              StreamBuilder<QuerySnapshot>(
                stream: Firestore.instance.collection('teams').snapshots(),
                builder:
                    (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError)
                    return new Text('Error: ${snapshot.error}');
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return new Text('Loading...');
                    default:
                      return new ListView(
                        children: snapshot.data.documents
                            .map((DocumentSnapshot document) {
                          return new ListTile(
                            title: new Text(document['teamCaptain'],
                              style: TextStyle(color: Colors.white)),
                            subtitle: new Text(document['teamName'],
                                style: TextStyle(color: Colors.white)),
                          );
                        }).toList(),
                      );
                  }
                },
              ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: teamNameController,
                    onChanged: (v) => teamNameController.text = v,
                    decoration: InputDecoration(
                      labelText: 'Team Name',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: teamCaptainNameController,
                    onChanged: (v) => teamCaptainNameController.text = v,
                    decoration: InputDecoration(
                      labelText: 'Team Captain Name',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: TextField(
                    controller: teamPrimaryColorsController,
                    onChanged: (v) => teamPrimaryColorsController.text = v,
                    decoration: InputDecoration(
                      labelText: 'Teams Primary Colors',
                    )),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Builder(
                  builder: (context) {
                    return RaisedButton(
                      onPressed: () => print('PRESSED'),
                      color: Colors.indigoAccent,
                      child: Text('Submit Player Info'),
                    );
                  },
                ),
              ),
        ])),
      ),
    );
  }
}
