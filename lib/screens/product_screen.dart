import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product_models.dart';

class ProductScreen extends StatefulWidget {

  final ProductModel product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState(product);
}

class _ProductScreenState extends State<ProductScreen> {

  final ProductModel product;

  _ProductScreenState(this.product);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
