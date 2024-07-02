import 'package:flutter/material.dart';

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99,
      imageUrl:
          'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    ),
    Product(
      id: 'p3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99,
      imageUrl:
          'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    ),
    Product(
      id: 'p4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99,
      imageUrl:
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    ),
    Product(
      id: 'p5',
      title: 'A Laptop',
      description:
          ' a personal computer that can be easily moved and used in a variety of locations',
      price: 1000,
      imageUrl:
          'https://img.freepik.com/premium-photo/laptop-computer-christmas-gifts-objects-wrapping_87910-8854.jpg?w=996',
    ),
    Product(
      id: 'p6',
      title: 'A Smart Phone',
      description:
          ' a personal mobile phone that can be easily moved and used in a variety of locations',
      price: 400,
      imageUrl:
          'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p7',
      title: 'A Dress',
      description: ' A dress for women',
      price: 100,
      imageUrl:
          'https://assets.vogue.com/photos/5f341f6f4721c86585cbb800/master/w_1920,c_limit/fullsizeoutput_6bcd_1_1080x.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Man Shoes',
      description: ' Shoes for Men',
      price: 200,
      imageUrl:
          'https://media.istockphoto.com/id/1629114862/photo/close-up-of-white-sports-shoes-on-a-white-background.webp?b=1&s=170667a&w=0&k=20&c=xJnzhqYgVTrLE_d3OB5FCAq34UBvYKCq3PgPUkrxjeM=',
    ),
    Product(
      id: 'p6',
      title: 'A Smart Phone',
      description:
          ' a personal mobile phone that can be easily moved and used in a variety of locations',
      price: 400,
      imageUrl:
          'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p5',
      title: 'A Laptop',
      description:
          ' a personal computer that can be easily moved and used in a variety of locations',
      price: 1000,
      imageUrl:
          'https://img.freepik.com/premium-photo/laptop-computer-christmas-gifts-objects-wrapping_87910-8854.jpg?w=996',
    ),
    Product(
      id: 'p6',
      title: 'A Smart Phone',
      description:
          ' a personal mobile phone that can be easily moved and used in a variety of locations',
      price: 400,
      imageUrl:
          'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
    Product(
      id: 'p7',
      title: 'A Dress',
      description: ' A dress for women',
      price: 100,
      imageUrl:
          'https://assets.vogue.com/photos/5f341f6f4721c86585cbb800/master/w_1920,c_limit/fullsizeoutput_6bcd_1_1080x.jpg',
    ),
    Product(
      id: 'p6',
      title: 'Man Shoes',
      description: ' Shoes for Men',
      price: 200,
      imageUrl:
          'https://media.istockphoto.com/id/1629114862/photo/close-up-of-white-sports-shoes-on-a-white-background.webp?b=1&s=170667a&w=0&k=20&c=xJnzhqYgVTrLE_d3OB5FCAq34UBvYKCq3PgPUkrxjeM=',
    ),
    Product(
      id: 'p6',
      title: 'A Smart Phone',
      description:
          ' a personal mobile phone that can be easily moved and used in a variety of locations',
      price: 400,
      imageUrl:
          'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    ),
  ];
  //var _showFavoritesOnly = false;

  List<Product> get items {
    // if (_showFavoritesOnly) {
    //   return _items.where((prodItem) => prodItem.isFavorite).toList();
    // }
    return [..._items];
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  // void showFavoritesOnly() {
  //   _showFavoritesOnly = true;
  //   notifyListeners();
  // }

  // void showAll() {
  //   _showFavoritesOnly = false;
  //   notifyListeners();
  // }

  void addProduct(Product product) {
    final newProduct = Product(
        id: DateTime.now().toString(),
        title: product.title,
        description: product.description,
        price: product.price,
        imageUrl: product.imageUrl);
    _items.add(newProduct);
    // _items.insert(0, newProduct);
    notifyListeners();
  }

  void updateProduct(String id, Product newProduct) {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('....');
    }
  }

  void deleteProduct(String id) {
    _items.removeWhere((prod) => prod.id == id);
    notifyListeners();
  }
}
