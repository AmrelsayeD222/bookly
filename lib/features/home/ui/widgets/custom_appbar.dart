import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 100, width: 100),
          const Spacer(),
        ],
      ),
    );
  }
}
