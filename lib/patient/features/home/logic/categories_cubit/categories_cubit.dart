import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dochome/patient/features/home/data/models/category_model.dart';
import 'package:dochome/patient/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final HomeRepo homeRepo;

  CategoriesCubit(this.homeRepo) : super(CategoriesInitial());
  static CategoriesCubit get(context) => BlocProvider.of(context);
  int selectedCategoryId = 1;
  List<CategoryModel> categories = [];
  Future<void> getAllCategories() async {
    emit(CategoriesLoading());
    var result = await homeRepo.getAllCategories();
    // print(result.toString());
    emit(
      result.fold((failure) {
        return CategoriesFailure(errorMsg: failure.message);
      }, (c) {
        categories = c;
        return CategoriesSuccess(categories: c);
      }),
    );
  }
}
