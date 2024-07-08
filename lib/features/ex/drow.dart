import 'package:flutter/material.dart';
import 'package:samay_admin_plan/constants/router.dart';
import 'package:samay_admin_plan/features/Account_Create_Form/account_create_form.dart';

class SalonTypeDropdown extends StatefulWidget {
  @override
  _SalonTypeDropdownState createState() => _SalonTypeDropdownState();
}

class _SalonTypeDropdownState extends State<SalonTypeDropdown> {
  String? _selectedSalonType;

  final List<String> _salonTypeOptions = [
    'Unisex',
    'Male',
    'Female',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          DropdownButton<String>(
            hint: Text('Select Salon Type'),
            value: _selectedSalonType,
            onChanged: (String? newValue) {
              setState(() {
                _selectedSalonType = newValue!;
              });
            },
            items:
                _salonTypeOptions.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          ElevatedButton(
              onPressed: () {
                Routes.instance
                    .push(widget: AccountCreateForm(), context: context);
              },
              child: Text("hii"))
        ],
      ),
    ));
  }
}
