import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';
//import 'package:sheger_homes/models/house.dart';

class Catagories extends StatefulWidget {
  final onClick;
  const Catagories({Key? key, this.onClick}) : super(key: key);
  @override
  _CatagoriesState createState() => _CatagoriesState();
}

class _CatagoriesState extends State<Catagories> {
  List<String> listNumberOfRooms = [
    'All',
    'Studio',
    '2 Room',
    '3 Rooms',
    '4 Rooms',
    '5 Rooms',
    'Above 5'
  ];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      height: 25,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listNumberOfRooms.length,
        itemBuilder: (context, index) => buildCatagories(index),
      ),
    );
  }

  Widget buildCatagories(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        widget.onClick(selectedIndex);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              listNumberOfRooms[index],
              style: TextStyle(
                color: selectedIndex == index
                    ? kPrimaryTextColor
                    : kTextLightColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 5),
              height: 2,
              width: 30,
              color: selectedIndex == index
                  ? kPrimaryTextColor
                  : Colors.transparent,
            )
          ],
        ),
      ),
    );
  }
}
