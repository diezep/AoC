import 'dart:io';

enum status { draw, win, lose }

var points = {
  'X': 1, // Rock
  'Y': 2, // Paper
  'Z': 3, // Scissors
};

var needs = {'X': status.lose, 'Y': status.draw, 'Z': status.win};

var rules = {
  'A': {status.draw: 'X', status.win: 'Y', status.lose: 'Z'},
  'B': {status.draw: 'Y', status.win: 'Z', status.lose: 'X'},
  'C': {status.draw: 'Z', status.win: 'X', status.lose: 'Y'}
};

void main(List<String> args) {
  // Read file from disk
  var file = new File('day2.input');
  var games = file.readAsLinesSync();
  int sum = 0;

  games.forEach((g) {
    var game = g.split(' ');
    var p1 = game[0];
    var p2 = game[1];

    var needed = needs[p2];
    if (needed == status.win) {
      sum += 6;
    } else if (needed == status.draw) {
      sum += 3;
    }

    var chose = rules[p1]![needed];
    sum += points[chose]!;
  });

  print(sum);
}
