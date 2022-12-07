import 'dart:io';

void main(List<String> args) {
  // Read file from disk
  var file = new File('day6.input');
  var line = file.readAsStringSync();
  var letters = [];
  var dif = 4;

  for (var i = 0; i < line.length; i++) {
    var letter = line[i];
    letters.add(letter);
    if (letters.length > 4) {
      letters.removeAt(0);

      if (checkDifferent(letters)) {
        print(i + 1);
        return;
      }
    }
  }
}

bool checkDifferent(List letters) {
  var _map = {};
  for (var i = 0; i < letters.length; i++) {
    if (_map.containsKey(letters[i]))
      return false;
    else
      _map[letters[i]] = false;
  }
  return true;
}
