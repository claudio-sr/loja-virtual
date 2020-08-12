import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  Widget _buildDrawerBack() => Container(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          Color.fromARGB(255, 203, 236, 241),
          Colors.lightBlueAccent
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Stack(
          children: <Widget>[
            _buildDrawerBack(),
            ListView(
              padding: EdgeInsets.only(left: 34, top: 15),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 8.0),
                  padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                  height: 170.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text('Electronics Store',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
    );
  }
}
