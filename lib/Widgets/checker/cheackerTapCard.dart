import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../Home/checkerpage/policy_details.dart';
import '../../data_service/insura_data.dart';

class CheckerTab extends StatefulWidget {
  const CheckerTab({Key? key}) : super(key: key);

  @override
  State<CheckerTab> createState() => _CheckerTabState();
}

class _CheckerTabState extends State<CheckerTab> {
  final idNumberController = TextEditingController();

  bool isSearch = false;
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 400,
            width: _width,
            decoration: BoxDecoration(
              color: Color(0xFFE8F3F3),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    spreadRadius: 3),
              ],
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(left: 60.0, right: 60, top: 30),
                  child: Lottie.asset('assets/lotties/check.json'),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(14.0),
                      child: Text(
                        "Hello, Koya Brown! Check Your \nVehicle Policy Status Here",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Poppins-Bold",
                          fontSize: 18,
                          color: Color(0xFF303F46),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 45),
                  height: 60,
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.1),
                          blurRadius: 10,
                          spreadRadius: 3),
                    ],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        child: TextFormField(
                          controller: idNumberController,
                          onSaved: (value) {
                            idNumberController.text = value.toString();
                          },
                          decoration: InputDecoration(
                            hintText: "Enter Policy Number",
                            hintStyle: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontSize: 20,
                            ),
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          InsuraData.checker(context, idNumberController.text)
                              .then((response) {
                            if (response['isExpired'].toDate()) {
                              // it has expired
                            } else {
                              ///not expired
                            }
                          });
                          setState(() {
                            isSearch = true;
                          });
                        },
                        child: Container(
                          height: 60,
                          width: 65,
                          decoration: BoxDecoration(
                            color: Color(0xFF6F8827),
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(8),
                                bottomRight: Radius.circular(8)),
                          ),
                          child: Icon(
                            CupertinoIcons.search,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Text(
            "Policy Status",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontFamily: "Poppins-Bold",
              fontSize: 20,
              color: Color(0xFF303F46),
            ),
          ),
        ),
        if (isSearch == false)
          // policy card status message
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Expanded(
              child: Container(
                height: 100,
                child: Center(
                  child: Text(
                    'No policy card status here',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                      letterSpacing: 2,
                      fontFamily: "Poppins-SemiBold",
                    ),
                  ),
                ),
              ),
            ),
          ),
        if (isSearch == true) statusCard(_width, _height),
      ],
    );
  }

  // status card
  Padding statusCard(double _width, double _height) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Container(
          width: _width,
          height: _height <= 700 ? 185 : 200,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 3),
            ],
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      width: 200,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CupertinoIcons.ellipsis,
                      color: Color(0xFF303F46),
                    ),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20.0),
                child: Row(
                  children: [
                    Icon(
                      CupertinoIcons.check_mark_circled,
                      size: _height <= 700 ? 50 : 60,
                      color: Color(0xFFA7CD3A),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "Insurance Policy Active",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFF303F46),
                                    fontFamily: "Poppins-Bold",
                                  ),
                                ),
                                TextSpan(
                                  text: "\nPhilip & Cater Insurance PLC",
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Color(0xFFA7CD3A),
                                    fontFamily: "Poppins-Bold",
                                  ),
                                ),
                                TextSpan(
                                    text: "\nInsurance type: Vehicle Insurance",
                                    style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey,
                                      fontFamily: "Poppins-Regular",
                                    )),
                              ],
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: _height <= 700 ? 9 : 12.0),
                child: Divider(
                  color: Colors.grey,
                  thickness: 0.3,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: _height <= 700 ? 13 : 15.0, right: 25, left: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PolicyDetails.id);
                      },
                      child: Text(
                        "REVIEW",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 2,
                          fontFamily: "Poppins-SemiBold",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "SEND MEMO",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 2,
                          fontFamily: "Poppins-SemiBold",
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Text(
                        "SHARE",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                          letterSpacing: 2,
                          fontFamily: "Poppins-SemiBold",
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }
}