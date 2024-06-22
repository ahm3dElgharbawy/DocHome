import 'package:dochome/caregiver/features/authentication/data/repo/auth.dart';
import 'package:dochome/caregiver/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/caregiver/features/bookings/logic/cubit/bookings_cubit.dart';
import 'package:dochome/caregiver/features/personalization/logic/cubit/personalization_cubit.dart';
import 'package:dochome/components/chat/data/repo/chat.dart';
import 'package:dochome/components/chat/logic/bloc/chat_bloc.dart';
import 'package:dochome/components/notifications/logic/notifications_cubit/notifications_cubit.dart';
import 'package:dochome/localization/cubit/locale_cubit.dart';
import 'package:dochome/patient/features/authentication/data/repo/auth.dart';
import 'package:dochome/patient/features/authentication/logic/bloc/auth_bloc.dart';
import 'package:dochome/patient/features/bookings/logic/cubit/bookings_cubit.dart';
import 'package:dochome/patient/features/chatbot/logic/cubit/chat_bot_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo_impl.dart';
import 'package:dochome/patient/features/find_caregiver/logic/booking_cubit/booking_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/cargivers_cubit/cargivers_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/location_cubit/location_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/reviews_cubit/reviews_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/home/data/repos/home_repo_impl.dart';
import 'package:dochome/patient/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:dochome/patient/features/home/logic/popular_cargivers_cubit/popular_caregivers_cubit.dart';
import 'package:dochome/patient/features/payment/logic/cubit/wallet_cubit.dart';
import 'package:dochome/patient/features/personalization/logic/cubit/personalization_cubit.dart';
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
      BlocProvider<ChatBloc>(
        create: (context) => ChatBloc(
          repoImpl: ChatRepoImpl(
            networkInfo: NetworkInfoImpl(
              internetChecker: InternetConnectionChecker(),
            ),
          ),
        )..add(
            InitPusherEvent(),
          ),
      ),

      BlocProvider<PersonalizationCubit>(
          create: (context) => PersonalizationCubit()),

      BlocProvider(
          create: (context) => LocaleCubit()
            ..getSavedLocale()), // Ge,t saved locale from local storage
      BlocProvider(
        create: (context) =>
            ServiceCubit(FindCaregiverRepoImpl())..getAllServices(),
        lazy: false,
      ),
      BlocProvider(
        create: (context) => CaregiversCubit(
          FindCaregiverRepoImpl(),
        )..getAllCaregivers(),
      ),
      BlocProvider(
        create: (context) =>
            CategoriesCubit(HomeRepoImpl())..getAllCategories(),
      ),
      BlocProvider(
        create: (context) => BookingCubit(),
      ),
      BlocProvider(create: (context) => BookingsCubit()),
      BlocProvider(create: (context) => PopularCaregiversCubit(HomeRepoImpl())),
      BlocProvider(create: (context) => LocationCubit()),
      BlocProvider(create: (context) => NotificationsCubit()),
      BlocProvider(create: (context) => ReviewsCubit()),
      BlocProvider(create: (context) => CaregiverBookingsCubit()),
      BlocProvider(create: (context) => CaregiverPersonalizationCubit()),
      BlocProvider(create: (context) => WalletCubit()),
    ];
  }
}
