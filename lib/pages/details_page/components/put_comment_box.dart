import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house_data.dart';

class PutCommentBox extends StatelessWidget {
  final int index;
  PutCommentBox({Key? key, required this.index}) : super(key: key);

  final textCommentController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    late String message;
    return Container(
      width: 300,
      height: 45,
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      margin: EdgeInsets.all(kDefaultPadding / 2),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Color(0xfff0f0f5),
      ),
      child: TextField(
        textAlign: TextAlign.justify,
        // maxLength: 80,
        controller: textCommentController,
        onChanged: (value) {
          message = value;
        },
        decoration: InputDecoration(
          hintText: "Put Your Comments Here",
          hintStyle: TextStyle(
              color: Colors.grey, textBaseline: TextBaseline.alphabetic),
          border: InputBorder.none,
          suffixIcon: IconButton(
            onPressed: () {
              Provider.of<HouseData>(context, listen: false)
                  .putComment(comment: message, index: index);
              //houses.putComment(comment: message, index: widget.index);
              textCommentController.clear();
            },
            icon: Icon(
              Icons.send,
              color: kPrimaryTextColor,
            ),
          ),
        ),
      ),
    );
  }
}
