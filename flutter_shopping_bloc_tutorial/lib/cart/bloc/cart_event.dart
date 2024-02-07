part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class CartRemoveFromCartEvent extends CartEvent {
  final ProductModel product;

  CartRemoveFromCartEvent({required this.product});
}

class CartItemAlreadyInCartEvent extends CartEvent {
  final ProductModel product;
  CartItemAlreadyInCartEvent({required this.product});
}
