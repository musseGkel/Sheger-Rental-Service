import 'package:flutter/material.dart';
import 'package:sheger_homes/constants.dart';

class ReportPage extends StatefulWidget {
  static const String id = 'report';
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  String message = '';
  bool visible = false;
  final controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kPrimaryColor,
      appBar: AppBar(
        title: Text('Report'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 130,
              ),
              Visibility(
                visible: visible,
                child: Container(
                  child: Text(
                    'Your report is sent we will look into it.',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Color(0xfff0f0f5),
                  borderRadius: BorderRadius.circular(20),
                ),
                width: size.width * 0.9,
                child: TextField(
                  controller: controller,
                  onChanged: (value) {
                    message = value;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Write down your issue here',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  maxLines: 10,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: size.width * 0.9,
                decoration: BoxDecoration(
                    color: kPrimaryLightColor,
                    borderRadius: BorderRadius.circular(20)),
                child: TextButton(
                  onPressed: () {
                    setState(() {
                      visible = true;
                      controller.clear();
                    });
                  },
                  child: Text(
                    'Send',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
