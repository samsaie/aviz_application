import 'package:flutter/material.dart';

import '../Constants/color.dart';
import '../Constants/theme.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 32),
        TextField(
          onChanged: (value) {},
          textDirection: TextDirection.rtl,
          textAlign: TextAlign.start,
          cursorColor: AppColors.borderGrey,
          decoration: InputDecoration(
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            suffixIcon: Image.asset('assets/images/search_icon.png'),
            hintTextDirection: TextDirection.rtl,
            hintText: 'جستجو...',
            hintStyle: appTheme().textTheme.titleMedium,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.backgroundGrey,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4),
              borderSide: const BorderSide(
                color: AppColors.backgroundGrey,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
