import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/patient/features/personalization/screens/select_region_one/select_region1_screen.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../../../common/widgets/appbars/main_appbar.dart';
import '../../../../../common/widgets/buttons/rounded_button.dart';
import '../../../../../common/widgets/text_fields/text_field_with_shadow.dart';
import '../../../../../utils/constants/image_strings.dart';

class MyAccountScreen extends StatelessWidget {
  const MyAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = CHelperFunctions.screenWidth(context);
    final screenHeight = CHelperFunctions.screenHeight(context);

    return Scaffold(
      appBar: const CMainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenHeight * 0.05),
              CircleAvatar(
                backgroundColor: const Color(0xFF4D8BBB),
                backgroundImage: const AssetImage(CImages.account),
                radius: screenWidth * 0.1,
                child: Stack(
                  children: [
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: CCircularContainer(
                          onTap: () {},
                          color: Colors.white,
                          height: screenWidth * .09,
                          width: screenWidth * .09,
                          child: Icon(
                            Icons.camera_alt,
                            size: screenWidth * .05,
                            color: Colors.black,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              Text(
                'My Account',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: screenWidth * 0.06,
                  fontFamily: 'Outfit',
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: screenHeight * 0.05),
              const CTextFieldWithInnerShadow(
                hintText: 'Mohamed Gebriel',
                prefixIcon: Icon(Icons.switch_account),
              ),
              SizedBox(height: screenHeight * 0.02),
              const CTextFieldWithInnerShadow(
                hintText: '+02 01140559306',
                prefixIcon: Icon(Icons.phone),
              ),
              SizedBox(height: screenHeight * 0.02),
              const CTextFieldWithInnerShadow(
                hintText: 'mohamedgmetwally540@gmail.com',
                prefixIcon: Icon(Icons.local_post_office),
              ),
              SizedBox(height: screenHeight * 0.05),
              CRoundedButton(
                onPressed: () {},
                title: 'Save',
                width: screenWidth * 0.8,
              ),
              SizedBox(height: screenHeight * 0.025),
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectRegion1Screen()));
                },
                child: Text(
                  'Choose your region?',
                  style: TextStyle(
                    color: const Color(0xFF4D8BBB),
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.0070),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Change Password?',
                  style: TextStyle(
                    color: const Color(0xFF4D8BBB),
                    fontSize: screenWidth * 0.04,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w500,
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
