import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_dev/bloc/cart/cart_bloc.dart';
import 'package:tul_dev/widgets/product_element.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 10),
              Text('Cart'),
            ],
          ),
          backgroundColor: Color(0xff2a5c57),
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: state.cart.length,
                  itemBuilder: (c, i) {
                    return ProductElement(cart: true, product: state.cart[i]);
                  },
                ),
              ),
              BottomAction()
            ],
          ),
        ),
      );
    });
  }
}

class BottomAction extends StatelessWidget {
  const BottomAction({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ActionButton(
            icon: Icons.done_outline_outlined,
            text: 'Create Order',
            action: () {},
          ),
          ActionButton(
              icon: Icons.delete_sharp,
              text: 'Delete Cart',
              action: () {
                cartBloc.add(DeleteCartEvent());
              }),
        ],
      ),
    );
  }
}
