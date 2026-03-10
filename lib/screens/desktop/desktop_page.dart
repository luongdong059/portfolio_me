import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/constants/global_keys.dart';
import 'package:portfolio_me/screens/desktop/components/experience_item.dart';
import 'package:portfolio_me/screens/desktop/components/navigation_bar.dart';
import 'package:portfolio_me/screens/desktop/components/page_tag.dart';
import 'package:portfolio_me/screens/desktop/components/skill_item.dart';
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
    var screenWidth = MediaQuery.sizeOf(context).width;
    double paddingHorizontal = screenWidth > 1200 ? 115 : screenWidth * 0.05;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: paddingHorizontal),
          child: Column(
            children: [
              DesktopNavBar(),
              Heros(),
              About(),
              Skill(),
              Experience(),
              Contact()
            ],
          ),
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
    var screenWidth = MediaQuery.sizeOf(context).width;
    bool isWideScreen = screenWidth > 900;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Flex(
        direction: isWideScreen ? Axis.horizontal : Axis.vertical,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            width: isWideScreen ? screenWidth * 0.5 : double.infinity,
            margin: EdgeInsets.only(bottom: isWideScreen ? 0 : 48),
            child: Column(
              crossAxisAlignment: isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment: isWideScreen ? WrapAlignment.start : WrapAlignment.center,
                  children: [
                    Text(
                      AppContents.hero01,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
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
                SelectableText(
                  AppContents.about02,
                  textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 48.0),
                  child: Column(
                    crossAxisAlignment: isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
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
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
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
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SocialItem(onTap: () {}, icon: Assets.iconsGithub),
                    SocialItem(onTap: () {}, icon: Assets.iconsTwitter),
                    SocialItem(onTap: () {}, icon: Assets.iconsFigma),
                  ],
                )
              ],
            ),
          ),
          if (isWideScreen) const Spacer(),
          Container(
              width: isWideScreen ? 300.w : 300,
              height: isWideScreen ? 400.w : 400,
              color: AppColors.backgroundColor,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: isWideScreen ? 250.w : 250,
                      height: isWideScreen ? 350.w : 350,
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
                        width: isWideScreen ? 250.w : 250,
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
    var screenWidth = MediaQuery.sizeOf(context).width;
    bool isWideScreen = screenWidth > 900;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Column(
        children: [
          PageTag(
            title: AppContents.aboutMe,
            key: GlobalKeys.aboutKey,
          ),
          Flex(
            direction: isWideScreen ? Axis.horizontal : Axis.vertical,
            crossAxisAlignment: isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
            children: [
              Container(
                  width: isWideScreen ? 400.w : 300,
                  height: isWideScreen ? 500.w : 380,
                  margin: EdgeInsets.only(bottom: isWideScreen ? 0 : 48),
                  color: AppColors.backgroundColor,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Positioned(
                        bottom: 0,
                        left: 0,
                        child: Container(
                          width: isWideScreen ? 350.w : 260,
                          height: isWideScreen ? 450.w : 350,
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
                            width: isWideScreen ? 350.w : 260,
                          ),
                        ),
                      ),
                    ],
                  )),
              if (isWideScreen) const Spacer(),
              Container(
                width: isWideScreen ? screenWidth * 0.5 : double.infinity,
                child: Column(
                  crossAxisAlignment: isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppContents.aboutMe,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SelectableText(
                      AppContents.about01,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about02,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about03,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about04,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about05,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about06,
                      textAlign: isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    )
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

class Skill extends StatelessWidget {
  const Skill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageTag(
            title: AppContents.skill,
          ),
          Text(AppContents.skill01,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall),
          const Padding(
            padding: EdgeInsets.only(top: 48.0),
            child: Center(
                child: Wrap(
              alignment: WrapAlignment.center,
              runAlignment: WrapAlignment.center,
              spacing: 32,
              runSpacing: 32,
              children: [
                SkillItem(
                  icon: Assets.iconsIconFigma,
                  title: AppContents.figma,
                ),
                SkillItem(
                  icon: Assets.iconsGit,
                  title: AppContents.git,
                ),
                SkillItem(
                  icon: Assets.iconsIconFlutter,
                  title: AppContents.flutter,
                ),
              ],
            )),
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
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Column(
        children: [
          PageTag(
            key: GlobalKeys.experienceKey,
            title: AppContents.experience,
          ),
          Text(AppContents.experienceDetail,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall),
          const SizedBox(
            height: 48,
          ),
          const ExperienceItem(
            image: Assets.imagesSouthTelecomLogo,
            company: AppContents.experienceSouthTelecom,
            date: AppContents.experienceSouthTelecomTime,
            content: AppContents.experienceSouthTelecomDetail,
          ),
          const SizedBox(
            height: 48,
          ),
          const ExperienceItem(
            image: Assets.imagesWellcareLogo,
            company: AppContents.experienceWellcare,
            date: AppContents.experienceWellcareTime,
            content: AppContents.experienceWellcareDetail,
          ),
          const SizedBox(
            height: 48,
          ),
          const ExperienceItem(
            image: Assets.imagesSmartinnotechLogo,
            company: AppContents.experienceSIT,
            date: AppContents.experienceSITTime,
            content: AppContents.experienceSITDetail,
          ),
        ],
      ),
    );
  }
}

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 96),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageTag(
            key: GlobalKeys.contactKey,
            title: AppContents.contact,
          ),
          Text(AppContents.contactDetail,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 16,
            children: [
              Image.asset(
                Assets.iconsIconEmail,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(AppContents.contactEmail,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: AppContents.contactEmail),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied'),
                    ),
                  );
                },
                child: Image.asset(
                  Assets.iconsIconCopy,
                  width: 24,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 16,
            children: [
              Image.asset(
                Assets.iconsIconPhone,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(AppContents.contactPhoneNum,
                    style: Theme.of(context).textTheme.titleMedium),
              ),
              GestureDetector(
                onTap: () {
                  Clipboard.setData(
                    ClipboardData(text: AppContents.contactPhoneNum),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Copied'),
                    ),
                  );
                },
                child: Image.asset(
                  Assets.iconsIconCopy,
                  width: 24,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(AppContents.contact01,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodySmall),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialItem(onTap: () {}, icon: Assets.iconsGithub),
              SocialItem(onTap: () {}, icon: Assets.iconsTwitter),
              SocialItem(onTap: () {}, icon: Assets.iconsFigma),
            ],
          )
        ],
      ),
    );
  }
}
