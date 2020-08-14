import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel {
  String category;
  String id;
  String title;
  String description;
  double price;
  List images;
  List colors;

  ProductModel.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    title = snapshot.data["title"];
    description = snapshot.data["description"];
    price = snapshot.data["price"] + 0.0;
    images = snapshot.data["images"];
    colors = snapshot.data["colors"];
  }
}