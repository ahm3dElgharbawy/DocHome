import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/common/widgets/profile/profile_header.dart';
import 'package:dochome/common/widgets/profile/settings_list.dart';
import 'package:dochome/common/widgets/profile/settings_tile.dart';
import 'package:dochome/patient/features/personalization/data/data_source/profile_settings_data.dart';
import 'package:dochome/patient/features/personalization/screens/profile/widgets/statistics_container.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:flutter/material.dart';

class PatientProfileScreen extends StatelessWidget {
  const PatientProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> emailParts = PatientLocal.get()!.email.split("@");
    return Scaffold(
      backgroundColor: CColors.softGrey,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              CProfileHeader(
                userName: emailParts.first,
                userEmail: "@${emailParts.last}",
                color: CColors.primary,
                image: CachedNetworkImageProvider(PatientLocal.get()!.avatar!.asLink()), // patient profile image
              ),
              //? containing statistics.
              const CPatientStatisticsContainer(),
              CSettingsList(
                child: Column(
                  children: [
                    ...ProfileSettingsData.data(context).map(
                      (item) => CSettingsTile(
                        title: item.title,
                        leadingIcon: item.icon,
                        leadingBackgroundColor: item.leadingBackgroundColor,
                        onTap: item.onTap
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
