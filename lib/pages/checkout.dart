// ignore_for_file: prefer_const_constructors, sort_child_properties_last, non_constant_identifier_names

import 'package:flutter_application_1/provider/cart.dart';
import 'package:flutter_application_1/shared/appbar.dart';
import 'package:flutter_application_1/shared/colors.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({super.key});

  @override
  Widget build(BuildContext context) {
    final cartt = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: appbarGreen,
        title: Text("checkout screen"),
        actions: [ProductsAndPrice()],
      ),
      body: Column(
        children: [
          SingleChildScrollView(
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: cartt.selectedProduct.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text(cartt.selectedProduct[index].name),
                        subtitle: Text(
                            "${cartt.selectedProduct[index].price} - ${cartt.selectedProduct[index].location}"),
                        leading: CircleAvatar(
                          backgroundImage:
                              AssetImage(cartt.selectedProduct[index].imgPath),
                        ),
                        trailing: IconButton(
                            onPressed: () {
                              cartt.delete(cartt.selectedProduct[index]);

                            }, icon: Icon(Icons.remove)),
                      ),
                    );
                  }),
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: Text(
              "Pay \$${cartt.price}",
              style: TextStyle(fontSize: 19),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(BTNpink),
              padding: MaterialStateProperty.all(EdgeInsets.all(12)),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
