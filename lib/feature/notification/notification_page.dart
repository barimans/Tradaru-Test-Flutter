import 'package:flutter/material.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/utils/res_color.dart';
import 'package:tradaru_test/widget/image_widget.dart';

class NotificationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: ResColor.colorPrimary),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        title: Text(
          'Notification',
          style: AppTextStyle.largeText.copyWith(
              color: ResColor.colorPrimary,
              fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageWidget(
                assetDefault: 'assets/images/coming_soon.png',
                height: 260,
                width: 200
            ),
            Text(
                "Notification Page",
                style: AppTextStyle.bigText.copyWith(
                  color: ResColor.colorPrimary,
                )
            ),
          ],
        ),
      ),
    );
  }
}
