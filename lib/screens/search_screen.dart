import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/item_model.dart';
import '../services/item_service.dart';
import 'add_screen.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'saved_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final ItemService _itemService = ItemService();
  List<Item> _items = [];
  List<Item> _filteredItems = [];

  @override
  void initState() {
    super.initState();
    fetchItems();
  }

  Future<void> fetchItems() async {
    try {
      List<Item> items = await _itemService.fetchItems();
      setState(() {
        _items = items;
        _filteredItems = items;
      });
    } catch (e) {
      print(e);
    }
  }

  void filterItems(String query) {
    setState(() {
      _filteredItems = _itemService.searchItems(_items, query);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 60.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 200.0,
                      child: Text(
                        'Search',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Inter',
                          fontSize: 38.0,
                          fontWeight: FontWeight.w800,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 7.5,
                          left: 30.0,
                          right: 30.0,
                        ),
                        padding: EdgeInsets.symmetric(
                          vertical: 12.5,
                          horizontal: 17.5,
                        ),
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        alignment: Alignment.centerLeft,
                        child: TextField(
                          maxLines: 1,
                          onChanged: filterItems,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Type here to search',
                            hintStyle: TextStyle(
                              color: Color(0xFFBDBDBD),
                              fontFamily: 'Inter',
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              letterSpacing: 0.1,
                            ),
                          ),
                          style: TextStyle(
                            color: Color(0xFF000000),
                            fontFamily: 'Inter',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15.0,
                  left: 30.0,
                  right: 30.0,
                ),
                height: 620.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: _filteredItems.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Item item = _filteredItems[index];
                    return Container(
                      margin: EdgeInsets.only(
                        bottom: 10.0,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                        horizontal: 10.0,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 75.0,
                            height: 75.0,
                            decoration: BoxDecoration(
                              color: Color(0xFFE0E0E0),
                              borderRadius: BorderRadius.circular(15.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.network(
                                item.photo,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              left: 15.0,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    item.name,
                                    style: TextStyle(
                                      color: Color(0xFF000000),
                                      fontFamily: 'Inter',
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.1,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                    top: 5.0,
                                  ),
                                  width: 150.0,
                                  child: Text(
                                    item.category,
                                    style: TextStyle(
                                      color: Color(0xFF9E9E9E),
                                      fontFamily: 'Inter',
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400,
                                      letterSpacing: 0.1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 100.0,
                ),
              ),
            ],
          ),
        ],
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
                Color(0xFFDB2542),
                Color(0xFFF36C2E),
                'assets/icons/search-icon.svg',
                Color(0xFFFBE1E5),
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
                Color(0xFFFBE1E5),
                Color(0xFFFBE1E5),
                'assets/icons/star-icon.svg',
                Color(0xFFDB2542),
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
