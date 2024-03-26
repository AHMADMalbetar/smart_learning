import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:one_context/one_context.dart';
import 'package:toast/toast.dart';

import '../core/my_color.dart';

class SnackBarComp {
  SnackBar customSnackBar(message) {
    return SnackBar(
      backgroundColor: Colors.red,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12.sp,
            ),
          )
        ],
      ),
    );
  }
}