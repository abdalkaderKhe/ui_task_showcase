
import 'package:flutter/material.dart';
import 'package:flutter_ui_showcase_test/feature/cart/view_model/cart_view_model.dart';
import '../../model/cart_model.dart';

class CartStateWidget extends StatefulWidget {
  final Widget child;
  const CartStateWidget({super.key,required this.child});
  @override
  State<CartStateWidget> createState() => _CartStateWidgetState();
}

class _CartStateWidgetState extends State<CartStateWidget> {

  CartModel cartModel = CartViewModel().cartModel;

  void update(CartModel cartNewState) {
    final newState = cartModel.copyWith(
      items: cartNewState.items,
      total: cartNewState.total,
    );
    setState(() {
      cartModel = newState;
    });
  }

  @override
  Widget build(BuildContext context) {
    return CartState(
      cartModel: cartModel,
      state: this,
      child: widget.child,
    );
  }
}

class CartState extends InheritedWidget{
  final CartModel cartModel;
  final _CartStateWidgetState state;
  const CartState({super.key, required super.child,required this.cartModel,required this.state,});
  @override
  bool updateShouldNotify(covariant CartState oldWidget) {
    return true;
  }
  static _CartStateWidgetState of(BuildContext context)  => context.dependOnInheritedWidgetOfExactType<CartState>()!.state;
}
