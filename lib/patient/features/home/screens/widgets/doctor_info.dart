import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/caregiver/features/authentication/data/models/caregiver.dart';
import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/patient/features/home/screens/widgets/custom_rate_row.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class DoctorInfoItem extends StatelessWidget {
  const DoctorInfoItem({
    super.key,
    required this.caregiver,
    this.onTap,
  });
  final Caregiver caregiver;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 0,
        color: const Color(0xFFF5F5F5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 55,
                width: 55,
                clipBehavior: Clip.hardEdge,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: CachedNetworkImage(
                  imageUrl: caregiver.profileImage.asLink(),
                  fit: BoxFit.cover,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    caregiver.name,
                    style: CAppStyles.styleRegular15(context)
                        .copyWith(fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    height: 2,
                  ),
                  Text(
                    caregiver.email,
                    style: CAppStyles.styleRegular12(context)
                        .copyWith(fontFamily: 'Outfit'),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  CustomRateRow(
                    reviews: caregiver.numberOfReviews,
                    rating: caregiver.stars,
                    fontSize: 10,
                    iconSize: 15,
                  ),
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(
                    Icons.bookmark,
                    color: CColors.primary,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    child: caregiver.open == 1
                        ? CRoundedContainer(
                            color: const Color(0xff20C968).withOpacity(.14),
                            height: 18,
                            width: 40,
                            radius: 6,
                            child: Text(
                              'Active'.tr,
                              style:
                                  CAppStyles.styleRegular10(context).copyWith(
                                color: const Color(0xff20C968),
                              ),
                            ),
                          )
                        : CRoundedContainer(
                            color: const Color.fromARGB(255, 221, 100, 91),
                            height: 18,
                            width: 40,
                            radius: 6,
                            child: Text(
                              'Offline'.tr,
                              style:
                                  CAppStyles.styleRegular10(context).copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
