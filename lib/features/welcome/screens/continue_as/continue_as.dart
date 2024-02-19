import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ContinueAsScreen extends StatelessWidget {
  const ContinueAsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(CSizes.defaultSpace),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Continue As",style: CAppStyles.styleBold30(context).copyWith(color: CColors.primary),),
                Image.asset(CImages.appLogo,height: 250,),
                CRoundedButton(onPressed: (){}, title: "Patient"),
                const SizedBox(height: CSizes.spaceBtwItems),
                CRoundedButton(onPressed: (){}, title: "Caregiver")
              ],
            ),
          ),
        )
      ),
    );
  }
}
