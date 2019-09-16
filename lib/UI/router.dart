import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Views/homePage.dart';
import 'Views/playerDetailsView.dart';
import 'Views/teamDetails.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/' :
        return  MaterialPageRoute(
            builder: (_)=> HomePage()
        );
      case '/playersListing' :
        return MaterialPageRoute(
            builder: (_)=> PlayerDetailsView()
        ) ;
      case '/teamListing' :
        return MaterialPageRoute(
            builder: (_)=> TeamsDetails()
        );
      case '/addTeam' :
        return MaterialPageRoute(
            builder: (_)=> TeamsDetails()
        );
      case '/addPlayer' :
        return MaterialPageRoute(
            builder: (_)=> TeamsDetails()
        );
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
              body: Center(
                child: Text('No route defined for ${settings.name}'),
              ),
            ));
    }
  }
}