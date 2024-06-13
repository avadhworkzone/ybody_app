import 'package:flutter/material.dart';

class CustomErrorScreen extends StatelessWidget {
  const CustomErrorScreen({Key? key, required this.errorMessage}) : super(key: key);
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(child:Text(errorMessage));
  }
}
