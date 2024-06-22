import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/home/data/models/notification_model.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class NotificationsListWidget extends StatelessWidget {
  const NotificationsListWidget({super.key, required this.notifications});
  final List<NotificationModel> notifications;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(CSizes.defaultSpace),
      child: ListView.separated(
        separatorBuilder: (context,i) => const SizedBox(height: CSizes.spaceBtwItems,),
        itemCount: notifications.length,
        itemBuilder: (context, i) => CRoundedContainer(
          color: CColors.softGrey,
          radius: 20,
          padding: const EdgeInsets.all(15),
          height: null,
          centerChild: false,
          child: Row(children: [
            const Icon(Icons.notifications,color: Colors.orange),
            const SizedBox(width: CSizes.spaceBtwItems),
            Expanded(
              child: Text(
                trans(
                    enText: notifications[i].msgEn,
                    arText: notifications[i].msgAr),
                style: CAppStyles.styleMedium13(context),
                softWrap: true,
              ),
            )
          ]),
        ),
      ),
    );
  }
}
