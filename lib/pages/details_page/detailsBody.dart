import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/components/location_button.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house.dart';
import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/pages/details_page/components/put_comment_box.dart';
import 'package:sheger_homes/pages/details_page/components/comments.dart';
import 'package:sheger_homes/pages/details_page/components/house_title_with_image.dart';

class DetailsBody extends StatefulWidget {
  final House house;
  final int indexdb;

  const DetailsBody({Key? key, required this.house, required this.indexdb})
      : super(key: key);

  @override
  _DetailsBodyState createState() => _DetailsBodyState();
}

class _DetailsBodyState extends State<DetailsBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int noRooms = widget.house.numberOfRooms;
    return SingleChildScrollView(
      child: Column(
        children: [
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(top: 240),
                height: size.height,
                width: size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.all(kDefaultPadding),
                  padding: const EdgeInsets.only(top: 110),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.house.description,
                        style: TextStyle(height: 1.6),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 18.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                margin: EdgeInsetsDirectional.all(
                                    kDefaultPadding / 2),
                                child: LocationButton(house: widget.house)),
                            Text(
                              noRooms == 1
                                  ? noRooms.toString() + ' Room'
                                  : noRooms.toString() + ' Rooms',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            RichText(
                                text: TextSpan(children: [
                              TextSpan(
                                  text: widget.house.meterSquare.toString() +
                                      ' m' +
                                      '\u00B2',
                                  style: TextStyle(color: kPrimaryTextColor))
                            ])),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: kDefaultPadding),
                        child: Text(
                          "Comments",
                          style: TextStyle(
                              color: kPrimaryTextColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 17),
                        ),
                      ),
                      PutCommentBox(
                        index: widget.indexdb,
                      ),
                      Expanded(
                          child: GridView.builder(
                              itemCount: Provider.of<HouseData>(context)
                                  .houses[widget.indexdb]
                                  .comments
                                  .length,
                              //itemCount: widget.house.comments.length,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                childAspectRatio: 4,
                              ),
                              itemBuilder: (context, index) => Comments(
                                    size: size,
                                    comment: Provider.of<HouseData>(context)
                                        .houses[widget.indexdb]
                                        .comments[index],
                                  )) //widget.house.comments[index])),
                          ),
                    ],
                  ),
                ),
              ),
              HouseTitlewithImage(
                house: widget.house,
                indexHT: widget.indexdb,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
