import 'package:flutter/material.dart';


extension ContextExtension on BuildContext{

   double dynamicHeight(double val) => MediaQuery.of(this).size.height*val;
  double dynamicWidth(double val) => MediaQuery.of(this).size.height*val;
  

}