import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../common/widgets/appbars/main_appbar.dart';
import '../../../common/widgets/buttons/rounded_button.dart';
import '../../../common/widgets/text_fields/text_field_with_shadow.dart';
import '../select_region_there/selectRegion3Screen.dart';

class SelectRegion2Screen extends StatefulWidget {
  const SelectRegion2Screen({Key? key}) : super(key: key);

  @override
  State<SelectRegion2Screen> createState() => _SelectRegion2ScreenState();
}

class _SelectRegion2ScreenState extends State<SelectRegion2Screen> {
  String? region;
  TextEditingController searchController = TextEditingController();

  Widget _buildRegionOption(String title) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      height: 50,
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
        border: Border.all(
          width: MediaQuery.of(context).size.width * 0.0035,
          color: Color(0xFF4D8BBB),
        ),
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.width * 0.05),
      ),
      child: RadioListTile(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.black,
            fontSize: MediaQuery.of(context).size.width * 0.05,
            fontFamily: 'Outfit',
            height: 0,
          ),
        ),
        value: title,
        groupValue: region,
        onChanged: (value) {
          setState(() {
            region = value.toString();
          });
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CMainAppBar(
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.025),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Select region',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.width * 0.06,
                        fontFamily: 'Outfit',
                        fontWeight: FontWeight.w500,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.02),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.01),
              child: CTextFieldWithInnerShadow(
                controller: searchController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Search must not be empty';
                  }
                  return null;
                },
                hintText: 'Search',
                prefixIcon: Icon(Icons.search_rounded),
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.03),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.06),
              child: Column(
                children: [
                  _buildRegionOption("El Delengat"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("Kafr El Dawwar"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("El Nubaria"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("Itay El Barud"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("Kom Hamada"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("Edku"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("Abu Hummus"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("El Mahmoudiya"),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                  _buildRegionOption("Hosh Essa"),
                ],
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.06),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05),
              child: CRoundedButton(
                onPressed: () {
                  print(region);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SelectRegion3Screen(
                        region: region,
                      ),
                    ),
                  );
                },
                title: 'Continue',
                width: MediaQuery.of(context).size.width * 0.95,
                height: 50,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          ],
        ),
      ),
    );
  }
}




