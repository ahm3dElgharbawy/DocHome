import 'package:dochome/common/widgets/appbars/main_appbar.dart';
import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/shimmers/notifications_shimmer.dart';
import 'package:dochome/components/notifications/logic/notifications_cubit/notifications_cubit.dart';
import 'package:dochome/components/notifications/screens/all_notifications/widgets/notifications_list.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key, required this.userType});
  final UserType userType;
  @override
  Widget build(BuildContext context) {
    final cubit = NotificationsCubit.get(context)..getAllNotifications(userType);
    return Scaffold(
      appBar: CMainAppBar(
        title: 'Notifications'.tr,
        centerTitle: true,
      ),
      body: BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, state) {
          if (state is LoadingNotificationsState) {
            return const CustomNotificationsShimmer();
          }
          if (state is FailureNotificationsState) {
            return CustomFailureWidget(onTap: (){
              cubit.getAllNotifications(userType);
            });
          }
          return cubit.notifications.isNotEmpty
              ? NotificationsListWidget(
                  notifications: cubit.notifications)
              : Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/ion_notifications.svg'),
                      Text(
                        'No Notifications'.tr,
                        style: CAppStyles.styleMedium24(context),
                      ),
                      Text(
                        'You have no notifications at this time'.tr,
                        style: CAppStyles.styleRegular16(context),
                      )
                    ],
                  ),
                );
        },
      ),
    );
  }
}
