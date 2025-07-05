import 'package:auto_route/auto_route.dart';
import 'package:the_kids_app/src/core/router/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Screen|Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(page: SplashRoute.page, initial: true),
    AutoRoute(page: AppUpdateRoute.page),
    AutoRoute(page: CategorySelectionRoute.page),
    AutoRoute(page: SubcategorySelectionRoute.page),
  ];
}
