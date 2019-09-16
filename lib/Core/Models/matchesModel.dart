class PlayerOfMatch{
  final String playerName;
  final String playerId;
  final String referenceId;

  PlayerOfMatch(this.playerId,this.playerName,this.referenceId);
}

class GoalsInfo{
  final bool isOwnGoal;
  final String goalScoredFor;
  final String assistedByRefId;
  final String assistedByName;
  final String description;
  final int scoredAt;
  final String scoredByName;
  final String scoredByRefId;

  GoalsInfo(this.isOwnGoal,this.goalScoredFor,this.assistedByRefId,this.assistedByName,
      this.description,this.scoredAt,this.scoredByName,this.scoredByRefId);

}

class MatchesModel {
  final String awayTeam;
  final String awayTeamRefId;
  final String fullTimeScore;
  final String halfTimeScore;
  final String homeTeam;
  final String homeTeamRefId;
  final String winningTeam;
  final String winningTeamRefId;
  final DateTime timeOfTheMatch;
//  final [PlayerOfMatch] manOfTheMatch;

  MatchesModel(this.awayTeam,this.awayTeamRefId,this.fullTimeScore,this.halfTimeScore,this.homeTeam,
    this.homeTeamRefId,this.winningTeam,this.winningTeamRefId,this.timeOfTheMatch,
//      this.manOfTheMatch
      );

}