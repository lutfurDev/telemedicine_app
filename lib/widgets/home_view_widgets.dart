import 'package:telemedicine_app/utils/app_layout.dart';
import 'package:telemedicine_app/utils/dimensions.dart';
import 'package:flutter/cupertino.dart';

RoundedRectangleBorder get roundedRectangleBorder {
  return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(Dimensions.radiusMid - 4));
}

EdgeInsets get margin{
  return EdgeInsets.only(left: AppLayout.getWidth(12), right: AppLayout.getWidth(12));
}