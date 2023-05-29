import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../models/item_model.dart';
import 'home_screen.dart';
import 'saved_screen.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    Key? key,
    required this.item,
  }) : super(key: key);

  final Item item;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 60.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFDB2542),
                            Color(0xFFF36C2E),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 20.0,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 2.0,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/chevron-left-icon.svg',
                          width: 20.0,
                          height: 20.0,
                          colorFilter: ColorFilter.mode(
                            Color(0xFFFBE1E5),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => HomeScreen(),
                        ),
                      );
                    },
                  ),
                  InkWell(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 50.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [
                            Color(0xFFFBE1E5),
                            Color(0xFFFBE1E5),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 15.0,
                        horizontal: 15.0,
                      ),
                      child: Container(
                        margin: EdgeInsets.only(
                          right: 2.0,
                        ),
                        child: SvgPicture.asset(
                          'assets/icons/star-icon.svg',
                          width: 20.0,
                          height: 20.0,
                          colorFilter: ColorFilter.mode(
                            Color(0xFFDB2542),
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SavedScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 30.0,
                  left: 30.0,
                  right: 30.0,
                  bottom: 20.0,
                ),
                height: 325.0,
                decoration: BoxDecoration(
                  color: Color(0xFFFBE1E5),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.item.photo,
                    ),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  bottom: 10.0,
                ),
                child: Text(
                  widget.item.name,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 32.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 5.0,
                          left: 30.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          'Status',
                          style: TextStyle(
                            color: Color(0xFF212121),
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 30.0,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 15.0,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: widget.item.is_done == 'Selesai'
                              ? Colors.teal.shade100
                              : Color(0xFFFBE1E5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          widget.item.is_done,
                          style: TextStyle(
                            color: widget.item.is_done == 'Selesai'
                                ? Colors.teal.shade600
                                : Color(0xFFDB2542),
                            fontFamily: 'Inter',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                          top: 5.0,
                          left: 15.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          'Barang',
                          style: TextStyle(
                            color: Color(0xFF212121),
                            fontFamily: 'Inter',
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          left: 15.0,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        decoration: BoxDecoration(
                          color: widget.item.type == 'Ditemukan'
                              ? Colors.teal.shade100
                              : Color(0xFFFBE1E5),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        child: Text(
                          widget.item.type,
                          style: TextStyle(
                            color: widget.item.type == 'Ditemukan'
                                ? Colors.teal.shade600
                                : Color(0xFFDB2542),
                            fontFamily: 'Inter',
                            fontSize: 15.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  left: 30.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Kategori',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
                child: Text(
                  widget.item.category,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  left: 30.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Pelapor',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
                child: Text(
                  widget.item.profile,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  left: 30.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Terlihat terakhir',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
                child: Text(
                  widget.item.last_seen,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  left: 30.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Lokasi terakhir',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                ),
                child: Text(
                  widget.item.last_location,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  top: 10.0,
                  left: 30.0,
                  bottom: 5.0,
                ),
                child: Text(
                  'Deskripsi',
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 30.0,
                  right: 30.0,
                  bottom: 105.0,
                ),
                child: Text(
                  widget.item.desc,
                  style: TextStyle(
                    color: Color(0xFF212121),
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 0.1,
                  ),
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
        child: InkWell(
          child: Container(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 3.5,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Colors.teal.shade900,
                  Colors.teal.shade800,
                ],
              ),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Tanya ke WhatsApp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFFFFFFF),
                    fontFamily: 'Inter',
                    fontSize: 15.0,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 0.1,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      extendBody: true,
    );
  }
}
