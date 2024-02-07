part of 'wishlist_bloc.dart';

@immutable
sealed class WishlistState {}

abstract class WishlistActionState extends WishlistState {}

final class WishlistInitial extends WishlistState {}

final class WishlistSuccessState extends WishlistState {
  final List<ProductModel> wishlistItems;

  WishlistSuccessState({required this.wishlistItems});
}

final class WishlistErrorState extends WishlistState {}

final class WishlistRemoveItemState extends WishlistActionState {}

final class WishlistItemAlreadyExistState extends WishlistActionState {}
