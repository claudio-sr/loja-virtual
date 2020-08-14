import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/category_screen.dart';

class CategoryTile extends StatelessWidget {

  final DocumentSnapshot snapshot;

  CategoryTile({@required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: CircleAvatar(
          radius: 30.0,
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage(snapshot.data["icon"]),
        ),
        title: Text(snapshot.data["titles"]),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: (){
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => CategoryScreen(snapshot: snapshot,))
          );
        },
      ),
    );
  }
}
