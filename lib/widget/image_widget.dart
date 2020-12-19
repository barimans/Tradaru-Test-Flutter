import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

Widget imageWidget({
  String assetDefault,
  double height,
  double width,
  String imageUrl,
}) {
  return imageUrl == null
      ? Image.asset(
          assetDefault,
          height: height,
          width: width,
        )
      : imageUrl.trim().isEmpty
          ? Image.asset(
              "assets/images/error_image.png",
              height: height,
              width: width,
            )
          : Image.network(
              imageUrl,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
              height: height,
              width: width,
              fit: BoxFit.fill,
            );
}
