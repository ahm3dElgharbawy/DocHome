import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
import 'package:dochome/utils/errors/failures.dart';
import 'package:equatable/equatable.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit(this.findCargiverRepo) : super(BookingInitial());
  final FindCargiverRepo findCargiverRepo;
  Future<Either<Failure, Unit>> storeNewBooking(
      Map<String, dynamic> bookingData) async {
    var result = await findCargiverRepo.storeNewBooking(bookingData);
    return result;
  }
}
