import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'product.dart';

class Products with ChangeNotifier {
  List<Product> _items = [
    // Product(
    //   id: 'p1',
    //   title: 'Red Shirt',
    //   description: 'A red shirt - it is pretty red!',
    //   price: 29.99,
    //   imageUrl:
    //       'https://cdn.pixabay.com/photo/2016/10/02/22/17/red-t-shirt-1710578_1280.jpg',
    // ),
    // Product(
    //   id: 'p2',
    //   title: 'Trousers',
    //   description: 'A nice pair of trousers.',
    //   price: 59.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Trousers%2C_dress_%28AM_1960.022-8%29.jpg/512px-Trousers%2C_dress_%28AM_1960.022-8%29.jpg',
    // ),
    // Product(
    //   id: 'p3',
    //   title: 'Yellow Scarf',
    //   description: 'Warm and cozy - exactly what you need for the winter.',
    //   price: 19.99,
    //   imageUrl:
    //       'https://live.staticflickr.com/4043/4438260868_cc79b3369d_z.jpg',
    // ),
    // Product(
    //   id: 'p4',
    //   title: 'A Pan',
    //   description: 'Prepare any meal you want.',
    //   price: 49.99,
    //   imageUrl:
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/1/14/Cast-Iron-Pan.jpg/1024px-Cast-Iron-Pan.jpg',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'A Laptop',
    //   description:
    //       ' a personal computer that can be easily moved and used in a variety of locations',
    //   price: 1000,
    //   imageUrl:
    //       'https://img.freepik.com/premium-photo/laptop-computer-christmas-gifts-objects-wrapping_87910-8854.jpg?w=996',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'A Smart Phone',
    //   description:
    //       ' a personal mobile phone that can be easily moved and used in a variety of locations',
    //   price: 400,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'A Dress',
    //   description: ' A dress for women',
    //   price: 100,
    //   imageUrl:
    //       'https://assets.vogue.com/photos/5f341f6f4721c86585cbb800/master/w_1920,c_limit/fullsizeoutput_6bcd_1_1080x.jpg',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Man Shoes',
    //   description: ' Shoes for Men',
    //   price: 200,
    //   imageUrl:
    //       'https://media.istockphoto.com/id/1629114862/photo/close-up-of-white-sports-shoes-on-a-white-background.webp?b=1&s=170667a&w=0&k=20&c=xJnzhqYgVTrLE_d3OB5FCAq34UBvYKCq3PgPUkrxjeM=',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'A Smart Phone',
    //   description:
    //       ' a personal mobile phone that can be easily moved and used in a variety of locations',
    //   price: 400,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // ),
    // Product(
    //   id: 'p5',
    //   title: 'A Laptop',
    //   description:
    //       ' a personal computer that can be easily moved and used in a variety of locations',
    //   price: 1000,
    //   imageUrl:
    //       'https://img.freepik.com/premium-photo/laptop-computer-christmas-gifts-objects-wrapping_87910-8854.jpg?w=996',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'A Smart Phone',
    //   description:
    //       ' a personal mobile phone that can be easily moved and used in a variety of locations',
    //   price: 400,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // ),
    // Product(
    //   id: 'p7',
    //   title: 'A Dress',
    //   description: ' A dress for women',
    //   price: 100,
    //   imageUrl:
    //       'https://assets.vogue.com/photos/5f341f6f4721c86585cbb800/master/w_1920,c_limit/fullsizeoutput_6bcd_1_1080x.jpg',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'Man Shoes',
    //   description: ' Shoes for Men',
    //   price: 200,
    //   imageUrl:
    //       'https://media.istockphoto.com/id/1629114862/photo/close-up-of-white-sports-shoes-on-a-white-background.webp?b=1&s=170667a&w=0&k=20&c=xJnzhqYgVTrLE_d3OB5FCAq34UBvYKCq3PgPUkrxjeM=',
    // ),
    // Product(
    //   id: 'p6',
    //   title: 'A Smart Phone',
    //   description:
    //       ' a personal mobile phone that can be easily moved and used in a variety of locations',
    //   price: 400,
    //   imageUrl:
    //       'https://images.unsplash.com/photo-1616077167599-cad3639f9cbd?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
    // ),
  ];
  //var _showFavoritesOnly = false;

  final String authToken;
  final String userId;
  Products(this.authToken, this.userId, this._items);

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

  Future<void> fetchAndSetProducts([bool filterByUser = false]) async {
    final filterString =
        filterByUser ? 'orderBy="creatorId"&equalTo="$userId"' : '';
    final url = Uri.parse(
        'https://quickcart-f00a2-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken&$filterString');
    try {
      http.Response response = await http.get(url);

      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }
      final url2 = Uri.parse(
          'https://quickcart-f00a2-default-rtdb.asia-southeast1.firebasedatabase.app/userFavorites/$userId.json?auth=$authToken');
      http.Response favoriteResponse = await http.get(url2);
      final favoriteData = json.decode(favoriteResponse.body);

      final List<Product> loadedProducts = [];
      extractedData.forEach((prodId, prodData) {
        loadedProducts.add(Product(
          id: prodId,
          title: prodData['title'],
          description: prodData['description'],
          price: prodData['price'],
          isFavorite:
              favoriteData == null ? false : favoriteData[prodId] ?? false,
          imageUrl: prodData['imageUrl'],
        ));
      });
      _items = loadedProducts;
      notifyListeners();
      //print(json.decode(response.body));
    } catch (error) {
      throw (error);
    }
  }

  Future<void> addProduct(Product product) async {
    final url = Uri.parse(
        'https://quickcart-f00a2-default-rtdb.asia-southeast1.firebasedatabase.app/products.json?auth=$authToken');

    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': product.title,
          'description': product.description,
          'imageUrl': product.imageUrl,
          'price': product.price,
          'creatorId': userId,
        }),
      );
      final newProduct = Product(
          id: json.decode(response.body)['name'],
          title: product.title,
          description: product.description,
          price: product.price,
          imageUrl: product.imageUrl);
      _items.add(newProduct);
      // _items.insert(0, newProduct);
      notifyListeners();
    } catch (error) {
      //print(error);
      throw error;
    }
  }

  Future<void> updateProduct(String id, Product newProduct) async {
    final prodIndex = _items.indexWhere((prod) => prod.id == id);
    if (prodIndex >= 0) {
      final url = Uri.parse(
          'https://quickcart-f00a2-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json=$authToken');

      await http.patch(url,
          body: json.encode({
            'title': newProduct.title,
            'description': newProduct.description,
            'imageUrl': newProduct.imageUrl,
            'price': newProduct.price,
          }));
      _items[prodIndex] = newProduct;
      notifyListeners();
    } else {
      print('....');
    }
  }

  void deleteProduct(String id) {
    final url = Uri.parse(
        'https://quickcart-f00a2-default-rtdb.asia-southeast1.firebasedatabase.app/products/$id.json?auth=$authToken');
    final existingProductIndex = _items.indexWhere((prod) => prod.id == id);
    var existingProduct = _items[existingProductIndex];

    _items.removeAt(existingProductIndex);
    http.delete(url).then((_) {
      //existingProduct = ;
    }).catchError((_) {
      _items.insert(existingProductIndex, existingProduct);
      notifyListeners();
    });
  }
}
