import 'package:flutter/material.dart';
import 'package:social_app/core/resources/color_manager.dart';
import 'package:social_app/core/resources/strings_manager.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.sWhite,
      appBar: AppBar(
        backgroundColor: ColorManager.sWhite,
        elevation: 0.0,
        title: Text(
          AppStrings.home,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
    );
  }
}
