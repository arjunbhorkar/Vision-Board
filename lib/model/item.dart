import 'package:flutter/cupertino.dart';

class Item {
  final String project;
  final List<String> team;
  final DateTime date;

  Item({@required this.project, @required this.date, @required this.team});
}
