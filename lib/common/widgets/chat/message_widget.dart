import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key,
      required this.message,
      required this.createdAt,
      required this.isMe});
  final String message;
  final String createdAt;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isMe ?  CColors.primary : const Color(0xffE1E7EC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment:isMe? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              Text(
                message,
                style:CAppStyles.styleRegular14(context).copyWith(color: isMe? Colors.white : Colors.black),
                textAlign: isMe ? TextAlign.end : TextAlign.start,
              ),
              const SizedBox(height: 10),
              Text(
                createdAt,
                style: CAppStyles.styleRegular14(context).copyWith(color: isMe? Colors.white70 : Colors.grey.shade600 ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
