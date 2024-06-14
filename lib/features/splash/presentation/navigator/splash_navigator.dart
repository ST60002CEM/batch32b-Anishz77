
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hotel_booking/features/auth/presentation/navigator/login_navigator.dart';

final splashViewNavigatorProvider = Provider((ref) => SplashViewNavigator());

class SplashViewNavigator with LoginViewRoute{}

mixin SplashViewRoute{}