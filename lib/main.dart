import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_cupertino_date_picker/flutter_cupertino_date_picker.dart';
import 'package:intl/intl.dart';
import './model/item.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final List<Item> lis = [
    Item(project: "project1", date: DateTime.utc(1989, 11, 9), team: ["arjun","nurja"])
  ];

  final BorderRadiusGeometry border = BorderRadius.only(
      topLeft: Radius.circular(100.0), topRight: Radius.circular(25.0));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF212121),
          title: Text("Project Manager"),
        ),
        body: SlidingUpPanel(
          minHeight: 20,
          maxHeight: 200,
          backdropEnabled: true,
          borderRadius: border,
          panel: Container(  
            color: Color(0xFF212121),
            height: 70,
            width: 700,
            child: DatePickerWidget(
                    
                  )
          ),
          collapsed: Container(  
            color: Color(0xFF212121),
            height: 70,
            width: 500,
            child: Container(
              alignment: Alignment(0.0, -1.0),
              child: Text("slide up",
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                  )),
            ),
          ),
          body: Container(
            color: Color(0xFF000000),
            child: Column(
              children: lis.map(makeCard).toList(),
            ),
          ),
        ),
      ),
    );
  }

  Container makeCard(Item item) => Container(
        height: 100,
        padding: new EdgeInsets.symmetric(horizontal: 10),
        margin: new EdgeInsets.symmetric(vertical: 1.0),
        child: Card(
          elevation: 8.0,
          margin: new EdgeInsets.symmetric(vertical: 6.0),
          color: Color(0xFF212121),
          child: Row(            
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(DateFormat('dd-MM').format(item.date))
                ],
              ),
              Column(
              children: item.team.map((str) => Text(str)).toList(),
            )
          ],),
        ),
      );
}
