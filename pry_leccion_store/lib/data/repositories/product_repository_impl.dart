import '../../domain/entities/product.dart';
import '../datasource/storeapi_datasource.dart';

class ProductRepositoryImpl {
  final StoreapiDatasource datasource;

  ProductRepositoryImpl(this.datasource);

  @override
  Future<List<Product>> getProducts() async {
    return await datasource.fetchProducts();
  }
}
