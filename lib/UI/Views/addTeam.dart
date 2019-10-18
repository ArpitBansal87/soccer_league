
import 'package:arpit_soccer_league/Core/Models/teamsModel.dart';
import 'package:arpit_soccer_league/Core/ViewModels/teamViewModel.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

class addTeamDetails extends StatefulWidget{

  @override
  _addTeamsDetailsState createState() => _addTeamsDetailsState();
}

class _addTeamsDetailsState extends State<addTeamDetails> {
  Teams addTeamObject = Teams();
  final _formKey = GlobalKey<FormState>();
  final _teamName = TextEditingController();
  final _teamPrimaryColors = TextEditingController();
  final _teamSecondaryColors = TextEditingController();
  final _teamSquadSize = TextEditingController();

  void submit() {
    // First validate form.
    if (this._formKey.currentState.validate()) {
      _formKey.currentState.save(); // Save our form now.
      final teamProvider = Provider.of<TeamViewModel>(context);

      print('Printing the login data.');
      print('Team Name: ${_teamName.value.text}');
      print('Team Squad Size: ${_teamSquadSize.value.text}');
      addTeamObject = Teams(id:'01',
        teamID:'001',
        teamLogo:_teamName.value.text,
        teamName:_teamName.value.text,
        teamPrimaryColors:_teamPrimaryColors.value.text,
        teamSecondaryColors:_teamSecondaryColors.value.text,
        teamSquadSize:int.parse(_teamSquadSize.value.text)
      );
      teamProvider.addTeam(addTeamObject);
    }
  }

  @override
  Widget build(BuildContext context){
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: GradientAppBar(
        title:Text('Add Team Details'),
        centerTitle: true,
        gradient: LinearGradient(
            colors:<Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
        ),
      ),
      body: Container(
        decoration:
          BoxDecoration(
              image: DecorationImage(
                  colorFilter: new ColorFilter.mode(Colors.blueGrey.withOpacity(0.8), BlendMode.dstATop),
                  image: AssetImage("images/hussain-ibrahim-gZoRGh-GGKY-unsplash.jpg"), fit: BoxFit.cover)),
              child: new Form(
                key: _formKey,
                child: new ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(

                        controller: _teamName,
                        keyboardType: TextInputType.text,
                        decoration: new InputDecoration(
                          labelText: 'Team Name',
                          errorText: 'Please enter a valid Team name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        controller: _teamSquadSize,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Team Squad Size',
                          errorText: 'Please enter the correct squad size',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        controller: _teamSquadSize,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Team Squad Size',
                          errorText: 'Please enter the correct squad size',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        controller: _teamSquadSize,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Team Squad Size',
                          errorText: 'Please enter the correct squad size',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: new TextFormField(
                        controller: _teamSquadSize,
                        keyboardType: TextInputType.number,
                        decoration: new InputDecoration(
                          labelText: 'Team Squad Size',
                          errorText: 'Please enter the correct squad size',
                          contentPadding: const EdgeInsets.all(8.0)
                        ),
                      ),
                    ),
                    new Container(
                      width: screenSize.width,
                      child: new RaisedButton(
                          onPressed: this.submit,
                          child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }
}