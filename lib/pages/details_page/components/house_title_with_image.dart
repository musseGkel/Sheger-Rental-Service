import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/components/like_button.dart';
import 'package:sheger_homes/components/price.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';
import 'package:sheger_homes/models/user.dart';
import 'package:sheger_homes/models/user_data.dart';
import 'package:sheger_homes/pages/profile/others_profile.dart';

int imageIndex = 0;
String rentBoxText = 'Rent';
Color rentBoxColor = kPrimaryColor;
TextStyle rentBoxTextStyle = TextStyle(color: Colors.white, fontSize: 27);
EdgeInsets rentBoxPadding =
    EdgeInsets.only(left: kDefaultPadding + 10, top: kDefaultPadding / 3);

class HouseTitlewithImage extends StatefulWidget {
  const HouseTitlewithImage({
    Key? key,
    required this.house,
    required this.indexHT,
  }) : super(key: key);

  final House house;
  final indexHT;

  @override
  _HouseTitlewithImageState createState() => _HouseTitlewithImageState();
}

class _HouseTitlewithImageState extends State<HouseTitlewithImage> {
  late Size size;
  bool agrreed = false;
  void rent() {
    if (rentBoxText == 'Rent') {
      showModalBottomSheet(
          context: context, builder: ((builder) => bottomSheet()));
    } else if (rentBoxText == 'request Sent') {
      setState(() {
        rentBoxText = 'Rent';
        rentBoxColor = kPrimaryColor;
        rentBoxTextStyle = TextStyle(color: Colors.white, fontSize: 27);
        rentBoxPadding = EdgeInsets.only(
            left: kDefaultPadding + 10, top: kDefaultPadding / 3);
        agrreed = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Flexible(
            child: Container(
              margin: EdgeInsets.only(left: 10),
              decoration: BoxDecoration(
                  color: kPrimaryLightColor.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(10)),
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => OthersProfile(
                              user: Provider.of<UserData>(context)
                                  .users[widget.house.ownerID - 1])));
                },
                child: Text(widget.house.title,
                    style: Theme.of(context).textTheme.headline4!.copyWith(
                        color: kPrimaryTextColor, fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Flexible(
            fit: FlexFit.loose,
            child: Hero(
                tag: widget.house.houseId,
                child: ImageOfDetailsPage(
                  size: size,
                  image: widget.house.images[imageIndex],
                  numberofImages: widget.house.images.length,
                  onPressedLeft: () {
                    setState(() {
                      if (imageIndex > 0) {
                        imageIndex--;
                      } else if (imageIndex == 0) {
                        imageIndex = widget.house.images.length - 1;
                      }
                    });
                  },
                  onPressedRight: () {
                    setState(() {
                      if (imageIndex < widget.house.images.length) {
                        imageIndex++;
                        if (imageIndex == widget.house.images.length) {
                          imageIndex = 0;
                        }
                      }
                    });
                  },
                )),
          ),
          Flexible(
            child: SizedBox(
              height: 15,
            ),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Price(house: widget.house),
                LikeButton(indexLB: widget.indexHT),
                Provider.of<User>(context).userType == UserType.Lessor
                    ? Container()
                    : GestureDetector(
                        onTap: () {
                          rent();
                        },
                        child: Container(
                          padding: rentBoxPadding,
                          decoration: BoxDecoration(
                            color: rentBoxColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Text(
                            rentBoxText,
                            style: rentBoxTextStyle,
                          ),
                          width: 130,
                          height: 50,
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget bottomSheet() {
    return Container(
        height: 450,
        width: double.infinity,
        child: ListView(children: [
          SizedBox(
            height: 10,
          ),
          Text(
            'Terms and Conditions',
            textAlign: TextAlign.center,
            style: TextStyle(),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley." +
                  "Lorem Ipsum is simply dummy text of the printing" +
                  " and typesetting industry. Lorem Ipsum has been the" +
                  " industry's standard dummy text ever since. When an" +
                  " unknown printer took a galley.",
              style: TextStyle(),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: size.width * 0.8,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextButton(
              onPressed: () {
                setState(() {
                  agrreed = true;

                  rentBoxText = 'request Sent';
                  rentBoxColor = kPrimaryLightColor;
                  rentBoxTextStyle =
                      TextStyle(color: Colors.white, fontSize: 18);
                  rentBoxPadding = EdgeInsets.only(
                      left: kDefaultPadding / 1.5, top: kDefaultPadding / 1.5);
                });

                Navigator.pop(context);
              },
              child: Text(
                'Accept',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
        ]));
  }
}

class ImageOfDetailsPage extends StatelessWidget {
  const ImageOfDetailsPage({
    Key? key,
    required this.size,
    required this.image,
    required this.numberofImages,
    this.onPressedLeft,
    this.onPressedRight,
  }) : super(key: key);

  final Size size;
  final String image;
  final int numberofImages;
  final onPressedLeft;
  final onPressedRight;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Container(
            margin: EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 4, vertical: kDefaultPadding / 2),
            height: 230,
            width: size.width * 0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    blurRadius: 10,
                    offset: Offset(0, 15),
                    color: kPrimaryColor.withOpacity(0.75)),
              ],
              image: DecorationImage(
                alignment: Alignment.center,
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            )),
        Positioned(
          top: 70,
          child: GestureDetector(
            onTap: onPressedLeft,
            child: Container(
              height: 140,
              width: 100,
              // color: Colors.grey,
              child: Icon(
                Icons.chevron_left_sharp,
                size: 80,
                color: Colors.grey,
              ),
            ),
          ),
        ),
        Positioned(
          top: 70,
          left: size.width * 0.62,
          child: GestureDetector(
            onTap: onPressedRight,
            child: Container(
              height: 140,
              width: 100,
              //color: Colors.grey,
              child: Icon(
                Icons.chevron_right_sharp,
                size: 80,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
