// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BankAccountDetailRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BankAccountDetailPage(),
      );
    },
    BankAccountRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const BankAccountPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    PreviewRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PreviewPage(),
      );
    },
    SubmitRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const SubmitPage(),
      );
    },
  };
}

/// generated route for
/// [BankAccountDetailPage]
class BankAccountDetailRoute extends PageRouteInfo<void> {
  const BankAccountDetailRoute({List<PageRouteInfo>? children})
      : super(
          BankAccountDetailRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountDetailRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [BankAccountPage]
class BankAccountRoute extends PageRouteInfo<void> {
  const BankAccountRoute({List<PageRouteInfo>? children})
      : super(
          BankAccountRoute.name,
          initialChildren: children,
        );

  static const String name = 'BankAccountRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PreviewPage]
class PreviewRoute extends PageRouteInfo<void> {
  const PreviewRoute({List<PageRouteInfo>? children})
      : super(
          PreviewRoute.name,
          initialChildren: children,
        );

  static const String name = 'PreviewRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SubmitPage]
class SubmitRoute extends PageRouteInfo<void> {
  const SubmitRoute({List<PageRouteInfo>? children})
      : super(
          SubmitRoute.name,
          initialChildren: children,
        );

  static const String name = 'SubmitRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
