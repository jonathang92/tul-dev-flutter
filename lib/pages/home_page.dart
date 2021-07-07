import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_dev/bloc/cart/cart_bloc.dart';
import 'package:tul_dev/bloc/product/product_bloc.dart';
import 'package:tul_dev/widgets/product_element.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        // get products from Firebase
        final productBloc = BlocProvider.of<ProductBloc>(context);
        productBloc.add(InitProductEvent());
        return Scaffold(
          appBar: AppBar(
            title: Text('Tül-dev'),
            backgroundColor: Color(0xff2a5c57),
            actions: [
              // ActionButton(
              //   icon: Icons.logout,
              //   text: 'Logout',
              //   action: () => Navigator.pushNamed(context, 'login'),
              // ),
              ActionButton(
                icon: Icons.login,
                text: 'Login',
                action: () => Navigator.pushNamed(context, 'login'),
              ),
              SizedBox(
                width: 5,
              ),
              ActionButton(
                icon: Icons.group_add,
                text: 'Register',
                action: () => Navigator.pushNamed(context, 'register'),
              ),
              SizedBox(
                width: 5,
              ),
              CartButton()
            ],
          ),
          body: Container(
            color: Colors.grey[300],
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemCount: state.products.length,
              itemBuilder: (c, i) {
                return ProductElement(product: state.products[i]);
              },
            ),
          ),
        );
      },
    );
  }
}

class CartButton extends StatelessWidget {
  const CartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartBloc, CartState>(
      builder: (contex, state) {
        int itemCount() {
          int c = 0;
          state.cart.forEach((element) {
            c += element.quantity;
          });
          return c;
        }

        return Stack(
          children: [
            IconButton(
                icon: Icon(Icons.shopping_cart_outlined),
                onPressed: () => Navigator.pushNamed(context, 'cart')),
            if (state.cart.length > 0)
              new Positioned(
                right: 7,
                top: 7,
                child: new Container(
                  padding: EdgeInsets.all(2),
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: new Text(
                    itemCount().toString(),
                    style: new TextStyle(
                      color: Colors.white,
                      fontSize: 7,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              )
          ],
        );
      },
    );
  }
}

class ActionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function action;
  const ActionButton({
    @required this.text,
    @required this.icon,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
      onPressed: action,
    );
  }
}
