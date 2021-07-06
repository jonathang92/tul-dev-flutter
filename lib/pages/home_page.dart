import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () => Navigator.pushNamed(context, 'cart'))
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
