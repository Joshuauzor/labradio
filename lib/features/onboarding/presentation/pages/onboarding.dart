import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:labradio/app/app.dart';
import 'package:labradio/core/core.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets.onboarding),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 67),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.w300,
                              fontFamily: AppFonts.inter,
                              color: AppColors.white,
                            ),
                            children: [
                              TextSpan(text: 'Enjoy your'),
                              TextSpan(
                                text: ' Radio,',
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                              TextSpan(text: ' from anywhere'),
                            ],
                          ),
                        ),
                        const Gap(18),
                        TextRegular(
                          'Listen to your favorite radio stations for free, anywhere and offline with Lab Radio',
                          color: AppColors.outline,
                          fontSize: 14,
                        ),
                        const Gap(32),
                        FittedBox(
                          child: GestureDetector(
                            onTap: () => Navigator.pushNamedAndRemoveUntil(
                              context,
                              AppRoutes.home,
                              (route) => false,
                            ),
                            child: Container(
                              height: 50,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                              ),
                              decoration: BoxDecoration(
                                color: AppColors.primary,
                                borderRadius: BorderRadius.circular(32),
                              ),
                              child: Center(child: TextBold('Start Listening')),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 14,
                        fontFamily: AppFonts.inter,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).textTheme.bodyMedium?.color,
                      ),
                      children: [
                        const TextSpan(text: 'By continuing, you agree to the'),
                        TextSpan(
                          text: ' Terms of service',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                'https://labhouse.io/terms-of-use.html'.launch,
                        ),
                        const TextSpan(text: ' and'),
                        TextSpan(
                          text: ' Privacy Policy',
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: AppColors.primary,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () =>
                                'https://labhouse.io/privacy-policy.html'
                                    .launch,
                        ),
                        const TextSpan(text: ' of Lab Radio'),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
