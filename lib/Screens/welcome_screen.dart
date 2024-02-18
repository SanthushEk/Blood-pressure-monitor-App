import 'package:demo2/Screens/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo2/Screens/home_screen.dart';

/// A screen widget displayed to welcome users.
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            // Background Image
            Image.asset(
              '../../assets/Images/pawel-czerwinski-Qiy4hr18aGs-unsplash.jpg', // Replace with your image path
              fit: BoxFit.cover,
            ),
            // Content
            Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Displaying Logo
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: wColor,
                        width: 2,
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Image.asset(
                      '../../assets/Images/Cardiologist-bro.png',
                      width: 200,
                      height: 200,
                    ),
                  ),
                  const SizedBox(height: 50),
                  // App Name
                  const Text(
                    "CardiHealth+",
                    style: TextStyle(
                      color: wColor,
                      fontSize: 35,
                      letterSpacing: 1,
                      wordSpacing: 2,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // App Description
                  const Text(
                    "Check Your Blood Pressure",
                    style: TextStyle(
                      color: wColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 60),
                  // Button to Navigate to HomeScreen
                  Material(
                    color: wColor,
                    borderRadius: BorderRadius.circular(10),
                    child: InkWell(
                      onTap: () {
                        Get.to(() =>
                            HomeScreen()); // Navigate to HomeScreen using GetX
                      },
                      highlightColor: wColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(10),
                      onTapCancel: () {},
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 40),
                        child: const Text(
                          "Let's Go",
                          style: TextStyle(
                            color: bgColor,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
