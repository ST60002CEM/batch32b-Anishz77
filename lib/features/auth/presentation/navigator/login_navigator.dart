

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/app/navigator/navigator.dart';
import 'package:hotel_booking/features/auth/presentation/navigator/register_navigator.dart';
import 'package:hotel_booking/features/auth/presentation/view/login_view.dart';

final loginViewNavigatorProvider = Provider((ref) => LoginViewNavigator());

class LoginViewNavigator with RegisterViewRoute {}

mixin LoginViewRoute {
  openLoginView() {
    NavigateRoute.pushRoute(LoginView());
  }
}
