// enum UserRole { Lessor, Lessee, Neither }
import 'package:flutter/cupertino.dart';

enum UserType { Lessee, Lessor, niether }

class User extends ChangeNotifier {
  DateTime createdAt;
  String username;
  String email;
  String firstName;
  int userId;
  String lastName;
  String password;
  String phoneNumber;
  String profilePicture;
  UserType userType;
  String sex;
  var houseMap;
  int numberOfFamily;
  List<int> likedHouses = [];

  User({
    required this.createdAt,
    required this.username,
    this.email = '',
    required this.firstName,
    required this.userId,
    required this.lastName,
    required this.password,
    required this.phoneNumber,
    required this.userType,
    required this.sex,
    required this.profilePicture,
    this.houseMap = '',
    this.numberOfFamily = 1,
  });

  void addToLikedHouses(int houseId) {
    if (likedHouses.contains(houseId)) {
      likedHouses.remove(houseId);
      notifyListeners();
    } else {
      likedHouses.add(houseId);
      notifyListeners();
    }
  }

  void changePhoneNumber(String phoneNumber) {
    this.phoneNumber = phoneNumber;
    notifyListeners();
  }

  void changeFirstname(String firstName) {
    this.firstName = firstName;
    notifyListeners();
  }

  void changeLastname(String lastName) {
    this.lastName = lastName;
    notifyListeners();
  }

  void changeGender(sex) {
    this.sex = sex;
    notifyListeners();
  }
}
