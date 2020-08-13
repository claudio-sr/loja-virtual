import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:loja_virtual/widget/drawer_tiles.dart';

class CustomDrawer extends StatelessWidget {

  final PageController pageController;

  CustomDrawer(this.pageController);

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
                        child: const Text('Electronics\nStore',
                        style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Olá,',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                            ),
                            GestureDetector(
                              child: Text('Entre ou Cadastre-se >',
                              style: TextStyle(
                                color: Theme.of(context).primaryColor,
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                              ),
                              ),
                              onTap: (){
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(color: Colors.black,),
                DrawerTiles(
                  icon: Icons.home,
                  text: 'Início',
                  pageController: pageController,
                  page: 0,
                ),
                DrawerTiles(
                    icon: Icons.list,
                    text: 'Produtos',
                    pageController: pageController,
                    page: 1,
                ),
                DrawerTiles(
                    icon: Icons.local_convenience_store,
                    text: 'Lojas',
                    pageController: pageController, page: 2,
                ),
                DrawerTiles(
                    icon: Icons.playlist_add_check,
                    text: 'Meus Pedidos',
                    pageController: pageController, page: 3,
                ),
              ],
            ),
          ],
        ),
    );
  }
}
