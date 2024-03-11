import 'package:dochome/common/widgets/text_fields/text_field_with_shadow.dart';
import 'package:dochome/patient/features/home/widgets/category_list_view.dart';
import 'package:dochome/patient/features/home/widgets/populer_doctor_list_view.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';
import '../widgets/c_appbar_title.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CAppBarTitle(),
            const SizedBox(
              height: 30,
            ),
            Text(
              'Hello,',
              style: CAppStyles.styleRegular18(context)
                  .copyWith(fontFamily: 'Outfit'),
            ),
            Text(
              'Adel Sobhi',
              style: CAppStyles.styleMedium20(context)
                  .copyWith(fontFamily: 'Outfit'),
            ),
            const SizedBox(
              height: 20,
            ),
            const CTextFieldWithInnerShadow(
              hintText: 'Search service',
              margin: EdgeInsets.all(0),
              prefixIcon: Icon(Icons.search),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Categories',
              style: CAppStyles.styleMedium24(context),
            ),
            const SizedBox(
              height: 30,
            ),
            const CategoryListView(),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Popular Doctor',
              style: CAppStyles.styleMedium24(context),
            ),
            const SizedBox(
              height: 20,
            ),
            const PopularDoctorsListView(),
          ],
        ),
      ),
    );
  }
}
