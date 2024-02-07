part of 'cart_bloc.dart';

@immutable
sealed class CartState {}

abstract class CartActionState extends CartState {}

class CartInitial extends CartState {}

class CartSuccessState extends CartState {
  final List<ProductModel> cartItems;

  CartSuccessState({required this.cartItems});
}

class CartErrorState extends CartState {}

class CartRemoveItemState extends CartActionState {}

class CartItemAlreadyExistState extends CartActionState {}
