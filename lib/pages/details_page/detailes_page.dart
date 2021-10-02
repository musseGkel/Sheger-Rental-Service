import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';
import 'package:sheger_homes/pages/details_page/detailsBody.dart';
import 'package:sheger_homes/pages/details_page/report_page.dart';

class DetailsPage extends StatefulWidget {
  final House house;
  final int index;

  const DetailsPage({Key? key, required this.house, required this.index})
      : super(key: key);

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: detailsAppBar(context),
      body: DetailsBody(
        house: widget.house,
        indexdb: widget.index,
      ),
    );
  }

  AppBar detailsAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      // backgroundColor: Colors.cyan,
      leading: TextButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: SvgPicture.asset(
          "assets/icons/back.svg",
          color: Colors.white,
        ),
      ),
      actions: [
        detailPageOptions(),
        // IconButton(
        //   onPressed: () {
        //     //detailPageOptions();
        //   },
        //   icon: Icon(
        //     Icons.arrow_drop_down,
        //   ),
        // ),
      ],
    );
  }

  List<String> items = [
    "",
    "Report",
  ];
  String selectedItem = '';
  DropdownButton<String> detailPageOptions() {
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
      icon: Icon(
        Icons.arrow_drop_down_outlined,
        color: Colors.white,
        size: 35,
      ),
      underline: Container(),
      //elevation: 0,
      value: selectedItem,
      items: dropdownMenuItems,
      onChanged: (value) {
        setState(() {
          selectedItem = value!;
        });
        selectedPage(context: context, value: selectedItem);
        print(selectedItem);
      },
    );
  }
}

selectedPage({required BuildContext context, required String value}) {
  //Navigator.of(context).pop();
  switch (value) {
    case 'Report':
      Navigator.pushNamed(context, ReportPage.id);
      break;
  }
}
