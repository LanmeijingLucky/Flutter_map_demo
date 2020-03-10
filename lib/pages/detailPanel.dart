import 'package:flutter/material.dart';


class DetailPanel extends StatelessWidget {

  DetailPanel({Key key, this.callback, this.data}):super(key: key);
  final callback;
  dynamic data;

  @override
  Widget build(BuildContext context) {
    print('tt${data}');
    return  ListView(
      controller: callback,
      children: <Widget>[
        SizedBox(height: 12.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 30,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(12.0))
              ),
            ),
          ],
        ),
        SizedBox(height: 8.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              (data == null?  "当前报警总数： 55": "${data['name']} - ${data['description']}"),
              style: TextStyle(
                fontWeight: FontWeight.normal,
                fontSize: 22.0,
              ),
            ),
          ],
        ),

        SizedBox(height: 36.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            _button("确认", Icons.donut_large, Colors.blue),
            _button("复位", Icons.done_all, Colors.red),
            _button("审核", Icons.group, Colors.orange),
          ],
        ),

        SizedBox(height: 36.0,),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child:  DropdownButton(
            underline: Container(height: 0),
            items: [
              DropdownMenuItem(child: Text('北京')),
              DropdownMenuItem(child: Text('天津')),
              DropdownMenuItem(child: Text('河北')),
            ], onChanged: (value) {}),
        ),
        SizedBox(height: 36.0,),

        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image(image: AssetImage('images/landscape.png')),
              Text("Images", style: TextStyle(fontWeight: FontWeight.w600,)),
              SizedBox(height: 12.0,),
            ],
          ),
        ),
        Icon(
          Icons.audiotrack,
          color: Colors.green,
          size: 30.0,
        ),
        SizedBox(height: 36.0,),
        Container(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("About", style: TextStyle(fontWeight: FontWeight.w600,)),
              SizedBox(height: 12.0,),
              Text(
                "test",
                softWrap: true,
              ),
            ],
          ),
        ),

        SizedBox(height: 24,),
      ],
    );

  }
  Widget _button(String label, IconData icon, Color color){
    return Column(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.all(16.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
            boxShadow: [BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.15),
                blurRadius: 8.0,
            )]
          ),
        ),

        SizedBox(height: 12.0,),

        Text(label),
      ],

    );
  }

}
