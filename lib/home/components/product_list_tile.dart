import 'package:flutter/material.dart';

import '../models/product.dart';

// TODO: Implement wishlist

class ProductListTile extends StatelessWidget {
  const ProductListTile({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.6,
      height: MediaQuery.of(context).size.width * 0.6,
      child: Column(
        children: [
          product.image != null
              ? Container(
                  alignment: Alignment.center,
                  width: 100.0,
                  height: 100.0,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(product.image!),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          product.title != null
              ? Text(
                  product.title!,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                )
              : const SizedBox.shrink(),
          product.rating!.rate != null
              ? Text(
                  '${product.rating!.rate!}/5.0',
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
