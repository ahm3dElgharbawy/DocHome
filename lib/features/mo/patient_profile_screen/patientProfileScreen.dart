
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbars/main_appbar.dart';
import '../../../common/widgets/listTitle/list_title.dart';
import '../../../utils/constants/image_strings.dart';
import '../my_accuont_screen/myAccountScreen.dart';
import '../payment_screen/payment_screen.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CMainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: screenWidth,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  children: [
                    Container(
                      width: screenWidth * 0.8,
                      height: screenHeight * 0.06,
                      child: Stack(
                        children: [
                          Positioned(
                            left: 0,
                            top: 0,
                            child: Text(
                              'welcome Mohamed Gebriel',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: screenWidth * 0.05,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          Positioned(
                            left: 0,
                            top: screenHeight * 0.035,
                            child: Text(
                              '+20 01140559306',
                              style: TextStyle(
                                color: Color(0xFF757575),
                                fontSize: screenWidth * 0.04,
                                fontFamily: 'Outfit',
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Divider(
                  color: Color(0xFF757575),
                  thickness: 1,
                  height: screenHeight * 0.01,
                ),
              ),
              SizedBox(height: screenHeight * 0.01),
              Container(
                width: screenWidth * 0.4,
                height: screenWidth * 0.42,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(CImages.appLogo),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.005),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.009),
                child: Column(
                  children: [
                    buildListTile(
                      icon: Icons.account_circle,
                      title: 'My Account',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyAccountScreen(),
                          ),
                        );
                      }, context: context,
                    ),
                    buildListTile(
                      icon: Icons.credit_card,
                      title: 'Manage credit',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CreditCardForm(),
                          ),
                        );
                      }, context: context,
                    ),
                    buildListTile(
                      icon: Icons.support_agent,
                      title: 'Support',
                      onTap: () {
                        // Handle support onTap
                      }, context: context,
                    ),
                    buildListTile(
                      icon: Icons.logout,
                      title: 'Log out',
                      onTap: () {
                        // Handle logout onTap
                      }, context: context,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



