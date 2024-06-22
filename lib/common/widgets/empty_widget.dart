import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';

class CustomEmptyWidget extends StatelessWidget {
  const CustomEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        CImages.empty,
        height: 100,
      ),
    );
  }
}
