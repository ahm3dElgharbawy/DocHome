import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  static LocationCubit get(BuildContext context) => BlocProvider.of(context);
  Position? currentPosition;

  getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      emit(const LocationFailure(message: 'Location services are disabled.'));
    }
    emit(const LocationLoading());

    // Check permission status
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(const LocationFailure(message: 'Location permissions are denied'));
      }
    }

    if (permission == LocationPermission.deniedForever) {
      emit(const LocationFailure(
          message:
              'Location permissions are permanently denied, we cannot request permissions.'));
    }
    emit(const LocationLoading());
    // Get current position
    currentPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    emit(const LocationSuccess());
  }
}
