import 'package:get/get.dart';

import '../modules/Screens/OtpScreen/bindings/otp_screen_binding.dart';
import '../modules/Screens/OtpScreen/views/otp_screen_view.dart';
import '../modules/Screens/TrialTransitionView/trial_transition_view.dart';
import '../modules/Screens/home/bindings/home_binding.dart';
import '../modules/Screens/home/views/home_view.dart';
import '../modules/Screens/onBoarding/bindings/on_boarding_binding.dart';
import '../modules/Screens/onBoarding/views/on_boarding_view.dart';
import '../modules/Screens/phone_verification/bindings/phone_verification_binding.dart';
import '../modules/Screens/phone_verification/views/phone_verification_view.dart';
import '../modules/Screens/signUp/bindings/sign_up_binding.dart';
import '../modules/Screens/signUp/views/sign_up_view.dart';
import '../modules/Screens/subscription/bindings/subscription_binding.dart';
import '../modules/Screens/subscription/views/subscription_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SUBSCRIPTION;

  static final routes = [
    GetPage(
      name: _Paths.ON_BOARDING,
      page: () => OnBoardingView(),
      binding: OnBoardingBinding(),
    ),
    GetPage(
      name: _Paths.SIGN_UP,
      page: () => SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: _Paths.OTP_SCREEN,
      page: () => OtpScreenView(),
      binding: OtpScreenBinding(),
    ),
    GetPage(
      name: _Paths.PHONE_VERIFICATION,
      page: () => PhoneVerificationView(),
      binding: PhoneVerificationBinding(),
    ),
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SUBSCRIPTION,
      page: () =>  SubscriptionView(),
      binding: SubscriptionBinding(),
    ),
    GetPage(name: '/trial-transition', page: () => TrialTransitionView()),
  ];
}
