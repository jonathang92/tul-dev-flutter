part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final Product product;
  final int cardId;
  final int quantity;
  AddToCartEvent({this.product, this.cardId, this.quantity});
}

class RemoveFromCartEvent extends CartEvent {
  final int id;
  RemoveFromCartEvent(this.id);
}

class DeleteCartEvent extends CartEvent {}
