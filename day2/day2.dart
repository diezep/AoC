import 'dart:io';

enum status { draw, win, lose }

var points = {
  'X': 1, // Rock
  'Y': 2, // Paper
  'Z': 3, // Scissors
};

var rules = {
  'A': {'X': status.draw, 'Y': status.win, 'Z': status.lose},
  'B': {'X': status.lose, 'Y': status.draw, 'Z': status.win},
  'C': {'X': status.win, 'Y': status.lose, 'Z': status.draw}
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

    var s = rules[p1]![p2];
    if (s == status.win) {
      sum += points[p2]! + 6;
    } else if (s == status.lose) {
      sum += points[p2]!;
    } else {
      sum += points[p2]! + 3;
    }
  });

  print(sum);
}
