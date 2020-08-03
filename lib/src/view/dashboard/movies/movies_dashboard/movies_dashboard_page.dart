
import 'package:mao_trailer_flutter/src/view/dashboard/movies/banner/hot_banner.dart';
import 'package:mao_trailer_flutter/src/view/dashboard/movies/movies_list/movies_horizontal_list_now.dart';

import 'movies_dashboard.dart';

class MoviesDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MoviesDashboardPageState();
}

class MoviesDashboardPageState extends State<MoviesDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("MOVIES", style: TextStyle(fontSize: 24)),
        actions: [
          Padding(padding: EdgeInsets.all(Dimens.dp6(context)),
            child: InkWell(
              child: Image.asset(Assets.icSearch, width: 35, height: 35,),
            ),
          )
        ],
      ),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          SizedBox(height: Dimens.dp10(context)),
          HotBanner(),
          SizedBox(height: Dimens.dp12(context)),
          MoviehorizontalListNow()
        ],
      ),
    );
  }

}