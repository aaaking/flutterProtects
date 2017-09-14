/*
* Metadata
Use metadata to give additional information about your code. A metadata annotation begins with the character @,
followed by either a reference to a compile-time constant (such as deprecated) or a call to a constant constructor.
Three annotations are available to all Dart code: @deprecated, @override, and @proxy. For examples of using @override and @proxy,
see Extending a class. Here’s an example of using the @deprecated annotation:
* */
class Television {
    /// _Deprecated: Use [turnOn] instead._
    @deprecated
    void activate() {
        turnOn();
    }
    /// Turns the TV's power on.
    void turnOn() {
        print('on!');
    }

    @todo('seth', 'make this do something')
    void doSomething() {
        print('do something');
    }
}

//You can define your own metadata annotations. Here’s an example of defining a @todo annotation that takes two arguments:
//library todo;
class todo {
    final String who;
    final String what;
    const todo(this.who, this.what);
}
/*Metadata can appear before a library, class, typedef, type parameter, constructor, factory,
function, field, parameter, or variable declaration and before an import or export directive.
You can retrieve metadata at runtime using reflection.
*/