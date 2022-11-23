import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';

enum FilterOptions {
  favourites,
  all,
}

class ProductsOverviewScreen extends StatefulWidget {
  const ProductsOverviewScreen({super.key});

  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavourites = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('MyShop'),
        actions: [
          PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.favourites) {
                    _showOnlyFavourites = true;
                  } else {
                    _showOnlyFavourites = false;
                  }
                });
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
      body: ProductsGrid(_showOnlyFavourites),
    );
  }
}
