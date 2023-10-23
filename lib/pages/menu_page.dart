import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/models/food.dart';
import 'package:sushi_restaurant/theme/color.dart';

import '../components/food_tile.dart';
import '../models/shop.dart';
import 'food_detail_page.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  // function to navigate to detail page
  void navigateToFoodDetail(int index) {
    // ger the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => FoodDetailsPage(
            food: foodMenu[index],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    // ger the shop and it's menu
    final shop = context.read<Shop>();
    final foodMenu = shop.foodMenu;
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.grey[800],
        elevation: 0,
        leading: const Icon(
          Icons.menu,
        ),
        title: const Text(
          'HaNoi',
          style: TextStyle(fontSize: 20),
        ),
        actions: [
//cart button
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/cartpage');
              },
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
                color: primaryColor, borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.symmetric(horizontal: 25),
            padding: const EdgeInsets.all(25),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    // promo banner
                    Text(
                      'Get 32% Promo',
                      style: GoogleFonts.dmSerifDisplay(
                          fontSize: 20, color: Colors.white),
                    ),

                    const SizedBox(
                      height: 20,
                    ),

                    //redeem button
                    MyButton(text: 'Redeem', onTap: () {})
                  ],
                ),

                //image
                Image.asset(
                  'lib/images/sushi.png',
                  height: 100,
                )
              ],
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: 'Search here..'),
            ),
          ),

          const SizedBox(
            height: 25,
          ),

          // menu list
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Text(
              'Food Menu',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[800],
                  fontSize: 18),
            ),
          ),

          const SizedBox(
            height: 10,
          ),

          Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: foodMenu.length,
                  itemBuilder: (context, index) => FoodTile(
                        food: foodMenu[index],
                        onTap: () => navigateToFoodDetail(index),
                      ))),
          const SizedBox(
            height: 25,
          ),

          // popular food
          Container(
            decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20)),
            margin: const EdgeInsets.only(left: 25, right: 25, bottom: 25),
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    // image
                    Image.asset(
                      'lib/images/sushi_1.png',
                      height: 60,
                    ),

                    const SizedBox(
                      width: 20,
                    ),

                    // name and price
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // name
                        Text(
                          'Salmon Eggs',
                          style: GoogleFonts.dmSerifDisplay(fontSize: 18),
                        ),

                        const SizedBox(
                          height: 10,
                        ),
                        // price
                        Text(
                          '\$21.00',
                          style: TextStyle(color: Colors.grey[700]),
                        )
                      ],
                    ),
                  ],
                ),

                // favorite
                const Icon(
                  Icons.favorite_outline,
                  color: Colors.grey,
                  size: 28,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
