import 'package:mao_trailer_flutter/src/common/styles/styles.dart';

class RatingLable extends StatelessWidget {
  double rate;

  RatingLable({Key key, this.rate = 0.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(rate.toString()),
    );
  }

}