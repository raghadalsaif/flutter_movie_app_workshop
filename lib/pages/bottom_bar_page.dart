import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/pages/favorites_page.dart';
import 'package:movie_app/pages/home_page.dart';
import 'package:movie_app/utils/theme/app_colors.dart';

class BottomBarPage extends StatefulWidget {
  const BottomBarPage({Key? key}) : super(key: key);

  @override
  State<BottomBarPage> createState() => _BottomBarPageState();
}

class _BottomBarPageState extends State<BottomBarPage>
    with SingleTickerProviderStateMixin {
  int _bottomNavIndex = 0; //default index of a first screen
  final tabsData = {
    "Movies": 'assets/images/popcorn_icon.svg',
    "Favorites": 'assets/images/like_icon.svg',
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBody: true,
      floatingActionButton: FloatingActionButton(
        elevation: 3,
        backgroundColor: AppColors.lightBlue,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(
            'assets/images/fire_icon.svg',
          ),
        ),
        onPressed: () {},
      ),
      body: IndexedStack(
        index: _bottomNavIndex,
        children: const [HomePage(), FavoritesPage()],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: tabsData.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.white : AppColors.darkGray;
          return Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                SvgPicture.asset(
                  tabsData.values.toList()[index],
                  color: color,
                ),
                Text(
                  tabsData.keys.toList()[index],
                  style: TextStyle(color: color),
                )
              ],
            ),
          );
        },
        backgroundColor: AppColors.primary,
        activeIndex: _bottomNavIndex,
        splashColor: AppColors.lightGray,
        splashSpeedInMilliseconds: 300,
        height: 70,
        shadow: Shadow(
          color: AppColors.lightBlue.withOpacity(0.5),
          blurRadius: 5,
        ),
        leftCornerRadius: 15,
        rightCornerRadius: 15,
        splashRadius: 10,
        notchSmoothness: NotchSmoothness.smoothEdge,
        notchMargin: 10,
        gapLocation: GapLocation.center,
        onTap: (index) => setState(() => _bottomNavIndex = index),
      ),
    );
  }
}
