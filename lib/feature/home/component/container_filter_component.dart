import 'package:flutter/material.dart';
import 'package:tradaru_test/utils/app_text_style.dart';
import 'package:tradaru_test/widget/image_widget.dart';

class ContainerFilterComponent extends StatelessWidget {

  final Function onTap;
  final Color colorContainer;
  final Color colorText;
  final String text;
  final String iconContainer;


  ContainerFilterComponent({
    Key key,
    this.onTap, this.colorContainer,
    this.colorText, this.text,
    this.iconContainer
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          color: colorContainer,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Row(
            children: [
              Text(
                text,
                style: AppTextStyle.mediumText.copyWith(
                    color: colorText
                ),
              ),
              SizedBox(width: 10,),
              imageWidget(
                assetDefault: iconContainer,
                height: 25,
                width: 25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
