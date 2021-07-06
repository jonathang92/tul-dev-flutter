import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_dev/bloc/cart/cart_bloc.dart';
import 'package:tul_dev/bloc/product/product_bloc.dart';
import 'package:tul_dev/pages/cart_page.dart';
import 'package:tul_dev/pages/home_page.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CartBloc>(create: (_) => CartBloc()),
      BlocProvider<ProductBloc>(create: (_) => ProductBloc())
    ], child: MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tül-dev',
      home: HomePage(),
      routes: {
        'cart': (context) => CartPage(),
      },
    );
  }
}
