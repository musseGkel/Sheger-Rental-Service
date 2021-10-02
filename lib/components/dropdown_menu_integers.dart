import 'package:flutter/material.dart';

class DropdownMenuIntegers extends StatelessWidget {
  const DropdownMenuIntegers({
    Key? key,
    required this.items,
    required this.icon,
    required this.selectedItem,
    required this.onChanged,
  }) : super(key: key);
  final List<int> items;
  final Icon icon;
  final int selectedItem;
  final onChanged;

  @override
  Widget build(BuildContext context) {
    return dropDown(items);
  }

  DropdownButton<int> dropDown(List<int> items) {
    List<DropdownMenuItem<int>> dropdownMenuItems = [];

    for (var item in items) {
      var ddm = DropdownMenuItem(
        value: item,
        child: Text(
          item.toString(),
          style: TextStyle(color: Colors.black),
        ),
      );

      dropdownMenuItems.add(ddm);
    }
    return DropdownButton<int>(
      icon: icon,
      value: selectedItem,
      items: dropdownMenuItems,
      onChanged: onChanged,
    );
  }
}
