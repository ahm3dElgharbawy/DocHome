import 'dart:math';

import 'package:dochome/common/widgets/text_fields/outlined_text_field.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class CSendMessageBottomBar extends StatelessWidget {
  const CSendMessageBottomBar(
      {super.key, required this.onSend, required this.controller, required this.onTapUpload});
  final VoidCallback onSend;
  final TextEditingController controller;
  final VoidCallback onTapUpload;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.grey[200],
      margin: EdgeInsets.zero,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          IconButton(
            onPressed:  onTapUpload,
            splashRadius: 22,
            icon: Transform.rotate(
              angle: -pi / 4,
              child: const Icon(
                Icons.attachment_rounded,
                size: 30,
                color: CColors.primary,
              ),
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: CustomOutlinedTextField(
                controller: controller,
                hintText: "Type a message...".tr,
              ),
            ),
          ),
          IconButton(
            splashRadius: 22,
            onPressed: onSend,
            icon: const Icon(
              Icons.send,
              size: 26,
              color: CColors.primary,
            ),
          ),
        ]),
      ),
    );
  }
}
