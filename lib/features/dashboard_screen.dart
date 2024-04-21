import 'package:flutter/material.dart';
import '../Constants/color.dart';
import 'add_promotion/view/category_screen.dart';
import 'home/view/home_screen.dart';
import 'profile/view/profile_screen.dart';
import 'search/view/search_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int selectedBottomNavigationIndex = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: IndexedStack(
            index: selectedBottomNavigationIndex,
            children: getScreen(),
          ),
          bottomNavigationBar: ClipRRect(
            child: BottomNavigationBar(
              onTap: (int index) {
                setState(() {
                  selectedBottomNavigationIndex = index;
                });
              },
              currentIndex: selectedBottomNavigationIndex,
              type: BottomNavigationBarType.fixed,
              backgroundColor: AppColors.grey200,
              elevation: 0,
              selectedItemColor: AppColors.red,
              unselectedItemColor: AppColors.grey400,
              selectedFontSize: 14,
              unselectedFontSize: 14,
              selectedLabelStyle: const TextStyle(
                fontFamily: 'sm',
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: 'sm',
              ),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/inactive_home_icon.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      child: Image.asset('assets/images/active_home_icon.png'),
                    ),
                  ),
                  label: 'آویز آگهی ها',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child:
                        Image.asset('assets/images/inactive_search_icon.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      child:
                          Image.asset('assets/images/active_search_icon.png'),
                    ),
                  ),
                  label: 'جستجو',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Image.asset('assets/images/inactive_add_icon.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      child: Image.asset('assets/images/active_add_icon.png'),
                    ),
                  ),
                  label: 'افزودن آویز',
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child:
                        Image.asset('assets/images/inactive_setting_icon.png'),
                  ),
                  activeIcon: Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: SizedBox(
                      child:
                          Image.asset('assets/images/active_setting_icon.png'),
                    ),
                  ),
                  label: 'آویز من',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

List<Widget> getScreen() {
  return <Widget>[
    const HomeScreen(),
    const SearchScreen(),
    const CategoryScreen(),
    const ProfileScreen()
  ];
}
