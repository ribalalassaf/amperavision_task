import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ampera_vision_test/styles/colors.dart';

class PlatformLoadingIndicator extends StatelessWidget {
  const PlatformLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return const Center(child: CupertinoActivityIndicator(color: AppColors.black));
      case TargetPlatform.android:
        return const Center(child: CircularProgressIndicator(color: AppColors.black));
      default:
        return const CircularProgressIndicator();
    }
  }
}
