import 'package:flutter/material.dart';

class TagButton extends StatefulWidget {
  TagButton({Key key, this.getTag,}): super(key: key);
  final getTag;

  @override
  _TagButton createState() => _TagButton();
}

class _TagButton extends State<TagButton>{
  //返回城市列表，写法二
  List<DropdownMenuItem<String>> _getCityList() {
    var list = ["北京", "上海", "广州", "深圳"];
    return list.map((item) => DropdownMenuItem(
        value: item,
        child: Text(item),
    )).toList();
  }
  String selectValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      // The width with full width
      //isExpanded: true,
      //要显示的条目
      items: _getCityList(),
      underline: Container(height: 0),
      //默认显示的值
      hint: Text("请选择城市"),
      //下拉菜单选中的值（注意：在初始化时，要么为null，这时显示默认hint的值；
      // 如果自己设定值，则值必须为列表中的一个值，如果不在列表中，会抛出异常）
      value: selectValue,
      onChanged: (itemValue) {//itemValue为选中的值
        //print("itemValue=$itemValue");
        _onChanged(itemValue);
      },
    );
  }
  _onChanged(String value) {
    //更新对象的状态
    setState(() {
        selectValue = value;
    });
    widget.getTag(value);
  }
}
