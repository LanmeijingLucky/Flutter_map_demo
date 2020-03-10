import 'package:flutter/material.dart';


class MyTest extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyTest> {
  @override
  Widget build(BuildContext context) {
    _displaySnackBar(BuildContext context, data) {
      Scaffold.of(context).removeCurrentSnackBar();
      var text = data;
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(text),
          duration: Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
      ));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('SnackBar Demo'),
      ),
      body: Builder(
        builder: (BuildContext context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text('btn1'),
                  onPressed: () {
                    _displaySnackBar(context, 'btn1');
                  },
                ),
                RaisedButton(
                  child: Text('btn2'),
                  onPressed: () {
                    _displaySnackBar(context, 'btn2');
                  },
                ),
                RaisedButton(
                  child: Text('btn3'),
                  onPressed: () {
                    _displaySnackBar(context, 'btn3');
                  },
                ),
              ]
            )
          );
        }
      )
    );
  }
}
