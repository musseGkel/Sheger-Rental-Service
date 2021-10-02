class House {
  final int houseId;
  int numberOfRooms;
  List<String> images = [], comments = [];
  String title, description, location;
  int price, likes;
  bool liked;
  int ownerID;
  DateTime postedAt;
  double meterSquare;
  House(
      {required this.comments,
      required this.liked,
      required this.likes,
      required this.location,
      required this.houseId,
      required this.numberOfRooms,
      required this.images,
      required this.title,
      required this.description,
      required this.price,
      required this.postedAt,
      required this.meterSquare,
      required this.ownerID});
}
