import 'package:dochome/common/widgets/main_widgets/loading_widget.dart';
import 'package:dochome/patient/features/find_caregiver/logic/location_cubit/location_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class TestLocation extends StatefulWidget {
  const TestLocation({super.key});

  @override
  State<TestLocation> createState() => _TestLocationState();
}

class _TestLocationState extends State<TestLocation> {
  @override
  Widget build(BuildContext context) {
  final cubit = LocationCubit.get(context);
    return Scaffold(
      body: Center(
        child: BlocConsumer<LocationCubit, LocationState>(
          listener: (context, state) async {
            if (state is LocationSuccess) {
              String googleMapsUrl =
                  "https://www.google.com/maps/search/?api=1&query=${cubit.currentPosition!.latitude},${cubit.currentPosition!.longitude}";
              await launchUrl(Uri.parse(googleMapsUrl));
            }
          },
          builder: (context, state) {
            if(state is LocationLoading){
              return const CLoadingWidget();
            }
            return IconButton(
              onPressed: () {
                LocationCubit.get(context).getCurrentLocation();
              },
              icon: const Icon(Icons.map),
            );
          },
        ),
      ),
    );
  }
}
