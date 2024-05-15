import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(LocationInitial());
  getLocation() async {
    Position position;
    bool serviceEnabled;
    LocationPermission permission;
    double latitude ;
    double longitude;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        emit(LocationDenied());
      }
    }
    if (permission == LocationPermission.whileInUse) {
      position = await Geolocator.getCurrentPosition();

       latitude = position.latitude;
       longitude = position.longitude;
    }
  }
}
