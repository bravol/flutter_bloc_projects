import 'package:flutter/material.dart';
import 'package:flutter_shopping_bloc_tutorial/model/product_model.dart';
import 'package:flutter_shopping_bloc_tutorial/wishList/bloc/wishlist_bloc.dart';

class WishlistCard extends StatelessWidget {
  const WishlistCard({
    Key? key,
    required this.product,
    required this.wishlistBloc,
  }) : super(key: key);

  final ProductModel product;
  final WishlistBloc wishlistBloc;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(14),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(product.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            product.name,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          Text(product.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                " \$ ${product.price.toString()}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(
                          WishlistRemoveFromWishlistEvent(product: product));
                    },
                    icon: const Icon(
                      Icons.restore_from_trash_outlined,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      wishlistBloc.add(
                          WishlistItemAlreadyInWishlistEvent(product: product));
                    },
                    icon: const Icon(
                      Icons.favorite,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
