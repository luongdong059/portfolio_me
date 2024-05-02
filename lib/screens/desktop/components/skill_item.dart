import 'package:flutter/material.dart';

class SkillItem extends StatelessWidget {
  const SkillItem({
    super.key,
    required this.title,
    required this.icon,
  });

  final String title;
  final String icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          icon,
          width: 30,
        ),
        Text(title, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}