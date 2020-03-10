import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
//import './alarmdetailPage.dart';

class DataTablePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<DataTablePage> {
  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    alarm.initData(20);
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBodyWidget(),
    );
  }

  Widget _getBodyWidget() {
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: 150, //行固定内容宽度
        rightHandSideColumnWidth: 560,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow, //每行固定位置内容
        rightSideItemBuilder: _generateRightHandSideColumnRow, //滑动显示内容
        itemCount: alarm.alarmInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFFFFFFFF),
        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
      ),
      height: MediaQuery
      .of(context)
      .size
      .height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget_(true, 40),
      _getTitleItemWidget('System', 60),
      FlatButton(
        padding: EdgeInsets.all(0),
        child: _getTitleItemWidget('Status' +
          (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''), 100),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          alarm.sortStatus(isAscending);
          setState(() {

          });
        },
      ),
      _getTitleItemWidget('Time', 100),
      _getTitleItemWidget('Info', 100),
    ];
  }
  // 表头，字符
  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      //padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.center,
    );
  }
  // 表头复选框
  Widget _getTitleItemWidget_(bool label, double width) {
    print(label);

    return  Row(
      children: <Widget>[
        Container(
          child: Checkbox(
            value: alarm.alarmInfo[0].state,
            activeColor: Colors.blue, //选中时的颜色
            onChanged:(value){
              print('---top-----checkbox------$value');
              setState(() {
                  alarm.alarmInfo[0].state=value;
              });
            } ,
          ),
          width: width,
          height: 56,
          alignment: Alignment.centerLeft,
        ),
        _getTitleItemWidget('Name', 80),
      ],
    );
  }


  // 固定不动的列表内容
  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return  Row(
      //padding: EdgeInsets.only(left: 20.0),
      children: <Widget>[
        Container(
          child:  Checkbox(
            value: alarm.alarmInfo[index].state,
            activeColor: Colors.blue, //选中时的颜色
            onChanged:(value){
              print('--------checkbox------$value');
              setState(() {
                  alarm.alarmInfo[index].state=value;
              });
            },
          ),
          width: 40,
          height: 52,
          alignment: Alignment.centerRight,
        ),
        Container(
          child: FlatButton(
            child: Text(alarm.alarmInfo[index].name),
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            onPressed: () {
              print('---${alarm.alarmInfo[index].name}');
              //Navigator.of(context).pushNamed("alarmdetail_page", arguments: data);
              // Navigator.push( context,
              //   MaterialPageRoute(builder: (context) {
              //       return AlarmDetailPage(name: alarm.alarmInfo[index].name);
              // }));
            },
          ),
        ),
      ],
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: FlatButton(
            child: Text(alarm.alarmInfo[index].system),
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            onPressed: () {
              //print('$alarm');
              print('-----${alarm.alarmInfo[index]}');
              // Navigator.push( context,
              //   MaterialPageRoute(builder: (context) {
              //       return AlarmDetailPage( name: alarm.alarmInfo[index].name);
              // }));
            },
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: Row(
            children: <Widget>[
              FlatButton(
                child: Text(alarm.alarmInfo[index].status ? 'Occured' : 'Accepted'),
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                onPressed: () {
                  
                  // Navigator.push( context,
                  //   MaterialPageRoute(builder: (context) {
                  //       return AlarmDetailPage(name: alarm.alarmInfo[index].name);
                  // }));
                },
              ),
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child:  FlatButton(
            child: Text(alarm.alarmInfo[index].registerDate),
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            onPressed: () {
              // Navigator.push( context,
              //   MaterialPageRoute(builder: (context) {
              //       return AlarmDetailPage(name: alarm.alarmInfo[index].name);
              // }));
            },
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child:  FlatButton(
            child: Text(alarm.alarmInfo[index].terminationDate),
            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
            onPressed: () {
              // Navigator.push( context,
              //   MaterialPageRoute(builder: (context) {
              //       return AlarmDetailPage(name: alarm.alarmInfo[index].name);
              // }));
            },
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

Alarm alarm = Alarm();

class Alarm {
  List<AlarmInfo> _alarmInfo = List<AlarmInfo>();

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      _alarmInfo.add(AlarmInfo(
          false, "Alarm_$i", i % 3 == 0, 'System_1', '12:25:51', '报警_$i'));
    }
    //print('$_alarmInfo');
  }
  List<AlarmInfo> get alarmInfo => _alarmInfo;

  set alarmInfo(List<AlarmInfo> value) {
    _alarmInfo = value;
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    _alarmInfo.sort((a, b) {
        int aId = int.tryParse(a.name.replaceFirst('Alarm_', ''));
        int bId = int.tryParse(b.name.replaceFirst('Alarm_', ''));
        return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    _alarmInfo.sort((a, b) {
        if (a.status == b.status) {
          int aId = int.tryParse(a.name.replaceFirst('Alarm_', ''));
          int bId = int.tryParse(b.name.replaceFirst('Alarm_', ''));
          return (aId - bId);
        } else if (a.status) {
          return isAscending ? 1 : -1;
        } else {
          return isAscending ? -1 : 1;
        }
    });
  }
}

class AlarmInfo {
  bool state;
  String name;
  bool status;
  String system;
  String registerDate;
  String terminationDate;

  AlarmInfo(this.state, this.name, this.status, this.system, this.registerDate,
    this.terminationDate);
}



/*********************************************************************************************/
// old
 
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   child: AppBar(
      //     backgroundColor: Colors.red,
      //   ),
      //   preferredSize: Size.fromHeight(0),
      // ),
      //backgroundColor: Colors.transparent,
      appBar: AppBar(
        title: const Text('Next page'),
        backgroundColor: Colors.transparent,
        elevation: 50,
        //toolbarOpacity: 0.5,
      ),
      body: NestedScrollView(
        headerSliverBuilder: (_, innerBoxIsScrolled) {
          return [
            SliverToBoxAdapter(//其他内容用SliverToBoxAdapter包裹
              child: Container(
                //height: 550,
                color: Colors.greenAccent,
                alignment: Alignment.center,
                child: Image(
                  image: AssetImage("images/baby.JPG"),
                  //width: 200.0,
                  fit: BoxFit.cover,
                ),
                // child: Text(
                //   "头部",
                //   style: TextStyle(
                //     fontSize: 50,
                //     color: Colors.white,
                //   ),
                // ),
              ),
            ),
            SliverPersistentHeader(//悬浮区
              pinned: true,
              delegate: _SliverAppBarDelegate(
                minHeight: 70,
                maxHeight: 170,
                child: Container(
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Tab1");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Tab1"),
                            color: Colors.red,
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 70,
                        color: Colors.white,
                      ),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            print("Tab2");
                          },
                          child: Container(
                            alignment: Alignment.center,
                            child: Text("Tab2"),
                            color: Colors.lightBlue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ];
        },
        body: Padding(
          padding: const EdgeInsets.fromLTRB(1.0,.0,10.0,10.0),
          child: new DataTablePage(),
        )
      ),
    );
  }
}
 
class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
  });
 
  final double minHeight;
  final double maxHeight;
  final Widget child;
 
  @override
  double get minExtent => minHeight;
 
  @override
  double get maxExtent => maxHeight;
 
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }
 
  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
