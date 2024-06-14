

import 'package:hotel_booking/app/navigator/navigator.dart';
import 'package:hotel_booking/features/auth/presentation/view/register_view.dart';

class RegisterViewNavigator{}

// called by other views to open this Register Page
mixin RegisterViewRoute{
  openRegisterView(){
    NavigateRoute.pushRoute(RegisterView());
  }
}