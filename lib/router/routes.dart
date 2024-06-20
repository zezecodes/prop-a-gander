import 'package:flutter/material.dart';
import 'package:vodafone/features/homepage/presentation/pages/list_page.dart';
import 'package:vodafone/features/homepage/presentation/pages/news_page.dart';

class AppRouter {
  Route? onGenerateRoute(RouteSettings setting) {
    switch (setting.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const ListPage());
      case "/second":
        return MaterialPageRoute(builder: (_) => const ArticlePage());
      // case "/third":
      //   return MaterialPageRoute(builder: (_) => const SignInPage());
      // case "/fourth":
      //   return MaterialPageRoute(builder: (_) => const ForgotPassword());
      // case "/fifth":
      //   return MaterialPageRoute(builder: (_) => const ResetEmail());
      // case "/sixth":
      //   return MaterialPageRoute(builder: (_) => const SignUpPage());
      // case "/seventh":
      //   return MaterialPageRoute(builder: (_) => const LoginPage());
      // case "/eighth":
      //   return MaterialPageRoute(builder: (_) => const OTPPage());
      // case "/ninth":
      //   return MaterialPageRoute(builder: (_) => const FindRestaurants());
      // case "/tenth":
      //   return MaterialPageRoute(builder: (_) => const BottomNavigation());
      // case "/eleventh":
      //   return MaterialPageRoute(builder: (_) => const BottomNavigation());
      // case "/twelth":
      //   return MaterialPageRoute(builder: (_) => const FeaturedPartners());
      // case "/thirteenth":
      //   return MaterialPageRoute(builder: (_) => const FilterPage());
      // case "/fourteenth":
      //   return MaterialPageRoute(builder: (_) => const AccountSettings());
      // case "/fifteenth":
      //   return MaterialPageRoute(builder: (_) => const ProfileInformation());
      // case "/sixteenth":
      //   return MaterialPageRoute(builder: (_) => const ChangePassword());
      // case "/seventeenth":
      //   return MaterialPageRoute(builder: (_) => const PaymentMethods());
      // case "/eighteenth":
      //   return MaterialPageRoute(builder: (_) => const CreditCards());
      // case "/nineteenth":
      //   return MaterialPageRoute(builder: (_) => const LocationsPage());
      // case "/twentieth":
      //   return MaterialPageRoute(builder: (_) => const SocialAccounts());
      // case "/twentyfirst":
      //   return MaterialPageRoute(builder: (_) => const ReferFriends());
      // case "/twentysecond":
      //   return MaterialPageRoute(builder: (_) => const AddPayment());
    }
    return null;
  }
}
