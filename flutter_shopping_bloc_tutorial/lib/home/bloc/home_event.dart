part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeProductWishListButtonEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductWishListButtonEvent({required this.clickedProduct});
}

class HomeProductCartButtonEvent extends HomeEvent {
  final ProductModel clickedProduct;

  HomeProductCartButtonEvent({required this.clickedProduct});
}

class HomeProductWishListButtonNavigate extends HomeEvent {}

class HomeProductCartButtonNavigate extends HomeEvent {}
