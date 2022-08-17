import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class home extends StatefulWidget {
  home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  List<String> items = [
    "Design of children's rooms",
    "Living room design",
    "Living room design2",
  ];

  List diff = [
    {
      'img': 'assets/image/1.jpg',
      'title1': "Design of a children's",
      "title2": "room for 2 children",
      "subTitle": "Interior design",
      "price": "256 EG"
    },
    {
      'img': 'assets/image/2.jpg',
      'title1': "Design of a children's",
      "title2": "room for 2 children",
      "subTitle": "Interior design",
      "price": "256 EG"
    },
    {
      'img': 'assets/image/3.jpg',
      'title1': "Design of a children's",
      "title2": "room for 2 children",
      "subTitle": "Interior design",
      "price": "256 EG"
    }
  ];

  String? setColor = "Design of children's rooms";

  @override
  Widget build(BuildContext context) {
    double hi = MediaQuery.of(context).size.height;
    double wi = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              children: [
                space(hi / 100, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Interior design',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ],
                ),
                space(hi / 50, 0),
                Container(
                  height: 34,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: items.isEmpty ? 0 : items.length,
                    itemBuilder: (context, index) {
                      final category = items[index];
                      return Categories(category);
                    },
                  ),
                ),
                space(hi / 40, 0),
                Container(
                    color: Color.fromARGB(10, 0, 0, 0),
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "different services",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text("see all"),
                          ],
                        ),
                        Container(
                          // height: 150,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: diff.isEmpty ? 0 : diff.length,
                            itemBuilder: (context, index) {
                              return different(diff[index], wi);
                            },
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Offers & packages",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 18),
                            ),
                            Text("see all"),
                          ],
                        ),
                        Container(
                          height: hi / 3.4,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 1,
                            itemBuilder: (context, index) {
                              return Offers();
                            },
                          ),
                        ),
                      ],
                    ))
              ],
            )
          ],
        ));
  }

  SizedBox space(double hi, double wi) {
    return SizedBox(
      height: hi,
      width: wi,
    );
  }

  Widget Categories(title) {
    return InkWell(
      onTap: () {
        setState(() {
          setColor = title;
        });
      },
      child: Container(
        decoration: BoxDecoration(
            color: setColor == title ? Colors.amber : Colors.white,
            borderRadius: BorderRadius.circular(8)),
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.symmetric(horizontal: 8),
        child: Text(
          title,
          style: TextStyle(
              color: setColor == title ? Colors.white : Colors.black,
              fontSize: 15,
              fontWeight:
                  setColor == title ? FontWeight.bold : FontWeight.normal),
        ),
      ),
    );
  }

  Widget different(di, double wi) {
    return Container(
      margin: EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.asset(
                  di['img'],
                  height: 90,
                  // fit: BoxFit.cover,
                ),
              ),
            ],
          ),
          space(0, 5),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(di['title1']),
                  ],
                ),
                space(10, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(di['title2']),
                  ],
                ),
                space(18, 0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      di['subTitle'],
                      style: TextStyle(fontSize: 13, color: Colors.black38),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                di['price'],
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
              RatingBarIndicator(
                rating: 3,
                itemBuilder: (context, index) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                itemCount: 4,
                itemSize: 15.0,
                direction: Axis.horizontal,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  ('BOOK'),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  minimumSize: const Size(30, 40),
                  primary: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget Offers() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          Container(
            height: 200,
            // color: Colors.black,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.asset(
                'assets/image/1.jpg',
                height: 250,
                width: double.infinity,
                fit: BoxFit.fitWidth,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Design of a children's room for 2 children",
                style: TextStyle(fontSize: 13),
              ),
              Text(
                "256 EG",
                style: TextStyle(
                    color: Colors.blue,
                    fontSize: 23,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
