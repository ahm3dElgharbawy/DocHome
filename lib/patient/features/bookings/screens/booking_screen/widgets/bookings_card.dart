import 'package:flutter/material.dart';

class CBookingsCard extends StatelessWidget {
  const CBookingsCard({
    super.key,
    required this.status,
    required this.date,
    required this.caregiverName,
    required this.caregiverImage,
    required this.time,
    required this.caregiverSpecialties,
  });
  final int status;
  final String date;
  final String time;
  final String caregiverName;
  final AssetImage caregiverImage;
  final String caregiverSpecialties;

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
                  ),
                ),
                subtitle: Text(
                  caregiverSpecialties,
                  style: const TextStyle(
                    color: Color(0xFF757575),
                    fontSize: 10,
                    fontFamily: 'Outfit',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                trailing: CircleAvatar(
                  radius: screenWidth * 0.055,
                  backgroundImage: caregiverImage,
                ),
              ),
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
                          decoration: const BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: screenWidth * 0.012),
                        const Text(
                          "Confirmed",
                          style: TextStyle(
                            fontFamily: 'Outfit',
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: Container(
                        width: screenWidth * 0.77,
                        padding:
                            EdgeInsets.symmetric(vertical: screenWidth * 0.048),
                        decoration: BoxDecoration(
                          color: status == 0
                              ? const Color(0xFFE86D6D)
                              : (status == 1
                                  ? const Color(0x991BBA2B)
                                  : const Color(0xFFE0E0E0)),
                          borderRadius:
                              BorderRadius.circular(screenWidth * 0.055),
                        ),
                        child: Center(
                          child: Text(
                            status == 0
                                ? "Cancel"
                                : (status == 1 ? "Accepted" : "Reviewing"),
                            style: TextStyle(
                              fontSize: screenWidth * 0.04,
                              fontWeight: FontWeight.w500,
                              fontFamily: 'Outfit',
                              color: Colors.black54,
                            ),
                          ),
                        ),
                      ),
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
