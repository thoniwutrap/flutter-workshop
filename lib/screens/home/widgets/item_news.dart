import 'package:flutter/material.dart';
import 'package:workshop1/models/news.dart';
import 'package:workshop1/models/news_response.dart';

class NewsItem extends StatefulWidget {
  final Articles news;
  const NewsItem(this.news);
  _NewsItemState createState() => _NewsItemState();
}

class _NewsItemState extends State<NewsItem> {
  
 @override
  Widget build(BuildContext context) {
    return _buildTiles(widget.news);
  }

  Widget _buildTiles(Articles item) {
    return Card(
      margin: EdgeInsets.all(5),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15)
      ),
         elevation: 3,
          child: Container(
          child: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 200,
              child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(10),topRight: Radius.circular(10)
                  ),
                  child: Image(
                    image: NetworkImage(item.urlToImage),
                    fit: BoxFit.cover,
                  )),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 10,left: 10),
                  child: Text(
                    item.title,
                    textAlign: TextAlign.start,
                    style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(child: Text(item.publishedAt.toString())),
                      IconButton(
                        icon: Icon(Icons.subject),
                      )
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    );
  }

}