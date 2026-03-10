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
    var screenWidth = MediaQuery.sizeOf(context).width;
    bool isWideScreen = screenWidth > 900;

    Widget contentColumn = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          alignment: WrapAlignment.spaceBetween,
          children: [
            Text(
              company,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            if (isWideScreen) const SizedBox(width: 16),
            Text(date, style: Theme.of(context).textTheme.bodyMedium),
          ],
        ),
        const SizedBox(
          height: 16,
        ),
        Text(
          content,
          style: Theme.of(context).textTheme.bodySmall,
          maxLines: 7,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );

    return Container(
      width: isWideScreen ? screenWidth / 2 : double.infinity,
      padding: EdgeInsets.all(isWideScreen ? 32 : 24),
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
      child: Flex(
        direction: isWideScreen ? Axis.horizontal : Axis.vertical,
        crossAxisAlignment: isWideScreen ? CrossAxisAlignment.center : CrossAxisAlignment.start,
        children: [
          Image.asset(
            image,
            width: isWideScreen ? 200 : 160,
          ),
          SizedBox(height: isWideScreen ? 0 : 24, width: isWideScreen ? 24 : 0),
          isWideScreen ? Expanded(child: contentColumn) : contentColumn,
        ],
      ),
    );
  }
}
