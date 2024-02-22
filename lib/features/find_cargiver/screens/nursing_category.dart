import 'package:dochome/features/find_cargiver/widgets/services_list_view.dart';
import 'package:dochome/utils/constants/colors.dart';
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class NursingCategory extends StatelessWidget {
  const NursingCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        toolbarHeight: 80,
        title: Text(
          'Nursing Services',
          style: AppStyles.styleBold25(context),
        ),
        centerTitle: true,
        leading: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 20, right: 20, top: 20),
          child: ServicesListView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        backgroundColor: CColors.primary,
        child: Center(
          child: Transform.rotate(
              angle: -1.571 * 2,
              child: const Icon(Icons.arrow_back_ios_new_outlined)),
        ),
      ),
    );
  }
}
