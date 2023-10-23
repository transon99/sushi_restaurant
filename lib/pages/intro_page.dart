import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sushi_restaurant/components/button.dart';
import 'package:sushi_restaurant/theme/color.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //shop name
                Text(
                  "SUSHI MAN",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 40, color: Colors.white),
                ),

                const SizedBox(height: 10),
                //icon
                Padding(
                  padding: const EdgeInsets.all(50),
                  child: Image.asset('lib/images/sushi_1.png'),
                ),

                const SizedBox(height: 20),

                //title
                Text(
                  "THE TASTE OF JAPANESE FOOD",
                  style: GoogleFonts.dmSerifDisplay(
                      fontSize: 40, color: Colors.white),
                ),

                const SizedBox(height: 10),

                //subtitle
                Text(
                  "Feel the taste of the most popular Japanese food from anywhere and any time",
                  style: TextStyle(
                      color: Colors.grey[300], height: 2, fontSize: 15),
                ),

                const SizedBox(height: 10),

                //button
                MyButton(
                  text: "Get Started",
                  onTap: () {
                    Navigator.pushNamed(context, '/menupage');
                  },
                )
              ],
            ),
          ),
        ));
  }
}
