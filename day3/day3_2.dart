import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day3.input');
  var lines = file.readAsLinesSync();
  List<String> letters = [];
  for (int i = 0; i < lines.length; i += 3) {
    var s1 = lines[i];
    var s2 = lines[i + 1];
    var s3 = lines[i + 2];

    for (String letter in s1.split('')) {
      if (s2.contains(letter) && s3.contains(letter)) {
        letters.add(letter);
        break;
      }
    }
  }
  int sum = 0;
  List<int> values = [];
  for (var letter in letters) {
    // Lowercase
    int v = 0;
    if (letter.codeUnits[0] < 95) {
      v = letter.codeUnits[0] - 64 + 26;
    } else {
      v = letter.codeUnits[0] - 96;
    }
    values.add(v);
    sum += v;
  }
  print(letters);
  print(values);

  print(sum);
}
