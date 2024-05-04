import 'package:dochome/common/widgets/containers/rounded_container.dart';
import 'package:dochome/localization/app_localizations.dart';
import 'package:dochome/localization/cubit/locale_cubit.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CLanguagesDialog extends StatelessWidget {
  const CLanguagesDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LocaleCubit, LocaleState>(
      listener: (context,state){
        if(state is ChangeLocaleState){
          Navigator.pop(context);
        }
      },
      builder: (context, state) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          content: state is ChangeLocaleState
              ? Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CRoundedContainer(
                      padding: const EdgeInsets.all(CSizes.md),
                      color: CColors.softGrey,
                      onTap: () {
                        context.read<LocaleCubit>().changeLocale("ar");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Arabic".tr(context),style: CAppStyles.styleMedium16(context),),
                          if (state.locale.languageCode == 'ar')
                            const Icon(
                              Icons.circle_rounded,
                              color: CColors.primary,
                            )
                        ],
                      ),
                    ),
                    const SizedBox(height: CSizes.spaceBtwItems),
                    CRoundedContainer(
                      padding: const EdgeInsets.all(CSizes.md),
                      color: CColors.softGrey,
                      onTap: () {
                        context.read<LocaleCubit>().changeLocale("en");
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("English".tr(context),style: CAppStyles.styleMedium16(context),),
                          if (state.locale.languageCode == 'en')
                            const Icon(
                              Icons.circle_rounded,
                              color: CColors.primary,
                            )
                        ],
                      ),
                    ),
                  ],
                )
              : const SizedBox(),
        );
      },
    );
  }
}
