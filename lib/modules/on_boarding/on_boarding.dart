import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:social_app/core/resources/assets_manager.dart';
import 'package:social_app/core/resources/color_manager.dart';
import 'package:social_app/core/resources/strings_manager.dart';
import 'package:social_app/core/resources/values_manager.dart';
import 'package:social_app/core/util/network/cache_helper.dart';
import 'package:social_app/modules/login/login.dart';
import 'package:social_app/modules/on_boarding/model/on_boarding_model.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

var pageController = PageController();
bool isLast = false;

void onSubmit(context)
{
  CacheHelper.saveData(key: 'onBoarding', value: true).then((value)
  {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => const LoginScreen(),
      ),
    );
  });
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.s15),
            child: TextButton(
              onPressed: () {
                onSubmit(context);
              },
              child: Text(
                'Skip',
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: ColorManager.bTwitter),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(
          AppPadding.p20,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                itemBuilder: (context, index) => buildOnBoarding(
                  context,
                  onBoarding[index],
                ),
                itemCount: onBoarding.length,
                controller: pageController,
                onPageChanged: (index) {
                  if (index == onBoarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
              ),
            ),
            const SizedBox(
              height: AppSize.s20,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: onBoarding.length,
                  axisDirection: Axis.horizontal,
                  effect: const ExpandingDotsEffect(
                    dotHeight: AppSize.s10,
                    dotWidth: AppSize.s10,
                    activeDotColor: ColorManager.bTwitter,
                    dotColor: ColorManager.grey,
                    spacing: AppSize.s4,
                    expansionFactor: 1.1,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      onSubmit(context);
                    }
                    pageController.nextPage(
                      duration: const Duration(
                        milliseconds: 750,
                      ),
                      curve: Curves.fastLinearToSlowEaseIn,
                    );
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildOnBoarding(context, OnBoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Image(
            image: AssetImage(
              model.image,
            ),
          ),
        ),
        const SizedBox(
          height: AppSize.s30,
        ),
        Text(
          model.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.sBlack,
              ),
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        Text(
          model.body,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.sBlack,
              ),
        ),
      ],
    );
