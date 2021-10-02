import 'package:flutter/material.dart';

class DropdownMenu extends StatelessWidget {
  const DropdownMenu({
    Key? key,
    required this.items,
    required this.icon,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);
  final List<String> items;
  final Icon icon;
  final String selectedItem;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return dropDown(items);
  }

  DropdownButton<String> dropDown(List<String> items) {
    List<DropdownMenuItem<String>> dropdownMenuItems = [];

    for (var item in items) {
      var ddm = DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(color: Colors.black),
        ),
      );

      dropdownMenuItems.add(ddm);
    }
    return DropdownButton<String>(
      icon: icon,
      value: selectedItem,
      items: dropdownMenuItems,
      onChanged: onChanged,
    );
  }
}
