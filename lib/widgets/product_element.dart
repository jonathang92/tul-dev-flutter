import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tul_dev/bloc/cart/cart_bloc.dart';
import 'package:tul_dev/models/product_model.dart';

class ProductElement extends StatefulWidget {
  final bool cart;
  final Product product;
  const ProductElement({this.cart = false, this.product});

  @override
  _ProductElementState createState() => _ProductElementState();
}

class _ProductElementState extends State<ProductElement> {
  int quantity = 1;

  @override
  void initState() {
    quantity = (this.widget.product.quantity != null)
        ? this.widget.product.quantity
        : 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final cartBloc = BlocProvider.of<CartBloc>(context);

    void addToCart({int q = 0}) {
      // This Action send product and quantity to cart.
      print(quantity);
      if (q != 0) {
        cartBloc.add(AddToCartEvent(
            product: this.widget.product, cardId: 1, quantity: q));
      } else {
        cartBloc.add(AddToCartEvent(
            product: this.widget.product, cardId: 1, quantity: quantity));
        setState(() {
          quantity = 1;
        });
      }
    }

    void add() {
      setState(() {
        if (quantity <= 98) {
          quantity++;
        }
        if (this.widget.cart) {
          addToCart(q: 1);
        }
      });
    }

    void substract() {
      setState(() {
        if (quantity >= 2) {
          quantity--;
        }
        if (this.widget.cart) {
          addToCart(q: -1);
        }
      });
    }

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 7),
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              this.widget.product.name,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              this.widget.product.sku,
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600]),
            ),
            SizedBox(height: 7),
            Text(this.widget.product.description),
            SizedBox(height: 7),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ProductQuantity(
                    quantity: quantity, add: add, substract: substract),
                if (this.widget.cart)
                  ActionButton(
                      icon: Icons.delete,
                      text: 'Delete from cart',
                      action: () {
                        setState(() {
                          cartBloc
                              .add(RemoveFromCartEvent(this.widget.product.id));
                        });
                      }),
                if (!this.widget.cart)
                  ActionButton(
                      icon: Icons.shopping_cart_outlined,
                      text: 'Add to cart',
                      action: addToCart),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function action;
  const ActionButton({
    @required this.icon,
    @required this.text,
    @required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff52b9a5)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(26))),
          ),
        ),
        onPressed: this.action,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Icon(this.icon, color: Colors.white),
              SizedBox(
                width: 5,
              ),
              Text(
                this.text,
                style: TextStyle(
                  color: Colors.white,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ProductQuantity extends StatefulWidget {
  final Function add;
  final Function substract;
  final int quantity;
  const ProductQuantity({
    this.add,
    this.substract,
    this.quantity,
  });

  @override
  _ProductQuantityState createState() => _ProductQuantityState();
}

class _ProductQuantityState extends State<ProductQuantity> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        ProductButton(
          onPress: this.widget.substract,
          child: Icon(
            Icons.remove,
            color: Colors.white,
          ),
        ),
        Container(
          color: Colors.grey[300],
          width: 40,
          height: 40,
          child: Center(
            child: Text(
              this.widget.quantity.toString(),
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        ProductButton(
          onPress: this.widget.add,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class ProductButton extends StatelessWidget {
  final Widget child;
  final Function onPress;

  const ProductButton({@required this.child, @required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      height: 40,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Color(0xff52b9a5)),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.zero)),
          ),
        ),
        onPressed: this.onPress,
        child: this.child,
      ),
    );
  }
}
