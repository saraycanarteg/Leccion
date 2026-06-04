import '../entities/product.dart';
import '../../data/repositories/product_repository_impl.dart';

class GetProductsUseCase {
  final ProductRepositoryImpl repository;

  GetProductsUseCase(this.repository);

  Future<List<Product>> call() {
    return repository.getProducts();
  }
}
