import 'package:flutter/material.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class AppThemes {
  static get lightDesktop {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.backgroundColor,
        elevation: 0,
      ),
      primaryColor: AppColors.primaryColor,
      scaffoldBackgroundColor: AppColors.backgroundColor,
      fontFamily: 'Poppins',
      tooltipTheme: const TooltipThemeData(
        decoration: BoxDecoration(
          color: AppColors.tooltipColor,
          border: Border(
            top: BorderSide(color: AppColors.primaryButton, width: 1.0),
            left: BorderSide(color: AppColors.primaryButton, width: 1.0),
            right: BorderSide(color: AppColors.primaryButton, width: 1.0),
            bottom: BorderSide(color: AppColors.primaryButton, width: 1.0),
          ),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
        ),
        textStyle: TextStyle(color: AppColors.textPrimary),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 60,
        ),
        displayMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 36,
        ),
        displaySmall: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 30,
        ),
        titleMedium: TextStyle(
          color: AppColors.textPrimary,
          fontSize: 20,
        ),
        bodyLarge: TextStyle(color: AppColors.textPrimary, fontSize: 18),
        bodyMedium: TextStyle(color: AppColors.textPrimary, fontSize: 16),
        bodySmall: TextStyle(color: AppColors.textPrimary, fontSize: 14),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryColor,
          textStyle: TextStyle(
            color: AppColors.textWhite,
            fontSize: 18,
          ),
          foregroundColor: AppColors.textWhite,
        ),
      ),
      pageTransitionsTheme: PageTransitionsTheme(
        builders: {
          TargetPlatform.iOS: const CupertinoPageTransitionsBuilder(),
          TargetPlatform.android: SlideTransitionBuilder(),
        },
      ),
    );
  }
}

class SlideTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    animation = CurvedAnimation(curve: Curves.easeInOutExpo, parent: animation);

    return SlideTransition(
      position: Tween(begin: Offset(1.0, 0.0), end: Offset(0.0, 0.0))
          .animate(animation),
      child: child,
    );
  }
}
