import 'dart:async';
import 'dart:io' show HttpServer, InternetAddress;
import 'dart:math' show sqrt;
//import 'dart:math' as Math;
//To lazily load a library, you must first import it using deferred as.
import 'dart:collection' deferred as collectionLazyLib;
greetBob(Person person) => person.greet('bob');

class Point {
    num x;
    num y;
    Point(this.x, this.y);
    num distanceTo(Point other) {
        var dx = x - other.x;
        var dy = y - other.y;
        return sqrt(dx * dx + dy * dy);
    }
}

class Rectangle {
    num left;
    num top;
    num width;
    num height;
    Rectangle(this.left, this.top, this.width, this.height);
    // Define two calculated properties: right and bottom.
    num get right => left + width;
    set right(num value) => left = value - width;
    num get bottom => top + height;
    set bottom(num value) => top = value - height;
}

//If you override ==, you should also override Object’s hashCode getter.
// For an example of overriding == and hashCode, see Implementing map keys.
class Vector {
    final int x;
    final int y;
    const Vector(this.x, this.y);
    /// Overrides + (a + b).
    Vector operator +(Vector v) {
        return new Vector(x + v.x, y + v.y);
    }
    /// Overrides - (a - b).
    Vector operator -(Vector v) {
        return new Vector(x - v.x, y - v.y);
    }
}

// A person. The implicit interface contains greet().
class Person {
    // In the interface, but visible only in this library.
    final _name;
    // Not in the interface, since this is a constructor.
    Person(this._name);
    // In the interface.
    String greet(who) => 'Hello, $who. I am $_name.';
}
// An implementation of the Person interface.

class Imposter implements Person {
    // We have to define this, but we don't use it.
    final _name = "";
    String greet(who) => 'Hi $who. Do you know who I am?';
}
class Television {
    void turnOn() {
    }
}

class SmartTelevision extends Television {
    @override
    void turnOn() {
        super.turnOn();
    }

}

enum Color {
    red,
    green,
    blue
}

/*Adding features to a class: mixins
Mixins are a way of reusing a class’s code in multiple class hierarchies.
To use a mixin, use the with keyword followed by one or more mixin names. The following example shows two classes that use mixins:
To implement a mixin, create a class that extends Object, declares no constructors, and has no calls to super. For example:
*/
abstract class Musical {
    bool canPlayPiano = false;
    bool canCompose = false;
    bool canConduct = false;
    void entertainMe() {
        if (canPlayPiano) {
            print('Playing piano');
        } else if (canConduct) {
            print('Waving hands');
        } else {
            print('Humming to self');
        }
    }
}

abstract class ObjectCache<T> {
    T getByKey(String key);
    setByKey(String key, T value);
}

/*Importing only part of a library
If you want to use only part of a library, you can selectively import the library. For example:*/
/*
// Import only foo.
import 'package:lib1/lib1.dart' show foo;
// Import all names EXCEPT foo.
import 'package:lib2/lib2.dart' hide foo;
* */

greet() async {
    await collectionLazyLib.loadLibrary();
    var server = await HttpServer.bind(InternetAddress.LOOPBACK_IP_V4, 4044);
    collectionLazyLib.DoubleLinkedQueue;
}

//Adding the async keyword to a function makes it return a Future. For example, consider this synchronous function, which returns a String:
String lookUpVersionSync() => '1.0.0';
Future<String> lookUpVersion() async => '1.0.0';

main() async {
    print(greetBob(new Person('kathy')));
    print(greetBob(new Imposter()));
    assert(Color.red.index == 0);
    List<Color> colors = Color.values;
    assert(colors[2] == Color.blue);
    //
    var names = new List<String>();
    print(names is List<num>);
    names.addAll(['Seth', 'Kathy', 'Kathy']);
    var nameSet = new Set<String>.from(names);
    names.forEach((str) => print(str));
    nameSet.forEach((str) => print(str));
    print('In main: version is ${await lookUpVersion()}');
    return "main return value";
}
