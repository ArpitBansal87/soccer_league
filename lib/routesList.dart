import 'package:arpit_soccer_league/teamsListDisplay.dart';
import 'package:flutter/material.dart';

class RoutesList{

  final Map<String, WidgetBuilder> routes ={
    '/teams': (BuildContext context) => new TeamsList(),
    '/': (BuildContext context) => new TeamsList(),
  };
}

final RoutesList routesList = RoutesList();