import 'package:trailtrekker_app/app/navigator/navigator.dart';
import 'package:trailtrekker_app/features/dashboard/presentation/view/dashboard_view.dart';

class DashboardViewNavigator{

}


mixin DashboardViewRoute{
  openDashBoardView(){
    NavigateRoute.pushRoute(DashboardView());
  }
}