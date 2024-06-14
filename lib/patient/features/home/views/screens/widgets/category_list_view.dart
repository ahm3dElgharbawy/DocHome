import 'package:dochome/patient/features/find_caregiver/views/logic/cargiver_cubit/cargiver_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/logic/service_cubit/service_cubit.dart';
import 'package:dochome/patient/features/find_caregiver/views/screens/services_list.dart';
import 'package:dochome/utils/constants/image_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'category_list_view_item.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});
  static List images = [
    CImages.nursingCategory,
    CImages.analysisabsCategory,
    CImages.analysisabsCategory,
    CImages.physicaltherapyCategory,
    CImages.nursingCategory,
    CImages.nursingCategory,
    CImages.nursingCategory,
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      // child: BlocBuilder<CategoriesCubit, CategoriesState>(
      //   builder: (context, state) {
      //     if (state is CategoriesLoding) {
      //       return CategorieShimmerLoding();
      //     } else if (state is CategoriesSuccess) {
      //       return ListView.builder(
      //           itemCount: state.categories.length,
      //           scrollDirection: Axis.horizontal,
      //           itemBuilder: (context, index) {
      //             return Padding(
      //               padding: const EdgeInsets.only(right: 20),
      //               child: GestureDetector(
      //                 onTap: () {
      //                   BlocProvider.of<ServiceCubit>(context).getAllServices(
      //                     id: state.categories[index].id,
      //                   );
      //                   BlocProvider.of<CargiverCubit>(context).getAllCargivers(
      //                     id: state.categories[index].id,
      //                   );
      //                   Navigator.push(context,
      //                       MaterialPageRoute(builder: (context) {
      //                     return ServicesList(
      //                       title: state.categories[index].nameEn!,
      //                     );
      //                   }));
      //                 },
      //                 child: CategoryListViewItem(
      //                   image: images[index],
      //                   categories: state.categories[index],
      //                 ),
      //               ),
      //             );
      //           });
      //     } else {
      //       return const Center(
      //           child: SizedBox(
      //         child: Text('HHHHHHHHHH'),
      //       ));
      //     }

          //////////////////////////////////////////////////////////////////////////////
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CategoryListViewItem(
                image: CImages.nursingCategory,
                text: 'Nursing',
                onTap: () {
                  BlocProvider.of<ServiceCubit>(context).getAllServices(id: 1);
                  BlocProvider.of<CargiverCubit>(context).getAllCargivers(id: 1);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ServicesList(
                      title: 'Nursing',
                    );
                  }));
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CategoryListViewItem(
                image: CImages.analysisabsCategory,
                text: 'Analysis labs',
                onTap: () {
                  BlocProvider.of<ServiceCubit>(context).getAllServices(id: 3);
                  BlocProvider.of<CargiverCubit>(context).getAllCargivers(id: 3);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ServicesList(
                      title: 'Analysis Labs',
                    );
                  }));
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CategoryListViewItem(
                image: CImages.physicaltherapyCategory,
                text: 'Pysical Therapy',
                onTap: () {
                  BlocProvider.of<ServiceCubit>(context).getAllServices(id: 4);
                  BlocProvider.of<CargiverCubit>(context).getAllCargivers(id: 4);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ServicesList(
                      title: 'Pysical Therapy',
                    );
                  }));
                },
              ),
              const SizedBox(
                width: 20,
              ),
              CategoryListViewItem(
                image: CImages.analysisabsCategory,
                text: 'Radiology',
                onTap: () {
                  BlocProvider.of<ServiceCubit>(context).getAllServices(id: 2);
                  BlocProvider.of<CargiverCubit>(context).getAllCargivers(id: 2);
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const ServicesList(
                      title: 'Radiology',
                    );
                  }));
                },
              ),
            ],
          ),
        );}
  }

