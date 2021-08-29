import 'package:flutter/material.dart';

//To calculate the dynamic pixel size of the screen
//it helps to make the UI responsive for all the different size of screen
double responsiveCofficient(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  return 0.00125 * size.height;
}
