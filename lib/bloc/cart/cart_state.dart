part of 'cart_bloc.dart';

class CartState {
  final List<Cart> cart;
  CartState({List<Cart> cart}) : cart = cart ?? [];
  CartState copyWith({
    List<Cart> cart,
  }) =>
      CartState(
        cart: cart ?? this.cart,
      );
}
