import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day4.input');
  var lines = file.readAsLinesSync();
  int sum = 0;

  for (var line in lines) {
    List<int> p1 =
        line.split(',')[0].split('-').map((e) => int.parse(e)).toList();
    List<int> p2 =
        line.split(',')[1].split('-').map((e) => int.parse(e)).toList();

    if ((p1[0] <= p2[0] && p1[1] >= p2[1]) ||
        (p2[0] <= p1[0] && p2[1] >= p1[1])) sum += 1;
  }

  print(sum);
}
