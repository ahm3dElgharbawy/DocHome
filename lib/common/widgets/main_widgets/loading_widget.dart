import 'package:flutter/material.dart';

class CLoadingWidget extends StatelessWidget {
  const CLoadingWidget({super.key, this.indicatorColor=Colors.white});
  final Color indicatorColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: indicatorColor,
      ),
    );
  }
}