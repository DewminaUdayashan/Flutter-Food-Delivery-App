import 'package:flutter/material.dart';

class ShortEatsDetailsPage extends StatelessWidget {
  final String itemName, image;

  const ShortEatsDetailsPage({Key key, this.itemName, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(Icons.shopping_bag, color: Colors.orange[900]),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              height: height * 0.6,
              decoration: BoxDecoration(
                color: Colors.orange[600],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40),
                  topRight: Radius.circular(40),
                ),
              ),
            ),
          ),
          Column(
            children: [
              Text(
                itemName,
                style: TextStyle(
                  fontFamily: 'Nunito',
                  fontSize: 45,
                ),
              ),
            ],
          ),
          Positioned(
            top: height * 0.16,
            left: 58,
            child: Container(
              width: width * 0.7,
              child: Hero(
                tag: 'shadow$itemName',
                child: Image.asset(
                  image,
                  color: Colors.black.withOpacity(0.5),
                ),
              ),
            ),
          ),
          Positioned(
            top: height * 0.15,
            left: 50,
            child: Container(
              width: width * 0.7,
              child: Hero(tag: itemName, child: Image.asset(image)),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 60,
            child: Container(
              height: height * 0.4,
              width: width * 0.7,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '100LKR',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontSize: 28,
                      ),
                    ),
                    Text(
                      '10 Available',
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'Nunito',
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Material(
                      elevation: 5,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.white,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Add To Cart',
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Material(
                      elevation: 6,
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.orange[900],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Text(
                            'Order Now',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontFamily: 'Nunito'),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
