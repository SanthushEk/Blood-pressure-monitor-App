import 'package:demo2/Screens/colors.dart';
import 'package:demo2/Screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'calculate_blood_pressure.dart';
import 'age_comparison.dart';
import 'package:get/get.dart';

/// Screen to display the result of blood pressure analysis.
class ResultScreen extends StatefulWidget {
  final String age;
  final String systolic;
  final String diastolic;

  /// Constructor for ResultScreen.
  ResultScreen({
    required this.age,
    required this.systolic,
    required this.diastolic,
  });

  @override
  _ResultScreenState createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  bool showAgeInfo = false;

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    BloodPressureCategory category = getBloodPressureCategory(
        int.parse(widget.systolic), int.parse(widget.diastolic));
    String categoryText = '';

    BloodPressureAgeCategory ageCategory =
        getBloodPressureCategoryForAge(int.parse(widget.age));

    switch (category) {
      case BloodPressureCategory.Normal:
        categoryText = 'Normal';
        break;
      case BloodPressureCategory.Elevated:
        categoryText = 'Elevated';
        break;
      case BloodPressureCategory.HypertensionStage1:
        categoryText = 'Hypertension Stage 1';
        break;
      case BloodPressureCategory.HypertensionStage2:
        categoryText = 'Hypertension Stage 2';
        break;
      case BloodPressureCategory.HypertensiveCrisis:
        categoryText = 'Hypertensive Crisis';
        break;
      default:
        categoryText = 'Unknown';
        break;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result', style: TextStyle(color: bgColor)),
        backgroundColor: borderColor,
        elevation: 1,
        iconTheme: const IconThemeData(color: bgColor),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('../../assets/Images/v870-tang-34.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Result Of Your Blood Sugar Level',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 15),
            Container(
              width: 370,
              height: 200,
              decoration: BoxDecoration(
                color: bgColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: borderColor,
                  width: 2,
                ),
                boxShadow: const [
                  BoxShadow(
                    color: wColor,
                  ),
                ],
              ),
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date: $formattedDate'),
                  const SizedBox(height: 5),
                  Text(
                    'Age: ${widget.age}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Blood Pressure: ${widget.systolic}/${widget.diastolic}',
                    style: const TextStyle(fontSize: 20),
                  ),
                  Text(
                    'Category: $categoryText',
                    style: const TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'How blood pressure should vary with age',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            SizedBox(
              width: 50,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showAgeInfo = !showAgeInfo;
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(wColor),
                ),
                child: const Text(
                  'Info',
                  style: TextStyle(color: bgColor, fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (showAgeInfo)
              Container(
                width: 370,
                height: 200,
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(
                    color: borderColor,
                    width: 2,
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: wColor,
                    ),
                  ],
                ),
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Age Category: ${ageCategory.name}',
                      style: const TextStyle(fontSize: 15),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Min: ${ageCategory.minSystolic}/${ageCategory.minDiastolic}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Normal: ${ageCategory.normalSystolic}/${ageCategory.normalDiastolic}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    Text(
                      'Max: ${ageCategory.maxSystolic}/${ageCategory.maxDiastolic}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
      // Bottom Navigation Bar
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
          if (index == 0) {
            Get.to(HomeScreen());
          }
        },
      ),
    );
  }
}
