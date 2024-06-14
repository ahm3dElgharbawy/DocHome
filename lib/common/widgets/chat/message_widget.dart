import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/helper_functions.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class MessageWidget extends StatelessWidget {
  const MessageWidget(
      {super.key,
      required this.message,
      this.createdAt,
      required this.isMe,
      this.file});
  final String message;
  final String? createdAt;
  final String? file;
  final bool isMe;
  @override
  Widget build(BuildContext context) {
    MediaType? fileType =
        file == null ? null : CHelperFunctions.getMediaType(file!);
    print(fileType);
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(bottom: 10),
          constraints: const BoxConstraints(maxWidth: 250),
          decoration: BoxDecoration(
            color: isMe ? CColors.primary : const Color(0xffE1E7EC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            crossAxisAlignment:
                isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
            children: [
              if (file != null)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: fileType == MediaType.image
                      ? CachedNetworkImage(imageUrl: "${EndPoints.domainUrl}/$file")
                      : Image.asset(
                          CHelperFunctions.getMediaImage(fileType),
                          height: 100,
                        ),
                ),
              if (message != "")
                SelectableText(
                  message,
                  style: CAppStyles.styleRegular14(context)
                      .copyWith(color: isMe ? Colors.white : Colors.black),
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                ),
              if (createdAt != null)
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(
                    createdAt!,
                    style: CAppStyles.styleRegular14(context).copyWith(
                        color: isMe ? Colors.white70 : Colors.grey.shade600),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
