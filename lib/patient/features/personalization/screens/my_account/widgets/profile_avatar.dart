import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class ProfileAvatarWidget extends StatefulWidget {
  const ProfileAvatarWidget({super.key, this.patientAvatar});
  final String? patientAvatar;
  @override
  State<ProfileAvatarWidget> createState() => _ProfileAvatarWidgetState();
}

class _ProfileAvatarWidgetState extends State<ProfileAvatarWidget> {
  File? newAvatar;

  @override
  Widget build(BuildContext context) {
    final screenWidth = CHelperFunctions.screenWidth(context);

    return CircleAvatar(
      backgroundColor: Colors.transparent,
      backgroundImage: newAvatar != null
          ? FileImage(newAvatar!) as ImageProvider
          : (widget.patientAvatar != null)
              ? CachedNetworkImageProvider(widget.patientAvatar!.asLink())
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
                  PersonalizationCubit.get(context).avatar = newAvatar;
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
