import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';
import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/pages/details_page/detailes_page.dart';
import 'package:sheger_homes/pages/home_page/components/items_for_home_page.dart';

class Favourites extends StatelessWidget {
  static const String id = 'favourites';
  Favourites({Key? key}) : super(key: key);

  late List<House> housesOriginal;
  late List<House> houses = [];
  List<int> likedHousesIndex = [];

  @override
  Widget build(BuildContext context) {
    likedHousesIndex = Provider.of<User>(context).likedHouses;
    housesOriginal = Provider.of<HouseData>(context).houses;
    houses.clear();
    housesList();
    if (houses.length == 0) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favourites"),
        ),
        body: Center(
          child: noResult(),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: Text("Favourites"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(kDefaultPadding),
                child: GridView.builder(
                  itemCount: houses.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 1,
                    mainAxisSpacing: kDefaultPadding,
                  ),
                  itemBuilder: (context, index) => ItemsForHomePage(
                    index: houses[index].houseId - 1,
                    onPress: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsPage(
                              house: houses[index],
                              index: houses[index].houseId - 1 //index,
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
      );
    }
  }

  Widget noResult() {
    return Container(
      child: Text(
        'No Result Found',
        style: TextStyle(color: kPrimaryColor, fontSize: 30),
      ),
    );
  }

  void housesList() {
    for (int item in likedHousesIndex) {
      for (var house in housesOriginal) {
        if (house.houseId == item) {
          houses.add(house);
        }
      }
    }
  }
}
