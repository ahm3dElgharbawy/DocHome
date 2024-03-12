import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/widgets/appbars/main_appbar.dart';
import '../../../common/widgets/buttons/rounded_button.dart';
import '../../../utils/constants/image_strings.dart';


class CreditCardForm extends StatefulWidget {
  @override
  _CreditCardFormState createState() => _CreditCardFormState();
}

class _CreditCardFormState extends State<CreditCardForm> {
  final _formKey = GlobalKey<FormState>();
  String _cardNumber = '';
  String _cardHolderName = '';
  String _expirationDate = '';
  String _securityCode = '';

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final double screenHeight = screenSize.height;
    final double screenWidth = screenSize.width;

    return Scaffold(
      appBar: CMainAppBar(),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.all(screenWidth * 0.04),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.04,
                    bottom: screenHeight * 0.04,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Credit Card Details',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          height: 0.07,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: screenWidth * 0.65,
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                            color: Colors.white70,
                            borderRadius: BorderRadius.circular(screenWidth * 0.04),
                          ),
                          child: Center(
                            child: Image(image: AssetImage(CImages.visa1)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name on card',
                      hintText: 'mohamed Gebriel',
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your name';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _cardHolderName = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Card Number',
                      hintText: '0000 0000 0000 0000',
                      suffixIcon: Padding(
                        padding: EdgeInsets.all(screenWidth * 0.055),
                        child: ImageIcon(AssetImage(CImages.visa2),
                          size: screenWidth * 0.08,
                        ),
                      ),
                      suffixIconColor: Color(0xFF4D8BBB),
                      labelStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        height: 0.10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(screenWidth * 0.05),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty || value.length < 16) {
                        return 'Please enter a valid card number';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      setState(() {
                        _cardNumber = value!;
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: screenHeight * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05,
                    bottom: screenHeight * 0.05,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Card expiration',
                            hintText: '3/14',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 5) {
                              return 'Please enter a valid expiration date';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _expirationDate = value!;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: screenWidth * 0.05),
                      Expanded(
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Code Security',
                            hintText: '123',
                            labelStyle: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              height: 0.10,
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(screenWidth * 0.05),
                            ),
                          ),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 3) {
                              return 'Please enter a valid security code';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            setState(() {
                              _securityCode = value!;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  child: CRoundedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _formKey.currentState!.save();
                      }
                    },
                    title: "Save",
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

