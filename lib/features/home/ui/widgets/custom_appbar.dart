import 'package:flutter/material.dart';

import '../../../../core/utils/assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset(AssetsData.logo, height: 30);
  }
}
