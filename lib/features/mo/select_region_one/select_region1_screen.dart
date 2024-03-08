import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbars/main_appbar.dart';
import '../../../common/widgets/text_fields/text_field_with_shadow.dart';
import '../../../utils/constants/image_strings.dart';
import '../select_region_two/selectRegion2Screen.dart';


class SelectRegion1Screen extends StatelessWidget {
  const SelectRegion1Screen({Key? key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CMainAppBar(leading: Icon(Icons.arrow_back_ios)),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.1),
                child: Container(
                  width: screenWidth * 0.8,
                  height: screenHeight * 0.24,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(CImages.region2),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02),
              Text(
                'Choose your region',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.06,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              SizedBox(
                width: screenWidth * 0.9,
                child: Text(
                  'Please choose your area to help us provide \n you with the best service',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF757575),
                    fontSize: screenWidth * 0.039,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              CTextFieldWithInnerShadow(
                hintText: 'Select region',
                suffixIcon: Icon(Icons.arrow_forward),
                onTapSuffixIcon: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectRegion2Screen(),
                    ),
                  );
                },
                obscureText: true,
              ),
              SizedBox(height: screenHeight * 0.1),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  onPrimary: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                    side: BorderSide(
                      width: 1.30,
                      color: Color(0x7F746868),
                    ),
                  ),
                  minimumSize: Size(screenWidth * 0.82, 50),
                ),
                child: Text(
                  'Continue',
                  style: TextStyle(
                    fontSize: screenWidth * 0.042,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

