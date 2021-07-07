import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_dev/bloc/cart/cart_bloc.dart';
import 'package:tul_dev/widgets/product_element.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(builder: (context, state) {
      int itemCount() {
        int c = 0;
        state.cart.forEach((element) {
          c += element.quantity;
        });
        return c;
      }

      return Scaffold(
        appBar: AppBar(
          title: Row(
            children: [
              Icon(Icons.shopping_cart),
              SizedBox(width: 10),
              if (state.cart.length == 0) Text('Cart'),
              if (state.cart.length > 0)
                Text('Cart (${itemCount().toString()} items)'),
            ],
          ),
          backgroundColor: Color(0xff2a5c57),
        ),
        body: Container(
          color: Colors.grey[300],
          child: Column(
            children: [
              if (state.cart.length > 0)
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.cart.length,
                    itemBuilder: (c, i) {
                      return ProductElement(cart: true, product: state.cart[i]);
                    },
                  ),
                ),
              if (state.cart.length == 0)
                Expanded(
                    child: Center(
                        child: Text(
                  'No Items in cart :(',
                  style: TextStyle(fontSize: 40),
                ))),
              if (state.cart.length > 0) BottomAction()
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
