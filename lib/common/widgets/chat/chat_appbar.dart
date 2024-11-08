import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/utils/api/endpoints.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CChatAppBar({super.key, required this.username, this.image});
  final String username;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: true,
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      title: ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: image == null
              ? const AssetImage(CImages.user)
              : CachedNetworkImageProvider("${EndPoints.domainUrl}/$image") as ImageProvider,
        ),
        title: Text(username, style: CAppStyles.styleSemiBold16(context)),
        // subtitle: Text(
        //   "last seen today at 7:10 PM",
        //   style: CAppStyles.styleRegular12(context),
        // ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(CSizes.appBarHeight);
}
