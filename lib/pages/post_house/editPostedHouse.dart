import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sheger_homes/components/dropdown_menu.dart';
import 'package:sheger_homes/components/dropdown_menu_integers.dart';
import 'package:sheger_homes/components/round_button.dart';
import 'package:sheger_homes/components/show_alert_dialog.dart';
import 'package:sheger_homes/constants.dart';
import 'package:sheger_homes/models/house_data.dart';
import 'package:sheger_homes/pages/my_homes/my_homes.dart';
import 'package:sheger_homes/pages/post_house/components/input_number.dart';
import 'package:sheger_homes/pages/post_house/components/name_input.dart';

class EditPostedHouse extends StatefulWidget {
  const EditPostedHouse({Key? key, required this.houseIndex}) : super(key: key);
  final int houseIndex;

  @override
  _EditPostedHouseState createState() => _EditPostedHouseState();
}

class _EditPostedHouseState extends State<EditPostedHouse> {
  List<int> numberOfRoomItems = [1, 2, 3, 4, 5, 6, 7, 8];
  List<String> subcityItems = [
    'Bole',
    'Yeka',
    'Arada',
    'Kirkos',
    'Lideta',
    'Gulele',
    'Nefassilk',
    'Akaki Kality',
    'Addis Ketema',
    'Kolfe Keranyo',
  ];
  List<String> districtItems = [
    '',
    'District 5',
    'District 18',
    'District 44',
    'District 23',
    'District 12',
  ];
  List<String> localityItems = [
    '',
    'Kebele 01',
    'Kebele 9',
    'Kebele 19',
    'Kebele 9',
    'Kebele 15'
  ];
  late final provider =
      Provider.of<HouseData>(context).houses[widget.houseIndex];
  late int selectedNoRooms = provider.numberOfRooms;
  late String selectedSubcity = provider.location;
  // String selectedLocality = '';
  // String selectedDistrict = '';
  late String description = provider.description;
  final descriptionController = TextEditingController();
  late String houseTitle = provider.title;
  late int price = provider.price;
  late double meterSquare = provider.meterSquare;
  late String image = provider.images[0];
  bool visibility = false;

