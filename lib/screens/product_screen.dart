import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/cupertino.dart';
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
  String productColor;

  _ProductScreenState(this.product);
  @override

  Widget build(BuildContext context) {

    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Carousel(
              images: product.images.map((url){
                return NetworkImage(url);
              }).toList(),
              dotSize: 6.0,
              dotSpacing: 15.0,
              dotBgColor: Colors.transparent,
              dotColor: Colors.blue,
              autoplay: false,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(product.title,
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
                  maxLines: 3,
                ),
                Text("R\$ ${product.price.toStringAsFixed(2)}",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: primaryColor),
                ),
                SizedBox(height: 10.0,),
                Text("Cores",
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 34.0,
                  child: GridView(
                    padding: EdgeInsets.symmetric(vertical: 4.0),
                    scrollDirection: Axis.horizontal,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8.0,
                      childAspectRatio: 0.4
                    ),
                    children:
                      product.colors.map(
                      (color) => GestureDetector(
                        onTap: () {
                          setState(() {
                            productColor = color;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: color == productColor ? primaryColor : Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(4.0)),
                            border: Border.all(
                              color: primaryColor,
                              width: 3.0,
                            ),
                          ),
                          width: 50.0,
                          alignment: Alignment.center,
                          child: Text(color),
                        ),
                      ),
                      ).toList(),
                  ),
                ),
                SizedBox(height: 10.0),
                SizedBox(
                  height: 44.0,
                  child: RaisedButton(
                    onPressed: productColor != null ? (){} : null,
                    child: Text("Add no Carrinho",
                    style: TextStyle( fontSize: 18.0),
                    ),
                    color: primaryColor,
                    textColor: Colors.white,
                  ),
                ),
                SizedBox(height: 10.0),
                Text("Descrição",
                style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.w500),
                ),
                Text(product.description,
                style:
                  TextStyle(fontSize: 15.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
