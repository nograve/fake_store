import '../components/home_title.dart';
import '../components/home_title_description.dart';
import '../components/product_list_tile.dart';
import '../repositories/home_repo.dart';
import '../viewmodels/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/product.dart';

// TODO: Add state management to Home View

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final HomeViewModel _homeViewModel = HomeViewModel(homeRepo: HomeRepoImpl());

  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _onLoading() {
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

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
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(),
        onLoading: _onLoading,
        child: Column(
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
              future: _homeViewModel.getProducts(),
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
                          mainAxisExtent: 275.0,
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
      ),
    );
  }
}
