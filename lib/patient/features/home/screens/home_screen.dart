import 'package:dochome/common/widgets/appbars/home_appbar.dart';
import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/components/notifications/screens/all_notifications/notifications_screen.dart';
import 'package:dochome/patient/features/authentication/data/models/patient.dart';
import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/home/screens/search/services_search.dart';
import 'package:dochome/patient/features/home/screens/widgets/category_list_view.dart';
import 'package:dochome/patient/features/home/screens/widgets/populer_doctor_list_view.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/enums.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Patient patient = PatientLocal.get()!;
    print(patient.toJson());
    print(PatientLocal.token);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: CSizes.defaultSpace, right: CSizes.defaultSpace, top: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CHomeAppBar(
                avatar: PatientLocal.get()!.avatar!,
                onTapActions: () {
                  context.push(const NotificationsScreen(userType: UserType.patient,));
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Hello,'.tr,
                style: CAppStyles.styleRegular18(context),
              ),
              Text(
                patient.name,
                style: CAppStyles.styleMedium20(context)
                    .copyWith(fontFamily: 'Outfit'),
              ),
              const SizedBox(
                height: 20,
              ),
              CTextFieldWithInnerShadow(
                hintText: 'Search service'.tr,
                margin: const EdgeInsets.all(0),
                prefixIcon: const Icon(Icons.search),
                readOnly: true,
                onTap: () {
                  showSearch(
                      context: context,
                      delegate: ServicesSearchDelegate(
                          searchList: ServiceCubit.get(context).allServices));
                },
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'Categories'.tr,
                style: CAppStyles.styleMedium24(context),
              ),
              const SizedBox(
                height: 30,
              ),
              const CategoryListView(),
              const SizedBox(
                height: 40,
              ),
              const PopularDoctorsListView()
            ],
          ),
        ),
      ),
    );
  }
}
