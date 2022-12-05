import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day5.input');
  var lines = file.readAsLinesSync();

  List<List<String>> cols =
      List.generate((lines[0].length + 1) ~/ 4, (i) => <String>[]);

  for (var line in lines) {
    if (line.contains('[')) {
      for (var i = 0; i < line.length + 1; i += 3) {
        var tmp = line.substring(i, i + 3);
        var idx = i ~/ 4;
        i += 1;
        if (tmp.trim() == "") continue;
        cols[idx].add(tmp[1]);
      }
      continue;
    }
    if (line.trim() == '' || !line.contains('move')) continue;

    List<String> args = line.split(' ');
    int idxCount = int.parse(args[1]);
    int idxFrom = int.parse(args[3]) - 1;
    int idxTo = int.parse(args[5]) - 1;

    var moved = cols[idxFrom].sublist(0, idxCount);
    cols[idxTo].insertAll(0, moved);
    cols[idxFrom].removeRange(0, idxCount);
  }

  print(cols.map((e) => e[0]).join(''));
}
