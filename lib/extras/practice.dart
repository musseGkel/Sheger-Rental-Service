// import 'package:flutter/material.dart';
// import 'package:sheger_homes/constants.dart';
// import 'package:sheger_homes/models/house.dart';

// class DetailsPicture extends StatelessWidget {
//   const DetailsPicture({
//     Key? key,
//     //required this.size,
//     required this.house,
//   }) : super(key: key);

//   //final Size size;
//   final House house;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Spacer(),
//         Container(
//           height: 230,
//           width: 320,
//           child: PageView.builder(
//             itemCount: house.images.length,
//             itemBuilder: (context, index) => Container(
//               margin: EdgeInsets.symmetric(
//                   horizontal: kDefaultPadding / 4,
//                   vertical: kDefaultPadding / 2),
//               height: 230,
//               width: 320, // size.width * 0.9,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                       blurRadius: 10,
//                       offset: Offset(0, 15),
//                       color: kPrimaryColor.withOpacity(0.75)),
//                 ],
//                 image: DecorationImage(
//                   alignment: Alignment.center,
//                   fit: BoxFit.cover,
//                   image: AssetImage(house.images[0]),
//                 ),
//               ),
//             ),
//           ),
//         ),
//         Spacer(
//           flex: 2,
//         ),
//       ],
//     );
//   }
// }
