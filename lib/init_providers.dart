import 'package:dochome/caregiver/features/authentication/data/repo/auth.dart';
import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/localization/cubit/locale_cubit.dart';
import 'package:dochome/patient/features/authentication/data/repo/auth.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class AppBlocProviders {
  static init(){
    return [
        BlocProvider(
          create: (context) => AuthBloc(
            repoImp: PatientAuthRepoImpl(
              networkInfo: NetworkInfoImpl(
                internetChecker: InternetConnectionChecker(),
              ),
            ),
          ),
        ),
        BlocProvider(
          create: (context) => CaregiverAuthBloc(
            repoImp: CaregiverAuthRepoImpl(
              networkInfo: NetworkInfoImpl(
                internetChecker: InternetConnectionChecker(),
              ),
            ),
          ),
        ),
        BlocProvider(create: (context) => LocaleCubit()..getSavedLocale()) // Get saved locale from local storage
      ];
  } 
}