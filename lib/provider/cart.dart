 import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/item.dart';

class Cart with ChangeNotifier {


List selectedProduct = [];

int price = 0;

add(Item product){
  selectedProduct.add(product);
  price += product.price.round();
  notifyListeners();
}

delete(Item product){
  selectedProduct.remove(product);
  price -= product.price.round();
  notifyListeners();
}


get itemCount{
  return selectedProduct.length;
}

 }