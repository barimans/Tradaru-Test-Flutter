import 'package:flutter/material.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/widget/image_widget.dart';

class BasketPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          imageWidget(
            assetDefault: 'assets/images/coming_soon.png',
            height: 260,
            width: 200
          ),
          Text(
            "Basket Page",
            style: AppTextStyle.bigText.copyWith(
              color: ResColor.colorPrimary,
            )
          ),
        ],
      ),
    );
  }
}
