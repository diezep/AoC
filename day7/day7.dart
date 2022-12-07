import 'dart:io';

class Dir {
  int size = 0;
  List<dynamic> files = [];
}

class _File {
  int size = 0;
  String name = "";
}

void main(List<String> args) {
  // Read file from disk
  var file = new File('day7.input');
  var lines = file.readAsLinesSync();

  Map<String, int> dir = {};
  String actualPath = "";
  String tmpPath = "";

  for (var line in lines) {
    line = line.replaceAll('\$ ', '');
    var args = line.split(' ');

    switch (args[0]) {
      case 'cd':
        if (args[1] == "..") {
          actualPath = actualPath.substring(0, actualPath.length - 1);
          int idxLastDir = actualPath.length -
              actualPath.split('').reversed.toList().indexOf('/');
          actualPath = actualPath.substring(0, idxLastDir);
        } else {
          actualPath += args[1] + (args[1] != '/' ? "/" : '');
        }
        break;
      case 'dir':
        dir["${actualPath}${args[1]}/"] = 0;
        break;
      case 'ls':
        break;
      default:
        dir[actualPath] = (dir[actualPath] ?? 0) + int.parse(args[0]);
        int depth = actualPath.split('').where((e) => e == '/').length;
        tmpPath = actualPath;

        if (depth > 1) {
          for (var i = 0; i < depth - 1; i++) {
            tmpPath = tmpPath.substring(0, tmpPath.length - 1);
            int idxLastDir = tmpPath.length -
                tmpPath.split('').reversed.toList().indexOf('/');
            tmpPath = tmpPath.substring(0, idxLastDir);
            dir[tmpPath] = (dir[tmpPath] ?? 0) + int.parse(args[0]);
          }
        }
        break;
    }
  }
  int sum = 0;
  for (var item in dir.entries) {
    if (item.value <= 100000) sum += item.value as int;
  }
  print(sum);
}
