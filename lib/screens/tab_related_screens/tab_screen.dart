import 'package:fitnessapp/model/user.dart';
import 'package:fitnessapp/screens/tab_related_screens/account_details.dart';
import 'package:fitnessapp/screens/tab_related_screens/activity_screen.dart';
import 'package:fitnessapp/screens/tab_related_screens/home_screen.dart';
import 'package:fitnessapp/screens/tab_related_screens/training_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({super.key, required this.currentUser, this.isPremium});
  final UserData currentUser;
  final bool? isPremium;

  @override
  State<TabScreen> createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _selectedPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen(
      currentUser: widget.currentUser,
    );

    if (_selectedPageIndex == 1) {
      activePage = TrainingScreen(
        userTrainingLevel: widget.currentUser.trainingLevel!,
      );
    }
    if (_selectedPageIndex == 2) {
      activePage = const ActivityScreen();
    }
    if (_selectedPageIndex == 3) {
      activePage = AccountDetails(
        isPremium: widget.isPremium == null ? false : widget.isPremium!,
        currentUser: widget.currentUser,
      );
    }

    void selectPage(int index) {
      setState(() {
        _selectedPageIndex = index;
      });
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: selectPage,
        currentIndex: _selectedPageIndex,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        type: BottomNavigationBarType.fixed,
        unselectedFontSize: 10,
        fixedColor: const Color.fromARGB(255, 208, 49, 25),
        items: [
          _buildBottomNavigationBarItem(
            label: 'Home',
            icon: 'assets/images/img_home_1.svg',
            activeIcon: 'assets/images/img_home.svg',
          ),
          _buildBottomNavigationBarItem(
            label: 'Training',
            icon: 'assets/images/img_checkmark_1.svg',
            activeIcon: 'assets/images/img_settings_23X23.svg',
          ),
          _buildBottomNavigationBarItem(
            label: 'Activity',
            icon: 'assets/images/img_clock_23X23.svg',
            activeIcon: 'assets/images/img_fingerprint.svg',
          ),
          _buildBottomNavigationBarItem(
            label: 'Account',
            icon: 'assets/images/img_user.svg',
            activeIcon: 'assets/images/img_user_23X18.svg',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String label,
    required String icon,
    required String activeIcon,
  }) {
    return BottomNavigationBarItem(
      label: label,
      icon: Column(
        children: [
          SvgPicture.asset(
            icon,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ),
        ],
      ),
      activeIcon: Column(
        children: [
          SvgPicture.asset(
            activeIcon,
            fit: BoxFit.fitWidth,
            alignment: Alignment.center,
          ), // Adjust the space between icon and label
        ],
      ),
    );
  }
}
