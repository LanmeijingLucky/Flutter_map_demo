import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'dart:async';
import 'package:latlong/latlong.dart';
import './one_page.dart';
import '../constant/constant.dart';

class HomeMap extends StatefulWidget {
  HomeMap({Key key, this.panel_open, this.panel_close}): super(key: key);
  final panel_open;
  final panel_close;

  @override
  _HomeMap createState() => _HomeMap();
}

class _HomeMap extends State<HomeMap> {

  MapController mapController;
  var _futureBuilderFuture;
  @override
  void initState() {
    super.initState();
    mapController = MapController();
    _futureBuilderFuture = MapConfig.getOption();
    //_startTimer();
    //getMapConfig();
  }

  var circleMarkers = <CircleMarker>[
    CircleMarker(
      point: LatLng(25.096882, 102.929096),
      color: Colors.red.withOpacity(0.7),
      borderStrokeWidth: 2,
      useRadiusInMeter: true,
      radius: 50 // 2000 meters | 2 km
    ),
  ];

  var center;
  var swPanBoundary;
  var nePanBoundary;
  var urlTemplate;
  var subdomains;

  getMapConfig () async{
    var config = await MapConfig.getOption();
    return config;
  }
  List datas = [
    { 'name': 'Point1', 'latlng': LatLng(51.503, -0.091), 'timeStamp':'2020-02-09 23:44:12',
      'status': 'OCCURRED', 'description': '点1位置围界400米报警发生'},
    { 'name': 'Point2', 'latlng': LatLng(51.501, -0.092), 'timeStamp': '2020-02-09 22:44:12',
      'status': 'OCCURRED', 'description': '点2位置'},
    { 'name': 'Point3', 'latlng': LatLng(51.502, -0.093), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'ACCEPTED', 'description': '点3位置'},
    { 'name': 'Point4', 'latlng': LatLng(51.503, -0.096), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'OCCURRED', 'description': '点1位置围界400米报警发生'},
    { 'name': 'Point5', 'latlng': LatLng(51.501, -0.097), 'timeStamp': '2020-02-09 22:44:12',
      'status': 'OCCURRED', 'description': '点2位置'},
    { 'name': 'Point6', 'latlng': LatLng(51.502, -0.095), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'ACCEPTED', 'description': '点3位置'},

    { 'name': 'Point7', 'latlng': LatLng(51.5035, -0.091), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'OCCURRED', 'description': '点1位置围界400米报警发生'},
    { 'name': 'Point8', 'latlng': LatLng(51.5015, -0.092), 'timeStamp': '2020-02-09 22:44:12',
      'status': 'OCCURRED', 'description': '点2位置'},
    { 'name': 'Point9', 'latlng': LatLng(51.5025, -0.093), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'ACCEPTED', 'description': '点3位置'},
    { 'name': 'Point10', 'latlng': LatLng(51.5038, -0.091), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'OCCURRED', 'description': '点1位置围界400米报警发生'},
    { 'name': 'Point12', 'latlng': LatLng(51.5018, -0.092), 'timeStamp': '2020-02-09 22:44:12',
      'status': 'OCCURRED', 'description': '点2位置'},
    { 'name': 'Point13', 'latlng': LatLng(51.5028, -0.093), 'timeStamp': '2020-02-09 23:44:12',
      'status': 'ACCEPTED', 'description': '点3位置'},
  ];


