import 'package:flutter/material.dart';
import 'package:arpit_soccer_league/authentication.dart';
import 'package:arpit_soccer_league/routesList.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TCS Premier League',
      theme: ThemeData(
       primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'TCS Premier League'),
      routes: routesList.routes,
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.2), BlendMode.dstATop),
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
    Navigator.of(context).pushNamed('/teams');
  }
}
