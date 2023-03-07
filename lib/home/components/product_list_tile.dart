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
    return Column(
      children: [
        product.image != null
            ? Container(
                alignment: Alignment.center,
                width: 125.0,
                height: 125.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(product.image!),
                  ),
                ),
              )
            : const SizedBox.shrink(),
        product.title != null
            ? Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  product.title!,
                  style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              )
            : const SizedBox.shrink(),
        product.rating!.rate != null
            ? Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  '${product.rating!.rate!}/5.0',
                ),
              )
            : const SizedBox.shrink(),
      ],
    );
  }
}
