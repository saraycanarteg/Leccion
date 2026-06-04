import 'package:flutter/material.dart';
import '../../domain/entities/product.dart';
import '../../domain/usecases/get_products_usecase.dart';

class ProductViewModel extends ChangeNotifier {
  final GetProductsUseCase getProductsUseCase;

  ProductViewModel(this.getProductsUseCase);

  List<Product> products = [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadProducts() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      products = await getProductsUseCase();
    } catch (e) {
      errorMessage = "Error al cargar productos: $e";
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
