import 'package:flutter/material.dart';

class CustomFailureWidget extends StatelessWidget {
  const CustomFailureWidget(
      {super.key, required this.onTap, this.title, this.icon});
  final VoidCallback onTap;
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: const Icon(
          Icons.refresh,
          size: 50,
          color: Colors.red,
        ),
      ),
    );
  }
}
