import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'result_page.dart';
import 'package:device_preview/device_preview.dart';

void main() => runApp(DevicePreview(
    enabled: !kReleaseMode, builder: (context) => BMICalculator()));

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      theme: ThemeData(
        primaryColor: Colors.red,
        backgroundColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        textTheme: const TextTheme(bodyText1: TextStyle(color: Colors.white)),
      ),
      home: InputPage(),
    );
  }
}
