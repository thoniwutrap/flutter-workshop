import 'package:flutter/material.dart';
import 'dart:io';
import 'package:scoped_model/scoped_model.dart';
import 'package:workshop1/models/news_response.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class  ArticlesModel extends Model{

static ArticlesModel of(BuildContext context) => ScopedModel.of<ArticlesModel>(context);

     bool _isLoading = true;
     bool get isLoading => _isLoading;
     
     List<Articles> news = new List<Articles>();
     List<Articles> get newsList => news;


  fetchNew() async {
    _isLoading = true;
    notifyListeners();
   final response = await http.get(
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=f5539947818f4ebfa02f6f828484fcfb",
        );
    var resJson = json.decode(response.body);
    NewsResponse newsResponse = NewsResponse.fromJson(resJson);
    news = newsResponse.articles;
    _isLoading = false;
    notifyListeners();
  }

}