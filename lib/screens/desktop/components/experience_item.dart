import 'package:flutter/material.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class ExperienceItem extends StatelessWidget {
  const ExperienceItem({
    super.key,
    required this.image,
    required this.company,
    required this.date,
    required this.content,
  });

  final String image;
  final String company;
  final String date;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 288,
      width: MediaQuery.sizeOf(context).width / 2,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
              blurRadius: 3,
              spreadRadius: 0.3,
              color: AppColors.componentColor,
              offset: Offset(0, 0)),
        ],
      ),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 200,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      company,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(date, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: Text(
                    content,
                    style: Theme.of(context).textTheme.bodySmall,
                    maxLines: 7,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}