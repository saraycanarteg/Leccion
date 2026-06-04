import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/store_model.dart';

class StoreapiDatasource {
  final String baseUrl = 'https://fakestoreapi.com/products';

  Future<List<StoreModel>> fetchProducts() async {
    final url = Uri.parse("$baseUrl?limit=10");
    final resp = await http.get(url);

    if (resp.statusCode != 200) {
      throw Exception("Error al cargar productos");
    }

    final List<dynamic> data = jsonDecode(resp.body);
    
    return data.map((e) => StoreModel.fromJson(e)).toList();
  }
}
