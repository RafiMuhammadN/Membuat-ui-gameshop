import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tampilan2/widget/bottom_bar.dart';
import 'package:tampilan2/widget/inputTextWidget.dart';
import 'package:tampilan2/widget/topup_page.dart';
import 'package:tampilan2/screen/loginScreen.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  _DashboardViewState createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Color(0xffffffff)),
          onPressed: () {},
        ),
        title: Text('Buy Games',
          style: TextStyle(
          fontFamily: 'Varela', fontSize: 20.0, color: Color(0xFFffffff))
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.reorder_outlined, color: Color(0xFFffffff)),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.only(left: 20.0),
        children: <Widget>[
          SizedBox(height: 15.0),
          Text('Categories',
          style: TextStyle(
            fontFamily: 'Varela',
            fontSize: 42.0,
            fontWeight: FontWeight.bold
          )),
          SizedBox(height: 15.0),
          TabBar(
            controller: _tabController,
            indicatorColor: Colors.transparent,
            labelColor: Colors.pink[200],
            isScrollable: true,
            labelPadding: EdgeInsets.only(right: 43.0),
            unselectedLabelColor: Color(0xFFCDCDCD),
            tabs: [
              Tab(
                child: Text('Semua',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('PC Game',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
              Tab(
                child: Text('Mobile Game',
                    style: TextStyle(
                      fontFamily: 'Varela',
                      fontSize: 21.0,
                    )),
              ),
            ]),
          Container(
            height: MediaQuery.of(context).size.height - 50.0,
            width: double.infinity,
            child: TabBarView(
              controller: _tabController,
              children: [
                topuppage(),
                topuppage(),
                topuppage(),
              ]
            )
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {},
      backgroundColor: Colors.pink[200],
      child: Icon(Icons.search),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomBar(),
    );
  }
}
