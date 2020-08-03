import 'package:mao_trailer_flutter/src/common/utils/router/route.dart';
import 'package:mao_trailer_flutter/src/view/dashboard/movies/movies_dashboard/movies_dashboard_page.dart';
import 'package:mao_trailer_flutter/src/view/dashboard/tv/tv_dashboard/tv_dashboard_page.dart';
import 'package:mao_trailer_flutter/src/view/launcher/launcher.dart';
import 'package:mao_trailer_flutter/src/widget/nav/bottom_navigation.dart';

class DashboardPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => DashboardPageState();
}

class DashboardPageState extends State<DashboardPage>{
  int navTapped = 0;
  PageController _pageController;
  final PageStorageBucket bucket = PageStorageBucket();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: PageStorage(
            bucket: bucket,
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              onPageChanged: onPageChanged,
              children: <Widget>[
                MoviesDashboardPage(),
                TvDashboardPage()
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigation(page: navTapped, tap: _navigationTapped,),
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: navTapped);
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void _navigationTapped(int page){
    setState(() {
      _pageController.jumpToPage(page);
    });
  }

  void onPageChanged(int page) {
    setState(() {
      navTapped = page;
    });
  }
}