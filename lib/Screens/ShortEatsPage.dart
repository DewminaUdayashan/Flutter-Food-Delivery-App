import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_app/Screens/ShortEatsDetailsPage.dart';
import 'package:readmore/readmore.dart';

class ShortEats extends StatefulWidget {
  @override
  _ShortEatsState createState() => _ShortEatsState();
}

class _ShortEatsState extends State<ShortEats> {
  List img = [
    'assets/img/3.png',
    'assets/img/2.png',
    'assets/img/1.png',
  ];

  List names = [
    'Sandwich',
    'Sausages Bun',
    'Family Pack',
  ];

  String details =
      'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: names.length,
        itemBuilder: (context, index) => ItemCard(
          itemName: names[index],
          description: details,
          image: img[index],
        ),
      ),
    );
  }
}

class ItemCard extends StatelessWidget {
  final String itemName, image, description;

  const ItemCard({Key key, this.itemName, this.image, this.description})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        height: height * 0.4,
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: [
                Positioned(
                  bottom: 0,
                  child: Material(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(1000),
                      topRight: Radius.circular(50),
                      bottomLeft: Radius.circular(50),
                      bottomRight: Radius.circular(50),
                    ),
                    elevation: 10,
                    child: Container(
                      height: constraints.maxHeight * 0.8,
                      width: constraints.maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.orange[600],
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(1000),
                          topRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 36,
                  top: 25,
                  child: Hero(
                    tag: 'shadow$itemName',
                    child: Image.asset(
                      image,
                      width: constraints.maxWidth * 0.6,
                      color: Colors.black.withOpacity(0.3),
                    ),
                  ),
                ),
                Positioned(
                  left: 30,
                  top: 20,
                  child: Hero(
                    tag: itemName,
                    child: Image.asset(
                      image,
                      width: constraints.maxWidth * 0.6,
                    ),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 70,
                  child: Material(
                    elevation: 5,
                    color: Colors.white.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(5),
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Icon(
                        Icons.favorite_border,
                        color: Colors.pink,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 40,
                  left: 30,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        itemName,
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Nunito',
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '10min ago',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 40,
                  right: 50,
                  child: Column(
                    children: [
                      Text(
                        '10 Available',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Material(
                        elevation: 6,
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ShortEatsDetailsPage(
                                image: image,
                                itemName: itemName,
                              ),
                            ),
                          ),
                          child: Container(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.all(9.0),
                              child: Text(
                                'Order Now',
                                style: TextStyle(
                                  fontFamily: 'Nunito',
                                  color: Colors.orange[900],
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
