import 'package:riverpod/riverpod.dart';
import 'package:trailtrekker_app/features/auth/presentation/navigator/login_navigator.dart';
import 'package:trailtrekker_app/features/auth/presentation/view/register_view.dart';

import '../../../../app/navigator/navigator.dart';

final registerViewNavigatorProvider=Provider((ref)=>RegisterNavigator());
class RegisterNavigator with LoginViewRoute{}
mixin RegisterViewRoute{
  openRegisterView(){
   NavigateRoute.pushRoute( RegisterView());
  }
}