import 'package:flutter/material.dart';
import 'package:hungrycart/app_style.dart';
import 'package:hungrycart/models/product_model.dart';
import 'package:hungrycart/models/shop_model.dart';
import 'package:provider/provider.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPage();
}

class _ShoppingCartPage extends State<ShoppingCartPage> {
  @override
  Widget build(BuildContext context) {
    var cart = context.watch<ShopModel>().cart;
    double total = context.read<ShopModel>().getCartTotal();

    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text(
            "Cart",
            style: AppStyle.headerTextStyle.copyWith(color: Colors.black),
          ),
          backgroundColor: AppStyle.mainColor,
          shape: const Border(
            bottom: BorderSide(color: Colors.black, width: 2),
          ),
          elevation: 4,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: cart.isEmpty
                  // display "Cart is empty" if cart is empty
                  ? const Center(
                      child: Text(
                        "Cart is empty.",
                        style: AppStyle.textStyle,
                      ),
                    )
                  // else display contents of cart
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];
                        return Material(
                          color: Colors.white,
                          child: ListTile(
                            leading: Image(image: AssetImage(item.productImgPath)),                            
                            title: Text(item.productName),
                            subtitle: Text(
                                "P${item.productPrice.toStringAsFixed(2)}"),
                            trailing: IconButton(
                              icon: const Icon(Icons.close),
                              onPressed: () => removeFromCart(context, item),
                            ),
                          ),
                        );
                      }),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: AppStyle.mainColor,
            onPressed: () {
              if (cart.isNotEmpty) {
                showDialog(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                          title: Text(
                            "Are you sure you want to checkout?",
                            style: AppStyle.textStyle.copyWith(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          content: Text(
                            "Total amount to pay is P${total.toStringAsFixed(2)}",
                            style: AppStyle.textStyle.copyWith(fontSize: 16),
                          ),
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
                                context.read<ShopModel>().clearCart();
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        AlertDialog(
                                          title: Text(
                                            "Checkout Success!",
                                            style: AppStyle.textStyle.copyWith(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 22),
                                          ),
                                          content: Text(
                                            "Thank you for shopping with HungryCart!",
                                            style: AppStyle.textStyle
                                                .copyWith(fontSize: 16),
                                          ),
                                          actions: [
                                            TextButton(
                                              onPressed: () => Navigator.pop(
                                                  context, 'Cancel'),
                                              child: const Text(
                                                'Ok',
                                                style: AppStyle.textStyle,
                                              ),
                                            ),
                                          ],
                                        ));
                              },
                              child: const Text(
                                'Yes',
                                style: AppStyle.textStyle,
                              ),
                            ),
                          ],
                        ));
              } else {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text(
                      "Cart is Empty",
                      style: AppStyle.textStyle
                          .copyWith(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                    content: Text(
                      "Please add items to cart first before checkout.",
                      style: AppStyle.textStyle.copyWith(fontSize: 16),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context, 'Cancel'),
                        child: const Text(
                          'Ok',
                          style: AppStyle.textStyle,
                        ),
                      ),
                    ],
                  ),
                );
              }
            },
            label: const Text(
              "Checkout",
              style: AppStyle.textStyle,
            )));
  }

  void removeFromCart(BuildContext context, Product product) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
              title: Text(
                "Remove this item from cart?",
                style: AppStyle.textStyle.copyWith(fontSize: 22),
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, "Cancel"),
                  child: Text(
                    "No",
                    style: AppStyle.textStyle.copyWith(fontSize: 16),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, "Yes");
                    context.read<ShopModel>().removeFromCart(product);
                  },
                  child: Text(
                    "Yes",
                    style: AppStyle.textStyle.copyWith(fontSize: 16),
                  ),
                ),
              ],
            ));
  }
}
