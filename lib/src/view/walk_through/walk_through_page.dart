import 'package:carousel_slider/carousel_slider.dart';
import 'package:mao_trailer_flutter/src/common/utils/utils.dart';
import 'package:mao_trailer_flutter/src/view/launcher/launcher.dart';

import 'walk_through.dart';

class WalkThroughPage extends StatefulWidget {

  @override
  WalkThroughPageState createState() => WalkThroughPageState();
}

class WalkThroughPageState extends State<WalkThroughPage>{
  int current = 0;

  List listIntro = [
    {
      "image": Assets.bgWalkthroughOne,
    },
    {
      "image": Assets.bgWalkthroughTwo,
    },
    {
      "image": Assets.bgWalkthroughThree,
    }
  ];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }

    return result;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: Scaffold(
          body: Stack(
            children: [
              CarouselSlider(
                options: CarouselOptions(
                  reverse: false,
                  enableInfiniteScroll: false,
                  viewportFraction: 1.0,
                  height: double.infinity,
                  onPageChanged: (index, reason) {
                    setState(() {
                      current = index;
                    });
                  },
                ),
                items: listIntro.map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          width: double.infinity,
                          child: Image.asset(i["image"], fit: BoxFit.cover,)
                      );
                    },
                  );
                }).toList(),
              ),
              Positioned(
                bottom: 50,
                right: 0,
                left: 0,
                child: _buildGetStatedButton(),
              ),
            ],
          )
        )
    );
  }

  Widget _buildGetStatedButton(){
    if(current == 2){
      return Column(
        children: [
          InkWell(
            onTap: () => Navigation.intentRemoveOld(context, dashboardRouted),
            child: Container(
              padding: EdgeInsets.only(left: 20, right: 20, top: 12, bottom: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(18)),
                  gradient: LinearGradient(
                      colors: [AppColors.orageColor, AppColors.pinkColor],
                      stops: [0.0, 0.8]
                  )
              ),
              child: Text("Get Stared", style: TextStyle(fontSize: 12, color: AppColors.primaryColor),),
            ),
          )
        ],
      );
    }
    return Container();
  }

  @override
  void dispose() {
    super.dispose();
    SystemChrome.setEnabledSystemUIOverlays(SystemUiOverlay.values);
  }
}