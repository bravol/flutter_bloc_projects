import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeProductCartButtonEvent>(_homeProductCartButtonEvent);
    on<HomeProductWishListButtonEvent>(_homeProductWishListButtonEvent);
  }

//cartitems function
  FutureOr<void> _homeProductCartButtonEvent(
      HomeProductCartButtonEvent event, Emitter<HomeState> emit) {
    print('Cart clicked');
  }

//favorite function
  FutureOr<void> _homeProductWishListButtonEvent(
      HomeProductWishListButtonEvent event, Emitter<HomeState> emit) {
    print('Wishlist favorites clicked');
  }
}
