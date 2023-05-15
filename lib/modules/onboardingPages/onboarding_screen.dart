import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:treely/config/color_pallet.dart';
import 'package:treely/modules/onboardingPages/top_images.dart';
import 'package:treely/routes/routes.gr.dart';

import '../../config/images.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/rounded_button.dart';

@RoutePage()
class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentPageIndex = 0;
  final PageController _pageController = PageController();
  List<String> images = [kP1Image, kP2Image, kP3Image];
  Map<String, String> texts = {
    'Our Mission': """It is to promote the use of natural remedies of medicinal plants in order to support holistic health and wellness.""",
    'Health': """We believe that by connecting people with the natural world, we can encourage a more mindful and healthy lifestyle.""",
    'Products': """We are constantly expanding our product and adding new plants to our nursery. We carefully research and sorce our plants from reputable suppliers.""",
  };
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
        elevation: 0,
        backgroundColor: kTertiaryColor,
        leading: currentPageIndex != 0
            ? BackButton(
                onPressed: (() => _pageController.previousPage(
                      duration: const Duration(milliseconds: 200),
                      curve: Curves.linear,
                    )),
                color: Colors.black,
              )
            : const SizedBox.shrink(),
      ),
      body: SafeArea(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: PageView.builder(
                itemCount: images.length,
                controller: _pageController,
                onPageChanged: (value) {
                  setState(() {
                    currentPageIndex = value;
                  });
                },
                itemBuilder: (context, index) {
                  return TopImages(
                    image: images[currentPageIndex],
                    heading: texts.keys.elementAt(currentPageIndex),
                    paragraph: texts.values.elementAt(currentPageIndex),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox.shrink(),
                ImageIndexIndicator(currentPage: currentPageIndex, length: 3),
                currentPageIndex == images.length - 1
                    ? Flexible(child: RoundedButton(
                      text: "Get Started",
                      onPressed: () async {
                           SharedPreferences pref = await SharedPreferences.getInstance();
        await pref.setInt("initScreen", 2);
        context.router.replace(const WelcomeScreen());
                      },
                      ),)
                    : const SizedBox.shrink(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
