import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class CHomeAppBar extends StatelessWidget {
  const CHomeAppBar({super.key, this.padding = EdgeInsets.zero, required this.avatar, required this.onTapActions});
  final EdgeInsetsGeometry padding;
  final String avatar;
  final VoidCallback onTapActions;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CCircularContainer(
            height: 36,
            width: 36,
            backgroundImage: CachedNetworkImageProvider(avatar.asLink()),
          ),
          Container(
            height: 36,
            width: 36,
            decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.circular(88),
                color: const Color(0xffEBF1F0)),
            child: GestureDetector(
              onTap: onTapActions,
              child: const Center(
                child: Icon(
                  Icons.notifications,
                  size: 28,
                  color: CColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
