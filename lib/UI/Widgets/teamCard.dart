import 'package:arpit_soccer_league/Core/Models/teamsModel.dart';
import 'package:flutter/material.dart';

class TeamCard extends StatelessWidget {
  final Teams teamDetails;

  TeamCard({@required this.teamDetails});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
//        Navigator.push(context, MaterialPageRoute(builder: (_) => ProductDetails(product: productDetails)));
      print('testline');
      },
      child: Padding(
        padding: EdgeInsets.all(8),
        child: Card(
          elevation: 5,
          child: Container(
            height: MediaQuery
                .of(context)
                .size
                .height * 0.45,
            width: MediaQuery
                .of(context)
                .size
                .width * 0.9,
            child: Column(
              children: <Widget>[
                Hero(
                  tag: teamDetails.id,
                  child: Image.asset(
                    'assets/${teamDetails.teamLogo}.jpg',
                    height: MediaQuery
                        .of(context)
                        .size
                        .height *
                        0.35,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Row(
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        teamDetails.teamName,
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic),
                      ),
                      Text(
                        '${teamDetails.teamSquadSize} \$',
                        style: TextStyle(
                            fontWeight: FontWeight.w900,
                            fontSize: 22,
                            fontStyle: FontStyle.italic,
                            color: Colors.orangeAccent),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}