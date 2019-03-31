import 'package:flutter/material.dart';
import 'package:workshop1/models/news.dart';
import 'package:workshop1/screens/detail/detail.dart';
import 'package:workshop1/screens/home/widgets/item_news.dart';


class Home extends StatefulWidget {
  
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _counter = 0;
  int _selectedIndex = 1;
  List<News> news = new List<News>();

  @override
  void initState() {
    news.add(News(
       title: "Title11111111111",
     datetime: DateTime.now(),
    detail: "Featured articles are considered to be some of the best articles Wikipedia has to offer, as determined by Wikipedia's editors. They are used by editors as examples for writing other articl Featured articles are considered to be some of the best articles Wikipedia has to offer, as determined by Wikipedia's editors. They are used by editors as examples for writing other articl Featured articles are considered to be some of the best articles Wikipedia has to offer, as determined by Wikipedia's editors. They are used by editors as examples for writing other articles. Before being listed here, articles are reviewed as featured article candidates for accuracy, neutrality, completeness, and style, according to our featured article criteria. There are 5,500 featured articles out of 5,829,365 articles on the English Wikipedia (~0.1% are featured). Thus, about one in 1,050 of all Wikipedia articles are listed here. Articles that no longer meet the criteria can be proposed for improvement or removal at featured article review.On non-mobile versions of our website, a small bronze star icon (This star symbolizes the featured content on Wikipedia.) on the top right corner of an article's page indicates that the article is featured. On most smartphones and tablets you can also select to see this line (do a search to find out how). Additionally, if the current article is featured in another language, a star will appear next to the corresponding entry in the Languages list in the sidebar (a user preference allows toggling this on/off under Gadgets > Appearance).",
    image: "https://animematch.com/wp-content/uploads/2018/08/Sword-Art-Online-Season-3-938x529.jpg"
    ));

      news.add(News(
       title: "Title22222222",
        datetime: DateTime.now(),
    detail: "Detail2",
  image: "https://cdn2-www.gamerevolution.com/assets/uploads/2018/07/New-Digimon-Game-July-2018.jpg"
    ));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
        backgroundColor: Colors.white,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: const NetworkImage(
                  "https://res.cloudinary.com/teepublic/image/private/s--9bcgK4L3--/t_Resized%20Artwork/c_fit,g_north_west,h_954,w_954/co_ffffff,e_outline:48/co_ffffff,e_outline:inner_fill:48/co_ffffff,e_outline:48/co_ffffff,e_outline:inner_fill:48/co_bbbbbb,e_outline:3:1000/c_mpad,g_center,h_1260,w_1260/b_rgb:eeeeee/c_limit,f_jpg,h_630,q_90,w_630/v1468005314/production/designs/576817_1.jpg"),
            ),
          )
        ],
        title: Text(
          
          "Headlines",
          style: TextStyle(color: Colors.black),
        ),
      ),
        body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: (){
                Navigator.push(context,
                     MaterialPageRoute(builder:(context)=> DetailScreen(news: news[index],))
                     );
              print(news[index].datetime);
            },
                      child: Ink(
                                              child: Padding(            
              padding: EdgeInsets.all(10),
              child: NewsItem(news[index]),
            ),
                      ),
          );
        },
        itemCount: news.length,
      ),
       bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.assistant), title: Text('My Feed')),
          BottomNavigationBarItem(
              icon: Icon(Icons.work), title: Text('Headline')),
          BottomNavigationBarItem(
              icon: Icon(Icons.star_border), title: Text('Favorites')),
        ],
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        onTap: _onItemTapped,
      ),
    );
  }
   void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}