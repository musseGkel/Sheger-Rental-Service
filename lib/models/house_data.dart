import 'package:flutter/cupertino.dart';
import 'package:sheger_homes/models/house.dart';

class HouseData extends ChangeNotifier {
  List<House> houses = [
    House(
        ownerID: 001,
        liked: false,
        likes: 16,
        location: 'Yeka',
        houseId: 001,
        numberOfRooms: 2,
        images: house1ImageItems,
        title: "Abel's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 3400,
        postedAt: DateTime(2021, 6, 24),
        meterSquare: 125.5,
        comments: house1Comments),
    House(
        ownerID: 002,
        liked: false,
        likes: 122,
        location: 'Lideta',
        houseId: 002,
        numberOfRooms: 3,
        images: house2ImageItems,
        title: "Jo's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 4100,
        postedAt: DateTime(2021, 2, 4),
        meterSquare: 175.43,
        comments: house2Comments),
    House(
        ownerID: 003,
        liked: false,
        likes: 56,
        location: 'Nefassilk',
        houseId: 003,
        numberOfRooms: 1,
        images: house3ImageItems,
        title: "Henok's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 2400,
        postedAt: DateTime(2020, 6, 2),
        meterSquare: 75,
        comments: house3Comments),
    House(
        ownerID: 004,
        liked: false,
        likes: 6,
        location: "Bole",
        houseId: 004,
        numberOfRooms: 2,
        images: house4ImageItems,
        title: "Senay's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 2500,
        postedAt: DateTime(2019, 6, 9),
        meterSquare: 165.2,
        comments: house4Comments),
    House(
        ownerID: 005,
        liked: false,
        likes: 78,
        location: 'Addis Ketema',
        houseId: 005,
        numberOfRooms: 4,
        images: house5ImageItems,
        title: "Dawit's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 5400,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 425,
        comments: house5Comments),
    House(
        ownerID: 006,
        liked: false,
        likes: 78,
        location: 'Kirkos',
        houseId: 006,
        numberOfRooms: 7,
        images: house6ImageItems,
        title: "Ezana's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 5400,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 425,
        comments: house6Comments),
    House(
        ownerID: 007,
        liked: false,
        likes: 78,
        location: 'Kolfe Keranyo',
        houseId: 007,
        numberOfRooms: 3,
        images: house7ImageItems,
        title: "Bereket's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 5400,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 425,
        comments: house7Comments),
    House(
        ownerID: 003,
        liked: false,
        likes: 83,
        location: 'Gulele',
        houseId: 008,
        numberOfRooms: 5,
        images: house8ImageItems,
        title: "Dawit's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 6400,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 425,
        comments: house8Comments),
    House(
        ownerID: 009,
        liked: false,
        likes: 83,
        location: 'Lideta',
        houseId: 009,
        numberOfRooms: 6,
        images: house9ImageItems,
        title: "Mussie's",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 7300,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 573,
        comments: house9Comments),
    House(
        ownerID: 010,
        liked: false,
        likes: 103,
        location: 'Kolfe Keranyo',
        houseId: 010,
        numberOfRooms: 3,
        images: house10ImageItems,
        title: "Minilik's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 3300,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 273,
        comments: house10Comments),
    House(
        ownerID: 006,
        liked: false,
        likes: 93,
        location: 'Akaki Kality',
        houseId: 011,
        numberOfRooms: 1,
        images: house11ImageItems,
        title: "Ezana's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 1300,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 173,
        comments: house11Comments),
    House(
        ownerID: 002,
        liked: false,
        likes: 03,
        location: 'Nefassilk',
        houseId: 012,
        numberOfRooms: 3,
        images: house12ImageItems,
        title: "Jo's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 4800,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 403,
        comments: house12Comments),
    House(
        ownerID: 011,
        liked: false,
        likes: 93,
        location: 'Addis Ketema',
        houseId: 013,
        numberOfRooms: 4,
        images: house13ImageItems,
        title: "Miki's House",
        description:
            "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.",
        price: 5800,
        postedAt: DateTime(2021, 1, 2),
        meterSquare: 553,
        comments: house13Comments),
  ];

  int get items {
    return houses.length;
  }

  like(bool l, int index) {
    if (l) {
      houses[index].liked = false;
      houses[index].likes--;
      notifyListeners(); //return false;
    } else {
      houses[index].liked = true;
      houses[index].likes++;
      notifyListeners(); //return true;
    }
  }

  void putComment({required String comment, required int index}) {
    houses[index].comments.insert(0, comment);
    notifyListeners();
  }

  void deleteHouse(int index) {
    houses.removeAt(index);
    notifyListeners();
  }