  bool verifyInput(String vHouseTitle, int vPrice, double vMeterSquare) {
    if (vHouseTitle.length >= 0 && vMeterSquare >= 0 && price >= 1)
      return true;
    else
      return false;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<HouseData>(builder: (context, house, child) {
      final houseToEdit = house.houses[widget.houseIndex];
      return Scaffold(
        appBar: AppBar(title: Text('Edit Posted House'), actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => ShowAlertDialog(
                  title: 'Are you sure you want to delete this house?',
                  actionTitle1: 'Yes',
                  action1: () {
                    Navigator.pop(context);
                    Navigator.pushNamed(context, MyHomes.id);

                    house.deleteHouse(widget.houseIndex);
                  },
                  actionTitle2: 'No',
                  action2: () {
                    Navigator.pop(context);
                  },
                ),
              );
            },
            icon: Icon(
              Icons.delete_forever_outlined,
              color: Colors.red,
            ),
          ),
        ]),
        body: Center(
          child: ListView(
            children: [
              SizedBox(
                height: 20,
              ),
              Input(
                  hintText: houseToEdit.title,
                  iconData: Icons.house,
                  onChanged: (value) {
                    houseTitle = value;
                  },
                  label: 'House Title'),
              InputNumber(
                hintText: houseToEdit.price.toString(),
                iconData: Icons.price_change,
                onChanged: (value) {
                  if (value.length >= 1) price = int.parse(value);
                },
                keybardType: TextInputType.number,
                label: 'Price',
                maxLength: 7,
              ),
              InputNumber(
                  hintText: houseToEdit.meterSquare.toString(),
                  iconData: Icons.format_size,
                  onChanged: (value) {
                    if (value.length >= 1) meterSquare = double.parse(value);
                  },
                  keybardType: TextInputType.number,
                  label: 'Area in m\u00B2'),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: Row(
                  children: [
                    Text('Number of Rooms'),
                    SizedBox(
                      width: 30,
                    ),
                    DropdownMenuIntegers(
                      items: numberOfRoomItems,
                      icon: Icon(
                        Icons.arrow_drop_down_outlined,
                        color: kPrimaryColor,
                        size: 35,
                      ),
                      selectedItem: selectedNoRooms,
                      onChanged: (value) {
                        setState(() {
                          selectedNoRooms = value!;
                        });
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 28.0),
                child: Row(
                  children: [
                    Text('Insert Image'),
                    TextButton(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: ((builder) => bottomSheet()),
                        );
                      },
                      child: Container(
                        height: 150,
                        width: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(houseToEdit.images[0]),
                                alignment: Alignment.center),
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  Text('Location'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Subcity: '),
                      SizedBox(
                        width: 20,
                      ),
                      DropdownMenu(
                          items: subcityItems,
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: kPrimaryColor,
                            size: 35,
                          ),
                          selectedItem: selectedSubcity,
                          onChanged: (value) {
                            setState(() {
                              selectedSubcity = value!;
                            });
                          }),
                    ],
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text('District: '),
                  //     DropdownMenu(
                  //         items: districtItems,
                  //         icon: Icon(
                  //           Icons.arrow_drop_down_outlined,
                  //           color: kPrimaryColor,
                  //           size: 35,
                  //         ),
                  //         selectedItem: selectedDistrict,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedDistrict = value!;
                  //           });
                  //         }),
                  //     Text('Locality'),
                  //     DropdownMenu(
                  //         items: localityItems,
                  //         icon: Icon(
                  //           Icons.arrow_drop_down_outlined,
                  //           color: kPrimaryColor,
                  //           size: 35,
                  //         ),
                  //         selectedItem: selectedLocality,
                  //         onChanged: (value) {
                  //           setState(() {
                  //             selectedLocality = value!;
                  //           });
                  //         })
                  //   ],
                  // )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color(0xfff0f0f5),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: size.width * 0.9,
                child: TextField(
                  controller: descriptionController,
                  onChanged: (value) {
                    description = value;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: houseToEdit.description,
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  maxLines: 10,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Visibility(
                visible: visibility,
                child: Text(
                  'please enter the required information correctly.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: RoundButton(
                  text: 'Edit House',
                  color: kPrimaryColor,
                  textColor: Colors.white,
                  onPressed: () {
                    if (verifyInput(
                      houseTitle,
                      price,
                      meterSquare,
                    )) {
                      setState(() {
                        visibility = false;
                      });
                      showDialog(
                        context: context,
                        builder: (context) => ShowAlertDialog(
                          title: 'Are you sure you want to edit this house?',
                          actionTitle1: 'Yes',
                          action1: () {
                            Provider.of<HouseData>(context, listen: false)
                                .editHouse(
                              widget.houseIndex,
                              houseTitle,
                              price,
                              meterSquare,
                              selectedNoRooms,
                              selectedSubcity,
                              description,
                            );
                            Navigator.pop(context);
                            Navigator.pushNamed(context, MyHomes.id);
                          },
                          actionTitle2: 'No',
                          action2: () {
                            Navigator.pop(context);
                          },
                        ),
                      );
                    } else {
                      setState(() {
                        visibility = true;
                      });
                    }
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget bottomSheet() {
    return Container(
      height: 150,
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Text('Choose a House Photo'),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton.icon(
                onPressed: () {
                  //  selectImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.camera,
                  size: 28,
                  color: kPrimaryColor,
                ),
                label: Text('Camera'),
              ),
              TextButton.icon(
                onPressed: () {
                  // selectImage(ImageSource.camera);
                },
                icon: Icon(
                  Icons.photo,
                  size: 28,
                  color: kPrimaryColor,
                ),
                label: Text('Gallery'),
              )
            ],
          )
        ],
      ),
    );
  }
}
