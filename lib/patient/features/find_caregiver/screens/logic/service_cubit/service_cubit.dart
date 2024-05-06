// import 'dart:developer';

// import 'package:bloc/bloc.dart';
// import 'package:dochome/patient/features/find_caregiver/data/models/service.dart';
// import 'package:dochome/patient/features/find_caregiver/data/repos/find_cargiver_repo.dart';
// import 'package:equatable/equatable.dart';

// part 'service_state.dart';

// class ServiceCubit extends Cubit<ServiceState> {
//   final FindCargiverRepo findCargiverRepo;
//   ServiceCubit(this.findCargiverRepo) : super(ServiceInitial());
 
//  Future<void> getAllServices() async{
//     emit(ServiceLoding());

//     var result = await findCargiverRepo.getAllServices();
    
//     result.fold(
//         (failure) => {
//               emit(ServiceFailure(errorMasege: failure.errMassage)),
//             },
//         (service) => {
//               emit(ServiceSuccess(services: service)),
//             });
// print('ahmed');
// print(result);
// print('result');
//   }
  
// }
