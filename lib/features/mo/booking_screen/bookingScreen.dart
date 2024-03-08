import 'package:flutter/material.dart';

import '../../../common/widgets/appbars/main_appbar.dart';
import '../../../utils/constants/image_strings.dart';


class bookingScreen extends StatefulWidget {
  @override
  State<bookingScreen> createState() => _bookingScreenState();
}

class _bookingScreenState extends State<bookingScreen> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: CMainAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(screenWidth * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: screenWidth * 0.008,
                        spreadRadius: screenWidth * 0.004,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: screenWidth,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Dr. Hode Elbatrwy",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Physical therapy \n - Cupping \n - Treatment sessions",
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 10,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          trailing: CircleAvatar(
                            radius: screenWidth * 0.055,
                            backgroundImage: AssetImage(CImages.doc1),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.036),
                          child: Divider(
                            thickness: 1,
                            height: screenWidth * 0.04,
                          ),
                        ),
                        Row(
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
                                  "12/01/2023",
                                  style: TextStyle(
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
                                  "10:30 AM",
                                  style: TextStyle(
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
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.012),
                                Text(
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
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: screenWidth * 0.77,
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenWidth * 0.048),
                                  decoration: BoxDecoration(
                                    color: Color(0x991BBA2B),
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.055),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Accepted",
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
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: screenWidth * 0.008,
                        spreadRadius: screenWidth * 0.004,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: screenWidth,
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            "Dr. Assma Abass",
                            style: TextStyle(
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            "Nursing \n - Intravenous Injection \n - Sensitivity Test \n - Installation of a urinary catheter ",
                            style: TextStyle(
                              color: Color(0xFF757575),
                              fontSize: 10,
                              fontFamily: 'Outfit',
                              fontWeight: FontWeight.w400,
                              height: 0,
                            ),
                          ),
                          trailing: CircleAvatar(
                            radius: screenWidth * 0.055,
                            backgroundImage: AssetImage(CImages.doc2),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: screenWidth * 0.036),
                          child: Divider(
                            thickness: 1,
                            height: screenWidth * 0.04,
                          ),
                        ),
                        Row(
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
                                  "12/01/2023",
                                  style: TextStyle(
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
                                  "10:30 AM",
                                  style: TextStyle(
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
                                    color: Colors.green,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                SizedBox(width: screenWidth * 0.012),
                                Text(
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
                        Padding(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: screenWidth * 0.77,
                                  padding: EdgeInsets.symmetric(
                                      vertical: screenWidth * 0.048),
                                  decoration: BoxDecoration(
                                    color: Color(0xFFE86D6D),
                                    borderRadius: BorderRadius.circular(
                                        screenWidth * 0.055),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Cancel",
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
              ),
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.02),
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(screenWidth * 0.025),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: screenWidth * 0.008,
                        spreadRadius: screenWidth * 0.004,
                      ),
                    ],
                  ),
                  child: SizedBox(
                    width: screenWidth,
                    child: Column(
                      children: [
                        Column(
                          children: [
                            ListTile(
                              title: Text(
                                "Dr. Mohamed Atya",
                                style: TextStyle(
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                "Nursing \n - Enema \n - Lotion Installation \n - Sensitivity Test ",
                                style: TextStyle(
                                  color: Color(0xFF757575),
                                  fontSize: 10,
                                  fontFamily: 'Outfit',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              trailing: CircleAvatar(
                                radius: screenWidth * 0.055,
                                backgroundImage: AssetImage(CImages.doc3),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: screenWidth * 0.036),
                              child: Divider(
                                thickness: 1,
                                height: screenWidth * 0.04,
                              ),
                            ),
                            Row(
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
                                      "12/01/2023",
                                      style: TextStyle(
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
                                      "10:30 AM",
                                      style: TextStyle(
                                        color: Colors.black54,
                                        fontFamily: 'Outfit',
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding:
                                          EdgeInsets.all(screenWidth * 0.012),
                                      decoration: BoxDecoration(
                                        color: Colors.green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: screenWidth * 0.012),
                                    Text(
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
                            Padding(
                              padding: EdgeInsets.all(screenWidth * 0.02),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () {},
                                    child: Container(
                                      width: screenWidth * 0.77,
                                      padding: EdgeInsets.symmetric(
                                          vertical: screenWidth * 0.048),
                                      decoration: BoxDecoration(
                                        color: Color(0xFFE0E0E0),
                                        borderRadius: BorderRadius.circular(
                                            screenWidth * 0.055),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "Reviewing",
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
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
