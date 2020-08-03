import 'package:mao_trailer_flutter/src/view/dashboard/dashboard_page.dart';
import 'package:mao_trailer_flutter/src/view/walk_through/walk_through_page.dart';

import 'route.dart';

class RouterConfig {
  Route<dynamic> generateRoute(RouteSettings settings) {
    var argumens = settings.arguments;

    switch (settings.name) {
      case launcherRouted:
        return CupertinoPageRoute(builder: (context) => LauncherPage());
      case walkthroughRouted:
        return CupertinoPageRoute(builder: (context) => WalkThroughPage());
      case dashboardRouted:
        return CupertinoPageRoute(builder: (context) => DashboardPage());
      default:
        return CupertinoPageRoute(builder: (context) => UndefinedView(name: settings.name,));
    }
  }
}