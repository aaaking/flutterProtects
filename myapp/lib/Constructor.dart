import 'dart:math';

void main() {
  var emp = new Employee.fromJson({});
  // Prints:
  // in Person
  // in Employee
  if (emp is Person) {
    // Type check
    emp.firstName = 'Bob';
  }
  (emp as Person).firstName = 'Bob';
}

class Point {
    final num x;
    final num y;
    final num distanceFromOrigin;
    Point(x, y)
            : x = x,
              y = y,
              distanceFromOrigin = sqrt(x * x + y * y);
    // Delegates to the main constructor.
    Point.alongXAxis(num x) : this(x, 0);
    // Initializer list sets instance variables before
    // the constructor body runs.
    Point.fromJson(Map jsonMap)
            : x = jsonMap['x'],
              y = jsonMap['y'],
              distanceFromOrigin = sqrt(jsonMap['x'] * jsonMap['x'] + jsonMap['y'] * jsonMap['y']) {
      print('In Point.fromJson(): ($x, $y)');
    }
}
//If your class produces objects that never change, you can make these objects compile-time constants.
// To do this, define a const constructor and make sure that all instance variables are final.
class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x, this.y);
  static final ImmutablePoint origin =
  const ImmutablePoint(0, 0);
}

class Person {
    var firstName;
    Person.fromJson(Map data) {
        print('in data');
    }
}

class Employee extends Person {
    // Person does not have a default constructor;
    // you must call super.fromJson(data).
    Employee.fromJson(Map data) : super.fromJson(data) {
        print('in Employee');
    }
}

/*Use the factory keyword when implementing a constructor that doesn’t always create a new instance of its class.
 For example, a factory constructor might return an instance from a cache, or it might return an instance of a subtype.*/
//Note: Factory constructors have no access to this.
class Logger {
  final String name;
  bool mute = false;
  // _cache is library-private, thanks to the _ in front
  // of its name.
  static final Map<String, Logger> _cache =
  <String, Logger>{};
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
      return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }
  Logger._internal(this.name);
  void log(String msg) {
    if (!mute) {
      print(msg);
    }
  }
}