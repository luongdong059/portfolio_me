import 'package:flutter/material.dart';
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/constants/global_keys.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class DesktopNavBar extends StatefulWidget {
  const DesktopNavBar({super.key});

  @override
  State<DesktopNavBar> createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 21, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 20,
          ),
          Spacer(),
          NavItem(
            title: AppContents.navAbout,
            onPress: () {

              Scrollable.ensureVisible(
                GlobalKeys.aboutKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
          ),
          NavItem(
            title: AppContents.navExperience,
            onPress: () {},
          ),
          NavItem(
            title: AppContents.navWork,
            onPress: () {},
          ),
          NavItem(
            title: AppContents.navContact,
            onPress: () {},
          ),
          ElevatedButton(
            onPressed: () {},
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(
              AppContents.downloadCV,
            ),
          ),
        ],
      ),
    );
  }
}

class NavItem extends StatelessWidget {
  const NavItem({
    super.key,
    required this.title,
    required this.onPress,
  });

  final String title;
  final Function() onPress;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onPress,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16.0, 0, 16.0, 0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
