import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:samay_admin_plan/features/services_page/widget/category_button.dart';
import 'package:samay_admin_plan/provider/service_provider.dart';

class CatergoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);

    return Container(
      width: 200,
      color: Colors.grey,
      child: Column(
        children: [
          DrawerHeader(child: Text('Categories')),
          CatergryButton(
            text: 'Haircut',
            isSelected: serviceProvider.selectedCategory == 'Haircut',
            onTap: () {
              serviceProvider.setCategory('Haircut');
            },
          ),
          CatergryButton(
            text: 'Body Wax',
            isSelected: serviceProvider.selectedCategory == 'Body Wax',
            onTap: () {
              serviceProvider.setCategory('Body Wax');
            },
          ),
        ],
      ),
    );
  }
}
