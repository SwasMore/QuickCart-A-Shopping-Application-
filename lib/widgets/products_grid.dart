import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/product_item.dart';
import '../providers/products.dart';

class ProductsGrid extends StatelessWidget {
  final bool showFavs;
  final String searchQuery;

  ProductsGrid(this.showFavs, this.searchQuery);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<Products>(context);
    final products = showFavs ? productsData.favoriteItems : productsData.items;
    final filteredProducts = products.where((product) {
      return product.title.toLowerCase().contains(searchQuery.toLowerCase());
    }).toList();

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: filteredProducts.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: filteredProducts[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
    );
  }
}
