import 'package:bookly/core/utils/styles.dart';

import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .30,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            errMessage,
            style: Styles.textStyle18,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
