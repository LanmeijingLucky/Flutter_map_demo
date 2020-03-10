import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:latlong/latlong.dart';
import '../constant/constant.dart';

class FormTestRoute extends StatefulWidget {
  @override
  _FormTestRouteState createState() => new _FormTestRouteState();
}
class _FormTestRouteState extends State<FormTestRoute> {
  TextEditingController _centerController = new TextEditingController();
  TextEditingController _swController = new TextEditingController();
  TextEditingController _neController = new TextEditingController();
  TextEditingController _urlController = new TextEditingController();

  GlobalKey _formKey= new GlobalKey<FormState>();
  bool _switchSelected=true; //维护单选开关状态
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text("用户数据"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: Column(
            children: <Widget>[
              TextFormField(
                //autofocus: true,
                controller: _centerController,
                decoration: InputDecoration(
                  labelText: "地图中心点",
                  hintText: "管理区域的中心点",
                  icon: Icon(Icons.gps_fixed)
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      controller: _swController,
                      decoration: InputDecoration(
                        labelText: "区域西南角",
                        hintText: "管理区域的西南角",
                        icon: Icon(Icons.crop_free)
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40.0),
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            controller: _neController,
                            decoration: InputDecoration(
                              labelText: "区域东北角",
                              hintText: "管理区域的东北角",
                            ),
                          ),
                        ]
                      ),
                    ),
                  ],
                ),
              ),
              TextFormField(
                controller: _urlController,
                decoration: InputDecoration(
                  //border: true,
                  labelText: "文件路径",
                  hintText: "您管理的区域文件路径",
                  icon: Icon(Icons.attach_file)
                ),
              ),
              // 登录按钮
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                //padding: const EdgeInsets.fromLTRB(80.0,.0,80.0,20.0),
                child: Row(
                //child: Column(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(15.0),
                        child: Text("确认"),
                        color: Theme
                        .of(context)
                        .primaryColor,
                        textColor: Colors.white,
                        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                        onPressed: () async {
                          print('用户数据确认');
                          print(_centerController.text);
                          print( _swController.text);
                          print( _neController.text);
                          print( _urlController.text);
                          MapConfig.setOption(_centerController.text, _swController.text,  _neController.text,  _urlController.text);
                          var config = await MapConfig.getOption();
                          var c = config['center'];
                          print('---$config----$c');
                          if((_formKey.currentState as FormState).validate()){
                            //验证通过提交数据
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



