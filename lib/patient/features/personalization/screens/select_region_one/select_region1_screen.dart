import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import '../select_region_two/select_region2_screen.dart';

class SelectRegion1Screen extends StatelessWidget {
  const SelectRegion1Screen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CMainAppBar(
        showBackArrow: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.1),
                child: Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(CImages.region2),
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
                    color: const Color(0xFF757575),
                    fontSize: screenWidth * 0.039,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              CTextFieldWithInnerShadow(
                hintText: 'Select region',
                suffixIcon: const Icon(Icons.arrow_forward),
                readOnly: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectRegion2Screen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
