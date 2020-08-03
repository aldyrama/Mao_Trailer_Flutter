import 'package:mao_trailer_flutter/src/common/styles/styles.dart';
import 'package:mao_trailer_flutter/src/view/launcher/launcher.dart';

class BottomNavigation extends StatelessWidget{
  final int page;
  final Function tap;
  const BottomNavigation({Key key, this.page, this.tap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).primaryColor,
          primaryColor: AppColors.pinkColor,
          textTheme: Theme.of(context).textTheme.copyWith(caption: TextStyle(color: Colors.grey[500]),),
        ),
        child: BottomNavigationBar(
          elevation: 8,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColors.primaryColor,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              activeIcon: Image.asset(Assets.icActiveMovie, scale: 4.5),
              icon: Image.asset(Assets.icMovie, scale: 5),
              title: Container(child: Text("MOVIES", style: TextStyle(fontSize: 11)),),
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(Assets.icActiveMovie, scale: 4.5),
              icon: Image.asset(Assets.icMovie, scale: 5),
              title: Container(child: Text("TV", style: TextStyle(fontSize: 11)),),
            ),
            BottomNavigationBarItem(
              activeIcon: Image.asset(Assets.icActiveMovie, scale: 4.5),
              icon: Image.asset(Assets.icMovie, scale: 5),
              title: Container(child: Text("PROFILE", style: TextStyle(fontSize: 11)),),
            ),
          ],
          onTap: tap,
          currentIndex: page,
        ),
      ),
    );
  }

}