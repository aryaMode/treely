import 'package:auto_route/auto_route.dart';
import 'package:treely/modules/SplashScreen/screens/splash_screen.dart';
import 'package:treely/modules/onboardingPages/onboarding_screen.dart';
import 'package:treely/modules/welcomeScreen/welcome_screen.dart';

// @CupertinoAutoRouter              
// @AdaptiveAutoRouter              
// @CustomAutoRouter              

@MaterialAutoRouter(              
  replaceInRouteName: 'Page,Route',              
  routes: <AutoRoute>[              
    AutoRoute(page: SplashScreen, initial: true),              
    AutoRoute(page: WelcomeScreen),     
    AutoRoute(page: OnboardingScreen),         
  ],              
)              
class $AppRouter {}              

// flutter packages pub run build_runner build              
// flutter packages pub run build_runner watch