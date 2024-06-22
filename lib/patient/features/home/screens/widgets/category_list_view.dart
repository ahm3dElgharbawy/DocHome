import 'package:dochome/common/widgets/failure_widget.dart';
import 'package:dochome/patient/features/find_caregiver/screens/services.dart';
import 'package:dochome/patient/features/home/logic/categories_cubit/categories_cubit.dart';
import 'package:dochome/common/widgets/shimmers/categories_loding.dart';
import 'package:dochome/utils/helpers/api_data_translate.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: BlocConsumer<CategoriesCubit, CategoriesState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is CategoriesSuccess) {
            return ListView.separated(
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
              separatorBuilder: (context, i) => const SizedBox(
                width: 20,
              ),
              itemBuilder: (context, index) => CategoryListViewItem(
                image: state.categories[index].image!,
                text: trans(
                    enText: state.categories[index].nameEn!,
                    arText: state.categories[index].nameAr!),
                onTap: () {
                  CategoriesCubit.get(context).selectedCategoryId =
                      state.categories[index].id!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ServicesScreen(
                        title: trans(
                          enText: state.categories[index].nameEn!,
                          arText: state.categories[index].nameAr!,
                        ),
                      );
                    }),
                  );
                },
              ),
            );
          } else if (state is CategoriesFailure) {
            return CustomFailureWidget(onTap: () {
              CategoriesCubit.get(context).getAllCategories();
            });
          } else {
            return const CategoryShimmerLoading();
          }
        },
      ),
    );
  }
}
