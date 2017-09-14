import 'dart:convert';
import 'dart:math';
var topLevel = true;
void main() {
// You can change the value of a non-final, non-const variable,
// even if it used to have a const value.
// You can't change the value of a final or const variable.
// bar = []; // Unhandled exception.
// baz = []; // Unhandled exception.
  var clapping = '\u{1f44f}';
  print(clapping);
  print(clapping.codeUnits);
  print(clapping.runes.toList());

  Runes input = new Runes(
          '\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}  \u{1f600}');
  print(new String.fromCharCodes(input));
  print('\u2665  \u{1f605}  \u{1f60e}  \u{1f47b}  \u{1f596}  \u{1f44d}  \u{1f600}');

  printElement(element) {
    print(element);
  }
  var list = [1, 2, 3];
// Pass printElement as a parameter.
  list.forEach(printElement);
  var loudify = (msg) => '!!! ${msg.toUpperCase()} !!!';
  print(loudify);
  var list2 = ['apples', 'oranges', 'grapes', 'bananas', 'plums', 'plums'];
  list2.forEach((i) {
    print(list2.indexOf(i).toString() + ': ' + i);
  });
  //////
  var p = new Point(0, 3);
// Set the value of the instance variable y.
// Get the value of y.
  print('${p.y}');
// Invoke distanceTo() on p.
  print('${p.distanceTo(new Point(4, 0))}');
  var a = new Point(2, 2);
  var b = new Point(2, 2);
  print('${identical(a, b)}');
}

printNum(num aNumber) {
  print("$aNumber");
  return aNumber;
}

printNumDefault([num aNumber = 1111]) {
  print("$aNumber");
  return aNumber;
}

enableFlags({bool bold, bool hidden}) {
  print("$bold $hidden");
}

class TestBean {
  int id;
  TestBean({this.id});
//  @override int hashCode() {
//    return this.id;
//  }
}