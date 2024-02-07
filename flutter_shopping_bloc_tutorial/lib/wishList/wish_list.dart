import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/wishList/bloc/wishlist_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/wishList/wishlist_card.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _CartState();
}

class _CartState extends State<Wishlist> {
  final WishlistBloc wishlistBloc = WishlistBloc();

  @override
  void initState() {
    wishlistBloc.add(WishlistInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.teal,
        title: const Text(
          'Favorites',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: BlocConsumer<WishlistBloc, WishlistState>(
        bloc: wishlistBloc,
        listenWhen: (previous, current) => current is WishlistActionState,
        buildWhen: (previous, current) => current is! WishlistActionState,
        listener: (context, state) {
          if (state is WishlistRemoveItemState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Item removed from favorites')));
          } else if (state is WishlistItemAlreadyExistState) {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Item already exist in favorites')));
          }
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case WishlistSuccessState:
              final successState = state as WishlistSuccessState;
              return GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5.0,
                    mainAxisSpacing: 5.0),
                itemCount: successState.wishlistItems.length,
                itemBuilder: ((context, index) {
                  return WishlistCard(
                    product: successState.wishlistItems[index],
                    wishlistBloc: wishlistBloc,
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
