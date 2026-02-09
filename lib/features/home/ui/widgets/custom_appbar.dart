import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/assets.dart';
import '../../../../core/utils/constants.dart';

class CustomAppbar extends StatelessWidget {
  const CustomAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 40),
      child: Row(
        children: [
          Image.asset(AssetsData.logo, height: 100, width: 100),
          const Spacer(),
          IconButton(
            onPressed: () => context.push(searchView),
            icon: const Icon(Icons.search),
            color: Colors.white,
            iconSize: 30,
          ),
        ],
      ),
    );
  }
}
