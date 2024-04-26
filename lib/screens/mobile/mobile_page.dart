import 'package:flutter/material.dart';
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/screens/desktop/desktop_page.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.fromLTRB(115, 0, 115, 0),
          children:  [
            Center(child: Image.asset(
              Assets.imagesLogo,
              height: 20,
            ),),
            Heros(),
            About(),
            Experience(),
          ],
        ),
        floatingActionButton: _showBackToTopButton
            ? ElevatedButton(
                onPressed: _scrollToTop,
                child: Text(
                  AppContents.btnBacktoTop,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.textWhite,
                      ),
                ),
              )
            : null,
      ),
    );
  }
}
