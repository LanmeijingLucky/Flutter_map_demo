import 'package:flutter/material.dart';
import './data.dart';

class DevicesListPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    var _rows = datas.map((data) {
        var name = data['name'];
        var sn = data['sn'];
        var type = data['type'];
        return ListTile(
          title: Text(name,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 20,
          )),
          subtitle: Text('SN: ${sn}'),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () {
            Navigator.of(context).pushNamed("timeline_page", arguments: data);
          },
          leading: Text(type)
        );
    }).toList();

    Widget _buildList(context) => ListView(
      children: ListTile.divideTiles(
        context: context,
        tiles: _rows,
      ).toList(),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Device List'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
      ],      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: _buildList(context),
      )
    );
  }
}
