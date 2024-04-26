import 'package:flutter/material.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class PageTag extends StatelessWidget {
  const PageTag({
    super.key, required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
        margin: const EdgeInsets.only(bottom: 48),
        decoration: BoxDecoration(
          color: AppColors.componentColor,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          style: Theme.of(context).textTheme.bodySmall,
        ),
      ),
    );
  }
}