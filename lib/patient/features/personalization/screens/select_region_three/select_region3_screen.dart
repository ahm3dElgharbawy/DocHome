import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/home/screens/home.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import '../../../../../utils/constants/image_strings.dart';
import '../select_region_two/select_region2_screen.dart';

class SelectRegion3Screen extends StatefulWidget {
  final String? region;

  const SelectRegion3Screen({Key? key, this.region}) : super(key: key);

  @override
  State<SelectRegion3Screen> createState() => _SelectRegion3ScreenState();
}

class _SelectRegion3ScreenState extends State<SelectRegion3Screen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: const CMainAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(screenWidth * 0.1),
              child: Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(CImages.region1),
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
                      color: const Color(0xFF757575),
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
              hintText: widget.region ?? 'Region is not selected',
              suffixIcon: const Icon(Icons.arrow_forward),
              onTapSuffixIcon: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SelectRegion2Screen(),
                  ),
                );
              },
              obscureText: true,
            ),
            SizedBox(height: screenHeight * 0.13),
            CRoundedButton(
              margin:
                  const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const Home()),
                    (route) => false);
              },
              title: 'Save',
            ),
            const SizedBox(height: CSizes.spaceBtwItems),
          ],
        ),
      ),
    );
  }
}
