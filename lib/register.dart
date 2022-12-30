import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  double screenHeight = 0;
  double screenWIdth = 0;
  double botton = 0;
  int sreenState = 0;
  Color blue = const Color(0xff8cccff);
  @override
  Widget build(BuildContext context) {
    screenHeight = MediaQuery.of(context).size.height;
    screenWIdth = MediaQuery.of(context).size.width;
    botton = MediaQuery.of(context).viewInsets.bottom;
    return SafeArea(
      child: WillPopScope(
        onWillPop: (() {
          setState(() {
            sreenState = 0;
          });
          return Future.value(false);
        }),
        child: Scaffold(
          backgroundColor: blue,
          body: SizedBox(
            height: screenHeight,
            width: screenWIdth,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding:  EdgeInsets.only(top: screenHeight /8),
                    child: Column(
                      children: [
                        Text(
                          "Join Us",
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWIdth/8,
                          ),
                        ), Text(
                          "Create an account today",
                          style: GoogleFonts.montserrat(
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                            fontSize: screenWIdth/30,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    height: screenHeight / 3.5,
                    width: screenWIdth / 3.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(30, -30),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      height: screenHeight / 3.5,
                      width: screenWIdth / 3,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Container(
                    height: screenHeight / 2,
                    width: screenWIdth / 1.8,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedContainer(
                    height: botton > 0 ? screenHeight : screenHeight / 2,
                    width: screenWIdth,
                    color: Colors.white,
                    duration: const Duration(microseconds: 800),
                    curve: Curves.fastLinearToSlowEaseIn,
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: screenWIdth / 12,
                        right: screenWIdth / 12,
                        top: botton > 0 ? screenHeight / 12 : 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          sreenState == 0
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "User name",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    TextFormField(
                                      controller: usernameController,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 16),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      "Phone Number",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    IntlPhoneField(
                                      controller: phoneController,
                                      showCountryFlag: false,
                                      showDropdownIcon: false,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 16),
                                      ),
                                    ),
                                  ],
                                )
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: "Kodingiz yuborildi ",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black87,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          TextSpan(
                                            text: phoneController.text,
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20,
                                            ),
                                          ),
                                          TextSpan(
                                            text: '\n Nima gap',
                                            style: GoogleFonts.montserrat(
                                                color: Colors.black87,
                                                // fontWeight: FontWeight.bold,
                                                fontSize: 12),
                                          ),
                                        ],
                                      ),
                                    ),
    
                                    Text(
                                      "User name",
                                      style: GoogleFonts.montserrat(
                                        color: Colors.black87,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.0,
                                    ),
                                    TextFormField(
                                      keyboardType: TextInputType.number,
                                      maxLength: 6,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(18),
                                        ),
                                        contentPadding:
                                            EdgeInsets.symmetric(horizontal: 16),
                                      ),
                                    ),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: ' Kodingiz kelmadimi !!! ',
                                          style: GoogleFonts.montserrat(
                                            color: Colors.black87,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        WidgetSpan(
                                            child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              sreenState = 0;
                                            });
                                          },
                                          child: Text(
                                            " Qayta boshlash",
                                            style: GoogleFonts.montserrat(
                                              color: Colors.black87,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ))
                                      ]),
                                    ),
    
                                    // Padding(
                                    //   padding: EdgeInsets.symmetric(
                                    //     horizontal: screenWith / 12,
                                    //   ),
                                    //   child:const PinCodeTextField(
                                    //     appContext: context,
                                    //     length: 6,
                                    //     onChanged: () {},
                                    //     Curves.easeIn,
                                    //     PointMode.lines,
                                    //   ),
                                    // ),
                                  ],
                                ),
                          GestureDetector(
                            onTap: () {
                              if (usernameController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content:
                                            Text(" Isminggizni kiriting !!!! ")));
                              } else if (phoneController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text(
                                            " Nomeringgizni kiriting !!!! ")));
                              } else {
                                setState(() {
                                  sreenState = 1;
                                });
                              }
                            },
                            child: Container(
                              height: 50,
                              width: screenWIdth,
                              margin: EdgeInsets.only(bottom: screenHeight / 8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  'Continue',
                                  style: GoogleFonts.montserrat(
                                    color: Colors.white,
                                    letterSpacing: 1.5,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// Widget stateRegister() {
//   return
// }

// Widget stateOTP() {
//   var screenWith;
//   return
// }

// Widget circle(double size)  {
//   // var screenHeight = 0;
//   // var screenWIdth = 0;
//   return Container(
//     height: screenHeight / size,
//     width: screenWIdth / size,
//     decoration: const BoxDecoration(
//       shape: BoxShape.circle,
//       color: Colors.white,
//     ),
//   );
// }
