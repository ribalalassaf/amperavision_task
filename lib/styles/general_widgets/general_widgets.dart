import 'package:flutter/material.dart';
import 'package:ampera_vision_test/styles/colors.dart';

class DividerSepratedListViewBuilder extends StatelessWidget {
  final int itemCount;
  final Widget? Function(BuildContext, int) itemBuilder;
  final bool isScrollable;

  const DividerSepratedListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.isScrollable = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: itemCount,
      physics: (!isScrollable) ? const NeverScrollableScrollPhysics() : null,
      separatorBuilder: (context, index) => Divider(color: AppColors.white.withValues(alpha: 0.08), height: 30),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
    );
  }
}

class HorizontalListViewBuilder extends StatelessWidget {
  final int itemCount;
  final double? sepratorWidth;
  final double? listHeight;
  final Widget? Function(BuildContext, int) itemBuilder;

  const HorizontalListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.sepratorWidth = 30,
    this.listHeight = 150,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: listHeight,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        separatorBuilder: (context, index) => SizedBox(width: sepratorWidth),
        shrinkWrap: true,
        itemBuilder: itemBuilder,
      ),
    );
  }
}

class BlankSpaceSepratedListViewBuilder extends StatelessWidget {
  final int itemCount;
  final double? sepratorHeight;
  final bool isScrollable;
  final Widget? Function(BuildContext context, int index) itemBuilder;
  final ScrollController? scrollController;
  const BlankSpaceSepratedListViewBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.sepratorHeight = 15,
    this.isScrollable = false,
    this.scrollController,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      controller: scrollController,
      itemCount: itemCount,
      physics: (!isScrollable) ? const NeverScrollableScrollPhysics() : null,
      separatorBuilder: (context, index) => SizedBox(height: sepratorHeight),
      shrinkWrap: true,
      itemBuilder: itemBuilder,
    );
  }
}
