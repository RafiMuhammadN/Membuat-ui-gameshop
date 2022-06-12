import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:tampilan2/widget/topup_detail.dart';
import 'package:tampilan2/widget/buildcard.dart';

class topuppage extends StatelessWidget {

  const topuppage({Key? key,})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFAF8),
      body: ListView(
        children: <Widget>[
          SizedBox(height: 15.0),
          Container(
            padding: EdgeInsets.only(right: 15.0),
            width: MediaQuery.of(context).size.width - 30.0,
            height: MediaQuery.of(context).size.height - 50.0,
            child: GridView.count(
              crossAxisCount: 2,
              primary: false,
              crossAxisSpacing: 10.0,
              mainAxisSpacing: 15.0,
              childAspectRatio: 0.8,
              children: <Widget>[
                _buildCard('Genshin','\$0.00', 'assets/images/genshin.jpg', 'Ayo jelajahi dunia teyvat bersama paimon dan teman-teman lainnya !',
                    false, false, context),
                _buildCard('Terraria', '\$9.99', 'assets/images/Terraria.png', 'Mainlah Terraria dan kalahkan boss dengan item-item yang bervariasi!',
                     false, false, context),
                _buildCard('Minecraft', '\$26.95', 'assets/images/minecraft.jpg', 'Mainlah bersama teman-teman mu dan bangun, pvp, dan bermain minigame bersama !',
                    false, true, context),
                _buildCard('Car X Drift Online', '\$14.99', 'assets/images/drift.jpg', 'Ayo balapan / tandem bersama teman-teman mu dengan mobil dan cuztomisasi yang bermacam-macam !',
                    false, false, context)
              ]
            )
          ),
          SizedBox(height: 15.0)
        ],
      ),
    );
  }
}

Widget _buildCard(String name, String price, String imgPath, String detail, bool added,
    bool isFavorite, context) {
  return Padding(
      padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
      child: InkWell(
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Topupdetail(
                    assetPath: imgPath,
                    topupprice:price,
                    topupname: name,
                    topupdetail: detail,
                )));
          },
          child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 3.0,
                        blurRadius: 5.0)
                  ],
                  color: Colors.white),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(
                        top: 25.0,
                        left: 5.0,
                        right: 5.0,
                        bottom: 5.0,
                    ),
                ),
                Hero(
                    tag: imgPath,
                    child: Container(
                        height: 75.0,
                        width: 75.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(imgPath),
                                fit: BoxFit.contain)))),
                SizedBox(height: 7.0),
                Text(price,
                    style: TextStyle(
                        color: Colors.pink[200],
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Text(name,
                    style: TextStyle(
                        color: Color(0xFF575E67),
                        fontFamily: 'Varela',
                        fontSize: 14.0)),
                Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(color: Color(0xFFEBEBEB), height: 1.0)),
                Padding(
                    padding: EdgeInsets.only(left: 5.0, right: 5.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (!added) ...[
                            Icon(Icons.shopping_basket,
                                color: Colors.pink[200], size: 12.0),
                            Text('Add to cart',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Colors.pink[200],
                                    fontSize: 12.0))
                          ],
                          if (added) ...[
                            Icon(Icons.remove_circle_outline,
                                color: Colors.pink[200],
                                size: 12.0),
                            Text('3',
                                style: TextStyle(
                                    fontFamily: 'Varela',
                                    color: Colors.pink[200],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 12.0)),
                            Icon(Icons.add_circle_outline,
                                color: Colors.pink[200], size: 12.0),
                          ]
                        ]
                    )
                )
              ]
              )
          )
      )
  );
}
