
import 'tv_dashboard.dart';

class TvDashboardPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => TvDashboardPageState();
}

class TvDashboardPageState extends State<TvDashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        title: Text("TV", style: TextStyle(fontSize: 24)),
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
        ],
      ),
    );
  }
}