import 'package:carousel_slider/carousel_slider.dart';
import 'package:mao_trailer_flutter/src/common/utils/utils.dart';
import 'package:mao_trailer_flutter/src/view/launcher/launcher.dart';

class HotBanner extends StatelessWidget {
  List listBanner = [
    {
      "image": "https://lumiere-a.akamaihd.net/v1/images/hb_artemisfowl_disneyplus_mobile_19170_23a7506c.png",
    },
    {
      "image": "https://parklandtalk.com/wp-content/uploads/2020/05/callofwildheader-1024x576.jpg",
    },
    {
      "image": "https://i.ytimg.com/vi/BJWtIOzmvRA/maxresdefault.jpg",
    }
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CarouselSlider(
          options: CarouselOptions(
            height: 170,
            aspectRatio: 16/9,
            viewportFraction: 0.8,
            initialPage: 0,
            enableInfiniteScroll: true,
            reverse: false,
            autoPlay: true,
            autoPlayInterval: Duration(seconds: 3),
            enlargeCenterPage: true,
            scrollDirection: Axis.horizontal,
          ),
        items: listBanner.map((i) {
          return Builder(
            builder: (BuildContext context) {
              return Card(
                  semanticContainer: true,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  elevation: 5,
                  child: Container(
                    width: double.infinity,
                    child: Image.network(i["image"], fit: BoxFit.fill,),
                )
              );
            },
          );
        }).toList(),
      ),
    );
  }

}