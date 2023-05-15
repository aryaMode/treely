import 'package:auto_route/auto_route.dart';
import 'package:treely/routes/routes.gr.dart';

// @CupertinoAutoRouter
// @AdaptiveAutoRouter
// @CustomAutoRouter

// @AutoRouterConfig()
// class AppRouter extends $AppRouter{
//   @override
//   List<AutoRoute> get routes => [

//     AutoRoute(page: SplashRoute.page, initial: true),
//     AutoRoute(page: WelcomeRoute.page),
//     AutoRoute(page: OnboardingRoute.page),
//     AutoRoute(page: LoginRoute.page),
//     AutoRoute(page: SignupRoute.page),
//     AutoRoute(page: HomeRoute.page),
//   ];
// }

@AutoRouterConfig(
  replaceInRouteName: 'Page,Route',
)
class AppRouter extends $AppRouter {
  @override
  RouteType get defaultRouteType => RouteType.material();
  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreen.page, path: '/'),
    AutoRoute(page: WelcomeScreen.page),
    AutoRoute(page: OnboardingScreen.page),
    AutoRoute(page: LoginScreen.page),
    AutoRoute(page: SignupScreen.page),
    AutoRoute(page: HomeScreen.page),
  ];
}

// flutter packages pub run build_runner build
// flutter packages pub run build_runner watch
