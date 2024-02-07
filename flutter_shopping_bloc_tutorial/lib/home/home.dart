import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/Home/bloc/home_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/cart/cart.dart';
import 'package:flutter_shopping_bloc_tutorial/home/product_tile_widget.dart';
import 'package:flutter_shopping_bloc_tutorial/wishList/wish_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HomeBloc homeBloc = HomeBloc();

//init state(as soon as the app opens)
  @override
  void initState() {
    homeBloc.add(HomeInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,
      listener: (context, state) {
        //  implement listener
        if (state is HomeNavigateToCartPageActionState) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => const Cart()));
        } else if (state is HomeNavigateToWishlistPageActionState) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const WishList()));
        } else if (state is HomeProductItemCartedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added to cart')));
        } else if (state is HomeProductItemWishlistedState) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Item added to wishlist')));
        }
      },
      builder: (context, state) {
        switch (state.runtimeType) {
          case HomeLoadingState:
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case HomeSusccessState:
            final successState = state as HomeSusccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: const Text(
                  'Bravol Grocery App',
                  style: TextStyle(color: Colors.white),
                ),
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishListButtonNavigate());
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductCartButtonNavigate());
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              //mapping of products
              body: ListView.builder(
                  itemCount: successState.products.length,
                  itemBuilder: ((context, index) {
                    return ProductCard(
                      product: successState.products[index],
                      homeBloc: homeBloc,
                    );
                  })),
            );

          case HomeErrorState:
            return const Scaffold(
              body: Center(
                child: Text('Error has occured'),
              ),
            );

          default:
            return const SizedBox();
        }
      },
    );
  }
}
