import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import '../../constants/colors.dart';
import '../../presentation/common/spinkit_loading_circle.dart';

class UserAvatar extends StatelessWidget {
  final double size;
  final String imageUrl;
  final EdgeInsetsGeometry margin;
  final Function onPressedCallback;

  UserAvatar({
    this.size,
    this.imageUrl,
    this.margin,
    this.onPressedCallback,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressedCallback,
      child: Container(
        margin: margin,
        height: size ?? 90.0,
        width: size ?? 90.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(
            size != null ? size / 2 : 45.0,
          ),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(
            size != null ? size / 2 : 45.0,
          ),
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => SpinkitLoadingCircle(),
            errorWidget: (context, url, error) => Icon(
              Ionicons.warning_outline,
              color: red,
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
