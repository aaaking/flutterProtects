import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
    final ThemeData kIOSTheme = new ThemeData(
        primarySwatch: Colors.orange,
        primaryColor: Colors.grey[100],
        primaryColorBrightness: Brightness.light,
    );
    final ThemeData kDefaultTheme = new ThemeData(
        primarySwatch: Colors.purple,
        accentColor: Colors.orangeAccent[400],
    );
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
      return new MaterialApp(
          title: 'Flutter Demo',
          theme: defaultTargetPlatform == TargetPlatform.iOS
                  ? kIOSTheme
                  : kDefaultTheme,
//      home: new MyHomePage(title: 'Flutter Demo Home Page'),
          home: new ShoppingList(products: <Product>[
              new Product(name: "Eggs"),
              new Product(name: "Apples"),
              new Product(name: "Pineapples"),
          ], appTitle: "ShoppingApp"),
      );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.
  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  final List<ChatMessage> _message = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  int _counter = 0;
  bool _isComposing = false;
  //创建输入框UI
  Widget _buildTextComposer() {
    return new IconTheme(
        data: new IconThemeData(color: Theme.of(context).accentColor),
        child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(
              children: <Widget>[
                new Flexible(
                  child: new TextField(
                    controller: _textController,
                    onSubmitted: _handleSubmmited,
                    onChanged: (String text) {
                        setState(() {
                           _isComposing = text.length > 0;
                        });
                    },
                    decoration: new InputDecoration.collapsed(
                        hintText: "Send a message"),
                  ),
                ),
                new Container(
                    margin: new EdgeInsets.only(left: 40.0),
                    child: Theme.of(context).platform == TargetPlatform.iOS ?
                    new CupertinoButton(
                        child: new Text("Send"),
                        onPressed: _isComposing ? () =>
                                _handleSubmmited(_textController.text) : null,)
                            :
                    new IconButton(
                        icon: new Icon(Icons.send),
                        onPressed: _isComposing ? () =>
                                _handleSubmmited(_textController.text) : null,
                    ),
                ),
              ],
            )));
  }

  @override
  void dispose() {
      for (ChatMessage message in _message) {
          message.animationController.dispose();
      }
      super.dispose();
  }

  void _handleSubmmited(String text) {
    _textController.clear();
    setState(() {
       _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
        text: text,
        animationController: new AnimationController(
            duration: new Duration(milliseconds: 700),
            vsync: this,
        ),
    );
    setState(() {
      _message.insert(0, message);
    });
    message.animationController.forward();
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
          title: new Text(widget.title),
          //the elevation property defines the z-coordinates of the AppBar. A z-coordinate value of 0.0 has no shadow(iOS) and a value of 4.0 has a defined shadow(android)
          elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
//        child: new Column(
//          // Column is also layout widget. It takes a list of children and
//          // arranges them vertically. By default, it sizes itself to fit its
//          // children horizontally, and tries to be as tall as its parent.
//          //
//          // Invoke "debug paint" (press "p" in the console where you ran
//          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
//          // window in IntelliJ) to see the wireframe for each widget.
//          //
//          // Column has various properties to control how it sizes itself and
//          // how it positions its children. Here we use mainAxisAlignment to
//          // center the children vertically; the main axis here is the vertical
//          // axis because Columns are vertical (the cross axis would be
//          // horizontal).
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: <Widget>[
//            new Text(
//              'You have pushed the button this many times:',
//            ),
//            new Text(
//              '${_counter}',
//              style: Theme.of(context).textTheme.display1,
//            ),
//            new RaisedButton(
//              onPressed: () {
////                Scaffold.of(context).showSnackBar(
////                  new SnackBar(
////                    content: new Text("Added to favorite"),
////                    action: new SnackBarAction(
////                      label: "UNDO",
////                      onPressed: () => Scaffold.of(context).hideCurrentSnackBar(),
////                    ),
////                  ),
////                );
//              },
//              color: Colors.blue[400],
//              child: new Text('RaisedButton',
//                  style: new TextStyle(color: Colors.white)),
//            ),
//            new FlatButton(
//              onPressed: () {},
//              color: Colors.blue[400],
//              child: new Text('FlatButton',
//                  style: new TextStyle(color: Colors.white)),
//            ),
            child: new Container(
                child: new Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                        new Text(
                            'You have pushed the button this many times:',
                        ),
                        new Text(
                            '${_counter}',
                            style: Theme
                                    .of(context)
                                    .textTheme
                                    .display1,
                        ),
                        new RaisedButton(
                            onPressed: () {
                            },
                            color: Colors.blue[400],
                            child: new Text('RaisedButton',
                                    style: new TextStyle(color: Colors.white)),
                        ),
                        // Expanded expands its child to fill the available space.
//                        new Expanded(
//                            child: new Text(widget.title),
//                        ),
                        new MyButton(),
                        new FlatButton(
                            onPressed: () {},
                            color: Colors.blue[400],
                            child: new Text('FlatButton',
                                    style: new TextStyle(color: Colors.white)),
                        ),
                        new Flexible(
                                child: new ListView.builder(
                                    padding: new EdgeInsets.all(8.0), // in logical pixels
                                    reverse: true,
                                    itemBuilder: (_, int index) => _message[index],
                                    itemCount: _message.length,
                                )
                        ),
                        new Divider(
                            height: 1.0, // in logical pixels
                        ),
                        new Container(
                            decoration: new BoxDecoration(color: Theme.of(context).cardColor),
                            child: _buildTextComposer(),
                        ),
                    ],
                ),
                decoration: Theme
                        .of(context)
                        .platform == TargetPlatform.iOS ?
                new BoxDecoration(border: new Border(
                        top: new BorderSide(color: Colors.grey[200]))) : null,
            ),
//          ],
//        ),
      ),
