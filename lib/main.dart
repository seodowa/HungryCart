import 'package:flutter/material.dart';
import 'package:hungrycart/models/shop_model.dart';
import 'package:provider/provider.dart';
import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ShopModel(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "HungryCart",
        home: HomePage(),
      ),
    );
  }
}
