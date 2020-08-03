import 'launcher.dart';

class LauncherPage extends StatefulWidget {
  @override
  LauncherPageState createState() => LauncherPageState();
}

class LauncherPageState extends State<LauncherPage>{
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return SafeArea(
      top: false,
      bottom: false,
      child: Scaffold(
        body: Stack(
          children: [
            Container(
              width: double.infinity,
              child: Image.asset(Assets.launcherBackground, fit: BoxFit.fill,),
            ),
            Positioned(
                bottom: 20,
                right: 0,
                left: 0,
                child: Container(
                  alignment: Alignment.center,
                  child: Text("Copyright © 2020", style: TextStyle(fontSize: 12, color: AppColors.primaryColor),),
                )
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _redirectView();
  }

  void _navigator(){
    Navigation.intentRemoveOld(context, walkthroughRouted);
  }

  void _redirectView() => Timer(Duration(seconds: 3), _navigator);

}