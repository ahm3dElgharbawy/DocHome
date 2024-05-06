import 'package:dio/dio.dart';
import 'package:dochome/init_providers.dart';
import 'package:dochome/localization/cubit/locale_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo_impl.dart';
import 'package:dochome/patient/features/find_caregiver/screens/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/intro/screens/welcome/welcome.dart';
import 'package:dochome/utils/services/dio_api_service.dart';
import 'package:dochome/utils/services/preference_services.dart';
import 'package:dochome/utils/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'localization/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PreferenceServices.init();
  FindCargiverRepoImpl().getAllServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: AppBlocProviders.init(),
      child: BlocBuilder<LocaleCubit, LocaleState>(
        builder: (context, state) {
          return state is ChangeLocaleState
              ? MaterialApp(
                  title: 'Doc Home',
                  debugShowCheckedModeBanner: false,
                  locale: state.locale, // Default local
                  supportedLocales: const [Locale('en'), Locale('ar')],
                  localizationsDelegates: const [
                    AppLocalizations.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate
                  ],
                  theme: CAppTheme.lightTheme,
                  home: const WelcomeScreen(),
                )
              : const SizedBox();
        },
      ),
    );
  }
}
