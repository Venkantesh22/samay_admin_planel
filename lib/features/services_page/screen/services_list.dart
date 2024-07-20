import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';

class ServicesList extends StatelessWidget {
  const ServicesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ServiceProvider serviceProvider = Provider.of<ServiceProvider>(context);
    final selectedCategory = serviceProvider.selectedCategory;

    return Scaffold(
      appBar: AppBar(
        title: Text("Services"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              selectedCategory?.categoryName ?? "No category selected",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
            Text(
              selectedCategory?.id ?? "No id selected",
              style: TextStyle(color: Colors.black, fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
