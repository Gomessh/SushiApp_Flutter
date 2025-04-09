import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sushi_app/component/button.dart';
import 'package:sushi_app/models/food.dart';
import 'package:sushi_app/models/shop.dart';
import 'package:sushi_app/theme/colors.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // remove from cart
  void removeFromCart(Food food, BuildContext context) {
    // get access to shop
    final shop = context.read<Shop>();

    // remove item
    shop.removeFromCart(food);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<Shop>(
      builder:
          (context, value, child) => Scaffold(
            backgroundColor: primaryColor,
            appBar: AppBar(
              centerTitle: true,
              foregroundColor: Colors.white,
              title: Text(
                "My Cart",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              backgroundColor: primaryColor,
            ),
            body: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: value.cart.length,
                    itemBuilder: (context, index) {
                      // get food from cart
                      final Food food = value.cart[index];

                      // get food name
                      final String foodName = food.name;

                      // get food price
                      final String foodPrice = food.price;

                      // return list tile
                      return Container(
                        decoration: BoxDecoration(
                          color: secondaryColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        margin: const EdgeInsets.only(
                          left: 20,
                          top: 20,
                          right: 20,
                        ),
                        child: ListTile(
                          title: Text(
                            foodName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            foodPrice,
                            style: TextStyle(
                              color: Colors.grey[200],
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            onPressed: () => removeFromCart(food, context),
                            icon: Icon(Icons.delete, color: Colors.grey[300]),
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Pay button
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: MainButton(text: "Pay Now", onTap: () {}),
                ),
              ],
            ),
          ),
    );
  }
}
