import 'package:demo2/Screens/colors.dart';
import 'package:demo2/Screens/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:validators/validators.dart';
import 'package:get/get.dart';

/// A screen widget for entering blood pressure details.
class HomeScreen extends StatelessWidget {
  final TextEditingController systolicController = TextEditingController();
  final TextEditingController diastolicController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  /// Constructor for HomeScreen.
  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: ListView(
        //Title Section
        padding: EdgeInsets.zero,
        children: <Widget>[
          Container(
            height: 400,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  '../../assets/Images/person-using-tensiometer-blood-pressure.jpg',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(100),
              ),
            ),
            child: const Column(
              children: [
                SizedBox(height: 270),
                ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 5),
                  title: Text(
                    'CardiHealth+',
                    style: TextStyle(
                      color: bgColor,
                      fontSize: 50,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                  subtitle: Text(
                    'Welcome Back.!',
                    style: TextStyle(
                      color: wColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //Input Data Section
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                const Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5),
                    Text(
                      "Input Your Blood Pressure Details",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: ageController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Input Your Age',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    suffixIcon: Icon(Icons.input, color: borderColor),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: systolicController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Input Systolic Value',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    suffixIcon: Icon(Icons.input, color: borderColor),
                  ),
                ),
                const SizedBox(height: 25),
                TextField(
                  controller: diastolicController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: 'Input Diastolic Value',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: wColor),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: borderColor),
                    ),
                    suffixIcon: Icon(Icons.input, color: borderColor),
                  ),
                ),
                //Validation Button For View Result In Next Screen
                const SizedBox(height: 25),
                ElevatedButton(
                  onPressed: () {
                    String age = ageController.text;
                    String systolic = systolicController.text;
                    String diastolic = diastolicController.text;

                    //Error Massage Box (If input data is not numeric then give a error msg)
                    if (systolic.isEmpty ||
                        diastolic.isEmpty ||
                        age.isEmpty ||
                        (!isNumeric(systolic) ||
                            !isNumeric(diastolic) ||
                            !isNumeric(age))) {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          backgroundColor: bgColor,
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 40, vertical: 20),
                          title: const Text(
                            'Invalid Data.!',
                            style: TextStyle(color: rColor, fontSize: 20),
                          ),
                          content: const Text(
                            'Please Enter Numeric Values Only.',
                            style: TextStyle(fontSize: 16, color: wColor),
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'OK',
                                style: TextStyle(color: rColor, fontSize: 20),
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      Get.to(
                        () => ResultScreen(
                          systolic: systolic,
                          diastolic: diastolic,
                          age: age,
                        ),
                      );
                    }
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(wColor),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(150, 50),
                    ),
                  ),
                  child: const Text(
                    'Show info',
                    style: TextStyle(color: bgColor, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      //Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: borderColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Result',
          ),
        ],
        selectedItemColor: bgColor,
        unselectedItemColor: bgColor,
        onTap: (int index) {
          if (index == 1) {
            String age = ageController.text;
            String systolic = systolicController.text;
            String diastolic = diastolicController.text;

            if (systolic.isEmpty ||
                diastolic.isEmpty ||
                age.isEmpty ||
                (!isNumeric(systolic) ||
                    !isNumeric(diastolic) ||
                    !isNumeric(age))) {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  backgroundColor: bgColor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 60, vertical: 20),
                  title: const Text(
                    'Invalid Data.!',
                    style: TextStyle(color: rColor, fontSize: 20),
                  ),
                  content: const Text(
                    'Please Enter Numeric Values Only.',
                    style: TextStyle(fontSize: 16, color: wColor),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(color: rColor, fontSize: 20),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              Get.to(ResultScreen(
                systolic: systolic,
                diastolic: diastolic,
                age: age,
              ));
            }
          }
        },
      ),
    );
  }
}
