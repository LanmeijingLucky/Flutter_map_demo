import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import './homeMap.dart';
import './detailPanel.dart';

class SlidePanel extends StatefulWidget {
  @override
  _SlidePanelState createState() => _SlidePanelState();
}

class _SlidePanelState extends State<SlidePanel> {

  final double _initFabHeight = 120.0;
  double _fabHeight;
  double _panelHeightOpen;
  //double _panelHeightClosed = 95.0;
  double _panelHeightClosed = 75.0;

  @override
  void initState(){
    super.initState();
    _fabHeight = _initFabHeight;
  }
  PanelController panel = new PanelController();

  var panel_data;
  void _panel_open (value) {
    //panel.open();
    setState(() {
        panel_data = value;
    });
    print(panel_data);
  }

  /// screen height
  /// 当前屏幕 高
  static double screenH(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.height;
  }
  /// screen width
  /// 当前屏幕 宽
  static double screenW(BuildContext context) {
    MediaQueryData mediaQuery = MediaQuery.of(context);
    return mediaQuery.size.width;
  }

  @override
  Widget build(BuildContext context){
    _panelHeightOpen = MediaQuery.of(context).size.height * .80;

    return Material(
      child: Stack(
        alignment: Alignment.topCenter,
        children: <Widget>[
          SlidingUpPanel(
            controller: panel,
            maxHeight: _panelHeightOpen,
            minHeight: _panelHeightClosed,
            parallaxEnabled: true,
            parallaxOffset: .5,
            backdropTapClosesPanel: false,
            body: HomeMap(panel_open: (val) => _panel_open(val), panel_close: () => panel.close()),
            panelBuilder: (sc) => _panel(sc),
          ),
          //Text(panel_data),
          // Positioned(
          //   right: 20.0,
          //   //bottom: _fabHeight,
          //   top: 20.0,
          //   child: FloatingActionButton(
          //     child: Icon(
          //       Icons.gps_fixed,
          //       color: Theme.of(context).primaryColor,
          //     ),
          //     onPressed: (){
          //       panel.close();
          //     },
          //     backgroundColor: Colors.white,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _panel(ScrollController sc){
    return MediaQuery.removePadding(
      context: context,
      removeTop: true,
      child: DetailPanel(callback: sc, data: panel_data),
    );
  }

}