  var currentData;
  @override
  Widget build(BuildContext context) {
    void handleTest() {
      print('image onTap');
    }

    var _setIcon = (status) {
      if( status == 'OCCURRED' ) {
        return AssetImage('images/point1.png');
      }
      return AssetImage('images/point2.png');
    };
    _displaySnackBar(BuildContext context, data) {
      Scaffold.of(context).removeCurrentSnackBar();
      var text = '${data["timeStamp"]} ${data["name"]} ${data["description"]}';
      Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(text),
          duration: Duration(seconds: 4),
          behavior: SnackBarBehavior.floating,
      ));
    }

    double width = 40.0;
    double height = 40.0;
    var markers = datas.map((data) {
        var latlng = data['latlng'];
        var status = data['status'];
        if(data['current'] != null) {
          width = 90.0;
          height = 90.0;
        }
        else {
          width = 40.0;
          height = 40.0;
        }
        print('draw marker ${data["name"]}');
        return Marker(
          width: width,
          height: height,
          point: latlng,
          builder: (ctx) => GestureDetector(
            child: Image(
              image: _setIcon(status),
            ),
            onTap: () {
              _displaySnackBar(ctx, data);
            },
            onLongPress:() {
              Navigator.of(context).pushNamed("alarmdetail_page", arguments: data);
            }
          ),
        );
    }).toList();

    return Stack(
      children: <Widget>[
        Scaffold(
          body: 
          FutureBuilder(
            //future: getMapConfig(),
            future: _futureBuilderFuture,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              /*表示数据成功返回*/
              if (snapshot.hasData) {
                var config = snapshot.data;
                print('--future--$config----');
                center = config['center'];
                swPanBoundary = config['swPanBoundary'];
                nePanBoundary = config['nePanBoundary'];
                urlTemplate = 'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
                subdomains = ['a', 'b', 'c'];
                //urlTemplate = config['urlTemplate'];
                return FlutterMap(
                  mapController: mapController,
                  options: MapOptions(
                    center: center,
                    zoom: 15.0,
                    minZoom: 10.0,
                    maxZoom: 18.0,
                    swPanBoundary: swPanBoundary,
                    nePanBoundary: nePanBoundary,
                    onTap:(LatLng latlng) {
                      print(' map on Tap');
                      //widget.panel_close();
                    },
                  ),
                  layers: [
                    TileLayerOptions(
                      urlTemplate: urlTemplate,
                      subdomains: subdomains,
                    ),
                    //CircleLayerOptions(circles: circleMarkers),
                    MarkerLayerOptions(markers: markers),
                  ],
                );
              } else {
                //return LoadingWidget();
                return Center(
                  child: Text('something going wrong - add map config'),
                );
              }
            },
          ),
        ),

        _myAppBar(),
        Positioned(
          top: ScreenUtil.screenH(context) * 0.125,
          right: ScreenUtil.screenW(context) * 0.02,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              _button('btn1', 'Fit map', Icons.gps_fixed, _fitBounds),
              _button('btn2', 'Refresh', Icons.autorenew, _setCenter),
              _button('btn3', 'Alarm List', Icons.format_list_bulleted,
                () => Navigator.pushNamed(context, "two_page")),
              _button('btn4', 'Alarm List', Icons.format_list_bulleted,
                () => Navigator.pushNamed(context, "devicelist_page")),
            ]
          )
        ),
      ]
    );
  }

  Widget _button(String tag, String tooltip, IconData icon, final callback) {
    return  FloatingActionButton(
      child: Icon(icon),
      backgroundColor: Colors.white,
      foregroundColor: Colors.blue,
      mini: true,
      heroTag: tag,
      tooltip: tooltip,
      onPressed: () => callback(),
    );
  }

  Widget _myAppBar() {
    return  Positioned(
      top: ScreenUtil.screenH(context) * 0.035,
      left: ScreenUtil.screenW(context) * 0.02,
      //top: 42.0,
      child: Container(
        width: ScreenUtil.screenW(context) * 0.96,
        height: ScreenUtil.screenH(context) * 0.07,
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          //mainAxisAlignment: MainAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              child: Icon(Icons.chevron_left),
              onTap: () => Navigator.of(context).pushNamed("home"),
            ),
            Text(" Map Demo ",
              style: new TextStyle(
                fontSize: 15.0,
                color: Colors.black,
                decoration: TextDecoration.none) ),
            GestureDetector(
              child: Icon(Icons.build, size: 20.0),
              onTap: () => Navigator.of(context).pushNamed("mapoption_page"),
            ),
          ],
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [BoxShadow(
              color: Color.fromRGBO(0, 0, 0, .25),
              blurRadius: 16.0
          )],
        ),
      ),
    );
  }
  
  // function
  _fitBounds() {
    var bounds = LatLngBounds();
    datas.map((data) {
        bounds.extend(data['latlng']);
    }).toList();

    mapController.fitBounds(
      bounds,
      options: FitBoundsOptions(
        padding: EdgeInsets.only(left: 15.0, right: 15.0),
      ),
    );
  }

  /// 启动倒计时的计时器。
  var _seconds = 1;
  Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
        setState(() {});
        if (_seconds <= 1) {
          _cancelTimer();
          return;
        }
        _seconds--;
    });
  }

  /// 取消倒计时的计时器。
  void _cancelTimer() {
    _fitBounds();
    _timer?.cancel();
  }

  void _setCenter() {
    print('set center');
    //mapController.move( LatLng(25.096882, 102.929096), 15.0);
    mapController.move( center, 15.0);
  }

}


