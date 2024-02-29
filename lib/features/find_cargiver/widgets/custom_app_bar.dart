
import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key, required this.titel,
  });
final String titel;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      toolbarHeight: 80,
      title: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          titel,
          style: AppStyles.styleBold25(context),
        ),
      ),
      centerTitle: true,
      leading: GestureDetector(
        onTap:(){
Navigator.pop(context);        } ,
        child: const Icon(
          Icons.arrow_back_ios_new_outlined,
          color: Colors.black,
        ),
      ),
    );
  }
  
  @override
  // TODO: implement preferredSize
Size get preferredSize => const Size.fromHeight(80);}
