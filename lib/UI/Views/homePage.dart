import 'package:arpit_soccer_league/Core/Models/teamsModel.dart';
import 'package:flutter/material.dart';
import 'package:arpit_soccer_league/Core/Services/authentication.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Teams> teams;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.blueGrey.withOpacity(0.9), BlendMode.dstATop),
              image: AssetImage("images/hussain-ibrahim-gZoRGh-GGKY-unsplash.jpg"), fit: BoxFit.cover)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Text('TCS Football League'),
          centerTitle: true,
        ),
        body: Center(
            child: Column(
                children: <Widget>[
                  LoginButton()
                ]
            )
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: authService.user,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MaterialButton(
              onPressed: () => authService.signOut(),
              color: Colors.red,
              textColor: Colors.white,
              child: Text('Signout'),
            );
          } else {
            return MaterialButton(
              onPressed: () => login(context),
              color: Colors.white,
              textColor: Colors.black,
              child: Text('Login with Google'),
            );
          }
        });
  }

  login(BuildContext context) {
    authService.googleSignIn();
    Navigator.of(context).pop();
    Navigator.of(context).pushNamed('/teamListing');
  }
}
