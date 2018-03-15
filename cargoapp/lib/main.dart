import 'package:flutter/material.dart';
import 'shop.dart';

class ShoppingList extends StatefulWidget {
  ShoppingList({
    Key key,
    this.list,
  }) : super(key: key);
  final List<Product> list;
  _ShoppingListState createState() {
    return new _ShoppingListState();
  }
}

class _ShoppingListState extends State<ShoppingList> {
  Set<Product> _shoppingCart = new Set<Product>();
  void _handleCartChanged(Product product, bool inCar) {
    setState(() {
      if (inCar)
        _shoppingCart.add(product);
      else
        _shoppingCart.remove(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('购物清单'),
      ),
      body: new ListView(
        children: widget.list.map((Product product) {
          return new ShoppingListItem(
            product: product,
            inCar: _shoppingCart.contains(product),
            onCartChanged: _handleCartChanged,
          );
        }).toList(),
      ),
    );
  }
}

final List<Product> _kProducts = <Product>[
  new Product(name: '鸡蛋'),
  new Product(name: '面粉'),
  new Product(name: '巧克力脆片'),
];
void main() {
  runApp(
    new MaterialApp(
      title: 'Flutter教程',
      debugShowCheckedModeBanner: false,
      home: new ShoppingList(list: _kProducts),
    ),
  );
}
