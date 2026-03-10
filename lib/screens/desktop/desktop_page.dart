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
              Contact(),
              Padding(
                padding: const EdgeInsets.only(bottom: 96),
                child: OutlinedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      barrierColor: Colors.black.withValues(alpha: 0.85),
                      builder: (context) => const ProductCarouselDialog(),
                    );
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(
                        color: AppColors.primaryColor, width: 2),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    'View Product',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontWeight: FontWeight.w600,
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
        crossAxisAlignment:
            isWideScreen ? CrossAxisAlignment.start : CrossAxisAlignment.center,
        children: [
          Container(
            width: isWideScreen ? screenWidth * 0.5 : double.infinity,
            margin: EdgeInsets.only(bottom: isWideScreen ? 0 : 48),
            child: Column(
              crossAxisAlignment: isWideScreen
                  ? CrossAxisAlignment.start
                  : CrossAxisAlignment.center,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  alignment:
                      isWideScreen ? WrapAlignment.start : WrapAlignment.center,
                  children: [
                    Text(
                      AppContents.hero01,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
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
                    crossAxisAlignment: isWideScreen
                        ? CrossAxisAlignment.start
                        : CrossAxisAlignment.center,
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
            crossAxisAlignment: isWideScreen
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
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
                  crossAxisAlignment: isWideScreen
                      ? CrossAxisAlignment.start
                      : CrossAxisAlignment.center,
                  children: [
                    Text(
                      AppContents.aboutMe,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
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
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about02,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about03,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about04,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about05,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    SelectableText(
                      AppContents.about06,
                      textAlign:
                          isWideScreen ? TextAlign.left : TextAlign.center,
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

class ProductCarouselDialog extends StatefulWidget {
  const ProductCarouselDialog({super.key});

  @override
  State<ProductCarouselDialog> createState() => _ProductCarouselDialogState();
}

class _ProductCarouselDialogState extends State<ProductCarouselDialog> {
  PageController _pageController = PageController();
  int _currentPage = 0;
  int _selectedTab = 0;

  final List<List<String>> _tabImages = const [
    // ACool Ecommerce
    [
      Assets.imagesAcool1,
      Assets.imagesAcool2,
      Assets.imagesAcool3,
      Assets.imagesAcool4,
      Assets.imagesAcool5,
    ],
    // ETC Inventory
    [
      Assets.imagesEtc1,
      Assets.imagesEtc2,
      Assets.imagesEtc3,
      Assets.imagesEtc4,
      Assets.imagesEtc5,
    ],
  ];

  final List<String> _tabTitles = const [
    'ACool Ecommerce',
    'ETC Inventory',
  ];

  List<String> get _currentImages => _tabImages[_selectedTab];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _switchTab(int index) {
    if (index == _selectedTab) return;
    setState(() {
      _selectedTab = index;
      _currentPage = 0;
      _pageController.dispose();
      _pageController = PageController();
    });
  }

  void _goToPrevious() {
    if (_currentPage > 0) {
      _pageController.animateToPage(
        _currentPage - 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  void _goToNext() {
    if (_currentPage < _currentImages.length - 1) {
      _pageController.animateToPage(
        _currentPage + 1,
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.sizeOf(context).width;
    var screenHeight = MediaQuery.sizeOf(context).height;
    double carouselWidth =
        screenWidth > 900 ? screenWidth * 0.5 : screenWidth * 0.85;
    double carouselHeight = screenHeight * 0.75;

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Close button
          Positioned(
            top: 20,
            right: 20,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(24),
                onTap: () => Navigator.pop(context),
                child: Container(
                  width: 48,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.close,
                    color: Colors.black87,
                    size: 24,
                  ),
                ),
              ),
            ),
          ),

          // Carousel content with tabs
          SizedBox(
            width: carouselWidth,
            height: carouselHeight,
            child: Column(
              children: [
                // Tab bar
                Container(
                  margin: const EdgeInsets.only(bottom: 24),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: List.generate(
                      _tabTitles.length,
                      (index) => GestureDetector(
                        onTap: () => _switchTab(index),
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            color: _selectedTab == index
                                ? Colors.white
                                : Colors.transparent,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            _tabTitles[index],
                            style: TextStyle(
                              color: _selectedTab == index
                                  ? Colors.black87
                                  : Colors.white70,
                              fontWeight: _selectedTab == index
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Image carousel
                Expanded(
                  child: PageView.builder(
                    key: ValueKey(_selectedTab),
                    controller: _pageController,
                    itemCount: _currentImages.length,
                    onPageChanged: (index) {
                      setState(() {
                        _currentPage = index;
                      });
                    },
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.asset(
                            _currentImages[index],
                            fit: BoxFit.contain,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 24),
                // Page indicator dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    _currentImages.length,
                    (index) => AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      width: _currentPage == index ? 24 : 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withValues(alpha: 0.4),
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Previous button
          Positioned(
            left: screenWidth > 900 ? screenWidth * 0.15 : 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: _currentPage > 0 ? _goToPrevious : null,
                child: AnimatedOpacity(
                  opacity: _currentPage > 0 ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.chevron_left,
                      color: Colors.black87,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),

          // Next button
          Positioned(
            right: screenWidth > 900 ? screenWidth * 0.15 : 12,
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.circular(28),
                onTap: _currentPage < _currentImages.length - 1
                    ? _goToNext
                    : null,
                child: AnimatedOpacity(
                  opacity:
                      _currentPage < _currentImages.length - 1 ? 1.0 : 0.3,
                  duration: const Duration(milliseconds: 200),
                  child: Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: const Icon(
                      Icons.chevron_right,
                      color: Colors.black87,
                      size: 32,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
