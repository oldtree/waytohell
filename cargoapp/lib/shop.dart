import 'package:flutter/material.dart';

class Product {
  const Product({this.name});
  final String name;
}

typedef void CartChangedCallback(Product product, bool inCar);

class ShoppingListItem extends StatelessWidget {
  ShoppingListItem({Product product, this.inCar, this.onCartChanged})
      : product = product,
        super(key: new ObjectKey(product));
  final Product product;
  final bool inCar;
  final CartChangedCallback onCartChanged;

  Color _getColor(BuildContext context) {
    return inCar ? Colors.black54 : Theme.of(context).primaryColor;
  }

  TextStyle _getTextStyle() {
    if (!inCar)
      return new TextStyle(fontWeight: FontWeight.bold, color: Colors.red);

    return new TextStyle(
      color: Colors.black54,
      decoration: TextDecoration.lineThrough,
    );
  }

  Widget build(BuildContext context) {
    return new ListTile(
      onTap: () {
        onCartChanged(product, !inCar);
      },
      leading: new CircleAvatar(
        backgroundColor: _getColor(context),
        child: new Text(product.name[0]),
      ),
      title: new Text(product.name, style: _getTextStyle()),
    );
  }
}