//      floatingActionButton: new FloatingActionButton(
//          onPressed: _incrementCounter,
//          tooltip: 'Increment',
////        child: new Icon(Icons.add)
//          child: new Text(
//            "add",
//          )), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

const String _name = "Zhihui Zhou";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
      return new SizeTransition(
          sizeFactor: new CurvedAnimation(
                  parent: animationController,
                  curve: Curves.easeOut),
          axisAlignment: 0.0,
          child: new Container(
              margin: const EdgeInsets.symmetric(vertical: 10.0), // in logical pixels
              child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      new Container(
                          margin: const EdgeInsets.only(right: 16.0),
                          child: new CircleAvatar(
                              child: new Text(_name[0]),
//                              foregroundColor: Colors.red,
//                              backgroundColor: Colors.green,
                          ),
                      ),
                      new Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                              new Text(
                                  _name,
                                  style: Theme
                                          .of(context)
                                          .textTheme
                                          .subhead,
                              ),
                              new Container(
                                  margin: const EdgeInsets.only(top: 5.0),
                                  child: new Text(text),
                              )
                          ],
                      )
                  ],
              ),
          ),
      );
  }
}

class MyButton extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return new GestureDetector(
            onTap: () {
                print("myButton was tapped!");//You can use GestureDetector to detect a variety of input gestures, including taps, drags, and scales.
            },
            child: new Container(
                height: 36.0,
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                decoration: new BoxDecoration(
                    borderRadius: new BorderRadius.circular(5.0),
                    color: Colors.lightGreen[500],
                ),
                child: new Center(
                    child: new Text("Engage"),
                ),
            ),
        );
    }
}

class Product {
    final String name;
    const Product({this.name});
}

typedef void CartChangedCallback(Product product, bool inCart);

class ShoppingListItem extends StatelessWidget {
    final Product product;
    final bool inCart;
    final CartChangedCallback onCartChanged;
    ShoppingListItem({Product product, this.inCart, this.onCartChanged})
            : product = product,
                super(key: new ObjectKey(product));

    Color _getColor(BuildContext context) {
        // The theme depends on the BuildContext because different parts of the tree
        // can have different themes.  The BuildContext indicates where the build is
        // taking place and therefore which theme to use.
        return inCart ? Colors.black54 : Theme.of(context).primaryColor;
    }

    TextStyle _getTextStyle(BuildContext context) {
        if (!inCart) return null;
        return new TextStyle(
            color: Colors.black54,
            decoration: TextDecoration.lineThrough,
        );
    }

    @override
    Widget build(BuildContext context) {
        return new ListTile(
            onTap: () {
                onCartChanged(product, !inCart);
            },
            leading: new CircleAvatar(
                backgroundColor: _getColor(context),
                child: new Text(product.name[0]),
            ),
            title: new Text(product.name, style: _getTextStyle(context)),
        );
    }
}

class ShoppingList extends StatefulWidget {
    final String appTitle;
    ShoppingList({Key key, this.products, this.appTitle}) : super(key: key);
    final List<Product> products;
    // The framework calls createState the first time a widget appears at a given
    // location in the tree. If the parent rebuilds and uses the same type of
    // widget (with the same key), the framework will re-use the State object
    // instead of creating a new State object.
    @override
    _ShoppingListState createState() => new _ShoppingListState();

    /*To access properties of the current ShoppingList, the _ShoppingListState can use its widget property. If the parent rebuilds and creates
    a new  ShoppingList, the _ShoppingListState will also rebuild with the new widget value. If you wish to be notified when the widget property
    changes, you can override the didUpdateWidget function, which is passed oldWidget to let you compare the old widget with the current widget.*/
//    @override
//    void didUpdateWidget(covariant ShoppingList oldWidget) {
//        super.didUpdateWidget(oldWidget);
//    }
}

class _ShoppingListState extends State<ShoppingList> {
    Set<Product> _shoppingCart = new Set<Product>();
    void _handleCartChanged(Product product, bool inCart) {
        setState(() {
            // When user changes what is in the cart, we need to change _shoppingCart
            // inside a setState call to trigger a rebuild. The framework then calls
            // build, below, which updates the visual appearance of the app.
            if (inCart)
                _shoppingCart.add(product);
            else
                _shoppingCart.remove(product);
        });
    }

    @override
    Widget build(BuildContext context) {
        return new Scaffold(
            appBar: new AppBar(
                // Here we take the value from the MyHomePage object that was created by
                // the App.build method, and use it to set our appbar title.
                title: new Text(widget.appTitle),
                //the elevation property defines the z-coordinates of the AppBar. A z-coordinate value of 0.0 has no shadow(iOS) and a value of 4.0 has a defined shadow(android)
                elevation: Theme.of(context).platform == TargetPlatform.iOS ? 0.0 : 4.0,
            ),
            body: new ListView(
                padding: new EdgeInsets.symmetric(vertical: 8.0),
                children: widget.products.map((Product product) {
                    return new ShoppingListItem(
                        product: product,
                        inCart: _shoppingCart.contains(product),
                        onCartChanged: _handleCartChanged,
                    );
                }).toList(),
            ),
        );
    }
}
