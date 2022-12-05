import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day3.input');
  var lines = file.readAsLinesSync();
  List<String> letters = [];
  for (String line in lines) {
    var s1 = line.substring(0, line.length ~/ 2);
    var s2 = line.substring(line.length ~/ 2);

    for (String letter in s1.split('')) {
      if (s2.contains(letter)) {
        letters.add(letter);
        break;
      }
    }
  }
  int sum = 0;
  for (var letter in letters) {
    // Lowercase
    int v = 0;
    if (letter.codeUnits[0] < 95) {
      v = letter.codeUnits[0] - 64 + 26;
    } else {
      v = letter.codeUnits[0] - 96;
    }
    sum += v;
  }

  print(sum);
}
