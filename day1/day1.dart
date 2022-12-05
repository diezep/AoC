import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day1.input');
  var lines = file.readAsLinesSync();

  int max = -1;
  var sum = 0;

  lines.forEach((l) {
    if (l.trim() == "") {
      if (sum > max) max = sum;
      sum = 0;
    } else {
      sum += int.parse(l);
    }
  });

  if (sum > max) {
    max = sum;
  }

  print(max);
}
