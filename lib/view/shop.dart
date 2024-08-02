import 'package:flutter/material.dart';
import 'package:hungrycart/app_style.dart';
import 'package:hungrycart/models/shop_model.dart';
import 'package:hungrycart/product_tile.dart';

import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  const ShopPage({super.key});

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    var products = context.watch<ShopModel>().products;

    return SingleChildScrollView(
      physics: const ScrollPhysics(),
      child: Column(
        children: <Widget>[
          // popular
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Popular",
                  style: AppStyle.headerTextStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 300,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ProductTile(product: products[index]);
              },
            ),
          ),
          const SizedBox(height: 50),
          // recommended for you
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Recommended for you",
                  style: AppStyle.headerTextStyle.copyWith(color: Colors.black),
                  textAlign: TextAlign.left,
                ),
              ),
            ],
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ProductTile(product: products[index]),
                  ProductTile(product: products[index]),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
