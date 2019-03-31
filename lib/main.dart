import 'package:flutter/material.dart';
import 'package:workshop1/models/news.dart';
import 'package:workshop1/models/sample.dart';
import 'package:workshop1/screens/home/home.dart';
import 'package:workshop1/screens/home/widgets/item_news.dart';
import './screens/detail/detail.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
 return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScopedModel<ArticlesModel>(
        model: ArticlesModel(),
        child:Home(),),
    );
  }
}
