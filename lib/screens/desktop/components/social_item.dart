import 'package:flutter/material.dart';

class SocialItem extends StatelessWidget {
  const SocialItem({
    super.key,
    required this.icon,
    required this.onTap,
  });

  final String icon;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Image.asset(
            icon,
            width: 24,
          ),
        ),
      ),
    );
  }
}