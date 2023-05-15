// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:treely/modules/authScreen/login_screen.dart' as _i3;
import 'package:treely/modules/authScreen/signup_screen.dart' as _i2;
import 'package:treely/modules/authScreen/welcome_screen.dart' as _i4;
import 'package:treely/modules/homeScreen/home_screen.dart' as _i6;
import 'package:treely/modules/onboardingPages/onboarding_screen.dart' as _i1;
import 'package:treely/modules/SplashScreen/screens/splash_screen.dart' as _i5;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    OnboardingScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.OnboardingScreen(),
      );
    },
    SignupScreen.name: (routeData) {
      final args = routeData.argsAs<SignupScreenArgs>(
          orElse: () => const SignupScreenArgs());
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.SignupScreen(key: args.key),
      );
    },
    LoginScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginScreen(),
      );
    },
    WelcomeScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.WelcomeScreen(),
      );
    },
    SplashScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashScreen(),
      );
    },
    HomeScreen.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.HomeScreen(),
      );
    },
  };
}

/// generated route for
/// [_i1.OnboardingScreen]
class OnboardingScreen extends _i7.PageRouteInfo<void> {
  const OnboardingScreen({List<_i7.PageRouteInfo>? children})
      : super(
          OnboardingScreen.name,
          initialChildren: children,
        );

  static const String name = 'OnboardingScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.SignupScreen]
class SignupScreen extends _i7.PageRouteInfo<SignupScreenArgs> {
  SignupScreen({
    _i8.Key? key,
    List<_i7.PageRouteInfo>? children,
  }) : super(
          SignupScreen.name,
          args: SignupScreenArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SignupScreen';

  static const _i7.PageInfo<SignupScreenArgs> page =
      _i7.PageInfo<SignupScreenArgs>(name);
}

class SignupScreenArgs {
  const SignupScreenArgs({this.key});

  final _i8.Key? key;

  @override
  String toString() {
    return 'SignupScreenArgs{key: $key}';
  }
}

/// generated route for
/// [_i3.LoginScreen]
class LoginScreen extends _i7.PageRouteInfo<void> {
  const LoginScreen({List<_i7.PageRouteInfo>? children})
      : super(
          LoginScreen.name,
          initialChildren: children,
        );

  static const String name = 'LoginScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.WelcomeScreen]
class WelcomeScreen extends _i7.PageRouteInfo<void> {
  const WelcomeScreen({List<_i7.PageRouteInfo>? children})
      : super(
          WelcomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'WelcomeScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashScreen]
class SplashScreen extends _i7.PageRouteInfo<void> {
  const SplashScreen({List<_i7.PageRouteInfo>? children})
      : super(
          SplashScreen.name,
          initialChildren: children,
        );

  static const String name = 'SplashScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.HomeScreen]
class HomeScreen extends _i7.PageRouteInfo<void> {
  const HomeScreen({List<_i7.PageRouteInfo>? children})
      : super(
          HomeScreen.name,
          initialChildren: children,
        );

  static const String name = 'HomeScreen';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
