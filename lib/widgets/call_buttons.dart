import 'package:flutter/material.dart';

import '../Constants/color.dart';

class CallButtons extends StatelessWidget {
  const CallButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SizedBox(
          height: 50,
          width: 180,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/message_icon.png'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'گفتگو',
                  style: TextStyle(fontFamily: 'sm', fontSize: 16),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 50,
          width: 180,
          child: TextButton(
            style: TextButton.styleFrom(
                backgroundColor: AppColors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6))),
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/call_icon.png'),
                const SizedBox(
                  width: 10,
                ),
                const Text(
                  'اطلاعات تماس',
                  style: TextStyle(fontFamily: 'sm', fontSize: 16),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
