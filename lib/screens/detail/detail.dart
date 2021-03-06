import 'package:flutter/material.dart';
import 'package:workshop1/models/news.dart';
import 'package:workshop1/models/news_response.dart';

class DetailScreen extends StatefulWidget {
  Articles news;
  final Widget child;

  DetailScreen({Key key, this.child,@required this.news}) : super(key: key);

  DetailScreenState createState() => DetailScreenState();
}

class DetailScreenState extends State<DetailScreen> {
   ScrollController _scrollController = ScrollController();
  double appBarExpandedHeight;


  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() => setState(() {}));
  }

  bool get _isExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (appBarExpandedHeight - kToolbarHeight);
  }

 @override
  Widget build(BuildContext context) {
    appBarExpandedHeight = MediaQuery.of(context).size.width * (0.5);
    return Scaffold(
      body: CustomScrollView(
        controller: _scrollController,
        slivers: <Widget>[
          SliverAppBar(
            brightness: Brightness.dark,
            elevation: 0,
            iconTheme:
            IconThemeData(color: _isExpanded ? Colors.black : Colors.white),
            backgroundColor: Colors.white,
            expandedHeight: appBarExpandedHeight,
            flexibleSpace: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                return FlexibleSpaceBar(
                  background: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          widget.news.urlToImage,
                          fit: BoxFit.cover,
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(<Widget>[
              Container(
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        widget.news.title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                    Divider(
                      height: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 10,
                      ),
                      child: Text(widget.news.description),
                    ),
                  ],
                ),
              )
            ]),
          )
        ],
      ),
    );
  }
}