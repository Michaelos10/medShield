import 'package:flutter/material.dart';
import 'package:medshield/screens/input_page.dart';
import 'package:device_preview/device_preview.dart'; // Helper method for reusable text boxes

// void main() => runApp(
//       DevicePreview(
//         enabled: true, // Set to true to enable DevicePreview
//         builder: (context) => BMICalculator(), // Your app widget
//       ),
//     );
void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      title: 'MedShield',
      home: InputPage(),
    );
  }
}
