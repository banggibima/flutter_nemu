import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/item_model.dart';
import '../services/item_service.dart';
import 'add_screen.dart';
import 'detail_screen.dart';
import 'profile_screen.dart';
import 'saved_screen.dart';
import 'search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ItemService _itemService = ItemService();
  List<Item> _items = [];

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
      });
    } catch (e) {
      print(e);
    }
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
                        'Find your lost item',
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
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 20.0,
              //     left: 30.0,
              //     right: 30.0,
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     crossAxisAlignment: CrossAxisAlignment.end,
              //     children: [
              //       Text(
              //         'Newsest Item',
              //         style: TextStyle(
              //           fontSize: 18.0,
              //           fontWeight: FontWeight.w600,
              //           color: Color(0xFFDB2542),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   margin: EdgeInsets.only(
              //     top: 15.0,
              //     left: 30.0,
              //     right: 30.0,
              //   ),
              //   height: 200.0,
              //   child: GridView.builder(
              //     scrollDirection: Axis.horizontal,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //       crossAxisCount: 1,
              //       mainAxisSpacing: 15.0,
              //       crossAxisSpacing: 10.0,
              //       childAspectRatio: 1.5,
              //     ),
              //     itemCount: _items.length,
              //     itemBuilder: (BuildContext context, int index) {
              //       final Item item = _items[index];
              //       return InkWell(
              //         child: Container(
              //           decoration: BoxDecoration(
              //             color: Color(0xFFFBE1E5),
              //             image: DecorationImage(
              //               image: NetworkImage(
              //                 item.photo,
              //               ),
              //               fit: BoxFit.cover,
              //             ),
              //             borderRadius: BorderRadius.circular(20.0),
              //           ),
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.end,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: [
              //               Container(
              //                 decoration: BoxDecoration(
              //                   color: Color(0xFFFFFFFF),
              //                   borderRadius: BorderRadius.circular(15.0),
              //                 ),
              //                 padding: EdgeInsets.symmetric(
              //                   horizontal: 20.0,
              //                   vertical: 10.0,
              //                 ),
              //                 margin: EdgeInsets.only(
              //                   bottom: 15.0,
              //                   left: 15.0,
              //                   right: 15.0,
              //                 ),
              //                 child: Column(
              //                   crossAxisAlignment: CrossAxisAlignment.start,
              //                   children: [
              //                     Text(
              //                       item.name,
              //                       style: TextStyle(
              //                         fontSize: 14.0,
              //                         fontWeight: FontWeight.w600,
              //                         color: Color(0xFF212121),
              //                       ),
              //                     ),
              //                   ],
              //                 ),
              //               ),
              //             ],
              //           ),
              //         ),
              //         onTap: () {
              //           Navigator.push(
              //             context,
              //             MaterialPageRoute(
              //               builder: (context) => DetailScreen(
              //                 item: item,
              //               ),
              //             ),
              //           );
              //         },
              //       );
              //     },
              //   ),
              // ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  left: 30.0,
                  right: 30.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Discover',
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFDB2542),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 15.0,
                  left: 30.0,
                  right: 30.0,
                ),
                height: 505.0,
                child: GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.0,
                    crossAxisSpacing: 15.0,
                    childAspectRatio: 1.0,
                  ),
                  itemCount: _items.length,
                  itemBuilder: (BuildContext context, int index) {
                    final Item item = _items[index];
                    return InkWell(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFFBE1E5),
                          image: DecorationImage(
                            image: NetworkImage(
                              item.photo,
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              padding: EdgeInsets.symmetric(
                                horizontal: 20.0,
                                vertical: 10.0,
                              ),
                              margin: EdgeInsets.only(
                                bottom: 15.0,
                                left: 15.0,
                                right: 15.0,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    item.name,
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF212121),
                                    ),
                                  ),
                                  Text(
                                    item.category,
                                    style: TextStyle(
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xFF212121),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(
                              item: item,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Container(
                height: 100.0,
              )
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
            horizontal: 2.5,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomBarLink(
                context,
                Color(0xFFDB2542),
                Color(0xFFF36C2E),
                'assets/icons/home-icon.svg',
                Color(0xFFFBE1E5),
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
