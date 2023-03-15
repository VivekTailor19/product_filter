import 'package:flutter/material.dart';
import 'package:product_filter/screen_change.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context) => Product_Filter(),
      },
    ),
  );
}
