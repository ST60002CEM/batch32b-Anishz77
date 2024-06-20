import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trailtrekker_app/app/navigator/navigator.dart';
import 'package:trailtrekker_app/features/auth/presentation/view/login_view.dart';

import '../../../auth/presentation/navigator/login_navigator.dart';


final splashViewNavigatorProvider=Provider((ref)=>SplashViewNavigator());

class SplashViewNavigator with LoginViewRoute{}  //open from splash screen






mixin SplashViewRoute{
  openSplashView(){
    NavigateRoute.pushRoute(const LoginStateful());
  }
}   //used for opening splash screen
