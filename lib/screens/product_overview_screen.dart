import 'package:flutter/material.dart';
import '../providers/cart.dart';

import '../widgets/app_drawer.dart';
import './cart_screen.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../providers/products.dart';
//import '../widgets/badge.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  State<ProductsOverviewScreen> createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;
  // final productsContainer = Provider.of<Products>(context);

  @override
  void initState() {
    //Provider.of<Products>(context).fetchAndSetProducts();
    // Future.delayed(Duration.zero).then((_) {
    //   Provider.of<Products>(context).fetchAndSetProducts();
    // });
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });

      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //final productsContainer = Provider.of<Products>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'QuickCart',
          style: TextStyle(
              color: Colors.white, fontSize: 23, fontWeight: FontWeight.w700),
        ),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavorites = true;
                  // productsContainer.showFavoritesOnly();
                } else {
                  _showOnlyFavorites = false;
                  //productsContainer.showAll();
                }
              });
            },
            icon: Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(
                  child: Text('Only Favourites'),
                  value: FilterOptions.Favorites),
              PopupMenuItem(child: Text('Show All'), value: FilterOptions.All),
            ],
          ),
          Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
              child: ch,
              label: Text(cart.itemCount.toString()),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const CartScreen()));
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Color.fromARGB(255, 169, 237, 133),
              ),
            ),
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: _isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ProductsGrid(_showOnlyFavorites),
    );
  }
}
