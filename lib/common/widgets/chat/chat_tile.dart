import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  const ChatTile({
    super.key,
    required this.lastMessage,
    required this.time,
    this.image,
    required this.name,
    this.unReadMessages,
    this.isLastChat = false,
    this.onTap,
  });
  final String lastMessage;
  final String time;
  final String? image;
  final String name;
  final int? unReadMessages;
  final bool isLastChat;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              name,
              style: CAppStyles.styleSemiBold16(context),
              maxLines: 1,
            ),
          ),
          subtitle: Text(
            lastMessage,
            style: CAppStyles.styleRegular14(context)
                .copyWith(color: const Color(0xff90A4AE)),
            maxLines: 1,
          ),
          onTap: onTap,
          leading: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: image == null
                  ? const DecorationImage(
                      image: AssetImage(CImages.user),
                      fit: BoxFit.cover,
                    )
                  : DecorationImage(
                      image: CachedNetworkImageProvider("${EndPoints.domainUrl}/$image"),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (unReadMessages != null && unReadMessages != 0)
                CCircularContainer(
                  width: 23,
                  height: 23,
                  color: CColors.primary,
                  child: Text(
                    unReadMessages! > 9 ? "+9" : "$unReadMessages",
                    style: CAppStyles.styleSemiBold13(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              Text(
                time,
                style: CAppStyles.styleRegular14(context)
                    .copyWith(color: const Color(0xff90A4AE)),
              ),
            ],
          ),
        ),
        if (!isLastChat)
          const Divider(
            indent: 60,
          )
      ],
    );
  }
}
