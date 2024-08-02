import 'package:flutter/material.dart';
import 'package:hungrycart/app_style.dart';
import 'package:hungrycart/models/product_model.dart';
import 'package:hungrycart/models/shop_model.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final Product product;

  const ProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.all(6),
      width: (screenWidth - 25) / 2,
      height: 300,
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: () => addToCart(context, product),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(image: AssetImage(product.productImgPath)),
              Text(
                product.productName,
                style: AppStyle.textStyle
                    .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "P${product.productPrice.toStringAsFixed(2)}",
                style: AppStyle.textStyle.copyWith(fontSize: 15),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void addToCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: Text(
          "Add item to cart?",
          style: AppStyle.textStyle
              .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        content: (Text(
          product.productName.toString(),
          style: AppStyle.textStyle.copyWith(fontSize: 16),
        )),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'No'),
            child: const Text(
              'No',
              style: AppStyle.textStyle,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context, 'Yes');
              context.read<ShopModel>().addToCart(product);

              showDialog(
                context: context,
                builder: (BuildContext context) => AlertDialog(
                  title: Text(
                    "Added to cart successfully!",
                    style: AppStyle.textStyle
                        .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, 'Ok'),
                      child: const Text(
                        'Ok',
                        style: AppStyle.textStyle,
                      ),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              'Yes',
              style: AppStyle.textStyle,
            ),
          ),
        ],
      ),
    );
  }
}
