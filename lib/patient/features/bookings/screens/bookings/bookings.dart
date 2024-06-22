import 'package:dochome/common/widgets/empty_widget.dart';
import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/common/widgets/shimmers/patient_bookings_shimmer.dart';
import 'package:dochome/patient/features/bookings/logic/cubit/bookings_cubit.dart';
import 'package:dochome/patient/features/bookings/screens/bookings/widgets/bookings_card.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/appbars/main_appbar.dart';

class PatientBookingsScreen extends StatefulWidget {
  const PatientBookingsScreen({super.key});

  @override
  State<PatientBookingsScreen> createState() => _PatientBookingsScreenState();
}

class _PatientBookingsScreenState extends State<PatientBookingsScreen> {
  @override
  Widget build(BuildContext context) {
    final cubit = BookingsCubit.get(context)..getBookings();
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CMainAppBar(
        showBackArrow: false,
        title: "My Bookings",
        centerTitle: true,
      ),
      body: BlocConsumer<BookingsCubit, BookingsState>(
        listener: (context, state) {
          if (state is FailureBookingsState) {
            state.message.showAsToast(Colors.red);
          }
        },
        builder: (context, state) {
          if (state is FailureBookingsState) {
            return CustomFailureWidget(onTap: () {
              cubit.getBookings();
            });
          } else if (state is LoadingBookingsState) {
            return const CustomPatientBookingsShimmer();
          }
          return cubit.bookings.isEmpty
              ? const CustomEmptyWidget()
              : SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(screenWidth * 0.03),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ...cubit.bookings.map(
                          (booking) => CBookingsCard(
                            status: booking.status,
                            date: booking.startDate.split(" ").first,
                            caregiverName: booking.caregiverName,
                            caregiverAvatar: booking.caregiverProfileImage,
                            time: booking.startDate.split(" ").last,
                            categoryName: "",
                            caregiverSpecialties: booking.services
                                .map((service) =>
                                    "- ${trans(enText: service.nameEn, arText: service.nameAr)}\n")
                                .toList()
                                .join(),
                            price: booking.totalPrice,
                          ),
                        )
                      ],
                    ),
                  ),
                );
        },
      ),
    );
  }
}
