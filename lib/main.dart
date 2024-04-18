import 'package:aviz_application/Constants/theme.dart';
import 'package:flutter/material.dart';
import 'DI/di.dart';
import 'features/welcome_screen.dart';

void main() async {
  await getInInit();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: appTheme(),
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: WelcomeScreen(),
        ),
      ),
    );
  }
}
