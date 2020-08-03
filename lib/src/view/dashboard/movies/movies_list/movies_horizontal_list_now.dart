import 'package:flutter/material.dart';
import 'package:mao_trailer_flutter/src/common/styles/colors.dart';
import 'package:mao_trailer_flutter/src/common/styles/styles.dart';
import 'package:mao_trailer_flutter/src/common/utils/dimens.dart';

class MoviehorizontalListNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: Dimens.dp16(context)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Now", style: TextStyle(fontSize: 18, color: AppColors.textColor1),),
            SizedBox(height: Dimens.dp20(context),),
            Container(
              height: 256,
              color: Colors.amber,
            )
          ],
        ),
    );
  }

}