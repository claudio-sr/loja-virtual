
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/models/product_models.dart';
import 'package:loja_virtual/widget/product_tile.dart';

class CategoryScreen extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryScreen({this.snapshot});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            title: Text(snapshot.data["titles"]),
            centerTitle: true,
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: <Widget>[
                Tab(icon: Icon(Icons.grid_on),),
                Tab(icon: Icon(Icons.list),),
              ],
            ),
          ),
        body: FutureBuilder<QuerySnapshot>(
          future: Firestore.instance.collection("products").document(snapshot.documentID)
              .collection("itens").getDocuments(),
          builder: (context, snapshot){
            if(snapshot.hasData){
              return TabBarView(
                children: <Widget>[
                 GridView.builder(
                   padding: EdgeInsets.all(4.0),
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                     crossAxisCount: 2,
                     mainAxisSpacing: 4,
                     crossAxisSpacing: 4,
                     childAspectRatio: 0.65,
                   ),
                   itemCount: snapshot.data.documents.length,
                   itemBuilder: (context, index)
                   => ProductTile(type: "grid", product: ProductModel.fromDocument(snapshot.data.documents[index]),),
                 ),
                  ListView.builder(
                      padding: const EdgeInsets.all(4.0),
                      itemCount: snapshot.data.documents.length,
                      itemBuilder: (context, index)
                      => ProductTile(type: "list", product: ProductModel.fromDocument(snapshot.data.documents[index]),))
                ],
              );
            } else {
              return Center(child: CircularProgressIndicator(),);
            }
          },
        ),
      ),
    );
  }
}
