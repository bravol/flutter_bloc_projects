// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_shopping_bloc_tutorial/Home/bloc/home_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/model/product_model.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.homeBloc,
  }) : super(key: key);

  final ProductModel product;
  final HomeBloc homeBloc;

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
            height: 200,
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
              //buttons to add to cart and to favorites(wishlist)
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(HomeProductWishListButtonEvent(
                          clickedProduct: product));
                    },
                    icon: const Icon(
                      Icons.favorite_border,
                      color: Colors.black,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                          HomeProductCartButtonEvent(clickedProduct: product));
                    },
                    icon: const Icon(
                      Icons.shopping_bag_outlined,
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
