import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_dev/bloc/cart/cart_bloc.dart';
import 'package:tul_dev/bloc/product/product_bloc.dart';
import 'package:tul_dev/pages/cart_page.dart';
import 'package:tul_dev/pages/home_page.dart';
import 'package:tul_dev/pages/login_page.dart';
import 'package:tul_dev/pages/register_page.dart';

void main() => runApp(AppState());

class AppState extends StatefulWidget {
  @override
  _AppStateState createState() => _AppStateState();
}

class _AppStateState extends State<AppState> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          // if (snapshot.hasError) {
          //   return SomethingWentWrong();
          // }
          if (snapshot.connectionState == ConnectionState.done) {
            return MultiBlocProvider(providers: [
              BlocProvider<CartBloc>(create: (_) => CartBloc()),
              BlocProvider<ProductBloc>(create: (_) => ProductBloc())
            ], child: MyApp());
          }
          return Container();
        });
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
        'login': (context) => LoginPage(),
        'register': (context) => RegisterPage(),
      },
    );
  }
}
