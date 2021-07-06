import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:tul_dev/models/cart_model.dart';
import 'package:tul_dev/models/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState());

  @override
  Stream<CartState> mapEventToState(
    CartEvent event,
  ) async* {
    if (event is AddToCartEvent) {
      final List<Cart> cart = state.cart;

      final int i = cart.lastIndexWhere((el) => el.id == event.product.id);
      if (i != -1) {
        cart[i].quantity += event.quantity;
      } else {
        final p = new Cart();
        p.name = event.product.name;
        p.description = event.product.description;
        p.sku = event.product.sku;
        p.id = event.product.id;
        p.quantity = event.quantity;
        p.cartId = event.cardId;
        cart.add(p);
      }
      yield CartState(cart: cart);
    } else if (event is RemoveFromCartEvent) {
      final List<Cart> cart = state.cart;
      cart.removeWhere((element) => element.id == event.id);
      yield state.copyWith(
        cart: cart,
      );
    } else if (event is DeleteCartEvent) {
      yield CartState(cart: []);
    }
  }
}
