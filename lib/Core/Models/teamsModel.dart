
class Teams {
  String id;
  String teamID;
  String teamLogo;
  String teamName;
  String teamPrimaryColors;
  String teamSecondaryColors;
  int teamSquadSize;

  //Constructor
  Teams({this.id, this.teamID,this.teamLogo,this.teamName,this.teamPrimaryColors,this.teamSecondaryColors,this.teamSquadSize});

  Teams.fromMap(Map snapshot, String id):
    id = id ?? '',
    teamID = snapshot['teamID'] ?? '',
    teamLogo = snapshot['teamLogo'] ?? '',
    teamName = snapshot['teamName'] ?? '',
    teamPrimaryColors = snapshot['teamPrimaryColors'] ?? '',
    teamSecondaryColors = snapshot['teamSecondaryColors'] ?? '',
    teamSquadSize = snapshot['teamSquadSize'] ?? 8;

  toJson() {
    return {
      "teamID": teamID,
      "teamName": teamName,
      "teamPrimaryColors": teamPrimaryColors,
      "teamSecondaryColors": teamSecondaryColors,
      "teamLogo": teamLogo,
      "teamSquadSize": teamSquadSize
    };
  }
}