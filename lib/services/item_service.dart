import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/item_model.dart';

class ItemService {
  String apiUrl = 'http://localhost:8000/api/items';

  Future<List<Item>> fetchItems() async {
    final response = await http.get(
      Uri.parse(apiUrl),
    );
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Item.fromJson(json)).toList();
    } else {
      throw Exception('Failed to fetch items');
    }
  }

  Future<Item> createItem({
    required String name,
    required String desc,
    required String photo,
    required String type,
    required String profile,
    required String category,
    required String last_seen,
    required String last_location,
    required String is_done,
  }) async {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'desc': desc,
        'photo': photo,
        'type': type,
        'profile': profile,
        'category': category,
        'last_seen': last_seen,
        'last_location': last_location,
        'is_done': is_done,
      }),
    );
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to create item');
    }
  }

  Future<Item> fetchItemById(int id) async {
    final response = await http.get(
      Uri.parse('$apiUrl/$id'),
    );
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to fetch item');
    }
  }

  Future<Item> updateItem({
    required int id,
    required String name,
    required String desc,
    required String photo,
    required String type,
    required String profile,
    required String category,
    required String last_seen,
    required String last_location,
    required String is_done,
  }) async {
    final response = await http.put(
      Uri.parse('$apiUrl/$id'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'desc': desc,
        'photo': photo,
        'type': type,
        'profile': profile,
        'category': category,
        'last_seen': last_seen,
        'last_location': last_location,
        'is_done': is_done,
      }),
    );
    if (response.statusCode == 200) {
      return Item.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to update item');
    }
  }

  Future<void> deleteItemById(int id) async {
    final response = await http.delete(
      Uri.parse('$apiUrl/$id'),
    );
    if (response.statusCode != 204) {
      throw Exception('Failed to delete item');
    }
  }

  List<Item> searchItems(List<Item> items, String query) {
    return items
        .where((item) => item.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
