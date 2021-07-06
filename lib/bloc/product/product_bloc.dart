import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tul_dev/models/product_model.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductState());

  @override
  Stream<ProductState> mapEventToState(
    ProductEvent event,
  ) async* {
    if (event is InitProductEvent) {
      // state.products is final
      final List<Product> p = state.products;

      if (p.length != 0) yield ProductState(products: []);
      p.addAll(event.products);
      yield state.copyWith(
        products: p,
      );
    }
  }
}
