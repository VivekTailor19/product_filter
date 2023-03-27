import 'package:flutter/material.dart';

class Product_Filter extends StatefulWidget {
  const Product_Filter({Key? key}) : super(key: key);

  @override
  State<Product_Filter> createState() => _Product_FilterState();
}

class _Product_FilterState extends State<Product_Filter> {
  double money = 50000;



  List<Product> p =[
    Product(no : 1, name : "T-shirt", price : 550, type : "Clothing"),
    Product(no : 2, name : "Jeans", price : 1100, type : "Clothing"),
    Product(no : 3, name : "Watch", price : 2500, type : "Electric"),
    Product(no : 4, name : "TV", price : 45000, type : "Electronics"),
    Product(no : 5, name : "SmartPhone", price : 20000, type : "Electric"),
  ];




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
          ListView.builder(itemBuilder: (context, index) {
            return Item(name: p[index].name, n: p[index].no, price: p[index].price,type: p[index].type);

          },),
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



class Product
{
  int? no,price;
  String? name,type;
  Product({this.no,this.name,this.type,this.price});

}

//
// List<String> i_no = ["1", "2", "3", "4", "5"];
// List<String> i_name = ["T-shirt", "Jeans", "Watch", "TV", "SmartPhone"];
// List<String> i_type = [
//   "Clothing",
//   "Clothing",
//   "Electric",
//   "Electronics",
//   "Electric"
// ];
// List<String> i_price = ["550", "1100", "2500", "45000", "20000"];
//
// print("Product(no : \"${no[i]}\", name : \"${name[i]}\", price : \"${price[i]}\", type : \"${type[i]}\"),");