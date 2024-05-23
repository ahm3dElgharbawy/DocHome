import 'package:bloc/bloc.dart';
import 'package:dochome/patient/features/home/data/models/categorie_model.dart';
import 'package:dochome/patient/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;
  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());

  Future<void> getAllCategories() async{
     emit(CategoriesLoding());
     var result = await homeRepo.getAllCategories();
     // print(result.toString());
    result.fold(
        (failure) => {
              emit(CategoriesFailure(errorMasege: failure.message)),
            },
        (categories) => {
              emit(CategoriesSuccess(categories: categories)),
            });
  }
}
