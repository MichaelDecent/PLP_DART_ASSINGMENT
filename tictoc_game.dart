import 'dart:io';

/*main*/
void main() {
  print("\t\t==================== TIC-T0C GAME ======================\t\t\n\n");
  String player = 'X';
  var dashboard = [
    ["", "", ""],
    ["", "", ""],
    ["", "", ""],
  ];
  display_dashboard(dashboard);
  play_game(dashboard, player);
}

void display_dashboard(List dashboard) {
  print(" ${dashboard[0][0]} || ${dashboard[0][1]} || ${dashboard[0][2]}");
  print("===+=====+====");
  print(" ${dashboard[1][0]} || ${dashboard[1][1]} || ${dashboard[1][2]}");
  print("===+=====+====");
  print(" ${dashboard[2][0]} || ${dashboard[2][1]} || ${dashboard[2][2]}");
}

void play_game(List dashboard, String player) {
  print("select row between 0-2 ");
  var row = int.parse(stdin.readLineSync()!);
  print("select column between 0-2 ");
  var column = int.parse(stdin.readLineSync()!);
  dashboard[row][column] = player;
  display_dashboard(dashboard);
  check_winner(dashboard, player);
}

void check_winner(
  List dashboard,
  String player,
) {
  int i, j;
  i = 0;
  while (i <= 2) {
    if (dashboard[i][0] == dashboard[i][1] &&
        dashboard[i][1] == dashboard[i][2] &&
        dashboard[i][0].toString().isNotEmpty) {
      display_winner(player);
      exit(1);
    }
    i++;
  }
  j = 0;
  while (j <= 2) {
    if (dashboard[0][j] == dashboard[1][j] &&
        dashboard[1][j] == dashboard[2][j] &&
        dashboard[0][j].toString().isNotEmpty) {
      display_winner(player);
      exit(1);
    }
    j++;
  }
  if (dashboard[0][0] == dashboard[1][1] &&
      dashboard[1][1] == dashboard[2][2] &&
      dashboard[0][0].toString().isNotEmpty) {
    display_winner(player);
    exit(1);
  }
  if (dashboard[0][2] == dashboard[1][1] &&
      dashboard[1][1] == dashboard[2][0] &&
      dashboard[0][2].toString().isNotEmpty) {
    display_winner(player);
    exit(1);
  }
  for (i = 0; i <= 2; i++) {
    for (j = 0; j <= 2; j++) {
      if (dashboard[i][j].toString().isEmpty == true) {
        if (player == "X")
          player = "Y";
        else
          player = "X";
        play_game(dashboard, player);
      }
    }
  }
  display_draw();
  exit(1);
}

void display_winner(String player) {
  print("player $player is the winner");
}

void display_draw() {
  print("DRAW!!!");
}
