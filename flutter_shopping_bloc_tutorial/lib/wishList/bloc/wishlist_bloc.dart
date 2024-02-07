import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/data/wishlist_items.dart';
import 'package:flutter_shopping_bloc_tutorial/model/product_model.dart';

part 'wishlist_event.dart';
part 'wishlist_state.dart';

class WishlistBloc extends Bloc<WishlistEvent, WishlistState> {
  WishlistBloc() : super(WishlistInitial()) {
    on<WishlistInitialEvent>(_wishlistInitialEvent);
    on<WishlistRemoveFromWishlistEvent>(_wishlistRemoveFromWishlistEvent);
    on<WishlistItemAlreadyInWishlistEvent>(_wishlistItemAlreadyInWishlistEvent);
  }

  FutureOr<void> _wishlistInitialEvent(
      WishlistInitialEvent event, Emitter<WishlistState> emit) {
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
  }

  FutureOr<void> _wishlistRemoveFromWishlistEvent(
      WishlistRemoveFromWishlistEvent event, Emitter<WishlistState> emit) {
    wishlistItems.remove(event.product);
    emit(WishlistSuccessState(wishlistItems: wishlistItems));
    emit(WishlistRemoveItemState());
  }

  FutureOr<void> _wishlistItemAlreadyInWishlistEvent(
      WishlistItemAlreadyInWishlistEvent event, Emitter<WishlistState> emit) {
    emit(WishlistItemAlreadyExistState());
  }
}
