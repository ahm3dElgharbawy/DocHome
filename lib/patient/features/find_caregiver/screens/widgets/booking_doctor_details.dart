import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/containers/circular_container.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/patient/features/find_caregiver/screens/booking_info_screen.dart';
import 'package:dochome/patient/features/find_caregiver/screens/reviews/reviews.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/about_section.dart';
import 'package:dochome/patient/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:dochome/patient/features/home/screens/widgets/custom_rate_row.dart';
import 'package:dochome/patient/features/layout/patient_layout_screen.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/services/patient_local.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class BookingDoctorDetails extends StatefulWidget {
  const BookingDoctorDetails({
    super.key,
    required this.caregiver,
  });
  final Caregiver caregiver;

  @override
  State<BookingDoctorDetails> createState() => _BookingDoctorDetailsState();
}

class _BookingDoctorDetailsState extends State<BookingDoctorDetails> {
  @override
  Widget build(BuildContext context) {
    final category = CategoriesCubit.get(context)
        .categories
        .firstWhere((category) => category.id == widget.caregiver.categoryId);
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadiusDirectional.only(
          topStart: Radius.circular(24),
          topEnd: Radius.circular(24),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          widget.caregiver.name,
                          style: CAppStyles.styleRegular23(context),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          "${'doctor of'.tr} ${trans(enText: category.nameEn!, arText: category.nameAr!)}",
                          style: CAppStyles.styleLight12(context),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: CSizes.spaceBtwItems),
                Row(
                  children: [
                    CCircularContainer(
                      color: Colors.amber,
                      onTap: () {
                        context.read<ChatBloc>().add(
                              CreateNewChatEvent(
                                patientId: PatientLocal.get()!.id,
                                caregiverId: widget.caregiver.id,
                              ),
                            );
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) =>
                              BlocConsumer<ChatBloc, ChatState>(
                            listener: (context, state) {
                              if (state is SuccessCreateChatState) {
                                context.pushReplacementAll(
                                    const PatientLayoutScreen(
                                  initialIndex: 2,
                                ));
                              }
                            },
                            builder: (context, state) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            },
                          ),
                        );
                      },
                      child: const Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: CSizes.spaceBtwItems),
                    CCircularContainer(
                      color: CColors.primary,
                      margin: EdgeInsets.zero,
                      onTap: () async {
                        final Uri launchUri = Uri(
                          scheme: 'tel',
                          path: widget.caregiver.phone,
                        );
                        await launchUrl(launchUri);
                      },
                      child: const Icon(
                        Icons.phone_enabled_outlined,
                        color: Colors.white,
                      ),
                    ),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomRateRow(
                  reviews: widget.caregiver.numberOfReviews,
                  rating: widget.caregiver.stars,
                  fontSize: 14,
                  onTap: () {
                    context.push(
                      ReviewsScreen(
                        caregiverId: widget.caregiver.id,
                        stars: widget.caregiver.stars,
                      ),
                    );
                  },
                ),
              ],
            ),
            const Divider(),
            const AboutSection(),
            // const SizedBox(
            //   height: 20,
            // ),
            // const StatusSection(),
            const Expanded(
              child: SizedBox(
                height: 20,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            CRoundedButton(
              title: 'Make an Appointment'.tr,
              onPressed: () async {
                context.push(const BookingInfoScreen());
              },
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
