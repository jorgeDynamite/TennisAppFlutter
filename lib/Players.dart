class Player {
   String firstName;
   String lastName;
   String email;
   String password;

  List<Tournament> tournaments;
  Player({this.firstName, this.lastName, this.email, this.password, this.tournaments});
}


class Tournament {
   List<Matches> matches;
   List<String> surface;
  String tournamentName;
 
  Tournament({
     this.matches,
    this.surface,
    this.tournamentName,
  }
    
  );
}

class Matches {
  Matches({
    
      this.opponent,
      this.score,
      this.unforcedErrors,
      this.forcedErrors,
      this.winners,
      this.aces,
      this.doubleFaults,
      this.voleyWinner,
      this.voleyErrors,
      this.pointsWon,
      this.pointsLost,
      this.secondServeProcentage,
      this.firstServeProcentage,
      this.returnErrors,
      this.returnWinner,
      this.doubles,
      this.rules,
      this.surface,
      this.matchDurationTime
    ,
    this.pointsPlayed,
    this.pointsTracked});
   String surface;

   String opponent;
   List<int> score;
   int unforcedErrors;
   int forcedErrors;
   int winners;
   int aces;
   int doubleFaults;
   int voleyWinner;
   int voleyErrors;
   int pointsWon;
   int pointsLost;
   int secondServeProcentage;
   int firstServeProcentage;
   int returnErrors;
   int returnWinner;
   int pointsPlayed;
   int pointsTracked;
   int matchDurationTime;
   bool doubles;
   Rules rules;
}




class Rules {
   bool ad;
   MatchFormat matchFormatVariable;

  Rules({
    this.ad,
    this.matchFormatVariable
  });
}

class MatchFormat {
   bool mostGamesWinsFormat;
   bool mostSetsWinsFormat;
   int numberSets;
   int timeRestriction;
   int gamesPerSet;
   bool decidingSuperTiebreak;
   bool tiebreak3all;
   bool tiebreak6all;



  MatchFormat({
    this.mostSetsWinsFormat,
    this.mostGamesWinsFormat,
    this.numberSets,
    this.timeRestriction,
    this.gamesPerSet,
    this.decidingSuperTiebreak,
    this.tiebreak3all,
    this.tiebreak6all
    
  });
}

