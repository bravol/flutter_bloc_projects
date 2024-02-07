import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/data/cart_items.dart';
import 'package:flutter_shopping_bloc_tutorial/model/product_model.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(_cartInitialEvent);
    on<CartRemoveFromCartEvent>(_cartRemoveFromCartEvent);
    on<CartItemAlreadyInCartEvent>(_cartItemAlreadyInCartEvent);
  }

  FutureOr<void> _cartInitialEvent(
      CartInitialEvent event, Emitter<CartState> emit) {
    emit(CartSuccessState(cartItems: cartItems));
  }

  FutureOr<void> _cartRemoveFromCartEvent(
      CartRemoveFromCartEvent event, Emitter<CartState> emit) {
    cartItems.remove(event.product);
    //emit to see new items
    emit(CartSuccessState(cartItems: cartItems));
    emit(CartRemoveItemState());
  }

  FutureOr<void> _cartItemAlreadyInCartEvent(
      CartItemAlreadyInCartEvent event, Emitter<CartState> emit) {
    emit(CartItemAlreadyExistState());
  }
}
