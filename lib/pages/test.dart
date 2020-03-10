import 'package:flutter/material.dart';


class MyTest extends StatefulWidget {

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyTest> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      /*
      appBar: new AppBar(
      title: new Text(widget.title),
    ),
      */
      body: new Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FloatingActionButton(
                        heroTag: 'home1',
                        onPressed: () => Navigator.pushNamed(context, "mapoption_page"),
                        backgroundColor: Colors.teal,
                        child: new Icon(Icons.home),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 10.0),
                        child: Text('设置'),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new FloatingActionButton(
                          heroTag: 'home2',
                          onPressed: (){
                            Navigator.pushNamed(context, "map");
                          },
                          backgroundColor: Colors.blue,
                          child: new Icon(Icons.map),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(top: 10.0),
                          child: Text('地图'),
                        ),//Text('列表'),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new FloatingActionButton(
                        heroTag: 'home3',
                        onPressed: () => Navigator.pushNamed(context, "two_page"),
                        backgroundColor: Colors.red,
                        child: new Icon(Icons.list),
                      ),
                      Padding(
                        padding:  EdgeInsets.only(top: 10.0),
                        child: Text('列表'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
