import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Constants/color.dart';
import '../Constants/theme.dart';
import '../features/dashboard_screen.dart';

Widget searchAppBar() {
  return AppBar(
    title: Image.asset('assets/images/logo_type.png'),
  );
}

Widget profileAppBar() {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/logo_with_not_background.png'),
        Text(
          'من',
          style: TextStyle(
            fontFamily: appTheme().textTheme.titleMedium!.fontFamily,
            fontSize: 18,
            color: AppColors.red,
          ),
        )
      ],
    ),
    centerTitle: true,
    elevation: 0,
    backgroundColor: Colors.transparent,
    scrolledUnderElevation: 0,
  );
}

class CategoryAppBar extends StatelessWidget {
  const CategoryAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_type.png'),
          Text('دسته بندی ',
              style:
                  appTheme().textTheme.titleLarge!.apply(color: AppColors.red))
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          },
          child: const Icon(CupertinoIcons.clear),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class AddAppBar extends StatelessWidget {
  const AddAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/images/logo_type.png'),
          Text('ثبت ',
              style:
                  appTheme().textTheme.titleLarge!.apply(color: AppColors.red))
        ],
      ),
      automaticallyImplyLeading: false,
      actions: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const DashboardScreen(),
              ),
            );
          },
          child: const Icon(CupertinoIcons.clear),
        ),
      ],
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: Image.asset('assets/images/logo_with_not_background.png'),
      centerTitle: true,
      backgroundColor: Colors.transparent,
    );
  }
}

class DetailAppBar extends StatefulWidget {
  const DetailAppBar({super.key});

  @override
  State<DetailAppBar> createState() => _DetailAppBarState();
}

class _DetailAppBarState extends State<DetailAppBar> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Information',
                ),
                content: const Text(
                  'Info of this Ad',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Center(
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Ok')),
                  )
                ],
              ),
            );
          },
          icon: Image.asset('assets/images/information_icon.png'),
        ),
        IconButton(
          onPressed: () {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'Share',
                ),
                content: const Text(
                  'Share this Ad',
                  textAlign: TextAlign.center,
                ),
                actions: [
                  Center(
                    child: TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Ok')),
                  )
                ],
              ),
            );
          },
          icon: Image.asset('assets/images/share_icon.png'),
        ),
        IconButton(
          icon: clicked
              ? Image.asset(
                  'assets/images/save_icon.png',
                  color: AppColors.red,
                )
              : Image.asset('assets/images/save_icon.png'),
          onPressed: () {
            setState(() {
              clicked = clicked;
            });
          },
        ),
      ],
    );
  }
}
