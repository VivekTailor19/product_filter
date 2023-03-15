import 'package:flutter/material.dart';

class Product_Filter extends StatefulWidget {
  const Product_Filter({Key? key}) : super(key: key);

  @override
  State<Product_Filter> createState() => _Product_FilterState();
}

class _Product_FilterState extends State<Product_Filter> {
  double money = 50000;

  List<int> i_no = [1, 2, 3, 4, 5];
  List<String> i_name = ["T-shirt", "Jeans", "Watch", "TV", "SmartPhone"];
  List<String> i_type = [
    "Clothing",
    "Clothing",
    "Electric",
    "Electronics",
    "Electric"
  ];
  List<int> i_price = [550, 1100, 2500, 45000, 20000];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Products Filter",
          style: TextStyle(color: Colors.white, fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          Icon(
            Icons.grid_on,
            size: 25,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Slider(
              min: 0,
              max: 50000,
              activeColor: Colors.red,
              value: money,
              onChanged: (value) {
                setState(() {
                  money = value;
                });
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Text(
                "All Products < ₹ 50000 /-",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Column(
                children:
                    //[Item(n: 1,name: "SmartWatch",type: "Electronics",price: 2500),],
                    i_no.asMap().entries
                        .map((e) => Item(n: i_no[e.key], name: i_name[e.key],price: i_price[e.key],type: i_type[e.key]))
                        .toList()),
          ],
        ),
      ),
    );
  }

  Widget Item({int? n, String? name, String? type, int? price}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Container(
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: Colors.white,
            boxShadow: [
              BoxShadow(offset: Offset(0, 2), color: Colors.black12)
            ]),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Row(
            children: [
              Text(
                "${n}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
              SizedBox(width: 15),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "$name",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    "$type",
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
              Spacer(),
              Text(
                "₹ ${price}/-",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              )
            ],
          ),
        ),
      ),
    );
  }
}
