import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/screens/desktop/desktop_page.dart';
import 'package:portfolio_me/screens/mobile/mobile_page.dart';
import 'package:portfolio_me/themes/app_themes.dart';
import 'package:portfolio_me/utils/responsive.dart';

void main() {
  runApp(const Portfolio());
}

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1440, 962),
      builder: ((context, child) {
        {
          return MaterialApp(
            title: AppContents.appName,
            debugShowCheckedModeBanner: false,
            theme: AppThemes.lightDesktop,
            home: const RootPage(),
          );
        }
      }),
    );
  }
}

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Responsive.isMobile() ? MobilePage() : DesktopPage();
  }
}
