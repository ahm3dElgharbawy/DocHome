import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TermsAndConditionScreen extends StatefulWidget {
  const TermsAndConditionScreen({super.key});

  @override
  State<TermsAndConditionScreen> createState() =>
      _TermsAndConditionScreenState();
}

class _TermsAndConditionScreenState extends State<TermsAndConditionScreen> {
  String data = "";
  @override
  void initState() {
    super.initState();
    loadTermsAndConditions();
  }

  loadTermsAndConditions() async {
    data = await rootBundle.loadString('assets/terms_and_conditions.txt');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CMainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(CSizes.defaultSpace),
          child: Form(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 200,
                  child: Image.asset(CImages.appLogo),
                ),
                // const SizedBox(height: CSizes.spaceBtwItems),
                Text("terms & conditions",
                    style: CAppStyles.styleSemiBold25(context)),
                const SizedBox(height: CSizes.spaceBtwItems),
                CRoundedContainer(
                  radius: 10,
                  height: 300,
                  color: CColors.softGrey,
                  margin: const EdgeInsets.only(bottom: CSizes.spaceBtwItems),
                  padding: const EdgeInsets.fromLTRB(
                      CSizes.md, CSizes.md, CSizes.md, 0),
                  child: SingleChildScrollView(
                    child: Text(data),
                  ),
                ),
                CRoundedButton(onPressed: () {
                  Navigator.pop(context);
                }, title: "I Agree")
              ],
            ),
          ),
        ),
      ),
    );
  }
}
