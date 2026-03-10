import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:universal_html/html.dart' as html;
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/constants/global_keys.dart';
import 'package:portfolio_me/screens/desktop/components/experience_item.dart';
import 'package:portfolio_me/screens/desktop/components/page_tag.dart';
import 'package:portfolio_me/screens/desktop/components/skill_item.dart';
import 'package:portfolio_me/screens/desktop/components/social_item.dart';
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
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

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

  void _scrollToSection(GlobalKey key) {
    Navigator.pop(context); // Close drawer first
    Future.delayed(const Duration(milliseconds: 300), () {
      if (key.currentContext != null) {
        Scrollable.ensureVisible(
          key.currentContext!,
          duration: const Duration(milliseconds: 1000),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        endDrawer: Drawer(
          backgroundColor: AppColors.backgroundColor,
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: const BoxDecoration(
                  color: AppColors.tooltipColor,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Image.asset(
                      Assets.imagesLogo,
                      height: 20,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      AppContents.hero01,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person_outline),
                title: Text(
                  AppContents.navAbout,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () => _scrollToSection(GlobalKeys.aboutKey),
              ),
              ListTile(
                leading: const Icon(Icons.work_outline),
                title: Text(
                  AppContents.navExperience,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () => _scrollToSection(GlobalKeys.experienceKey),
              ),
              ListTile(
                leading: const Icon(Icons.mail_outline),
                title: Text(
                  AppContents.navContact,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () => _scrollToSection(GlobalKeys.contactKey),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.download),
                title: Text(
                  AppContents.downloadCV,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                onTap: () {
                  Navigator.pop(context);
                  if (kIsWeb) {
                    final html.AnchorElement anchor = html.AnchorElement(
                        href: 'assets/assets/files/dongnguyen-cv.pdf')
                      ..setAttribute('download', 'dongnguyen-cv.pdf')
                      ..target = 'blank';
                    anchor.click();
                  }
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              // Mobile Navigation Bar
              Padding(
                padding: const EdgeInsets.only(top: 21),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      Assets.imagesLogo,
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        _scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: const Icon(
                        Icons.menu,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              // Hero Section
              const MobileHeros(),
              // About Section
              const MobileAbout(),
              // Skill Section
              const MobileSkill(),
              // Experience Section
              const MobileExperience(),
              // Contact Section
              const MobileContact(),
              Padding(
                padding: const EdgeInsets.only(bottom: 48),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Color(0xFF0061FF),
                        Color(0xFF60EFFF),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        barrierColor: Colors.black.withValues(alpha: 0.85),
                        builder: (context) => const ProductCarouselDialog(),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      'View Product',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                    ),
                  ),
                ),
              ),
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

// ============================================================
// Mobile Hero Section
// ============================================================
class MobileHeros extends StatelessWidget {
  const MobileHeros({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            alignment: WrapAlignment.center,
            children: [
              Text(
                AppContents.hero01,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Image.asset(
                Assets.iconsSign,
                width: 50,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SelectableText(
            AppContents.about02,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      Assets.iconsAddress,
                      width: 24,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      AppContents.address,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
                    const SizedBox(width: 8),
                    Text(
                      AppContents.status,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
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
          ),
          const SizedBox(height: 32),
          // Personal Image
          Container(
            width: 250,
            height: 320,
            color: AppColors.backgroundColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 210,
                    height: 280,
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
                      width: 210,
                    ),
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

// ============================================================
// Mobile About Section
// ============================================================
class MobileAbout extends StatelessWidget {
  const MobileAbout({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          PageTag(
            title: AppContents.aboutMe,
            key: GlobalKeys.aboutKey,
          ),
          // Personal Image
          Container(
            width: 250,
            height: 320,
            margin: const EdgeInsets.only(bottom: 32),
            color: AppColors.backgroundColor,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 0,
                  left: 0,
                  child: Container(
                    width: 210,
                    height: 280,
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
                      width: 210,
                    ),
                  ),
                ),
              ],
            ),
          ),
          // About Text
          Text(
            AppContents.aboutMe,
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .headlineSmall!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SelectableText(
            AppContents.about01,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          SelectableText(
            AppContents.about02,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          SelectableText(
            AppContents.about03,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          SelectableText(
            AppContents.about04,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          SelectableText(
            AppContents.about05,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 12),
          SelectableText(
            AppContents.about06,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Mobile Skill Section
// ============================================================
class MobileSkill extends StatelessWidget {
  const MobileSkill({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageTag(
            title: AppContents.skill,
          ),
          Text(
            AppContents.skill01,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 32.0),
            child: Center(
              child: Wrap(
                alignment: WrapAlignment.center,
                runAlignment: WrapAlignment.center,
                spacing: 24,
                runSpacing: 24,
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
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// Mobile Experience Section
// ============================================================
class MobileExperience extends StatelessWidget {
  const MobileExperience({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          PageTag(
            key: GlobalKeys.experienceKey,
            title: AppContents.experience,
          ),
          Text(
            AppContents.experienceDetail,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          const SizedBox(height: 32),
          const ExperienceItem(
            image: Assets.imagesSouthTelecomLogo,
            company: AppContents.experienceSouthTelecom,
            date: AppContents.experienceSouthTelecomTime,
            content: AppContents.experienceSouthTelecomDetail,
          ),
          const SizedBox(height: 32),
          const ExperienceItem(
            image: Assets.imagesWellcareLogo,
            company: AppContents.experienceWellcare,
            date: AppContents.experienceWellcareTime,
            content: AppContents.experienceWellcareDetail,
          ),
          const SizedBox(height: 32),
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

// ============================================================
// Mobile Contact Section
// ============================================================
class MobileContact extends StatelessWidget {
  const MobileContact({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PageTag(
            key: GlobalKeys.contactKey,
            title: AppContents.contact,
          ),
          Text(
            AppContents.contactDetail,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodySmall,
          ),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 12,
            children: [
              Image.asset(
                Assets.iconsIconEmail,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppContents.contactEmail,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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
          const SizedBox(height: 12),
          Wrap(
            alignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 12,
            children: [
              Image.asset(
                Assets.iconsIconPhone,
                width: 24,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  AppContents.contactPhoneNum,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
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
            child: Text(
              AppContents.contact01,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SocialItem(onTap: () {}, icon: Assets.iconsGithub),
              SocialItem(onTap: () {}, icon: Assets.iconsTwitter),
              SocialItem(onTap: () {}, icon: Assets.iconsFigma),
            ],
          ),
        ],
      ),
    );
  }
}
