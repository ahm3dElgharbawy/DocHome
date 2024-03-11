import 'package:dochome/caregiver/features/authentication/screens/join/widgets/upload_button.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UploadsScreen extends StatelessWidget {
  const UploadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CUploadButton(
          title: "Personal\nimage",
          icon: Icons.image,
          source: ImageSource.gallery,
        ),
        CUploadButton(
          title: "Identity\ncard",
          icon: Icons.card_giftcard,
          source: ImageSource.gallery,
        ),
        CUploadButton(
          title: "Practice the\nprofession card",
          icon: Icons.verified_user_sharp,
          source: ImageSource.gallery,
        )
      ],
    );
  }
}


