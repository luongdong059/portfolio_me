import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:universal_html/html.dart' as html;
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/constants/global_keys.dart';

class DesktopNavBar extends StatefulWidget {
  const DesktopNavBar({super.key});

  @override
  State<DesktopNavBar> createState() => _DesktopNavBarState();
}

class _DesktopNavBarState extends State<DesktopNavBar> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    bool isWideScreen = screenWidth > 900;

    return Padding(
      padding: const EdgeInsets.only(top: 21),
      child: isWideScreen ? Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 20,
          ),
          const Spacer(),
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
            onPress: () {
              Scrollable.ensureVisible(
                GlobalKeys.experienceKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
          ),
          NavItem(
            title: AppContents.navContact,
            onPress: () {
              Scrollable.ensureVisible(
                GlobalKeys.contactKey.currentContext!,
                duration: const Duration(milliseconds: 1000),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              if (kIsWeb) {
                final html.AnchorElement anchor = html.AnchorElement(href: 'assets/assets/files/dongnguyen-cv.pdf')
                  ..setAttribute('download', 'dongnguyen-cv.pdf')
                  ..target = 'blank';
                anchor.click();
              }
            },
            style: Theme.of(context).elevatedButtonTheme.style,
            child: Text(
              AppContents.downloadCV,
            ),
          ),
        ],
      ) : Column(
        children: [
          Image.asset(
            Assets.imagesLogo,
            height: 20,
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
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
                onPress: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.experienceKey.currentContext!,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
              ),
              NavItem(
                title: AppContents.navContact,
                onPress: () {
                  Scrollable.ensureVisible(
                    GlobalKeys.contactKey.currentContext!,
                    duration: const Duration(milliseconds: 1000),
                  );
                },
              ),
              ElevatedButton(
                onPressed: () {
                  if (kIsWeb) {
                    final html.AnchorElement anchor = html.AnchorElement(href: 'assets/assets/files/dongnguyen-cv.pdf')
                      ..setAttribute('download', 'dongnguyen-cv.pdf')
                      ..target = 'blank';
                    anchor.click();
                  }
                },
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                  AppContents.downloadCV,
                ),
              ),
            ],
          )
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
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ),
      ),
    );
  }
}
