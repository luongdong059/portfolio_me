import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/constants/global_keys.dart';
import 'package:portfolio_me/screens/desktop/components/navigation_bar.dart';
import 'package:portfolio_me/screens/desktop/components/page_tag.dart';
import 'package:portfolio_me/screens/desktop/components/social_item.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
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
          children: const [
            DesktopNavBar(),
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

class Heros extends StatelessWidget {
  const Heros({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 96, bottom: 96),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.sizeOf(context).width * 60 / 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      AppContents.hero01,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Image.asset(
                      Assets.iconsSign,
                      width: 70,
                    ),
                  ],
                ),
                SelectableText(AppContents.about02,
                    style: Theme.of(context).textTheme.bodyMedium),
                Padding(
                  padding: const EdgeInsets.only(top: 48.0, bottom: 48.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset(
                            Assets.iconsAddress,
                            width: 24,
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(AppContents.address,
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 4.0, right: 4.0),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: AppColors.availableColor,
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(AppContents.status,
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    SocialItem(onTap: () {}, icon: Assets.iconsGithub),
                    SocialItem(onTap: () {}, icon: Assets.iconsTwitter),
                    SocialItem(onTap: () {}, icon: Assets.iconsFigma),
                  ],
                )
              ],
            ),
          ),
          const Spacer(),
          Container(
              width: 300.w,
              height: 400.w,
              color: AppColors.backgroundColor,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 250.w,
                      height: 350.w,
                      color: AppColors.tooltipColor,
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                      color: AppColors.backgroundColor,
                      child: Image.asset(
                        Assets.imagesPersonal,
                        width: 250.w,
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class About extends StatelessWidget {
  const About({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 96, bottom: 96),
      child: Column(
        key: GlobalKeys.aboutKey,
        children: [
          const PageTag(
            title: AppContents.aboutMe,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  width: 400.w,
                  height: 500.w,
                  color: AppColors.backgroundColor,
                  child: Stack(
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: 350.w,
                          height: 450.w,
                          color: AppColors.tooltipColor,
                        ),
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(16, 0, 0, 16),
                          color: AppColors.backgroundColor,
                          child: Image.asset(
                            Assets.imagesPersonal1,
                            width: 350.w,
                          ),
                        ),
                      ),
                    ],
                  )),
              const Spacer(),
              Container(
                width: MediaQuery.sizeOf(context).width * 50 / 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      AppContents.aboutMe,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SelectableText(AppContents.about01,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(AppContents.about02,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(AppContents.about03,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(AppContents.about04,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(AppContents.about05,
                        style: Theme.of(context).textTheme.bodyMedium),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(AppContents.about06,
                        style: Theme.of(context).textTheme.bodyMedium)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Experience extends StatelessWidget {
  const Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 96, top: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const PageTag(
            title: AppContents.experience,
          ),
          Text(AppContents.experienceDetail,
              style: Theme.of(context).textTheme.bodySmall)
        ],
      ),
    );
  }
}
