// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';
import 'package:flutter_application_1/pages/checkout.dart';
import 'package:flutter_application_1/pages/details_screen.dart';
import 'package:flutter_application_1/provider/cart.dart';
import 'package:flutter_application_1/shared/appbar.dart';
import 'package:flutter_application_1/shared/colors.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 22),
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 33),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Details(
                        product: items[index],
                      ),
                    ),
                  );
                },
                child: GridTile(
                  child: Stack(children: [
                    Positioned(
                      top: -3,
                      bottom: -9,
                      right: 0,
                      left: 0,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(55),
                          child: Image.asset(items[index].imgPath)),
                    ),
                  ]),
                  footer: GridTileBar(
// backgroundColor: Color.fromARGB(66, 73, 127, 110),
                    trailing: IconButton(
                        color: Color.fromARGB(255, 62, 94, 70),
                        onPressed: () {
                          cartt.add(items[index]);
                        },
                        icon: Icon(Icons.add)),

                    leading: Text("\$12.99"),

                    title: Text(
                      "",
                    ),
                  ),
                ),
              );
            }),
      ),
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/img/test.jpg"),
                        fit: BoxFit.cover),
                  ),
                  currentAccountPicture: CircleAvatar(
                      radius: 55,
                      backgroundImage: AssetImage(
                          "assets/img/pexels-simon-robben-614810.jpg")),
                  accountName: Text("Anas Hassan",
                      style: TextStyle(
                        color: Color.fromARGB(255, 255, 255, 255),
                      )),
                  accountEmail: Text(
                    "anas@gmail.com",
                  ),
                ),
                ListTile(
                    title: Text("Home"),
                    leading: Icon(Icons.home),
                    onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Home(
                       
                      ),
                    ),
                  );
                    }),
                ListTile(
                    title: Text("My products"),
                    leading: Icon(Icons.add_shopping_cart),
                    onTap: () {
                       Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckOut(
                       
                      ),
                    ),
                  );
                    }),
                ListTile(
                    title: Text("About"),
                    leading: Icon(Icons.help_center),
                    onTap: () {}),
                ListTile(
                    title: Text("Logout"),
                    leading: Icon(Icons.exit_to_app),
                    onTap: () {}),
              ],
            ),
            Container(
              margin: EdgeInsets.only(bottom: 12),
              child: Text(
                "Developed by Anas Hasan © 2023",
                style: TextStyle(fontSize: 16),
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("Home"),
        actions: [
          ProductsAndPrice()

        ],
      ),
    );
  }
}
