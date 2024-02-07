import 'package:flutter/material.dart';
import 'package:flutter_shopping_bloc_tutorial/cart/bloc/cart_bloc.dart';
import 'package:flutter_shopping_bloc_tutorial/model/product_model.dart';

class CartCard extends StatelessWidget {
  const CartCard({
    Key? key,
    required this.product,
    required this.cartBloc,
  }) : super(key: key);

  final ProductModel product;
  final CartBloc cartBloc;

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
                      cartBloc.add(CartRemoveFromCartEvent(product: product));
                    },
                    icon: const Icon(
                      Icons.restore_from_trash_outlined,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc
                          .add(CartItemAlreadyInCartEvent(product: product));
                    },
                    icon: const Icon(
                      Icons.shopping_bag,
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
