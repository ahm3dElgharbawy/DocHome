import 'package:dochome/caregiver/features/authentication/data/repo/auth.dart';
import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/caregiver/features/chat/data/repo/chat.dart';
import 'package:dochome/caregiver/features/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/localization/cubit/locale_cubit.dart';
import 'package:dochome/patient/features/authentication/data/repo/auth.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/chat/data/repo/chat.dart';
import 'package:dochome/patient/features/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/patient/features/chatbot/logic/cubit/chat_bot_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo_impl.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/cargiver_cubit/cargiver_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/service_cubit/service_cubit.dart';
import 'package:dochome/utils/network/network_info.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

abstract class AppBlocProviders {

  
  static init() {
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
      BlocProvider(
        create: (context) => ChatBotCubit(),
      ),
      BlocProvider<PatientChatBloc>(
        create: (context) => PatientChatBloc(
        repoImpl: PatientChatRepoImpl(
          networkInfo: NetworkInfoImpl(
            internetChecker: InternetConnectionChecker(),
          ),
        ),
      )
        ..add(InitPusherEvent(),)
      ),
      
      BlocProvider<CaregiverChatBloc>(
        create: (context) => CaregiverChatBloc(
        repoImpl: CaregiverChatRepoImpl(
          networkInfo: NetworkInfoImpl(
            internetChecker: InternetConnectionChecker(),
          ),
        ),
      )
      ),
      
      BlocProvider(
          create: (context) => LocaleCubit()
            ..getSavedLocale()), // Ge,t saved locale from local storage
      BlocProvider(
          create: (context) =>
              ServiceCubit(FindCargiverRepoImpl())..getAllServices()),
      BlocProvider(
          create: (context) =>
              CargiverCubit(FindCargiverRepoImpl())..getAllCargivers()),
    ];
  }
}
