import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../models/item_model.dart';
import '../services/item_service.dart';
import 'home_screen.dart';
import 'profile_screen.dart';
import 'saved_screen.dart';
import 'search_screen.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  final ItemService _itemService = ItemService();
  List<Item> _items = [];

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _photoController = TextEditingController();
  final _typeController = TextEditingController();
  final _profileController = TextEditingController();
  final _categoryController = TextEditingController();
  final _lastSeenController = TextEditingController();
  final _lastLocationController = TextEditingController();
  final _isDoneController = TextEditingController();

  Future<void> _createItem() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final desc = _descController.text;
      final photo = _photoController.text;
      final type = _typeController.text;
      final profile = _profileController.text;
      final category = _categoryController.text;
      final last_seen = _lastSeenController.text;
      final last_location = _lastLocationController.text;
      final is_done = _isDoneController.text;
      try {
        final newItem = await _itemService.createItem(
          name: name,
          desc: desc,
          photo: photo,
          type: type,
          profile: profile,
          category: category,
          last_seen: last_seen,
          last_location: last_location,
          is_done: is_done,
        );
        setState(() async {
          _items.add(newItem);
        });
        _nameController.clear();
        _descController.clear();
        _photoController.clear();
        _typeController.clear();
        _profileController.clear();
        _categoryController.clear();
        _lastSeenController.clear();
        _lastLocationController.clear();
        _isDoneController.clear();
      } catch (e) {
        print(e);
      }
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
                        'Add item',
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
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10.0,
                        left: 30.0,
                        right: 30.0,
                      ),
                      child: Text(
                        'Upload Gambar',
                        style: TextStyle(
                          color: Color(0xFF000000),
                          fontFamily: 'Inter',
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.1,
                        ),
                      ),
                    ),
                    InkWell(
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 7.5,
                          left: 30.0,
                          right: 30.0,
                        ),
                        decoration: BoxDecoration(
                          color: Color(0xFFFFFFFF),
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        height: 125.0,
                        alignment: Alignment.center,
                        child: Icon(
                          CupertinoIcons.camera_fill,
                          size: 50.0,
                          color: Color(0xFFBDBDBD),
                        ),
                      ),
                    ),
                    customTextField(
                      'Nama Barang',
                      'Masukan Nama Barang',
                      50.0,
                      1,
                      _nameController,
                    ),
                    customTextField(
                      'Deskripsi Barang',
                      'Masukan Deskripsi Barang',
                      100.0,
                      4,
                      _descController,
                    ),
                    customTextField(
                      'Link Foto Barang',
                      'Masukan Foto Barang',
                      50.0,
                      1,
                      _photoController,
                    ),
                    customTextField(
                      'Tipe Barang',
                      'Masukan Tipe Barang',
                      50.0,
                      1,
                      _typeController,
                    ),
                    customTextField(
                      'Profil',
                      'Masukan Profil',
                      50.0,
                      1,
                      _profileController,
                    ),
                    customTextField(
                      'Kategori Barang',
                      'Masukan Kategori Barang',
                      50.0,
                      1,
                      _categoryController,
                    ),
                    customTextField(
                      'Tanggal Terakhir Dilihat',
                      'Masukan Tanggal Terakhir Dilihat',
                      50.0,
                      1,
                      _lastSeenController,
                    ),
                    customTextField(
                      'Lokasi Terakhir Dilihat',
                      'Masukan Lokasi Terakhir Dilihat',
                      75.0,
                      2,
                      _lastLocationController,
                    ),
                    customTextField(
                      'Status',
                      'Masukan Status',
                      50.0,
                      1,
                      _isDoneController,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 20.0,
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
                                Color(0xFFDB2542),
                                Color(0xFFF36C2E),
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
                                'Kirim',
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
                        onTap: () {
                          _createItem();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        bottom: 100.0,
                      ),
                    )
                  ],
                ),
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
                Color(0xFFDB2542),
                Color(0xFFF36C2E),
                'assets/icons/add-icon.svg',
                Color(0xFFFBE1E5),
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

Widget customTextField(
  String labelText,
  String hintText,
  double height,
  int maxLines,
  TextEditingController textController,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        margin: EdgeInsets.only(
          top: 10.0,
          left: 30.0,
          right: 30.0,
        ),
        child: Text(
          labelText,
          style: TextStyle(
            color: Color(0xFF000000),
            fontFamily: 'Inter',
            fontSize: 13.0,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.1,
          ),
        ),
      ),
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
        height: height,
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
          borderRadius: BorderRadius.circular(15.0),
        ),
        alignment: Alignment.centerLeft,
        child: TextField(
          maxLines: maxLines,
          controller: textController,
          decoration: InputDecoration.collapsed(
            hintText: hintText,
            hintStyle: TextStyle(
              color: Color(0xFF9E9E9E),
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
  );
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
