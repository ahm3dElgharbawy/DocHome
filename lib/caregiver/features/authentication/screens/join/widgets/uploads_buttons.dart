import 'package:dochome/caregiver/features/authentication/screens/join/widgets/upload_button.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class CUploadsButtons extends StatelessWidget {
  const CUploadsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CUploadButton(
          title: "Personal\nimage".tr,
          icon: Icons.image,
          source: ImageSource.gallery,
          index: 0,
        ),
        CUploadButton(
          title: "Identity\ncard".tr,
          icon: Icons.contact_emergency,
          source: ImageSource.gallery,
          index: 1,
        ),
        CUploadButton(
          title: "Practice the\nprofession card".tr,
          icon: Icons.verified_user_sharp,
          source: ImageSource.gallery,
          index: 2,
        )
      ],
    );
  }
}
