part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

abstract class HomeActionState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSusccessState extends HomeState {
  final List<ProductModel> products;
  HomeSusccessState({required this.products});
}

class HomeErrorState extends HomeState {
  final String error;

  HomeErrorState(this.error);
}

class HomeNavigateToWishlistPageActionState extends HomeActionState {}

class HomeNavigateToCartPageActionState extends HomeActionState {}

class HomeProductItemCartedState extends HomeActionState {}

class HomeProductItemWishlistedState extends HomeActionState {}
