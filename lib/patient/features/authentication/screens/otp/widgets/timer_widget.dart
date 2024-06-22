import 'dart:async';

import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TimerWidget extends StatefulWidget {
  const TimerWidget({super.key, required this.email});
  final String email;

  @override
  State<TimerWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends State<TimerWidget> {
  static const maxSeconds = 60;
  int remainingSeconds = maxSeconds;
  Timer? timer;

  void startTimer() {
    timer?.cancel(); // Cancel any existing timer
    remainingSeconds = maxSeconds;
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingSeconds > 0) {
          remainingSeconds--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  void resetTimer() {
    setState(() {
      timer?.cancel();
      remainingSeconds = maxSeconds;
    });
  }

  @override
  void dispose() {
    timer?.cancel(); // Cancel the timer if the widget is disposed
    super.dispose();
  }
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //? remaining time
        Text(
          "00:${remainingSeconds.toString().padLeft(2,"0")} ${'Sec'.tr}",
          style: CAppStyles.styleMedium14(context),
        ),
        const SizedBox(height: CSizes.spaceBtwItems),
        //? resend the otp
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Don't receive code ?".tr,
              style: CAppStyles.styleRegular14(context),
            ),
            TextButton(
              onPressed: timer!.isActive ? null : () {
                startTimer();
                context.read<AuthBloc>().add(SendOtpEvent(email: widget.email));
              },
              child: Text(
                "Re-send".tr,
                style: CAppStyles.styleSemiBold14(context)
                    .copyWith(color: Colors.black),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
