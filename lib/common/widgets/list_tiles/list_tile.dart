import 'package:flutter/material.dart';
class BuildListTile extends StatelessWidget {
  const BuildListTile({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.context,
  });
  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final BuildContext context;
  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
      child: Container(
        color: const Color(0xFF4D8BBB),
        child: ListTile(
          leading: Icon(icon),
          iconColor: const Color(0xFFF5F5F5),
          title: Text(
            title,
            style: TextStyle(
              color: const Color(0xFFF5F5F5),
              fontSize: screenWidth * 0.041, // Adjust as per your requirement
              fontFamily: 'Outfit',
              fontWeight: FontWeight.w400,
              height: 0,
            ),
          ),
          trailing: const Icon(Icons.arrow_forward_outlined),
          onTap: onTap,
        ),
      ),
    );
  }
}
