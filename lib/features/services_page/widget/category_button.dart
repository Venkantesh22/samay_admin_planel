import 'package:flutter/material.dart';

class CatergryButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CatergryButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(text),
      tileColor: isSelected ? Colors.lightGreen : null,
      onTap: onTap,
    );
  }
}
