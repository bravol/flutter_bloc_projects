part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistEvent {}

class WishlistInitialEvent extends WishlistEvent {}

class WishlistRemoveFromWishlistEvent extends WishlistEvent {
  final ProductModel product;

  WishlistRemoveFromWishlistEvent({required this.product});
}

class WishlistItemAlreadyInWishlistEvent extends WishlistEvent {
  final ProductModel product;
  WishlistItemAlreadyInWishlistEvent({required this.product});
}
