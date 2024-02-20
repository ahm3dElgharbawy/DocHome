import 'package:dochome/utils/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CRememberMe extends StatelessWidget {
  const CRememberMe({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value: true, onChanged: (val) {}),
        Text("Remember me", style: CAppStyles.styleRegular13(context)),
        const Spacer(),
        TextButton(
          onPressed: () {},
          child: Text(
            "Forget your password?",
            style: CAppStyles.styleRegular13(context)
                .copyWith(decoration: TextDecoration.underline,color: Colors.black),
          ),
        )
      ],
    );
  }
}
