import 'dart:convert';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_svg/svg.dart';
import 'package:visitorsa/Screens/fav_screen.dart';
import 'package:visitorsa/Screens/profile_screen.dart';
import 'package:visitorsa/Screens/search_screen.dart';
import 'package:visitorsa/Screens/settings_screen.dart';
import 'package:visitorsa/utils/app_localizations.dart';
import 'package:visitorsa/utils/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _storage = FlutterSecureStorage();
  String key = 'cart';

  int _selectedTab = 0;
  TextEditingController searchKeyController = new TextEditingController();
  int _counter = 0;
  callback(int length) {
    setState(() {
      _counter = length;
    });
  }

  var appBarHeight = AppBar().preferredSize.height;

  @override
  Widget build(BuildContext context) {
    final _pageOptions = [
      SearchScreen(),
      ProfileScreen(),
      FavoriteScreen(),
      FavoriteScreen(),
      SettingsScreen(),

//      FirstHomeScreen(callback), //0
//      ServiceCategoriesScreen(callback), //1 service
//      ProductCategoriesScreen(callback), //2 products
//      WalletsScreen(),
//      SettingsScreen(callback),
    ];
    return Stack(
      children: [
        Image.asset(
          "images/blur_bg.jpg",
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            backgroundColor: Colors.transparent,
            appBar: AppBar(
                backgroundColor: AppColors.darkGreen,
                elevation: 0.0,
                centerTitle: true,
                title: Text(
                  'Visitor sa',
                  style: TextStyle(color: Colors.white),
                )),
            body: _pageOptions[_selectedTab],
            bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(
                // sets the background color of the `BottomNavigationBar`
                canvasColor: Colors.white,
              ),
              child: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: _selectedTab,
                onTap: (int index) {
                  setState(() {
                    _selectedTab = index;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/icon_search.svg',
                      height: 20.0,
                      width: 20.0,
                      color: Colors.grey,
                      allowDrawingOutsideViewBox: true,
                    ),
                    title: Text(
                      "",
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/icon_search.svg',
                      height: 20.0,
                      width: 20.0,
                      color: AppColors.lightGreen,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/icon_profile.svg',
                      height: 20.0,
                      width: 20.0,
                      color: Colors.grey,
                      allowDrawingOutsideViewBox: true,
                    ),
                    title: Text(
                      "",
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/icon_profile.svg',
                      height: 20.0,
                      width: 20.0,
                      color: AppColors.lightGreen,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/icon_fav.svg',
                      height: 20.0,
                      width: 20.0,
                      color: Colors.grey,
                      allowDrawingOutsideViewBox: true,
                    ),
                    title: Text(
                      "",
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/icon_fav.svg',
                      height: 20.0,
                      width: 20.0,
                      color: AppColors.lightGreen,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/icon_star.svg',
                      height: 20.0,
                      width: 20.0,
                      color: Colors.grey,
                      allowDrawingOutsideViewBox: true,
                    ),
                    title: Text(
                      "",
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/icon_star.svg',
                      height: 20.0,
                      width: 20.0,
                      color: AppColors.lightGreen,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                  BottomNavigationBarItem(
                    icon: SvgPicture.asset(
                      'images/icon_list.svg',
                      height: 20.0,
                      width: 20.0,
                      color: Colors.grey,
                      allowDrawingOutsideViewBox: true,
                    ),
                    title: Text(
                      "",
                    ),
                    activeIcon: SvgPicture.asset(
                      'images/icon_list.svg',
                      height: 20.0,
                      width: 20.0,
                      color: AppColors.lightGreen,
                      allowDrawingOutsideViewBox: true,
                    ),
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
