
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key, required this.color, required this.icon,
  });
final Color color;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 50,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color, ),
        onPressed: () {},
        child:  Center(child: Icon(icon)),
      ),
    );
  }
}
