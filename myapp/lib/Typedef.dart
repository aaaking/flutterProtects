class SortedCollection {
    Function compare;
    SortedCollection(int f(Object a, Object b)) {
        compare = f;
    }
}

// Initial, broken implementation.
int sort(Object a, Object b) => 0;

main() {
    SortedCollection coll = new SortedCollection(sort);
    // All we know is that compare is a function,
    // but what type of function?
    assert(coll.compare is Function);
    SortedCollectionTypedef collTypedef = new SortedCollectionTypedef(sort);
    assert(collTypedef.compare is Function);
    assert(collTypedef.compare is Compare);
}


typedef int Compare(Object a, Object b);
class SortedCollectionTypedef {
    Compare compare;
    SortedCollectionTypedef(this.compare);
}

//New function type syntax: Dart 1.24 introduced a new form of function types,
// the generic function type alias. You might use this feature if you pass around generic methods,
// define fields that are function types, or define arguments with generic function types.
// Here’s an example of using the new syntax:
typedef F = List<T> Function <T>(T);
