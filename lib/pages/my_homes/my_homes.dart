import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';
import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/pages/home_page/components/items_for_home_page.dart';
import 'package:sheger_homes/pages/home_page/home_page.dart';
import 'package:sheger_homes/pages/post_house/editPostedHouse.dart';

class MyHomes extends StatelessWidget {
  static const String id = 'myHomes';
  MyHomes({Key? key}) : super(key: key);

  late List<House> housesOriginal;
  late List<House> houses = [];
  late int userId;
  late int numberOfHouses;

  @override
  Widget build(BuildContext context) {
    userId = Provider.of<User>(context).userId;
    housesOriginal = Provider.of<HouseData>(context).houses;
    houses.clear();
    housesList();
    if (houses.length == 0) {
      return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, HomePage.id);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text("My Homes"),
          ),
          body: Center(
            child: noResult(),
          ),
        ),
      );
    } else {
      return WillPopScope(
        onWillPop: () async {
          Navigator.pushNamed(context, HomePage.id);
          return true;
        },
        child: Scaffold(
          appBar: AppBar(
            title: Text('MyHomes: ' + '${housesText()}'),
          ),
          body: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: GridView.builder(
                    itemCount: houses.length,
                    // itemCount: Provider.of<HouseData>(context).houses.length,

                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: kDefaultPadding,
                    ),
                    itemBuilder: (context, index) => ItemsForHomePage(
                      // index: index,
                      index: houses[index].houseId - 1,
                      onPress: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditPostedHouse(
                                houseIndex: houses[index].houseId - 1 //index,
                                ),
                          ),
                        );
                      },
                      house: houses[index],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }

  Widget noResult() {
    return Container(
      child: Text(
        'No Posted House',
        style: TextStyle(color: kPrimaryColor, fontSize: 30),
      ),
    );
  }

  void housesList() {
    for (var house in housesOriginal) {
      if (house.ownerID == userId) {
        houses.add(house);
      }
    }
  }

  String housesText() {
    numberOfHouses = houses.length;
    String text = numberOfHouses == 1
        ? numberOfHouses.toString() + ' House'
        : numberOfHouses.toString() + ' Houses';
    return text;
  }
}
