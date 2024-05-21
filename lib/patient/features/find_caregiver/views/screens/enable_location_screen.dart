import 'package:dochome/common/widgets/buttons/rounded_button.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/location_cubit/location_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/widgets/custom_app_bar.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

class EnableLocationScreen extends StatelessWidget {
  const EnableLocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: CustomAppBar(title: ''),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_on,
                  color: CColors.primary,
                  size: 90,
                ),
                Text(
                  'Enable current location ',
                  style: CAppStyles.styleMedium18(context).copyWith(
                    color: Colors.black,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'You must allow your location access to \n available Caregiver ',
                  style: CAppStyles.styleRegular16(context).copyWith(
                    color: const Color(0xff757575),
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 100,
                ),
                CRoundedButton(
                  title: 'Get the current location',
                  onPressed: () async {
                    await BlocProvider.of<LocationCubit>(context).getLocation();
                    print(BlocProvider.of<LocationCubit>(context).latitude);
                    // Position position;
                    // bool serviceEnabled;
                    // LocationPermission permission;
                    // double latitude;
                    // double longitude;

                    // serviceEnabled =
                    //     await Geolocator.isLocationServiceEnabled();
                    // permission = await Geolocator.checkPermission();
                    // if (permission == LocationPermission.denied) {
                    //   permission = await Geolocator.requestPermission();
                    //   if (permission == LocationPermission.denied) {
                    //     return Future.error('Location permissions are denied');
                    //   }
                    // } else if (permission == LocationPermission.whileInUse) {
                    //   position = await Geolocator.getCurrentPosition();

                    //   latitude = position.latitude;
                    //   longitude = position.longitude;
                    //   print(longitude.toString());
                    // }
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
