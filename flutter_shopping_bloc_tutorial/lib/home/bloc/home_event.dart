part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeProductWishListButtonEvent extends HomeEvent {}

class HomeProductCartButtonEvent extends HomeEvent {}

class HomeproductWishListButtonNavigate extends HomeEvent {}

class HomeproductCartButtonNavigate extends HomeEvent {}
