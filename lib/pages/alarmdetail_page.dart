import 'package:flutter/material.dart';
import './one_page.dart';
import './tag_button.dart';
import '../constant/constant.dart';
import '../constant/text_size_constant.dart';
import '../constant/color_constant.dart';

class  AlarmDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    dynamic args = ModalRoute.of(context).settings.arguments;
    var name = args['name'];
    var description = args['description'];
    var time_stamp = args['timeStamp'];

    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,.0,10.0,10.0),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 36.0,),
            Text(
              '''$time_stamp
$description''',
              style: TextStyle(
                color: ColorConstant.colorDefaultTitle,
                fontWeight: FontWeight.w600,
                fontSize: TextSizeConstant.TextDefaultSize,
              )
            ),
            SizedBox(height: 36.0,),
            ChewieDemo(),
            SizedBox(height: 36.0,),
            _showPhoto(),
            SizedBox(height: 36.0,),
            Container(
              width: 50.0,
              padding: const EdgeInsets.only(left: 24.0, right: 24.0),
              child: TagButton(getTag: getTag),
            ),
            SizedBox(height: 36.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                _button("确认", Icons.donut_large, Colors.blue, () => print('queren')),
                _button("复位", Icons.done_all, Colors.red, () => print('fuwei')),
                _button("审核", Icons.group, Colors.orange, () => print('shenhe')),
              ],
            ),
            SizedBox(height: 66.0,),
          ]
        )
      )
    );
  }

  Widget _showPhoto() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Text('图片复核',
          style: TextStyle(
            color: ColorConstant.colorDefaultTitle,
            fontWeight: FontWeight.w600,
            fontSize: TextSizeConstant.TextImageSize,
          )
        ),
        Image(
          image: AssetImage("images/baby.JPG"),
          fit: BoxFit.cover,
        ),
        SizedBox(height: 36.0,),
        FloatingActionButton.extended(
          elevation: 0.0,
          highlightElevation: 2.0,
          onPressed: () {
            print('button click add photo');
          },
          //foregroundColor: Colors.white,
          backgroundColor: Colors.blue,
          icon: new Icon(Icons.add_a_photo,color: Colors.white,),
          label: new Text('添加照片', maxLines: 1),
        ),
      ]
    );
  }

  Widget _button(String label, IconData icon, Color color, final callback){
    return Column(
      children: <Widget>[
        FloatingActionButton(
          heroTag: label,
          onPressed: callback,
          backgroundColor: color,
          elevation: 0.0,
          highlightElevation: 2.0,
          child: Icon(
            icon,
            color: Colors.white),
        ),
        SizedBox(height: 12.0,),
        Text(label),
      ],
    );
  }

  void getTag (value) {
    print('<---getTag-->$value');
  }
}


// Row(
//   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//   children: <Widget>[
//     FlatButton(
//       color: Colors.blue,
//       highlightColor: Colors.blue[700],
//       colorBrightness: Brightness.dark,
//       splashColor: Colors.grey,
//       child: Text("CAM_01_1"),
//       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//       onPressed: () {
//       },
//     ),
//     FlatButton(
//       color: Colors.blue,
//       highlightColor: Colors.blue[700],
//       colorBrightness: Brightness.dark,
//       splashColor: Colors.grey,
//       child: Text("CAM_01_2"),
//       shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
//       onPressed: () {},
//     ),
//   ]
// ),
