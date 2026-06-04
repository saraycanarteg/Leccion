import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'data/datasource/storeapi_datasource.dart';
import 'data/repositories/product_repository_impl.dart';
import 'domain/usecases/get_products_usecase.dart';
import 'presentation/viewmodels/product_viewmodel.dart';
import 'presentation/routes/app_routes.dart';

void main() {
  final datasource = StoreapiDatasource();
  final repository = ProductRepositoryImpl(datasource);
  final usecase = GetProductsUseCase(repository);

  runApp(MyApp(usecase: usecase));
}

class MyApp extends StatelessWidget {
  final GetProductsUseCase usecase;

  const MyApp({super.key, required this.usecase});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductViewModel(usecase)),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Fake Store',
        routes: AppRoutes().routes,
        initialRoute: "/",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
      ),
    );
  }
}
