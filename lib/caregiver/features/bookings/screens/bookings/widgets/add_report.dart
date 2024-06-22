import 'package:dochome/caregiver/features/bookings/data/models/bookings.dart';
import 'package:dochome/caregiver/features/bookings/logic/cubit/bookings_cubit.dart';
import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/common/widgets/dialogs/dialog.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/text_fields/normal_text_field.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:dochome/utils/validators/text_field_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddingReportWidget extends StatelessWidget {
  const AddingReportWidget({super.key, required this.booking});
  final CaregiverBookingsModel booking;

  @override
  Widget build(BuildContext context) {
    return CRoundedButton(
      onPressed: () {
        final cubit = CaregiverBookingsCubit.get(context);
        showDialog(
          context: context,
          builder: (context) => CustomDialog(
            child: Form(
              key: cubit.reportFormKey,
              child: Column(mainAxisSize: MainAxisSize.min, children: [
                Text(
                  "Add Report".tr,
                  style: CAppStyles.styleBold16(context),
                ),
                const SizedBox(height: CSizes.spaceBtwItems),
                NormalTextField(
                  controller: cubit.reportTitleController,
                  hintText: "title".tr,
                  expanded: false,
                  validator: (p0) => CTextFieldValidator.requiredTextField(p0),
                ),
                NormalTextField(
                  controller: cubit.reportContentController,
                  hintText: "content".tr,
                  expanded: false,
                  validator: (p0) => CTextFieldValidator.requiredTextField(p0),
                ),
                Row(
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
                    const SizedBox(width: CSizes.spaceBtwItems),
                    BlocConsumer<CaregiverBookingsCubit,
                        CaregiverBookingsState>(listener: (context, state) {
                      if (state is SuccessReportState) {
                        "Success adding the report".tr.showAsToast(Colors.green);
                        context.pop();
                      }
                    }, builder: (context, state) {
                      return Expanded(
                        child: CRoundedButton(
                          onPressed: () {
                            cubit.addReport(
                                username: booking.userName,
                                bookingId: booking.id);
                          },
                          title: "Submit".tr,
                          color: Colors.green,
                          child: state is LoadingReportState
                              ? const CLoadingWidget(
                                  indicatorColor: Colors.white,
                                )
                              : null,
                        ),
                      );
                    }),
                  ],
                )
              ]),
            ),
          ),
        );
      },
      title: "Mark as complete".tr,
      margin: const EdgeInsets.only(top: CSizes.spaceBtwItems),
    );
  }
}
