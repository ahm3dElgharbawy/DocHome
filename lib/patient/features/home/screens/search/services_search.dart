import 'package:dochome/patient/features/find_caregiver/data/models/service_model.dart';
import 'package:dochome/patient/features/find_caregiver/screens/widgets/service_item.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/constants/sizes.dart';
import 'package:dochome/utils/helpers/extension.dart';
import 'package:flutter/material.dart';

class ServicesSearchDelegate extends SearchDelegate {
  ServicesSearchDelegate({required this.searchList});
  List<ServiceModel> searchList;
  List<ServiceModel> suggestionList = [];
  @override
  String? get searchFieldLabel => "search here".tr;
  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context).copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: CColors.primary, // Set the AppBar color
        iconTheme:
            IconThemeData(color: Colors.white), // Set the color of AppBar icons
        titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 18), // Set the color and size of the AppBar title
      ),
      inputDecorationTheme: searchFieldDecorationTheme,
    );
  }

  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        color: Colors.white,
        fontSize: 18,
      );
  @override
  InputDecorationTheme get searchFieldDecorationTheme {
    return const InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.white),
      border: InputBorder.none,
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          // When pressed here the query will be cleared from the search bar.
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () => Navigator.of(context).pop(),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const SizedBox();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    suggestionList = query.isEmpty
        ? []
        : searchList
            .where(
              (item) => item.nameAr.contains(
                query,
              ) || item.nameEn.contains(
                query,
              ),
            )
            .toList();

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: CSizes.defaultSpace),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: CSizes.defaultSpace),
        child: ListView.separated(
          itemCount: suggestionList.length,
          separatorBuilder: (context, index) => const SizedBox(
            height: CSizes.spaceBtwItems,
          ),
          itemBuilder: (context, index) {
            return ServiceItem(service: suggestionList[index], index: index,forSearch: true,);
          },
        ),
      ),
    );
  }

}
