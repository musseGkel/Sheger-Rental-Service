import 'package:flutter/cupertino.dart';
import 'package:sheger_homes/models/user.dart';

class UserData extends ChangeNotifier {
  List<User> users = [
    User(
      createdAt: DateTime(2018, 6, 24),
      username: 'abel@sheger',
      email: 'abel123@gmail.com',
      firstName: 'Abel',
      userId: 001,
      lastName: 'Tadesse',
      password: '123456',
      phoneNumber: '+251923234567',
      profilePicture: 'assets/images/avatar3.png',
      userType: UserType.Lessor,
      sex: 'Male',
    ),
    User(
        createdAt: DateTime(2015, 2, 14),
        username: 'jo@sheger',
        email: 'jo163@gmail.com',
        firstName: 'Jo',
        userId: 002,
        lastName: 'Fikadu',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2015, 12, 04),
        username: 'henok@sheger',
        email: 'henok133@gmail.com',
        firstName: 'Henok',
        userId: 003,
        lastName: 'Alemayehu',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2020, 2, 07),
        username: 'senay@sheger',
        email: 'senay143@gmail.com',
        firstName: 'Senay',
        userId: 004,
        lastName: 'Ezra',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2021, 2, 17),
        username: 'dawit@sheger',
        email: 'dawit153@gmail.com',
        firstName: 'Dawit',
        userId: 005,
        lastName: 'Meles',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2021, 2, 17),
        username: 'ezana@sheger',
        email: 'ezana153@gmail.com',
        firstName: 'Ezana',
        userId: 006,
        lastName: 'hailu',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2020, 2, 17),
        username: 'bereket@sheger',
        email: 'bereket103@gmail.com',
        firstName: 'bereket',
        userId: 007,
        lastName: 'moges',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2020, 2, 17),
        username: 'Musse@sheger',
        email: 'Musse103@gmail.com',
        firstName: 'Musse',
        userId: 008,
        lastName: 'Gkel',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessee,
        sex: 'Male'),
    User(
        createdAt: DateTime(2020, 2, 17),
        username: 'Mussie@sheger',
        email: 'Mussie103@gmail.com',
        firstName: 'Mussie',
        userId: 009,
        lastName: 'Teshome',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2020, 2, 17),
        username: 'Minilik@sheger',
        email: 'Minilik103@gmail.com',
        firstName: 'Minilik',
        userId: 010,
        lastName: 'Shumete',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
    User(
        createdAt: DateTime(2020, 2, 17),
        username: 'Michael@sheger',
        email: 'Michael103@gmail.com',
        firstName: 'Michael',
        userId: 011,
        lastName: 'Girma',
        password: '123456',
        phoneNumber: '+251923234567',
        profilePicture: 'assets/images/avatar3.png',
        userType: UserType.Lessor,
        sex: 'Male'),
  ];
  late int _authenticatedUserId;
  int get authenticatedUserId => _authenticatedUserId;
  set authenticatedUserId(int id) {
    _authenticatedUserId = id;
    notifyListeners();
  }

  void changeAuthenticatedUserId(int id) {
    _authenticatedUserId = id;
    notifyListeners();
  }
}

UserData userData = UserData();
