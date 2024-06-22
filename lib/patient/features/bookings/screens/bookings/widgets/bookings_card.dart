import 'package:cached_network_image/cached_network_image.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class CBookingsCard extends StatelessWidget {
  const CBookingsCard({
    super.key,
    this.status,
    required this.date,
    required this.caregiverName,
    required this.caregiverAvatar,
    required this.time,
    required this.caregiverSpecialties,
    required this.categoryName, required this.price,
  });
  final int? status;
  final String date;
  final String time;
  final String caregiverName;
  final String caregiverAvatar;
  final String caregiverSpecialties;
  final String categoryName;
  final double price;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.02),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(screenWidth * 0.025),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              spreadRadius: 2,
            ),
          ],
        ),
        child: SizedBox(
          width: screenWidth,
          child: Column(
            children: [
              ListTile(
                title: Text(
                  caregiverName,
                  style: const TextStyle(
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  ),
                ),
                subtitle: Text(
                  "${'Selected Services'.tr}\n$caregiverSpecialties",
                  style: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 14,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                trailing: CircleAvatar(
                  radius: screenWidth * 0.055,
                  backgroundImage: CachedNetworkImageProvider(
                      caregiverAvatar.asLink()),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
                child: Divider(
                  thickness: 1,
                  height: screenWidth * 0.04,
                ),
              ),
              Text("${'Total Price:'.tr} $price ${'EGP'.tr}"),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.036),
                child: Divider(
                  thickness: 1,
                  height: screenWidth * 0.04,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.black54,
                          size: screenWidth * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.012),
                        Text(
                          date,
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.access_time_filled,
                          color: Colors.black54,
                          size: screenWidth * 0.06,
                        ),
                        SizedBox(width: screenWidth * 0.012),
                        Text(
                          time,
                          style: const TextStyle(
                            color: Colors.black54,
                            fontFamily: 'Outfit',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.012),
                          decoration: BoxDecoration(
                            color: status == null ? CColors.primary : status == 1? Colors.green : Colors.red,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.012),
                        Text(
                          status == null ? "Waiting".tr : status == 1? "Accepted".tr : "Canceled".tr,
                          style: const TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
