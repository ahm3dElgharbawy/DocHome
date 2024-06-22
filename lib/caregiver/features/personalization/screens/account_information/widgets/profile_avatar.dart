import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/caregiver/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class CaregiverProfileAvatarWidget extends StatefulWidget {
  const CaregiverProfileAvatarWidget({super.key, this.caregiverAvatar});
  final String? caregiverAvatar;
  @override
  State<CaregiverProfileAvatarWidget> createState() => _CaregiverProfileAvatarWidgetState();
}

class _CaregiverProfileAvatarWidgetState extends State<CaregiverProfileAvatarWidget> {
  File? newAvatar;

  @override
  Widget build(BuildContext context) {
    final screenWidth = CHelperFunctions.screenWidth(context);

    return CircleAvatar(
      backgroundColor: const Color(0xFF4D8BBB),
      backgroundImage: newAvatar != null
          ? FileImage(newAvatar!) as ImageProvider
          : (widget.caregiverAvatar != null)
              ? CachedNetworkImageProvider( widget.caregiverAvatar!.asLink())
              : null,
      radius: screenWidth * 0.1,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomLeft,
            child: CCircularContainer(
              onTap: () async {
                newAvatar = await CHelperFunctions.pickImage();
                if (newAvatar != null && mounted) {
                  CaregiverPersonalizationCubit.get(context).avatar = newAvatar;
                  setState(() {});
                }
              },
              color: Colors.white,
              height: screenWidth * .09,
              width: screenWidth * .09,
              child: Icon(
                Icons.camera_alt,
                size: screenWidth * .05,
                color: Colors.black,
              ),
            ),
          )
        ],
      ),
    );
  }
}
