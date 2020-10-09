import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/Screens/ShortEatsPage.dart';

class FoodListingPage extends StatefulWidget {
  @override
  _FoodListingPageState createState() => _FoodListingPageState();
}

class _FoodListingPageState extends State<FoodListingPage>
    with TickerProviderStateMixin {
  TabController _tabController;

  List<Widget> tabViews = [
    ShortEats(),
    Container(
      height: 200,
    ),
    Container(),
    Container(),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.more_vert, color: Colors.black),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              Icons.shopping_cart,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Text(
              "Food Delivery",
              style: TextStyle(
                fontSize: 35,
                fontFamily: 'Nunito',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 4,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        hintText: "Search Here",
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                  child: Material(
                    borderRadius: BorderRadius.circular(15),
                    elevation: 4,
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Icon(
                        Icons.fastfood,
                        color: Colors.orange[600],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          TabBar(
            controller: _tabController,
            isScrollable: true,
            unselectedLabelColor: Colors.grey,
            labelColor: Colors.black,
            indicatorColor: Colors.orange[600],
            indicatorPadding: EdgeInsets.all(10),
            tabs: [
              Tab(
                child: Text(
                  'Short Eats',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  'Rice',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  'Noodles',
                  style: TextStyle(fontSize: 12),
                ),
              ),
              Tab(
                child: Text(
                  'Sea Foods',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: tabViews,
            ),
          )
        ],
      ),
    );
  }
}
