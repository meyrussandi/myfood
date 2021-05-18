import 'package:flutter/material.dart';
import 'package:myfood/models/models.dart';
import 'package:myfood/ui/pages/pages.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: PaymentPage(transaction: Transaction(food: dummyFoods[0], user: dummyUser, quantity: 2, total: (dummyFoods[0].price *2 * 1.1).toInt() + 15000),)
    );
  }
}