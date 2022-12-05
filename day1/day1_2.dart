import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day1_2.input');
  var lines = file.readAsLinesSync();

  List<int> max = [];
  var sum = 0;

  lines.forEach((l) {
    if (l.trim() == "") {
      if (max.length < 3) {
        max.add(sum);
      } else {
        max.sort();
        if (sum > max[0]) {
          max[0] = sum;
        }
      }
      sum = 0;
    } else {
      sum += int.parse(l);
    }
  });

  max.sort();
  if (sum > max[0]) {
    max[0] = sum;
  }

  sum = 0;
  for (var i = 0; i < max.length; i++) {
    sum += max[i];
  }
  print(sum);
}
