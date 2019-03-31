import 'package:flutter/material.dart';

class News {
  final String title;
  final DateTime datetime;
  final String image;
  final String detail;

  News(
{
    @required this.title,
    @required this.datetime,
    @required this.image,
    @required this.detail
}
  );
  
}
