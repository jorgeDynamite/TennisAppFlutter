class Player {
  String firstName;
  String lastName;
  String email;
  String password;

  List<Tournament> tournaments;
  Player(this.firstName, this.lastName, this.email, this.password, {this.tournaments});
}

class Matches {
  Matches(
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
      this.ad);
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
  bool doubles;
  bool ad;
}

class Tournament {
  List<Matches> matches;
  List<String> surface;
  String tournamentName;
  List<bool> dubblesOrSingle;
  Tournament(
    List<Matches> matches,
    List<String> surface,
    String tournamentName,
  );
}
