import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sh/core/store.dart';
import 'package:sh/models/cart.dart';
import 'package:sh/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';
//2import 'package:velocity_x/velocity_x.dart';
// ignore: unnecessary_import
import 'package:vxstate/vxstate.dart';

class AddToCart extends StatelessWidget {
  final Item catalog;
  AddToCart({
    Key key = const Key("any_key"),
    required this.catalog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    VxState.watch(context, on: [AddMutation],);
    final CartModel _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalog) ?? false;
    return ElevatedButton(
      onPressed: () {
        if (!isInCart) {
          AddMutation(catalog);
        }
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(context.theme.buttonColor),
          shape: MaterialStateProperty.all(
            StadiumBorder(),
          )),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),
    );
  }
}