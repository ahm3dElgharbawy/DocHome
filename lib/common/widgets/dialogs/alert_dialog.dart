import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.onConfirm, this.title, required this.content,this.isLoading = false});
  final VoidCallback onConfirm;
  final String? title;
  final String content;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title ?? "Confirmation".tr,style: CAppStyles.styleSemiBold18(context))),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actionsOverflowDirection: VerticalDirection.up,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      actionsPadding: const EdgeInsets.all(15),
      content: Text(
        content,
        textAlign: TextAlign.center,
        style: CAppStyles.styleRegular16(context),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: CRoundedButton(
                onPressed: () {
                  context.pop();
                },
                title: "Cancel".tr,
                color: Colors.red,
              ),
            ),
            const SizedBox(width: CSizes.spaceBtwSections),
            Expanded(
              child: CRoundedButton(
                onPressed: onConfirm,
                title: "Confirm".tr,
                child:  isLoading? const CLoadingWidget(indicatorColor: Colors.white,) : null,
              ),
            ),
          ],
        )
      ],
    );
  }
}
