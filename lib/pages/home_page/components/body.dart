import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';
import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/pages/details_page/detailes_page.dart';
import 'package:sheger_homes/pages/home_page/components/catagories.dart';
import 'package:sheger_homes/pages/home_page/components/items_for_home_page.dart';
import 'package:sheger_homes/pages/home_page/search/search_field.dart';

class Body extends StatefulWidget {
  final onPressed;
  Body({Key? key, this.onPressed}) : super(key: key);
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String query = '';
  late List<House> housesOriginal;

  late List<House> houses = housesOriginal;

  @override
  Widget build(BuildContext context) {
    housesOriginal = Provider.of<HouseData>(context).houses;
    if (houses.length == 0) {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: kPrimaryColor,
                child: Row(
                  children: [
                    IconButton(
                      onPressed: widget.onPressed,
                      icon: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: SearchField(
                        text: query,
                        onChanged: searchHouse,
                        hintText: 'Enter House name or Location',
                      ),
                    ),
                  ],
                ),
              ),
              Catagories(
                onClick: (int index) {
                  filterHouse(index);
                },
              ),
              noResult(),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: kPrimaryColor,
                child: Row(
                  children: [
                    IconButton(
                        onPressed: widget.onPressed,
                        icon: Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    Expanded(
                      child: SearchField(
                        text: query,
                        onChanged: searchHouse,
                        hintText: 'Enter House name or Location',
                      ),
                    ),
                  ],
                ),
              ),
              Catagories(
                onClick: (int index) {
                  filterHouse(index);
                },
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(kDefaultPadding),
                  child: GridView.builder(
                    //itemCount: Provider.of<HouseData>(context).houses.length,
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
        ),
      );
    }
  }

  void searchHouse(String query) {
    final housess = housesOriginal.where((house) {
      final title = house.title.toLowerCase();
      final location = house.location.toLowerCase();
      final search = query.toLowerCase();
      return title.contains(search) || location.contains(search);
    }).toList();

    setState(() {
      this.query = query;
      this.houses = housess;
    });
  }

  searchByNumberRooms(int qNumberOfRooms) {
    final housess = housesOriginal.where((house) {
      final rooms = house.numberOfRooms;
      final search = qNumberOfRooms;
      if (qNumberOfRooms > 5) {
        return rooms > 5;
      }
      return rooms == search;
    }).toList();
    setState(() {
      this.houses = housess;
    });
  }

  void filterHouse(int index) {
    switch (index) {
      case 0:
        setState(() {
          houses = housesOriginal;
        });

        break;
      case 1:
        searchByNumberRooms(1);
        break;

      case 2:
        searchByNumberRooms(2);
        break;

      case 3:
        searchByNumberRooms(3);
        break;
      case 4:
        searchByNumberRooms(4);
        break;
      case 5:
        searchByNumberRooms(5);
        break;
      case 6:
        searchByNumberRooms(6);
        break;
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
}
