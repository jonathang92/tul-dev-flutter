// import 'dart:convert';

// Cart cartFromJson(String str) => Cart.fromJson(json.decode(str));

// String cartToJson(Cart data) => json.encode(data.toJson());

import 'package:tul_dev/models/product_model.dart';

class Cart extends Product {
  Cart({
    this.cartId,
    this.quantity,
  });

  int cartId;
  int quantity;

  // factory Cart.fromJson(Map<String, dynamic> json) => Cart(
  //       cartId: json["cart_id"],
  //       quantity: json["quantity"],
  //     );

  // Map<String, dynamic> toJson() => {
  //       "cart_id": cartId,
  //       "quantity": quantity,
  //     };
}
