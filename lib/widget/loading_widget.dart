import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:tradaru_test/utils/app_text_style.dart';

class LoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.black54.withOpacity(0.5),
      child: Column(
        children: [
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  margin: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      CircularProgressIndicator(),
                      SizedBox(width: 10),
                      Text(
                        "Please wait ...",
                        style: AppTextStyle.largeText,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
