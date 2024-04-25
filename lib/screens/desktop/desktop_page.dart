import 'package:flutter/material.dart';
import 'package:portfolio_me/constants/app_contents.dart';
import 'package:portfolio_me/constants/assets_constants.dart';
import 'package:portfolio_me/screens/desktop/components/navigation_bar.dart';
import 'package:portfolio_me/themes/app_colors.dart';

class DesktopPage extends StatefulWidget {
  const DesktopPage({super.key});

  @override
  State<DesktopPage> createState() => _DesktopPageState();
}

class _DesktopPageState extends State<DesktopPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView(
        padding: const EdgeInsets.fromLTRB(115, 0, 115, 0),
        children: [
          DesktopNavBar(),
          Row(
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
                          AppContents.about01,
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
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                              text: AppContents.about02,
                              style: Theme.of(context).textTheme.bodyMedium)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(child: Container(child: Image.network('https://imgix.ranker.com/user_node_img/73/1445753/original/liev-schreiber-recording-artists-and-groups-photo-u22?auto=format&q=60&fit=crop&fm=pjpg&dpr=2&w=375',),))
            ],
          )
        ],
      ),
    );
  }
}