  void addHouse(
    String location,
    int numberOfRooms,
    String title,
    String description,
    int price,
    double meterSquare,
    int ownerID,
  ) {
    houses.add(House(
        comments: house14Comments,
        liked: false,
        likes: 0,
        location: location,
        houseId: houses.last.houseId + 1,
        numberOfRooms: numberOfRooms,
        images: house14ImageItems,
        title: title,
        description: description,
        price: price,
        postedAt: DateTime.now(),
        meterSquare: meterSquare,
        ownerID: ownerID));
    notifyListeners();
  }

  void editHouse(
    int houseIndex,
    String title,
    int price,
    double meterSquare,
    int numberOfRooms,
    String subCity,
    String description,
  ) {
    houses[houseIndex].title = title;
    houses[houseIndex].price = price;
    houses[houseIndex].meterSquare = meterSquare;
    houses[houseIndex].numberOfRooms = numberOfRooms;
    houses[houseIndex].location = subCity;
    houses[houseIndex].description = description;
    notifyListeners();
  }
}

List<String> house1Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];

List<String> house2Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];

List<String> house3Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];

List<String> house4Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];

List<String> house5Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house6Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house7Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house8Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house9Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house10Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house11Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house12Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house13Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house14Comments = [
  "Arif bet new",
  "Akeraywa nechnahca nech",
  "I have alot of memories in this house",
  "Wha yelewm betu",
  "Arif ymeslal gn wagaw betam wid new",
  "Betu yalebet Sefer safe adelem"
];
List<String> house1ImageItems = [
  "assets/images/house010.jpg",
  "assets/images/house011.jpg",
  "assets/images/house012.jpg",
  "assets/images/house013.jpg",
  "assets/images/house014.jpg",
];
List<String> house2ImageItems = [
  "assets/images/house020.jpg",
  "assets/images/house021.jpg",
  "assets/images/house022.jpg",
  "assets/images/house023.jpg",
  "assets/images/house024.jpg",
];
List<String> house3ImageItems = [
  "assets/images/house030.jpg",
  "assets/images/house031.jpg",
  "assets/images/house032.jpg",
  "assets/images/house033.jpg",
  "assets/images/house034.jpg",
];
List<String> house4ImageItems = [
  "assets/images/house040.jpg",
  "assets/images/house041.jpg",
  "assets/images/house042.jpg",
  "assets/images/house043.jpg",
  "assets/images/house044.jpg",
];
List<String> house5ImageItems = [
  "assets/images/house050.jpg",
  "assets/images/house051.jpg",
  "assets/images/house052.jpg",
  "assets/images/house053.jpg",
  "assets/images/house054.jpg",
];
List<String> house6ImageItems = [
  "assets/images/house060.jpg",
  "assets/images/house061.jpg",
  "assets/images/house062.jpg",
  "assets/images/house063.jpg",
  "assets/images/house064.jpg",
];
List<String> house7ImageItems = [
  "assets/images/house070.jpg",
  "assets/images/house071.jpg",
  "assets/images/house072.jpg",
  "assets/images/house073.jpg",
  "assets/images/house074.jpg",
];
List<String> house8ImageItems = [
  "assets/images/house080.jpg",
  "assets/images/house081.jpg",
  "assets/images/house082.jpg",
  "assets/images/house083.jpg",
  "assets/images/house084.jpg",
];
List<String> house9ImageItems = [
  "assets/images/house090.jpg",
  "assets/images/house091.jpg",
  "assets/images/house092.jpg",
  "assets/images/house093.jpg",
  "assets/images/house094.jpg",
];
List<String> house10ImageItems = [
  "assets/images/house100.jpg",
  "assets/images/house101.jpg",
  "assets/images/house102.jpg",
  "assets/images/house103.jpg",
  "assets/images/house104.jpg",
];
List<String> house11ImageItems = [
  "assets/images/house110.jpg",
  "assets/images/house111.jpg",
  "assets/images/house112.jpg",
  "assets/images/house113.jpg",
  "assets/images/house114.jpg",
];
List<String> house12ImageItems = [
  "assets/images/house120.jpg",
  "assets/images/house121.jpg",
  "assets/images/house122.jpg",
  "assets/images/house123.jpg",
  "assets/images/house124.jpg",
];
List<String> house13ImageItems = [
  "assets/images/house130.jpg",
  "assets/images/house131.jpg",
  "assets/images/house132.jpg",
  "assets/images/house133.jpg",
  "assets/images/house134.jpg",
];
List<String> house14ImageItems = [
  "assets/images/house140.jpg",
  "assets/images/house141.jpg",
  "assets/images/house142.jpg",
  "assets/images/house143.jpg",
  "assets/images/house144.jpg",
];
