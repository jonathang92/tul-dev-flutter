part of 'product_bloc.dart';

class ProductState {
  final List<Product> products;

  ProductState({List<Product> products}) : products = products ?? [];
  ProductState copyWith({
    List<Product> products,
  }) =>
      ProductState(
        products: products ?? this.products,
      );
}
