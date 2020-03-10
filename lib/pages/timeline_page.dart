import 'package:flutter/material.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class TimelinePage extends StatefulWidget {
  //TimelinePage({Key key, this.title, this.datas}) : super(key: key);
  //final String title;

  @override
  _TimelinePageState createState() => _TimelinePageState();
}

class _TimelinePageState extends State<TimelinePage> {
  var mydatas = [];
  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context).settings.arguments;
    var title = args['name'];
    mydatas = args['life'];

    print('---args--${title}');
    print('---args--${args["life"]}');
    print('---args-mydatas-${mydatas}');

    List<Widget> pages = [
      timelineModel()
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: () {}),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0,10.0,10.0,10.0),
        child:PageView(
          children: pages,
        )
      )
    );
  }
  timelineModel() => Timeline.builder(
    itemBuilder: centerTimelineBuilder,
    itemCount: mydatas.length,
    position: TimelinePosition.Left);


  TimelineModel centerTimelineBuilder(BuildContext context, int i) {
    //final doodle = doodles[i];
    final doodle = mydatas[i];
    print('doodle---$doodle');
    var icon = TimeLineIcon.setIcon(doodle['status']);
    final textTheme = Theme.of(context).textTheme;
    return TimelineModel(
      Card(
        margin: EdgeInsets.symmetric(vertical: 16.0),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Image.network(doodle.doodle),
              const SizedBox(
                height: 8.0,
              ),
              Text('${doodle["time"]} - 处理人：${doodle["people"]}', style: textTheme.caption),
              const SizedBox(
                height: 8.0,
              ),
              Text(
                doodle['event'],
                style: textTheme.title,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 8.0,
              ),
            ],
          ),
        ),
      ),
      iconBackground: icon['iconBackground'],
      icon: icon['icon']
    );
  }
}
class TimeLineIcon {
  static setIcon(status) {
    if (status == 'installed') {
      return {
        "icon": Icon(
          Icons.visibility,
          color: Colors.white),
        "iconBackground": Colors.cyan
      };
    }
    else if (status == 'repaired') {
      return {
        "icon": Icon(
          Icons.visibility,
          color: Colors.white),
        "iconBackground": Colors.cyan
      };
    }
    else if (status == 'destroyed'){
      return {
        "icon": Icon(
          Icons.report_problem,
          color: Colors.white,
        ),
        "iconBackground":  Colors.redAccent,
      };
    }
    else if (status == 'disabled'){
      return {
        "icon": Icon(
          Icons.close,
          color: Colors.white,
        ),
        "iconBackground": Colors.orange,
      };
    }
    else if (status == 'repairing') {
      return {
        "icon": Icon(
          Icons.build,
          color: Colors.black87,
          size: 32.0,
        ),
        "iconBackground": Colors.yellow,
      };
    }
    return {
      "icon": Icon(
        Icons.exposure,
        color: Colors.white,
      ),
      "iconBackground": Colors.redAccent,
    };
  }
}
