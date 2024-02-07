import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/cart/bloc/cart_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/cart/cart_card.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  final CartBloc cartBloc = CartBloc();

  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text(
          'Cart Items',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {
          if (state is CartRemoveItemState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item removed from cart')));
          } else if (state is CartItemAlreadyExistState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item already exist in cart')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case CartSuccessState:
              final successState = state as CartSuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: ((context, index) {
                  return CartCard(
                    product: successState.cartItems[index],
                    cartBloc: cartBloc,
                  );
                }),
              );

            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
