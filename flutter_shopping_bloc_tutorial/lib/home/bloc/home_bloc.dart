import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_shopping_bloc_tutorial/data/product_data.dart';
import 'package:flutter_shopping_bloc_tutorial/data/wishlist_items.dart';
import 'package:flutter_shopping_bloc_tutorial/model/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeInitialEvent>(_homeInitialEvent);
    on<HomeProductCartButtonEvent>(_homeProductCartButtonEvent);
    on<HomeProductWishListButtonEvent>(_homeProductWishListButtonEvent);
    on<HomeProductCartButtonNavigate>(_homeProductCartButtonNavigate);
    on<HomeProductWishListButtonNavigate>(_homeProductWishListButtonNavigate);
  }

  FutureOr<void> _homeInitialEvent(
      HomeInitialEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      await Future.delayed(const Duration(seconds: 2));
      final products = ProductData.products
          .map((product) => ProductModel.fromMap(product))
          .toList();

      emit(HomeSusccessState(products: products));
    } catch (e) {
      emit(HomeErrorState(e.toString()));
    }
  }

//cartitems function
  FutureOr<void> _homeProductCartButtonEvent(
      HomeProductCartButtonEvent event, Emitter<HomeState> emit) {
    print('Cart clicked');
    cartItems.add(event.clickedProduct);
    emit(HomeProductItemCartedState());
  }

//favorite function
  FutureOr<void> _homeProductWishListButtonEvent(
      HomeProductWishListButtonEvent event, Emitter<HomeState> emit) {
    print('Wishlist favorites clicked');
    wishlistItems.add(event.clickedProduct);
    emit(HomeProductItemWishlistedState());
  }

//navigating to wish list page
  FutureOr<void> _homeProductWishListButtonNavigate(
      HomeProductWishListButtonNavigate event, Emitter<HomeState> emit) {
    print('Wishlist favorites navigate clicked');
    emit(HomeNavigateToWishlistPageActionState());
  }

// navigating to cart list page
  FutureOr<void> _homeProductCartButtonNavigate(
      HomeProductCartButtonNavigate event, Emitter<HomeState> emit) {
    print('Cart navigate clicked');
    emit(HomeNavigateToCartPageActionState());
  }
}
