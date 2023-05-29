import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'add_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'search_screen.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SavedScreen> createState() => _SavedScreenState();
}

class _SavedScreenState extends State<SavedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [],
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(
          vertical: 30.0,
          horizontal: 40.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Color(0xFFE0E0E0),
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(0.0, 0.0),
            ),
          ],
        ),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 10.0,
          ),
          padding: EdgeInsets.symmetric(
            vertical: 10.0,
            horizontal: 3.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomBarLink(
                context,
                Color(0xFFFBE1E5),
                Color(0xFFFBE1E5),
                'assets/icons/home-icon.svg',
                Color(0xFFDB2542),
                HomeScreen(),
              ),
              bottomBarLink(
                context,
                Color(0xFFFBE1E5),
                Color(0xFFFBE1E5),
                'assets/icons/search-icon.svg',
                Color(0xFFDB2542),
                SearchScreen(),
              ),
              bottomBarLink(
                context,
                Color(0xFFFBE1E5),
                Color(0xFFFBE1E5),
                'assets/icons/add-icon.svg',
                Color(0xFFDB2542),
                AddScreen(),
              ),
              bottomBarLink(
                context,
                Color(0xFFDB2542),
                Color(0xFFF36C2E),
                'assets/icons/star-icon.svg',
                Color(0xFFFBE1E5),
                SavedScreen(),
              ),
              bottomBarLink(
                context,
                Color(0xFFFBE1E5),
                Color(0xFFFBE1E5),
                'assets/icons/profile-icon.svg',
                Color(0xFFDB2542),
                ProfileScreen(),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }
}

Widget bottomBarLink(
  BuildContext context,
  Color colorOne,
  Color colorTwo,
  String icon,
  Color iconColor,
  Widget route,
) {
  return InkWell(
    child: Container(
      padding: EdgeInsets.symmetric(
        vertical: 15.0,
        horizontal: 15.0,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            colorOne,
            colorTwo,
          ],
        ),
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: SvgPicture.asset(
        icon,
        height: 20.0,
        colorFilter: ColorFilter.mode(
          iconColor,
          BlendMode.srcIn,
        ),
      ),
    ),
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => route,
        ),
      );
    },
  );
}
