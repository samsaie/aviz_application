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
    return const MaterialApp(
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: WelcomeScreen(),
        ),
      ),
    );
  }
}
