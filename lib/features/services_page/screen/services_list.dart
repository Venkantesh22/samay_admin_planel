import 'package:flutter/material.dart';

class ServicesList extends StatelessWidget {
  final String categoryName;
  const ServicesList({
    Key? key,
    required this.categoryName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Text(categoryName),
      ),
    );
  }
}
