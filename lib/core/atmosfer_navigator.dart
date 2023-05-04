import 'package:flutter/cupertino.dart';

class AtmosferNavigator {
  static final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> get getNavigationKey => _navigatorKey;

  static bool canPop() {
    BuildContext? context = getNavigationKey.currentContext;
    if (context == null) return false;
    NavigatorState navigator = Navigator.of(context);

    return navigator.canPop();
  }

  static Future<dynamic> push(
    dynamic page,
  ) async {
    bool isPage = page is Widget;
    bool isString = page is String;

    BuildContext? context = getNavigationKey.currentContext;
    if (context == null) return false;

    NavigatorState navigator = Navigator.of(context);
    if (isString) {
      return navigator.pushNamed(
        page,
      );
    }

    return navigator.push(
      isPage
          ? CupertinoPageRoute(
              builder: (context) {
                return page;
              },
            )
          : page,
    );
  }

  static Future<dynamic> pushAndRemoveUntil(
    dynamic page,
  ) async {
    bool isPage = page is Widget;
    bool isString = page is String;

    BuildContext? context = getNavigationKey.currentContext;
    if (context == null) return false;

    NavigatorState navigator = Navigator.of(context);

    if (isString) {
      return navigator.pushNamedAndRemoveUntil(
        page,
        (route) => false,
      );
    }
    return isPage
        ? navigator.pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) {
                return page;
              },
            ),
            (route) => false,
          )
        : null;
  }

  static dynamic pop({
    dynamic popItem,
  }) {
    BuildContext? context = getNavigationKey.currentContext;
    if (context == null) return false;
    NavigatorState navigator = Navigator.of(context);
    navigator.pop(
      popItem,
    );
  }

  static dynamic popUntil(
    String route,
  ) {
    BuildContext? context = getNavigationKey.currentContext;
    if (context == null) return false;

    NavigatorState navigator = Navigator.of(context);
    navigator.popUntil(
      ModalRoute.withName(
        route,
      ),
    );
  }
}
