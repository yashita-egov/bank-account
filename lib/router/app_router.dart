import 'package:auto_route/auto_route.dart';
import 'package:bank_accounts/pages/HomePage.dart';
import 'package:bank_accounts/pages/BankAccountPage.dart';
import 'package:bank_accounts/pages/BankAccountDetailPage.dart';
import 'package:bank_accounts/pages/PreviewPage.dart';
import 'package:bank_accounts/pages/SubmitPage.dart';


part 'app_router.gr.dart';


@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter{

 @override
 List<AutoRoute> get routes => [
    AutoRoute(page: HomeRoute.page, initial: true),
    AutoRoute(page: BankAccountRoute.page),
    AutoRoute(page: BankAccountDetailRoute.page),
    AutoRoute(page: PreviewRoute.page),
    AutoRoute(page: SubmitRoute.page)
 ];
}
