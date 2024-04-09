import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/color.dart';
import '../../dashboard_screen.dart';

class AddScreen extends StatelessWidget {
  const AddScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
              );
            },
            child: const Icon(CupertinoIcons.clear),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const DashboardScreen(),
                  ),
                );
              },
              icon: const Icon(CupertinoIcons.right_chevron),
            ),
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo_type.png'),
              const Text(
                'دسته بندی ',
                style: TextStyle(
                    fontFamily: 'sm', fontSize: 16, color: AppColors.red),
              )
            ],
          ),
        ),
      ),
    );
  }
}
