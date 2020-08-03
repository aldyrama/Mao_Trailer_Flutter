import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mao_trailer_flutter/src/common/utils/constant.dart';
import 'package:mao_trailer_flutter/src/service/api_manager.dart';
import 'package:mao_trailer_flutter/src/view/launcher/launcher.dart';
import 'package:mao_trailer_flutter/src/view/launcher/launcher_page.dart';
import 'src/bloc/bloc_delegate.dart';
import 'src/common/utils/router/route.dart';
import 'src/common/utils/router/router_config.dart';

void main() async {
  BlocSupervisor.delegate = MaoBlocDelegate();
  runApp(MaoTrailerApp());
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MaoTrailerApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => SiapBroAppState();
}

class SiapBroAppState extends State<MaoTrailerApp> {

  @override
  void initState() {
    super.initState();
    APIManager.initAPIManager(context);
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown,]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: AppColors.primaryColorDark, statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constant.appName,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: "Montserrat",
          primaryColor: AppColors.primaryColor,
          accentColor: AppColors.accentColor,
          pageTransitionsTheme: PageTransitionsTheme(
              builders: {TargetPlatform.android: CupertinoPageTransitionsBuilder(), TargetPlatform.iOS: CupertinoPageTransitionsBuilder()}
          )
      ),
      navigatorKey: APIManager.alice.getNavigatorKey(),
      home: LauncherPage(),
      onGenerateRoute: RouterConfig().generateRoute,
      onUnknownRoute: (settings) => MaterialPageRoute(builder: (context) => UndefinedView(name: settings.name,)),
    );
  }
}