import 'package:fake_store/home/components/home_title.dart';
import 'package:fake_store/home/components/home_title_description.dart';
import 'package:fake_store/home/components/product_list_tile.dart';
import 'package:fake_store/home/repositories/home_repo.dart';
import 'package:fake_store/home/viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';

import '../models/product.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final HomeViewModel homeViewModel = HomeViewModel(homeRepo: HomeRepoImpl());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
          ),
          child: IconButton(
            onPressed: () => Navigator.popAndPushNamed(
              context,
              'auth',
            ),
            icon: const Icon(
              Icons.logout,
              size: 40.0,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: HomeTitle(),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 32.0),
            child: HomeTitleDescription(),
          ),
          FutureBuilder(
            future: homeViewModel.getProducts(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                final List<Product> products = snapshot.data!;
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 200.0,
                        mainAxisExtent: 225.0,
                        childAspectRatio: 1.5,
                        mainAxisSpacing: 20.0,
                        crossAxisSpacing: 20.0,
                      ),
                      shrinkWrap: true,
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        return ProductListTile(product: products[index]);
                      },
                    ),
                  ),
                );
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}
