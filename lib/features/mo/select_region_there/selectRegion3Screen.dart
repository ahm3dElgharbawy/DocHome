import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbars/main_appbar.dart';
import '../../../common/widgets/buttons/rounded_button.dart';
import '../../../common/widgets/text_fields/text_field_with_shadow.dart';
import '../../../utils/constants/image_strings.dart';
import '../select_region_two/selectRegion2Screen.dart';

class SelectRegion3Screen extends StatefulWidget {
  final String? region;

  const SelectRegion3Screen({Key? key,this.region }) : super(key: key);

  @override
  State<SelectRegion3Screen> createState() => _SelectRegion3ScreenState();
}

class _SelectRegion3ScreenState extends State<SelectRegion3Screen> {



  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: CMainAppBar(),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.1),
                child: Container(
                  width: screenWidth * 0.6,
                  height: screenHeight * 0.25,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(CImages.region1),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Text(
                    'Choose your region',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: screenWidth * 0.06,
                      fontFamily: 'Outfit',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.01),
              Column(
                children: [
                  SizedBox(
                    width: screenWidth * 0.8,
                    child: Text(
                      '   Please choose your area to help us provide\n you with the best service',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF757575),
                        fontSize: screenWidth * 0.04,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: screenHeight * 0.07),
              CTextFieldWithInnerShadow(
                hintText:widget.region ?? 'Region is not selected',
                suffixIcon: Icon(Icons.arrow_forward),
                onTapSuffixIcon: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectRegion2Screen(),
                      ));
                },
                obscureText:true,
              ),
              SizedBox(height: screenHeight * 0.13),
              CRoundedButton(
                onPressed: () {  },
                title: 'Save',
                height: screenHeight * 0.06,
                width: screenWidth * 0.9,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

