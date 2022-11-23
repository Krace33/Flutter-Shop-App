import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/products_provider.dart';
import '../widgets/products_grid.dart';

enum FilterOptions {
  favourites,
  all,
}

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                if (selectedValue == FilterOptions.favourites) {
                  productsContainer.showFavouritesOnly();
                } else {
                  productsContainer.showAll();
                }
              },
              icon: const Icon(Icons.more_vert),
              itemBuilder: ((_) => [
                    const PopupMenuItem(
                        value: FilterOptions.favourites,
                        child: Text('Only Favourites')),
                    const PopupMenuItem(
                        value: FilterOptions.all, child: Text('Show All')),
                  ]))
        ],
      ),
      body: const ProductsGrid(),
    );
  }
}
