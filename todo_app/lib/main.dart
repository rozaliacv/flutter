import 'package:flutter/material.dart';
import 'package:todo_app/home_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {

  await Hive.initFlutter();

var box = await Hive.openBox('mybox');
  runApp(
   const MaterialApp(
      home: HomePage(),
    ),
  );
}
