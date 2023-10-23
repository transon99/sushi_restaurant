import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/models/shop.dart';
import 'package:sushi_restaurant/theme/color.dart';

import '../models/food.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // funcion to remove food
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    // remove from cart
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
        builder: (context, value, child) => Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                centerTitle: true,
                elevation: 0,
                title: const Text(
                  'My Cart',
                ),
                backgroundColor: primaryColor,
              ),
              body: Column(
                children: [
                  // Customer Cart
                  Expanded(
                    child: ListView.builder(
                        itemCount: value.cart.length,
                        itemBuilder: (context, index) {
                          // get food from the cart
                          final Food food = value.cart[index];
                          // get food name
                          final String foodName = food.name;

                          // get food price
                          final String foodPrice = food.price;
                          // return list tile
                          return Container(
                            decoration: BoxDecoration(
                                color: secondaryColor,
                                borderRadius: BorderRadius.circular(8)),
                            margin: const EdgeInsets.only(
                                left: 20, top: 20, right: 20),
                            child: ListTile(
                              title: Text(
                                foodName,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                foodPrice,
                                style: TextStyle(color: Colors.grey[200]),
                              ),
                              trailing: IconButton(
                                icon: Icon(
                                  Icons.delete,
                                  color: Colors.grey[300],
                                ),
                                onPressed: () => removeFromCart(food, context),
                              ),
                            ),
                          );
                        }),
                  ),
                  //Pay Button
                  Padding(
                    padding: const EdgeInsets.all(25),
                    child: MyButton(text: 'Pay Now', onTap: () {}),
                  )
                ],
              ),
            ));
  }
}
