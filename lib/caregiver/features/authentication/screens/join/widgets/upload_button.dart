import 'dart:io';

import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class CUploadButton extends StatefulWidget {
  const CUploadButton({
    super.key,
    required this.title,
    required this.icon,
    required this.source,
    required this.index

  });
  final String title;
  final IconData icon;
  final ImageSource source;
  final int index;

  @override
  State<CUploadButton> createState() => _CUploadButtonState();
}

class _CUploadButtonState extends State<CUploadButton> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        final pickedFile = await ImagePicker().pickImage(source: widget.source);
        if (pickedFile != null) {
          setState(() {
            image = File(pickedFile.path);
            context.read<CaregiverAuthBloc>().files[widget.index] = image;
          });
        }
      },
      child: Column(
        children: [
          CRoundedContainer(
            height: 60,
            width: 60,
            radius: 16,
            color: CColors.softGrey,
            child: image != null
                ? Image.file(
                    image!,
                    fit: BoxFit.cover,
                  )
                : Icon(
                    widget.icon,
                    color: CColors.primary,
                  ),
          ),
          const SizedBox(height: CSizes.sm),
          Text(
            widget.title,
            style: CAppStyles.styleRegular12(context),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
