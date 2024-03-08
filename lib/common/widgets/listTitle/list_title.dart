import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildListTile({
  required IconData icon,
  required String title,
  required VoidCallback onTap,
  required BuildContext context,
}) {
  final double screenWidth = MediaQuery.of(context).size.width;

  return Padding(
    padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
    child: Container(
      color: Color(0xFF4D8BBB),
      child: ListTile(
        leading: Icon(icon),
        iconColor: Color(0xFFF5F5F5),
        title: Text(
          title,
          style: TextStyle(
            color: Color(0xFFF5F5F5),
            fontSize: screenWidth * 0.041, // Adjust as per your requirement
            fontFamily: 'Outfit',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
        ),
        trailing: Icon(Icons.arrow_forward_outlined),
        onTap: onTap,
      ),
    ),
  );
}
